# Makefile for nodejs applicatios
# Richard Antal Nagy, 2022
# https://gitlab.com/richardnagy/makefiles


# Settings
pm := yarn # Package manager (commands might not be compatible with all)
lockfile := yarn.lock # Lockfile path
modules := node_modules # Node package patch (probably node_modules)
node := node # Node command used for package checking
devnode := npx nodemon # Node command used for development
depnode := npx pm2-runtime start # Node command used in deployment mode
main := main.js # Main entry point of the application
debug_args := --trace-exit --trace-uncaught --trace-warnings # Arguments for debug runtime
deploy_args := # Arguments for deployment runtime
container := myapp:api # Container name:tag
container_port_internal := 8080 # Container internal exposed port
container_port_external := 4000 # Container external exposed port


# Start the application in development mode
dev:: $(main) $(modules)
	$(devnode) $(debug_args) $(main)

# Run compile test and eslint
lint:: $(modules)
	@echo "Compile test.."
	@$(node) --check $(main)
	@echo "OK"
	@echo "Running ESLint.."
	@npx eslint .
	@echo "OK"

# Fixes auto fixable format errors
fix:: $(modules)
	npx eslint . --fix

# Runs tests
test:: $(modules)
	NODE_OPTIONS='--experimental-vm-modules' npx jest .

# Runs tests in interactive mode
testwatch:: $(modules)
	NODE_OPTIONS='--experimental-vm-modules' npx jest . --watch

# Install packages (development mode)
install:: package.json
	$(pm) install

# Install packages (deployment mode)
deploy:: $(lockfile)
	@echo "Creating deployment.."
	$(pm) install --silent --prod --frozen-lockfile

# Start the application in deployment mode
start:: $(modules)
	$(depnode) $(deploy_args) $(main)

# Create container
container::
	@echo "Building container.. ($(container))"
	@docker build -t $(container) .

# Run container
run::
	@echo "Starting continer.. ($(container))"
	@docker run -p$(container_port_external):$(container_port_internal) $(container)

# Create a new project
new::
	@echo "Creating package.."
	$(pm) init -y
	@echo "Installing default packages.."
	$(pm) add -D eslint nodemon
	@echo 'console.log("Hello Human!")' > $(main)
	@echo New project reated. Run with: make dev


# Auto install packages dependency
$(modules): package.json
	@echo "Dependency inconsistency found, updating.."
	$(MAKE) -s install
