FROM texlive/texlive:latest

# Set working directory
WORKDIR /workspace

# Install additional packages if needed (most are included in texlive-full)
# You can add more packages here if required
RUN tlmgr update --self && \
    tlmgr install \
    beamer \
    beamertheme-metropolis \
    listings \
    xcolor \
    hyperref \
    graphics \
    amsmath || true

# Copy the presentation file (will be overridden by volume mount)
COPY presentation.tex /workspace/

# Default command
CMD ["/bin/bash"]

