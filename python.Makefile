# Makefile for python applications using venv
# Richard Antal Nagy, 2022
# https://gitlab.com/richardnagy/makefiles

# Settings
venv_name := .venv
deps_name := requirements.txt
lock_name := pip.lock
pybin := python3
main := main.py

# Run even if a file or folder with the same name exists
.PHONY: clean venv install run generate lock

# Run program from virtual environment
# Create virtual env if one does not exist, update requirements if changed
run: $(venv_name)/bin/activate
	@./$(venv_name)/bin/$(pybin) $(main)

# Create virtual environment
$(venv_name)/bin/activate: $(deps_name)
	@$(MAKE) -s venv
	@$(MAKE) -s install

# Force install dependencies from requirements
install: $(deps_name)
	@echo "Installing dependencies from $(deps_name)"
	@./$(venv_name)/bin/pip install -r $(deps_name)
	@$(MAKE) -s lock

# Create a pip lock file
lock: $(deps_name) $(venv_name)/bin/pip
	@echo "Creating lock file: $(lock_name)"
	@./$(venv_name)/bin/pip freeze > $(lock_name)

# Remove virtual environment and caches
clean:
	@rm -rf $(venv_name) __pycache__/

# Force create virtual environment
venv:
	@echo "Creating virtual environment: $(venv_name)"
	@$(pybin) -m venv $(venv_name)

# Generate sample project
generate:
	@echo "Generating sample project.."
	@echo "print('Hello Human!')" > $(main)
	@touch $(deps_name)
	@touch $(lock_name)
	@$(MAKE) -s venv