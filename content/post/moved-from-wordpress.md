+++
date = "2016-04-20T12:00:00"
draft = false
tags = ["blogdown", "hugo", "github", "netlify"]
title = "Moved from WordPress to Hugo"
math = true
summary = """
A couple of days ago I stumpled upon [blogdown](https://github.com/rstudio/blogdown) and I was immediatly convinced to transition to Hugo with its help.  
"""

[header]
image = ""
caption = ""

+++

A couple of days ago I stumpled upon [blogdown](https://github.com/rstudio/blogdown) and I was immediatly convinced to transition to Hugo with its help. The previous version of my website was hosted on WordPress. Thanks to the [blogdown book](https://bookdown.org/yihui/blogdown/) the setup was quite easy: it took me about a days work. However, the migration from WordPress to Hugo via Jekyll using the python tool [exitwp](https://github.com/thomasf/exitwp) did not fully succeed (I lost all the comments). Since I did not want to spend too much time on it, I decided to leave [my old WordPress website](http://samboh.blogs.dsv.su.se/) as is, and start afresh with my new Hugo website. Once all is set up, the work process is really simple.

In a nutshell, this is my work process: 

1. Blogdown: I write all blog posts in [R Markdown](http://rmarkdown.rstudio.com/) using [RStudio IDE](https://www.rstudio.com/products/RStudio/) and the blogdown package. 
2. GitHub: Then, I push all source files to [my-personal-website](https://github.com/samuel-bohman/my-personal-website) repository.
3. Netlify: Each time new content is pushed to my GitHub repository, Netlify automatically updates [my new website](https://samuel.netlify.com/) (this one!) through a webhook. 

For more information and tutorials, I suggest the following resources:  

- [Up and running with blogdown](https://apreshill.rbind.io/post/up-and-running-with-blogdown/) by Alison Presmanes Hill  
- [Making a Website Using Blogdown, Hugo, and GitHub pages](https://proquestionasker.github.io/blog/Making_Site/) by Amber Thomas  
- [Create a Free Personal Academic Website with Hugo](https://georgecushen.com/create-your-website-with-hugo/) by George Cushen  
- [Migrating a blog (yes, this one!) from Wordpress to Hugo](http://justindunham.net/migrating-from-wordpress-to-hugo/) by Justin Dunham  
- [The GitHub organization "rbind"](https://support.rbind.io/about/) 