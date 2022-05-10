# Makefile for python applications using venv
# Richard Antal Nagy, 2022
# https://gitlab.com/richardnagy/makefiles

# Settings
venv_name := .venv
deps_name := requirements.txt
lock_name := pip.lock
lint_lib := pylint
test_lib := pytest
pybin := python3
main := main.py
params := 
deploy_params := 
caches := __pycache__/

# Run even if a file or folder with the same name exists
.PHONY: clean venv install run generate lock deploy up

# Run program from virtual environment
# Create virtual env if one does not exist, update requirements if changed
run: $(venv_name)/bin/activate
	@./$(venv_name)/bin/$(pybin) $(main) $(params)

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
	@rm -rf $(venv_name) $(caches)

# Force create virtual environment
venv:
	@echo "Creating virtual environment: $(venv_name)"
	@rm -rf $(venv_name)
	@$(pybin) -m venv $(venv_name)

# Generate sample project
generate:
	@echo "Generating sample project.."
	@echo "print('Hello Human!')" > $(main)
	@touch $(deps_name)
	@touch $(lock_name)
	@$(MAKE) -s venv

# Cleans up, install packages globally from lock, and compiles project to pyc files
deploy: $(lock_name)
	@echo "### Deploying application.."
	@echo "### Cleaning up.."
	@$(MAKE) -s clean
	@echo "### Installing packages from lock.. ($(lock_name))"
	@pip install -r $(lock_name)
	@echo "### Compiling project.."
	@$(pybin) -O -m compileall -b .
	@echo "### Completed."

# Runs the application in production mode without virtual environment from pyc files
up:
	$(pybin) $(main)c $(deploy_params)

# Runs the linter
lint:
	@./$(venv_name)/bin/$(pybin) -m $(lint_lib) .

# Runs the tester
test:
	@./$(venv_name)/bin/$(pybin) -m $(test_lib)