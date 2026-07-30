#!/usr/bin/env bash
# Per-clone installer for the gzip_graph mechanism. Idempotent -- safe to re-run.
#
# git deliberately does not version .git/config or .git/hooks/ (a repo that could
# install executable filters on clone would be a remote-code-execution hole), so
# the sources live here under scripts/ and this script copies them into .git/ for
# the current clone. That is the entire "activation" of the mechanism.
set -euo pipefail
ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

# clean  = working tree -> git object (flat JSON -> gzipped blob) at `git add`
# smudge = git object -> working tree (gzipped blob -> flat JSON) at checkout
# -n drops gzip's name/mtime header so output is byte-deterministic; without it
#    git reports a phantom "modified" every session.
# -6 is the default speed/ratio balance.
# required = fail loudly if gzip/gunzip is missing, never silently store raw.
git config filter.gzip_graph.clean    "gzip -n -c -6"
git config filter.gzip_graph.smudge   "gunzip -c"
git config filter.gzip_graph.required true
echo "configured: filter.gzip_graph"

# Install the pre-commit size guard, without clobbering a foreign hook.
src="$ROOT/scripts/git-hooks/pre-commit"
dst="$ROOT/.git/hooks/pre-commit"
if [ -e "$dst" ] && ! grep -q "graph-size-guard" "$dst" 2>/dev/null; then
    echo "warning: $dst exists and is not ours -- merge by hand." >&2
else
    cp "$src" "$dst"
    chmod +x "$dst"
    echo "installed: pre-commit size guard"
fi

echo
echo "Done. If graph.json is still stored flat in git, normalise it:"
echo "    git add --renormalize graphify-out/graph.json"
echo "    git commit -m 'store graph gzipped'"
echo
echo "If graph.json on disk is binary garbage (fresh clone), inflate it:"
echo "    git checkout -- graphify-out/graph.json"
