+++
date = "2017-06-28T12:00:00"
draft = false
tags = ["blogdown", "hugo", "netlify"]
title = "Moved from WordPress to Hugo"
math = false
summary = """
A couple of days ago I stumpled upon [blogdown](https://github.com/rstudio/blogdown) and I was immediatly convinced to transition to Hugo with its help.  
"""

[header]
image = ""
caption = ""

+++

A couple of days ago I stumpled upon [blogdown](https://github.com/rstudio/blogdown) and I was immediatly convinced to transition from WordPress to [Hugo](https://gohugo.io/), a static website generator, with its help. Thanks to the [blogdown book](https://bookdown.org/yihui/blogdown/) the setup was easy: it took me about a day's work. However, the migration from WordPress to Hugo via Jekyll using the Python tool [exitwp](https://github.com/thomasf/exitwp) did not fully succeed (I lost all the comments). Since I did not want to spend too much time on this problem, I decided to leave [my old WordPress website](http://samboh.blogs.dsv.su.se/) and start anew with Hugo. Once everything is set up and running, the work process is really smooth and enjoyable. Hugo’s is extremely fast and takes the fun back into site-building. Writing text in markdown and deploying with git is how I as a computer scientist like to make content. 

In a nutshell, this is my work process: 

1. Blogdown: I write all blog posts in [R Markdown](http://rmarkdown.rstudio.com/) using [RStudio IDE](https://www.rstudio.com/products/RStudio/). 
2. GitHub: Then, I push all new content to my-personal-website repository on [GitHub](https://github.com/samuel-bohman/my-personal-website).
3. Netlify: Each time new content is pushed to GitHub, Netlify automatically updates [my new website](https://samuel.netlify.com/) (this one!) through a webhook. It only takes about 10 seconds or so for the new content to be generated. 

For more detailed information and tutorials, I suggest the following resources:  

- [Up and running with blogdown](https://apreshill.rbind.io/post/up-and-running-with-blogdown/) by Alison Presmanes Hill  
- [Making a Website Using Blogdown, Hugo, and GitHub pages](https://proquestionasker.github.io/blog/Making_Site/) by Amber Thomas  
- [Create a Free Personal Academic Website with Hugo](https://georgecushen.com/create-your-website-with-hugo/) by George Cushen  
- [Migrating a blog (yes, this one!) from Wordpress to Hugo](http://justindunham.net/migrating-from-wordpress-to-hugo/) by Justin Dunham  
- [The GitHub organization "rbind"](https://support.rbind.io/about/) 

Enjoy! `r emo::ji("smile")`