+++
# Projects widget.
# This widget displays all projects from `content/project/`.

date = "2016-04-20T00:00:00"
draft = false

title = "Projects"
subtitle = "Software, code snippets, datasets, misc."
widget = "projects"

# Order that this section will appear in.
weight = 40

# View.
# Customize how projects are displayed.
# Legend: 0 = list, 1 = cards.
view = 1

# Filter toolbar.
# Add or remove as many filters (`[[filter]]` instances) as you like.
# Use "*" tag to show all projects or an existing tag prefixed with "." to filter by specific tag.
# To remove toolbar, delete/comment all instances of `[[filter]]` below.
[[filter]]
  name = "All"
  tag = "*"
  
[[filter]]
  name = "R"
  tag = ".r"

[[filter]]
  name = "Python"
  tag = ".python"
  
[[filter]]
  name = "Julia"
  tag = ".julia"
  
[[filter]]
  name = "Wolfram"
  tag = ".wolfram"
  
[[filter]]
  name = "SQL"
  tag = ".sql"

[[filter]]
  name = "Other"
  tag = ".other"

+++

