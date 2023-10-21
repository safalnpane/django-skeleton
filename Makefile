# Django skeleton Makefile

VENV_DIR := pyvenvs
PYTHON = python3
PROJECT_NAME := $(or $(PROJECT_NAME),$(error PROJECT_NAME is not set. Set it using export PROJECT_NAME=<your_project_name>))

# Create a virtual environment
venv:
	@mkdir -p $(VENV_DIR)
	@$(PYTHON) -m venv $(VENV_DIR)/$(PROJECT_NAME)
	@echo "Virtual environment created: $(VENV_DIR)/$(PROJECT_NAME)"
	@echo "Activate with: source $(VENV_DIR)/$(PROJECT_NAME)/bin/activate"
