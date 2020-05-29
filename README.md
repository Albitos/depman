# What is it
Depman is a wrapper for popular dependency managers. Currently supported ones are composer, pip and npm. Other ones are really easy to add - pull requests are welcome.

It automatically adds alias for those programs and executes them through configured docker container.
This isolates all scripts executed by packages to the local directory and prevents malicious code from accessing the developers machine.

# Why
There are two reasons to using depman:
 1. Security of local development environment
 2. Easier management of development environment versions and tools   

# Installation
First make sure you have [jq](https://stedolan.github.io/jq/) installed. 

Clone this repository and add `source shrc` to your bashrc or zshrc.

# Usage

Simply execute `composer`, `pip` or `npm` as usual. They will be executed from within a docker container using version defined in config.

You can switch docker image and tag using following command:

`depman_switch_image [plugin]`

It will set image and tag for current directory and save it to a config file.

# Configuration
You can edit `workspace.default.json` to edit default workspace settings. 
Configuration for individual workspaces are in `workspaces` directory - they are created if you change default settings for the workspace.
