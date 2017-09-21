+++
# Date this page was created.
date = "2017-09-17"

# Project title.
title = "Getting Started with Julia"

# Project summary to display on homepage.
summary = "Installation of the Julia programming language and setup of alternative IDEs on Ubuntu 16.04."

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
# caption = "My caption :smile:"

+++

# Installation

[Julia](https://julialang.org/) is a high-level, high-performance dynamic programming language for numerical computing with performance comparable to traditional statically-typed languages such as C. It is multi-paradigm, combining features of imperative, functional, and object-oriented programming. Julia provides ease and expressiveness for high-level numerical computing, in the same way as languages such as R, MATLAB, and Python, but also supports general programming. Julia is free and open source. 

## Julia

Download Julia and extract the `.tar.gz` file downloaded to a folder on your computer. Next, run the following command in a terminal:

```bash
sudo ln -s <where you extracted the julia archive>/bin/julia /usr/local/bin/julia
```

To start Julia, just type `julia` in a terminal window:

```julia
samuel@ASUS:~$ julia
               _
   _       _ _(_)_     |  A fresh approach to technical computing
  (_)     | (_) (_)    |  Documentation: http://docs.julialang.org
   _ _   _| |_  __ _   |  Type "?help" for help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 0.4.5 (2016-03-18 00:58 UTC)
 _/ |\__'_|_|_|\__'_|  |  
|__/                   |  x86_64-linux-gnu

julia>
```

To update the Julia packages, keeping Julia itself the same, run `Pkg.update()` at the Julia prompt. 

## Anaconda

Anaconda is a free, platform-agnostic Python distribution and packet manager. The [Jupyter Notebook](http://jupyter.org/) comes bundled with Anaconda. 

Download [Anaconda](https://www.anaconda.com). 

After downloading the installer, run the following command from a terminal:

```bash
$ bash Anaconda3-4.4.0-Linux-x86_64.sh
```

If you want to check out the Anaconda Navigator GUI after installation, run the command `anaconda-navigator`. Pretty cool! :snake:

## IJulia

Next, at the prompt, type

```julia
Pkg.add("IJulia")
```

to install IJulia. On Linux, it defaults to looking for jupyter in your PATH first, and only installs the Conda Jupyter if that fails. 

In Julia, at the `julia>` prompt, type 

```julia
using IJulia
notebook()
```

to launch the IJulia notebook in your browser. Alternatively, you can run `jupyter notebook` from the command line. Click on the New button and choose the Julia option to start a new "notebook". 

Enjoy! :smile:

