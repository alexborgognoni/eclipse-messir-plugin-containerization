# Eclipse Excalibur Docker Container

A Docker containerization solution for running Eclipse IDE with the Excalibur plugin. This setup includes all necessary dependencies (LaTeX, PDF tools, and Java) in an isolated environment.

## Quick Start

1. **Install**: Run `./excalibur_install` to build the Docker image
2. **Run**: Execute `./excalibur_run` to launch Eclipse with Excalibur

## Notes

- Eclipse configuration and project files are stored in `.eclipse-docker/`
- The current directory is mounted as `/workspace` inside the container
- Requires X11 for GUI display