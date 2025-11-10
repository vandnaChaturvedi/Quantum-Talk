#!/bin/bash

# Build script for LaTeX presentation using Docker

set -e

# Check Docker status first
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/check-docker.sh" ]; then
    if ! "$SCRIPT_DIR/check-docker.sh"; then
        echo ""
        echo "Trying to start Docker Desktop..."
        if command -v open &> /dev/null; then
            open -a Docker 2>/dev/null && echo "Docker Desktop is starting. Please wait and try again."
        fi
        exit 1
    fi
fi

echo "Building LaTeX Docker image..."
docker build -t quantum-presentation-latex:latest .

echo "Compiling presentation..."
docker run --rm \
    -v "$(pwd):/workspace" \
    -w /workspace \
    quantum-presentation-latex:latest \
    bash -c "pdflatex -interaction=nonstopmode presentation.tex && pdflatex -interaction=nonstopmode presentation.tex"

echo "Presentation compiled successfully!"
echo "Output: presentation.pdf"

