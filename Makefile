.PHONY: build compile clean docker-build docker-compile docker-check docker-start help

# Default target
help:
	@echo "Available targets:"
	@echo "  build          - Build the Docker image"
	@echo "  compile        - Compile the presentation using Docker"
	@echo "  clean          - Remove generated files"
	@echo "  docker-check   - Check if Docker is running"
	@echo "  docker-start   - Try to start Docker Desktop (macOS)"
	@echo "  docker-build   - Build Docker image"
	@echo "  docker-compile - Compile using Docker"
	@echo "  docker-shell   - Open a shell in the Docker container"

# Check Docker status
docker-check:
	@./check-docker.sh

# Try to start Docker Desktop (macOS)
docker-start:
	@echo "Attempting to start Docker Desktop..."
	@open -a Docker 2>/dev/null || echo "Could not start Docker Desktop. Please start it manually from Applications."
	@echo "Waiting for Docker to start..."
	@sleep 5
	@./check-docker.sh

# Build Docker image
build: docker-check docker-build

docker-build: docker-check
	docker build -t quantum-presentation-latex:latest .

# Compile presentation
compile: docker-check docker-compile

docker-compile: docker-check docker-build
	docker run --rm \
		-v "$(PWD):/workspace" \
		-w /workspace \
		quantum-presentation-latex:latest \
		bash -c "pdflatex -interaction=nonstopmode presentation.tex && pdflatex -interaction=nonstopmode presentation.tex"

# Open shell in container
docker-shell: docker-check docker-build
	docker run --rm -it \
		-v "$(PWD):/workspace" \
		-w /workspace \
		quantum-presentation-latex:latest \
		/bin/bash

# Clean generated files
clean:
	rm -f *.aux *.log *.out *.nav *.snm *.toc *.vrb *.fdb_latexmk *.fls *.synctex.gz

