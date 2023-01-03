#!/bin/bash

# GitHub pages with notebook support:

# Ref: https://jiaweizhuang.github.io/blog/nikola-guide/

# 1. Created page as docs in https://pages.github.com/

# 2. Cloned page repo
GITHUB_USERNAME="marcelotournier"
git clone https://github.com/${GITHUB_USERNAME}/${GITHUB_USERNAME}.github.io
cd ${GITHUB_USERNAME}.github.io

# Install nikola (RECOMMENDED - Use a brand new virtual environment with python >= 3.7):
pip install nikola aiohttp watchdog notebook

# Init the site in the repo:
nikola init

# Follow the prompts:
"""
(nikola) marcelotournier@MBP-MT marcelotournier.github.io % nikola init                     
Creating Nikola Site
====================

This is Nikola v8.2.3.  We will now ask you a few easy questions about your new site.
If you do not want to answer and want to go with the defaults instead, simply restart with the `-q` parameter.
--- Questions about the site ---
Destination: 
    ERROR: you need to specify a target directory.

Destination: .
Site title [My Nikola Site]: Marcelo Tournier
Site author [Nikola Tesla]: Marcelo Tournier
Site author's e-mail [n.tesla@example.com]: marcelo@inova.life
Site description [This is a demo site for Nikola.]: My Personal Website
Site URL [https://example.com/]: marcelotournier.github.io
    ERROR: You must specify a protocol (http or https).
Site URL [https://example.com/]: https://marcelotournier.github.io
    The URL does not end in '/' -- adding it.
Enable pretty URLs (/page/ instead of /page.html) that don't need web server configuration? [Y/n] Y
--- Questions about languages and locales ---
We will now ask you to provide the list of languages you want to use.
Please list all the desired languages, comma-separated, using ISO 639-1 codes.  The first language will be used as the default.
Type '?' (a question mark, sans quotes) to list available languages.
Language(s) to use [en]: en,pt_br

Please choose the correct time zone for your blog. Nikola uses the tz database.
You can find your time zone here:
https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

Time zone [America/Sao_Paulo]: America/New_York
    Current time in America/New_York: 04:53:22
Use this time zone? [Y/n] Y
--- Questions about comments ---
You can configure comments now.  Type '?' (a question mark, sans quotes) to list available comment systems.  If you do not want any comments, just leave the field blank.
Comment system: disqus
You need to provide the site identifier for your comment system.  Consult the Nikola manual for details on what the value should be.  (you can leave it empty and come back later)
Comment system site identifier: marcelo-tournier

That's it, Nikola is now configured.  Make sure to edit conf.py to your liking.
If you are looking for themes and addons, check out https://themes.getnikola.com/ and https://plugins.getnikola.com/.
Have fun!
[2023-01-03 06:53:42] INFO: init: Created empty site at ..
(nikola) marcelotournier@MBP-MT marcelotournier.github.io % ls
LICENSE    README.md  conf.py    files/     galleries/ images/    listings/  pages/     posts/
"""

# Change theme in conf.py - look for line and modify:
# THEME = "bootstrap4"

# Create nb post:
nikola new_post -f ipynb



git remote set-url origin git@github.com:marcelotournier/marcelotournier.github.io.git

