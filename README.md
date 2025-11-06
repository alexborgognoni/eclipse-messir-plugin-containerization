# Eclipse Excalibur Docker Container

A Docker containerization solution for running Eclipse IDE with the Excalibur plugin. [Excalibur](https://dl.acm.org/do/10.5281/zenodo.1458158/full/) is an open-source UML requirements engineering tool that implements the [Messir methodology](https://dl.acm.org/doi/10.1145/3276604.3276614), commonly used in software engineering education. The tool provides textual DSL-based requirements modeling with UML diagram generation and LaTeX document export capabilities.

This container includes all necessary dependencies (Eclipse, LaTeX, PDF tools, and Java) in an isolated, reproducible environment.

## Quick Start

1. **Install**: Run `./excalibur_install` to build the Docker image
2. **Run**: Execute `./excalibur_run` to launch Eclipse with Excalibur

## Notes

- Eclipse configuration and project files are stored in `.eclipse-docker/`
- The current directory is mounted as `/workspace` inside the container
- Requires X11 for GUI display
