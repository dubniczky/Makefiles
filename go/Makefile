# Makefile for go development
# Richard Antal Nagy, 2022
# https://github.com/dubniczky/Makefiles


# Settings
main := main.go # Main entry point
bins := bin # Folder for binaries
target := main # Final executable base name
params := # debug parameters
bflags := # Build parameters
pflags := # Publish parameters

# Default help command to list available commands
help::
	@echo "Go development makefile"
	@echo ""
	@echo "Command utilities:"
	@echo "make|make help - This command, shows available commands"
	@echo "make clean" - Removes binaries and runs go format, tidy and clean utilities
	@echo "make build" - Builds a debug version of the application
	@echo "make publish" - Builds a release version of the application for multiple platforms
	@echo "make run" - Runs the compiled debug version, auto builds if missing or outdated
	@echo "make all" - Run clean, build, run consecutively
	@echo ""
	@echo "One-time commands:"
	@echo "make init" - Creates a new default go module
	@echo "make new" - Creates a new sample Hello-world project

# Default command if no parameters are given to make
all:: clean build run

# Cleans up project. Removes binaries and formats code
clean::
	@rm -rf ./$(bins)/*
	@go clean
	@go fmt
	@go mod tidy

# Compile main target
build:: $(main)
	@go build -o ./$(bins)/$(target) $(bflags) $(main)

# Compile project to multiple platforms
publish:: $(main) clean
	GOOS=linux   GOARCH=amd64 go build -o ./$(bins)/$(target)-linux-x64   $(pflags) $(main)
	GOOS=linux   GOARCH=386   go build -o ./$(bins)/$(target)-linux-x86   $(pflags) $(main)
	GOOS=linux   GOARCH=arm   go build -o ./$(bins)/$(target)-linux-arm   $(pflags) $(main)
	GOOS=darwin  GOARCH=amd64 go build -o ./$(bins)/$(target)-darwin-x64  $(pflags) $(main)
	GOOS=darwin  GOARCH=386   go build -o ./$(bins)/$(target)-darwin-x86  $(pflags) $(main)
	GOOS=windows GOARCH=amd64 go build -o ./$(bins)/$(target)-windows-x64 $(pflags) $(main)
	GOOS=windows GOARCH=386   go build -o ./$(bins)/$(target)-windows-x86 $(pflags) $(main)

# Run the compiled target and build if it does not exist
run:: ./$(bins)/$(target)
	@./$(bins)/$(target) $(params)

# Create a go package
init::
	@go mod init mainmodule

# Generate a new sample start project
new::
	@echo "Generating sample project.."
	@echo 'package main\nimport "fmt"\nfunc main(){fmt.Println("Hello Human!")}' > $(main)
	@touch go.sum
	-@$(MAKE) -s init 2> /dev/null
	@go fmt > /dev/null
	@echo "Done."


# Compile target dependency
./bin/$(target):
	@$(MAKE) -s build
