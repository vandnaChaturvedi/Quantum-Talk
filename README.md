# Quantum Computing Presentation

LaTeX Beamer presentation on "Applications and Indian Trends in Quantum Computing and Quantum-AI"

## Docker Setup

This project includes a Docker setup for compiling the LaTeX presentation without installing LaTeX locally.

### Quick Start

1. **Build the Docker image:**
   ```bash
   docker build -t quantum-presentation-latex:latest .
   ```

2. **Compile the presentation:**
   ```bash
   make compile
   # OR
   ./build.sh
   # OR
   docker-compose up
   ```

### Available Commands

- `make docker-check` - Check if Docker is running
- `make docker-start` - Try to start Docker Desktop (macOS)
- `make build` or `make docker-build` - Build the Docker image
- `make compile` or `make docker-compile` - Compile the presentation
- `make docker-shell` - Open a shell in the Docker container
- `make clean` - Remove generated LaTeX auxiliary files

### Manual Docker Commands

```bash
# Build image
docker build -t quantum-presentation-latex:latest .

# Compile presentation
docker run --rm -v "$(pwd):/workspace" -w /workspace quantum-presentation-latex:latest \
  bash -c "pdflatex -interaction=nonstopmode presentation.tex && pdflatex -interaction=nonstopmode presentation.tex"

# Interactive shell
docker run --rm -it -v "$(pwd):/workspace" -w /workspace quantum-presentation-latex:latest /bin/bash
```

## Requirements

- Docker Desktop installed and running on your system
- Make (optional, for using Makefile)

## Troubleshooting

### Docker Permission Denied Error

If you see an error like:
```
permission denied while trying to connect to the Docker daemon socket
```

**Solution:**

1. **Check if Docker Desktop is running:**
   ```bash
   make docker-check
   # OR
   ./check-docker.sh
   ```

2. **Start Docker Desktop (macOS):**
   ```bash
   make docker-start
   # OR manually: open -a Docker
   ```
   
   Then wait for Docker Desktop to fully start (look for the whale icon in your menu bar).

3. **Verify Docker is accessible:**
   ```bash
   docker ps
   ```
   
   If this works, you can proceed with building and compiling.

4. **If Docker Desktop is running but still getting errors:**
   - Restart Docker Desktop
   - Make sure you're using the same user account that installed Docker
   - Check Docker Desktop settings and ensure it's running properly

### Alternative: Local LaTeX Installation

If you prefer not to use Docker, you can install LaTeX directly:
- **macOS:** `brew install --cask mactex` or `brew install basictex`
- **Linux:** `sudo apt-get install texlive-full` (Ubuntu/Debian)
- **Windows:** Install MiKTeX or TeX Live

Then compile directly:
```bash
pdflatex presentation.tex
pdflatex presentation.tex  # Run twice for TOC
```

## Output

The compiled PDF will be generated as `presentation.pdf` in the project directory.

