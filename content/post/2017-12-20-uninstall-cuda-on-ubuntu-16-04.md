---
title: Uninstall CUDA on Ubuntu 16.04
author: Samuel Bohman
date: '2017-12-20'
slug: uninstall-cuda-on-ubuntu-16-04
categories: []
tags:
  - cuda
summary: "How to uninstall CUDA on Ubuntu 16.04"
---

## Uninstall cuda

```{bash, eval = FALSE}
# Remove cuda
sudo apt-get --purge remove cuda
sudo apt autoremove

# Clear apt-get cache
sudo apt-get clean
```

If you are having trouble with removing cuda 9.x and installing cuda 8.0 instead, you can try this:

```{bash, eval = FALSE}
dpkg -l | grep cuda- | awk '{print $2}' | xargs -n1 sudo dpkg --purge
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
sudo apt autoremove
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
```
