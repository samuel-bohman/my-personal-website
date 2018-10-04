---
title: Install Turi Create with GPU Support
author: Samuel Bohman
date: '2017-12-20'
slug: install-turicreate-with-gpu-support
categories: []
tags:
  - turicreate
  - cuda
  - cudnn
summary: "How to install Turi Create with GPU support."
---

To use, install, or build Turi Create use `virtualenv`:

```{bash, eval = FALSE}
pip install virtualenv
```

The method for installing Turi Create follows the standard python package installation steps. To create and activate a Python virtual environment called venv follow these steps:

```{bash, eval = FALSE}
# Create a Python virtual environment
cd ~
virtualenv venv

# Activate your virtual environment
source ~/venv/bin/activate
```

To install Turi Create within your virtual environment:

```{bash, eval = FALSE}
pip install -U turicreate
```

## GPU Support

To enable GPU support after installation of the turicreate package, do the following steps. 

First, [download and Install CUDA 8.0](https://developer.nvidia.com/cuda-80-ga2-download-archive). The official documentation is detailed and good so I will not go over it here. 

Next, [download and install cuDNN v5 for CUDA 8.0](https://developer.nvidia.com/rdp/cudnn-archive). Uncompress and copy cuDNN to the toolkit directory. The toolkit default install location is `/usr/local/cuda`:

```{bash, eval = FALSE}
$ tar xvzf cudnn-8.0-linux-x64-v5.1-ga.tgz
$ sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include
$ sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
$ sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
```

Now you need to update your bash file:

```{bash, eval = FALSE}
$ gedit ~/.bashrc
```

With the text editor open, scroll to the bottom and paste in these lines:

```{bash, eval = FALSE}
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda
```

Save and close it. Now CUDA and cuDNN are installed and ready to go. 
