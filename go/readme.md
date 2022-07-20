# Go Makefile

A Makefile for go environments using a standard go module.

> Don't forget to customize settings parameters and scripts for your specific project.

## Commands

|Command|Effect|
|---|---|
|`make`, `make help`|Shows this help message|
|`make all`|Run clean, build, run consecutively|
|`make run`|Runs the compiled debug version, auto builds if missing or outdated|
|`make clean`|Removes binaries and runs go format, tidy and clean utilities|
|`make build`|Builds a debug version of the application|
|`make publish`|Builds a release version of the application for multiple platforms|
|`make new`|Creates a new sample Hello-world project|
|`make init`|Creates a new default go module|

## Settings

|Name|Default|Description|
|---|---|---|
|`main`|`main.go`|Name of the main go compile target|
|`bins`|`bin`|Name of the build directory|
|`target`|`main`|Name of the output executable in the build directory|
|`params`||Run parameters for `run` and `all` commands|
|`bflags`||Build flags for standard building|
|`pflags`||Build flags for publish building|
