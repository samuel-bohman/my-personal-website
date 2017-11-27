---
title: Getting Started with Julia
author: Samuel Bohman
date: '2017-09-17'
slug: getting-started-with-julia
categories: []
tags:
  - julia
summary: "Installation of the Julia programming language and setup of IJUlia on Ubuntu 16.04."
---

# Introduction

[Julia](https://julialang.org/) is a free and open source programming language that combines the performance of traditional statically-typed languages such as C or Fortran, with the ease and expressiveness of high-level languages such as R, MATLAB, and Python. This tutorial shows how to install Julia on a 64-bit Ubuntu 16.04 machine, together with [Anaconda](https://www.anaconda.com) (Jupyter Notebook) and [IJulia](https://github.com/JuliaLang/IJulia.jl).  

## Install Julia

Download the Generic Linux Binaries for x86 (64-bit) from the [Julia website](https://julialang.org/downloads/) and extract the `.tar.gz` file to a folder on your computer. To create a symbolic link, run the following command in a terminal:

```
sudo ln -s <where you extracted the julia archive>/bin/julia /usr/local/bin/julia
```

If you are upgrading Julia from an older version, you may first have to remove the existing symbolic link using the following command (before you run the above command):

```
sudo rm /usr/local/bin/julia
```

To start Julia, just type `julia` in a terminal window:

```
samuel@ASUS:~$ julia
   _       _ _(_)_     |  A fresh approach to technical computing
  (_)     | (_) (_)    |  Documentation: https://docs.julialang.org
   _ _   _| |_  __ _   |  Type "?help" for help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 0.6.1 (2017-10-24 22:15 UTC)
 _/ |\__'_|_|_|\__'_|  |  Official http://julialang.org/ release
|__/                   |  x86_64-pc-linux-gnu

julia>
```

To update the Julia packages, keeping Julia itself the same, run `Pkg.update()` at the Julia prompt. 

To remove Julia, type `sudo apt-get remove julia` at the terminal. 

## Install Anaconda

Anaconda is a free, platform-agnostic Python distribution and packet manager. The [Jupyter Notebook](http://jupyter.org/) comes bundled with Anaconda. 

Download [Anaconda](https://www.anaconda.com). After downloading the installer, run the following command from a terminal:

```
$ bash Anaconda3-4.4.0-Linux-x86_64.sh
```

If you want to check out the Anaconda Navigator GUI after installation, run the command `anaconda-navigator`. Pretty cool! :snake:

## Install IJulia

Next, at the prompt, type

```
Pkg.add("IJulia")
```

to install IJulia. On Linux, it defaults to looking for jupyter in your PATH first, and only installs the Conda Jupyter if that fails. 

In Julia, at the `julia>` prompt, type the following to launch the IJulia notebook in your browser. 

```
using IJulia
notebook()
```

Alternatively, you can run `jupyter notebook` from the command line. Click on the New button and choose the Julia option to start a new "notebook". 

Enjoy! :smile:
