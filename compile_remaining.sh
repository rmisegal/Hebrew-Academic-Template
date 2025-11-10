#!/bin/bash
# Compile remaining examples with full workflow
cd /c/25D/CLS-examples

# Intermediate already done, let's complete it
echo "Completing intermediate_example..."
biber intermediate_example > /c/25D/CLS-examples/agent_outputs/agent_g/intermediate_biber.log 2>&1
lualatex intermediate_example.tex > /c/25D/CLS-examples/agent_outputs/agent_g/intermediate_pass2.log 2>&1
lualatex intermediate_example.tex > /c/25D/CLS-examples/agent_outputs/agent_g/intermediate_pass3.log 2>&1

examples=(
    "advanced_example"
    "expert_example"
)

for example in "${examples[@]}"; do
    echo "===================================="
    echo "Compiling $example..."
    echo "===================================="

    # First pass
    echo "Pass 1: lualatex $example.tex"
    lualatex $example.tex > /c/25D/CLS-examples/agent_outputs/agent_g/${example}_pass1.log 2>&1
    if [ $? -ne 0 ]; then
        echo "ERROR: First pass failed for $example"
        grep -E "Error:|!" /c/25D/CLS-examples/agent_outputs/agent_g/${example}_pass1.log | head -10
        continue
    fi

    # Run biber
    echo "Pass 2: biber $example"
    biber $example > /c/25D/CLS-examples/agent_outputs/agent_g/${example}_biber.log 2>&1

    # Second pass
    echo "Pass 3: lualatex $example.tex"
    lualatex $example.tex > /c/25D/CLS-examples/agent_outputs/agent_g/${example}_pass2.log 2>&1

    # Third pass
    echo "Pass 4: lualatex $example.tex"
    lualatex $example.tex > /c/25D/CLS-examples/agent_outputs/agent_g/${example}_pass3.log 2>&1

    # Check if PDF was created
    if [ -f "$example.pdf" ]; then
        echo "✓ PDF created: $example.pdf"
    else
        echo "✗ PDF not created for $example"
    fi
done

# Copy all PDFs to agent_g
echo "Copying all PDFs to agent_g..."
for pdf in *.pdf; do
    if [ -f "$pdf" ]; then
        cp "$pdf" /c/25D/CLS-examples/agent_outputs/agent_g/
        echo "Copied: $pdf"
    fi
done

echo "===================================="
echo "Compilation complete!"
echo "===================================="