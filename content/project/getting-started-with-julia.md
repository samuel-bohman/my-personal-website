+++
# Date this page was created.
date = "2017-09-17"

# Project title.
title = "Getting Started with Julia"

# Project summary to display on homepage.
summary = "Installation of the Julia programming language on Linux Ubuntu"

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "julia-200x232.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["julia"]

# Optional external URL for project (replaces project detail page).
# external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
[header]
# image = "headers/bubbles-wide.jpg"
caption = "My caption :smile:"

+++

# Installation

## Julia

Download [Julia](https://julialang.org/) and run the installer. 

Extract the `.tar.gz` file downloaded to a folder on your computer. Next, run the following command in a terminal:

```bash
sudo ln -s <where you extracted the julia archive>/bin/julia /usr/local/bin/julia
```

To start Julia, just type `julia` in a terminal window. 

To update the Julia packages, keeping Julia itself the same, run `Pkg.update()` at the Julia prompt. 

## Anaconda

Download [Anaconda](https://www.anaconda.com). 

After downloading the installer, run the following command from a terminal:

```bash
$ bash Anaconda3-4.4.0-Linux-x86_64.sh
```

To run the Anaconda Navigator GUI after installation, run the command `anaconda-navigator`. 

## IJulia

Next, at the prompt, type

```bash
Pkg.add("IJulia")
```

to install IJulia. On Linux, it defaults to looking for jupyter in your PATH first, and only installs the Conda Jupyter if that fails. 

In Julia, at the `julia>` prompt, type 

```bash
using IJulia
notebook()
```

to launch the IJulia notebook in your browser. Alternatively, you can run `jupyter notebook` from the command line. Click on the New button and choose the Julia option to start a new "notebook". 
