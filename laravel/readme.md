# Laravel Makefile

A Makefile for laravel environments using composer, artisan and npm.

> Don't forget to customize settings parameters and scripts for your specific project.

## Commands

|Command|Effect|
|---|---|
|`make`, `make serve`|Starts the server. Installs dependencies if changed or missing|
|`make install`|Installs dependencies if changed or missing|
|`make seed`|Removed database entries, migrates and seeds it|
|`make model`|Creates a model. Must specify `mod` parameter|
|`make new`|Generates a standard Laravel project using composer|
|`make setup`|Installs php, required tools and composer|

## Settings

|Name|Default|Description|
|---|---|---|
|`package_folder`|`vendor`|Name of the package folder|
|`params`||Parameters for the server on `serve` command|
