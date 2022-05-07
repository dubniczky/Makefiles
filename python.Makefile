# Makefile for python applications
# Richard Antal Nagy, 2022
# https://gitlab.com/richardnagy/makefiles

# Settings
VENV_NAME=.venv
DEPS_NAME=requirements.txt
LOCK_NAME=pip.lock
PYBIN=python3
ENTRY_POINT=main.py

# Run even if the given file or folder exists
.PHONY: clean venv install run

# Run program from virtual environment
run: $(VENV_NAME)/bin/activate
	./$(VENV_NAME)/bin/$(PYBIN) $(ENTRY_POINT)

# Create virtual environment
$(VENV_NAME)/bin/activate: $(DEPS_NAME)
	make venv
	make install

# Force install dependencies from requirements
install:
	./$(VENV_NAME)/bin/pip install -r $(DEPS_NAME)
	make lock

# Create a pip lock file
lock:
	./$(VENV_NAME)/bin/pip freeze > $(LOCK_NAME)

# Force create virtual environment
venv:
	$(PYBIN) -m venv $(VENV_NAME)