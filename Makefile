# Django skeleton Makefile

VENV_DIR := "$(HOME)/.pyvenvs"
PYTHON = python3
PROJECT_NAME := $(or $(PROJECT_NAME),$(error PROJECT_NAME is not set. Set it using export PROJECT_NAME=<your_project_name>))
VENV_ACTIVATE_PATH := $(VENV_DIR)/$(PROJECT_NAME)/bin/activate
VENV_ACTIVATE := source $(VENV_ACTIVATE_PATH)


# Django specific
APP ?= ""

# Create a virtual environment
venv:
	@mkdir -p $(VENV_DIR)
	@$(PYTHON) -m venv $(VENV_DIR)/$(PROJECT_NAME)
	@echo "Virtual environment created: $(VENV_DIR)/$(PROJECT_NAME)"
	@echo "Activate with: source $(VENV_DIR)/$(PROJECT_NAME)/bin/activate"
	@echo "Try: \n\n alias activate='source $(VENV_DIR)/$(PROJECT_NAME)/bin/activate'\n"
	@echo "And activate with: activate"

cleanvenv:
	@echo "Removing virtual environment: $(VENV_DIR)/$(PROJECT_NAME)"
	@rm -rf "$(VENV_DIR)/$(PROJECT_NAME)"
	@echo "Done"

resetgit:
	# If you've cloned the skeleton, you'll want to reset the git directory.
	# This will remove the git directory and re-initialize it.
	# This is useful if you want to use the skeleton as a starting point for a new project.
	@echo "Removing git directory..."
	@rm -rf .git
	@echo "Re-initializing git directory..."
	@git init
	@echo "Done"

django: resetgit
	@$(VENV_ACTIVATE) && python -m pip install --upgrade pip
	@$(VENV_ACTIVATE) && python -m pip install django
	@$(VENV_ACTIVATE) && django-admin startproject "$(PROJECT_NAME)" .

# Install dependencies
install:
	@$(PYTHON) -m pip install --upgrade pip
	@$(PYTHON) -m pip install -r requirements.txt

# Run the Django development server
run:
	@$(PYTHON) manage.py runserver

# create APP
app:
	@$(PYTHON) manage.py startapp $(NAME)

# Makemigrations
migrations:
	@$(PYTHON) manage.py makemigrations $(APP)

# Migrate
migrate:
	@$(PYTHON) manage.py migrate $(APP)

.PHONY: venv django install run app makemigrations migrate
