#!/bin/bash

# Creating static websites with python

# 1. Install nikola:

pip install nikola

# To initialize the site:
nikola init mysite

# Build the site
cd mysite
nikola build

# Test it:
nikola serve

# Change the site template in "conf.py" in the line "THEME = 'base'"

# Make a post
nikola new_post

# Edit a post
nikola new_post -e

# Follow guide at "https://pages.github.com/"

# Site at https://marcelotournier.github.io/mt_site
# If "google chrome security error" appears: copy the URL and paste
# in the google search bar, this will get the site verified


