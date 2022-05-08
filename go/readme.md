# Go Makefile

A Makefile for go environments using a standard go module.

> Don't forget to customize settings parameters and scripts for your specific project.

[[_TOC_]]

## Commands

|Command|Effect|
|---|---|
|`make`, `make all`|Cleans, compiles then runs the project|
|`make run`|Runs the project, builds if does not exist|
|`make clean`|Removes build files, formats code and tidies the modules|
|`make build`|Builds the project|
|`make publish`|Builds the project to multiple platforms|
|`make new`|Builds the project to multiple platforms|
|`make init`|Creates a go module with the name `mainmodule`. Rename the module after running the command|

## Settings

|Name|Default|Description|
|---|---|---|
|`main`|`main.go`|Name of the main go compile target|
|`bins`|`bin`|Name of the build directory|
|`target`|`main`|Name of the output executable in the build directory|
|`params`||Run parameters for `run` and `all` commands|
|`bflags`||Build flags for standard building|
|`pflags`||Build flags for publish building|
