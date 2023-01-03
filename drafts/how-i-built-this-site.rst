.. title: How I Built This Site
.. slug: how-i-built-this-site
.. date: 2023-01-02 15:49:22 UTC-05:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text

Hey! I thought a good beginning for my site would be sharing a snippet with
some info about how I created this site.

First of all, all I needed was a space to store random thoughts, code snippets and stuff.

For this purpose, a static website, with a simple design would be more than enough!

Since I am a python person,  I used `Nikola <https://getnikola.com/>`_. The best static site generators 
are built with JS or Ruby based, but I wanted to stick with Python, since I am a bit of control freak, 
and wanted to troubleshoot it just in case I needed it.

Another advantage of Nikola is that it is dead-simple easy to use.  All I needed to do was:

1. Installed Nikola 
```
pip install nikola
```

2. Created my website
```
nikola init mysite
```

3. Build the site. Every change you make in your static site, you should run `nikola build`
```
cd mysite
nikola build
```

4. Run the site on a development server locally
```
nikola serve
```

5. Make a new post. This will only create the site post file. 
To edit the content, look in the `./posts` folder for the `.rst` file you just created
```
nikola new_post
```

5. Make a new page. This will only create the site page file. 
To edit the content, look in the `./pages` folder for the `.rst` file you just created
```
nikola new_page
```

6. Setup `conf.py` to point the new page added, or extra links if you want:
```
# In the conf.py file, make these changes to match the branch names you are using:
NAVIGATION_LINKS = {
    DEFAULT_LANG: (
        ("/", "Home"),
        ("/pages/about-me", "About"),
        ("/archive.html", "Archive"),
        ("/categories/", "Tags"),
        ("/rss.xml", "RSS"),
        ("https://www.linkedin.com/in/marcelotournier/", "LinkedIn"),
        ("https://github.com/marcelotournier", "Github"),
    )
}
```

7. Let's prepare our site for github publishing. 
Create a `.gitignore` file locally and add these lines:
```
cache
.doit.db
__pycache__
output
```

8. Setup `conf.py` for github publishing:
```
# In the conf.py file, make these changes to match the branch names you are using:
GITHUB_SOURCE_BRANCH = 'main'
GITHUB_DEPLOY_BRANCH = 'main'

# The name of the remote where you wish to push to, using github_deploy.
GITHUB_REMOTE_NAME = 'origin'
```

9. Create a public github repository and push your branch into it.
Once you created, make sure you set Github Pages support in this repo, according to 
their `documentation <https://getnikola.com/>`_

10. Push everything locally to the remote github repo. Usually you get these instructions
whenever you create a new empty repo in github.com . Check github documentation for details.

11. 