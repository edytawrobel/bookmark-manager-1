# Bookmark Manager
### Makers Academy Weekly Challenge No. 4

### Specification

* It shows a list of **links** from the **database**
* New links can be added
* Links can be tagged
* Links can be filtered by a tag

```
As an Internet user,
So that I can return to interesting websites,
I'd like to see a list of links from the database

As an Internet user,
So that I can save a website to access it later,
I'd like add a link to the database

As an Internet user,
So that I can better organise my bookmarks,
I'd like to tag links stored in the database

As an Internet user,
So that I can find a particular website more quickly,
I'd like to see a list of links from the database filtered by their tag
```

### Domain model

|Objects  |Messages             |State   |
|---------|:-------------------:|:------:|
|User     |log_in;              |Username|
|Weblinks |add_tag;             |Tags    |
|Database |save_link; find_link |Links   |
