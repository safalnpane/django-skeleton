# Django skeleton Makefile

VENV_DIR := pyvenvs
PYTHON = python3
PROJECT_NAME := $(or $(PROJECT_NAME),$(error PROJECT_NAME is not set. Set it using export PROJECT_NAME=<your_project_name>))

# Create a virtual environment
venv:
	@mkdir -p $(VENV_DIR)
	@VENV_NAME=$$(mktemp -u $(PROJECT_NAME)_XXX); \
	$(PYTHON) -m venv $(VENV_DIR)/$$VENV_NAME; \
	echo "Virtual environment created: $(VENV_DIR)/$$VENV_NAME"; \
	echo "Activate with: source $(VENV_DIR)/$$VENV_NAME/bin/activate"
