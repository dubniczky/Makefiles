# Makefile for go development
# Richard Antal Nagy, 2022
# https://gitlab.com/richardnagy/makefiles

# Settings
main := main.go
bins := bin
target := main
params := 
bflags := 
pflags := 

# Run even if a file or folder with the same name exists
.PHONY: all clean build publish run init new

# Default command if no parameters are given to make
all: clean build run

# Cleans up project. Removes binaries and formats code
clean:
	@rm -rf ./$(bins)/*
	@go clean
	@go fmt
	@go mod tidy

# Compile target dependency
./bin/$(target):
	@$(MAKE) -s build

# Compile main target
build: $(main)
	@go build -o ./$(bins)/$(target) $(bflags) $(main)

# Compile project to multiple platforms
publish: $(main) clean
	GOOS=linux   GOARCH=amd64 go build -o ./$(bins)/$(target)-linux-x64   $(pflags) $(main)
	GOOS=linux   GOARCH=386   go build -o ./$(bins)/$(target)-linux-x86   $(pflags) $(main)
	GOOS=linux   GOARCH=arm   go build -o ./$(bins)/$(target)-linux-arm   $(pflags) $(main)
	GOOS=darwin  GOARCH=amd64 go build -o ./$(bins)/$(target)-darwin-x64  $(pflags) $(main)
	GOOS=darwin  GOARCH=386   go build -o ./$(bins)/$(target)-darwin-x86  $(pflags) $(main)
	GOOS=windows GOARCH=amd64 go build -o ./$(bins)/$(target)-windows-x64 $(pflags) $(main)
	GOOS=windows GOARCH=386   go build -o ./$(bins)/$(target)-windows-x86 $(pflags) $(main)

# Run the compiled target and build if it does not exist
run: ./$(bins)/$(target)
	@./$(bins)/$(target) $(params)

# Create a go package
init:
	@go mod init mainmodule

# Generate a new sample start project
new:
	@echo "Generating sample project.."
	@echo 'package main\nimport "fmt"\nfunc main(){fmt.Println("Hello Human!")}' > $(main)
	@touch go.sum
	-@$(MAKE) -s init 2> /dev/null
	@go fmt > /dev/null
	@echo "Done."