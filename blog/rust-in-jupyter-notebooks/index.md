<!--
.. title: How to add Rust support in Jupyter notebooks
.. slug: rust-in-jupyter-notebooks
.. date: 2023-01-03 07:01:36 UTC-05:00
.. tags: code,rust,jupyter
.. category: 
.. link: 
.. description: 
.. type: text
-->

```sh
#!/bin/bash
# Adds Rust lang support in Jupyter notebooks
# Ref: https://github.com/google/evcxr

# Requirements : Jupyter already installed. If you need it, go to "https://www.anaconda.com/products/distribution"

# Install Rust:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install notebook kernel:
cargo install evcxr_jupyter
evcxr_jupyter --install

# Stop and Restart the Jupyter server
# or in the browser, logoff and login your Jupyter session again
```
