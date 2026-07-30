#!/bin/bash
# Compile all examples with full workflow
cd /c/25D/CLS-examples

examples=(
    "intermediate_example"
    "advanced_example"
    "expert_example"
    "footnote_example"
    "image_example"
    "bibliography_example"
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

    # Check for errors and warnings
    echo "Checking for errors and warnings..."
    grep -E "Warning:|Error:|!" /c/25D/CLS-examples/agent_outputs/agent_g/${example}_pass3.log | \
        grep -v "Language hebrew not found" | \
        grep -v "float specifier changed" > /c/25D/CLS-examples/agent_outputs/agent_g/${example}_warnings.txt

    if [ -s /c/25D/CLS-examples/agent_outputs/agent_g/${example}_warnings.txt ]; then
        echo "Warnings found in $example:"
        cat /c/25D/CLS-examples/agent_outputs/agent_g/${example}_warnings.txt
    else
        echo "✓ $example compiled successfully with no significant warnings"
    fi

    # Check if PDF was created
    if [ -f "$example.pdf" ]; then
        echo "✓ PDF created: $example.pdf"
        # Copy to agent_g output
        cp $example.pdf /c/25D/CLS-examples/agent_outputs/agent_g/
    else
        echo "✗ PDF not created for $example"
    fi

    echo ""
done

# Also copy the already compiled beginner_example.pdf
cp beginner_example.pdf /c/25D/CLS-examples/agent_outputs/agent_g/

echo "===================================="
echo "All compilations complete!"
echo "===================================="