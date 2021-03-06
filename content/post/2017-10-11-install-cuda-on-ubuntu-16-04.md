---
title: Install CUDA on Ubuntu 16.04
author: Samuel Bohman
date: '2017-10-11'
slug: install-cuda-on-ubuntu-16-04
categories: []
tags:
  - cuda
  - ubuntu 16.04
  - parallel computing
summary: "A step-by-step tutorial on how to install CUDA on Ubuntu 16.04."
---

This blog post describes how to install NVIDIA CUDA on Ubuntu 16.04 for parallel computing. The exact appearance and the output lines might be different on your system. 

## Pre-Installation Actions

### Verify You Have a CUDA-Capable GPU

```{bash}
lspci | grep -i nvidia
```

### Verify You Have a Supported Version of Linux

```{bash}
uname -m && cat /etc/*release
```

### Verify the System Has gcc Installed

```{bash}
gcc --version
```

### Verify the System has the Correct Kernel Headers and Development Packages Installed

```{bash}
uname -r
```

The kernel headers and development packages for the currently running kernel can be installed with:

```{bash, eval = FALSE}
sudo apt-get install linux-headers-$(uname -r)
```

### Choose an Installation Method

NVIDIA recommends to use the distribution-specific packages, where possible.

### Download the NVIDIA CUDA Toolkit

The NVIDIA CUDA Toolkit is available [here](http://developer.nvidia.com/cuda-downloads). Next, verify your download by comparing the [MD5 checksum](http://developer.download.nvidia.com/compute/cuda/9.0/Prod/docs/sidebar/md5sum.txt). To calculate the MD5 checksum of the downloaded file, run the following (you may need to change the `~/Downloads/` part):

```{bash}
md5sum ~/Downloads/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb
```

#### Handle Conflicting Installation Methods

Before installing CUDA, any previously installations that could conflict should be uninstalled.

```{bash, eval = FALSE}
# Use the following command to uninstall a Toolkit runfile installation
sudo /usr/local/cuda-X.Y/bin/uninstall_cuda_X.Y.pl

# Use the following command to uninstall a Driver runfile installation
sudo /usr/bin/nvidia-uninstall

# Use the following commands to uninstall a RPM/Deb installation
sudo apt-get --purge remove <package_name>  # Ubuntu
```

## Packet Manager Installation 

1. Perform the pre-install actions (described above)
2. Install repository meta-data

```{bash, eval = FALSE}
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb
```

3. Install the CUDA public GPG key

```{bash, eval = FALSE}
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
```

4. Update the Apt repository cache

```{bash, eval = FALSE}
sudo apt-get update
```

5. Install CUDA

```{bash, eval = FALSE}
sudo apt-get install cuda
```

6. Reboot

```{bash, eval = FALSE}
sudo reboot
```


## Post-Installation Actions

The post-installation actions must be manually performed. 

### Environment Setup

```{bash, eval = FALSE}
export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```

### Install Writable Samples

In order to modify, compile, and run the samples, the samples must be installed with write permissions. A convenience installation script is provided:

```{bash, eval = FALSE}
cuda-install-samples-9.0.sh ~/  # root directory 
```

### Verify the Installation

Before continuing, it is important to verify that the CUDA toolkit can find and communicate correctly with the CUDA-capable hardware. To do this, you need to compile and run some of the included sample programs.

#### Verify the driver version

```{bash}
cat /proc/driver/nvidia/version
```

#### Verify the CUDA Toolkit version

```{bash}
nvcc -V
```

#### Verify NVIDIA System Management Interface

The NVIDIA System Management Interface (nvidia-smi) is a command line utility intended to aid in the management and monitoring of NVIDIA GPU devices. 

```{bash}
nvidia-smi
```

#### Compile CUDA Toolkit sample programs  

Go to the folder where the samples resides: `~/NVIDIA_CUDA-9.0_Samples`. 

```{bash, eval = FALSE}
make
```

#### Run `deviceQuery`  

If the CUDA software is installed and configured correctly, the output for `deviceQuery` should look similar to the output below. 

```{bash}
~/NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/./deviceQuery
```

The important outcomes are that a device was found (`Detected 1 CUDA Capable device(s)`), that the device matches the one on your system (`Device 0: "GeForce GTX 1060 6GB"`), and that the test passed (`Result = PASS`).

#### Run `bandwidthTest`  

Running the `bandwidthTest` program ensures that the system and the CUDA-capable device are able to communicate correctly. 

```{bash}
~/NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/./bandwidthTest
```

The important point is that you obtain measurements, and that the second-to-last line (`Result = PASS`) confirms that all necessary tests passed. Finally done!
