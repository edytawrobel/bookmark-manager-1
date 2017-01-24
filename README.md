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

### Understanding CRUD

###### Defines CRUD
* Create, read, update and delete (as an acronym CRUD) are the four basic functions of persistent storage

###### Defines SQL
* SQL stands for Structured Query Language and it is the standard language for relational database management

###### Give SQL examples for each CRUD action

|CRUD Action | SQL Example                                                   |
|------------|:-------------------------------------------------------------:|
|Create      |INSERT INTO table_name (column_one) VALUES (value_one);        |
|Read        |SELECT * FROM table_name;                                      |
|Update      |UPDATE table_name SET column_one = value_one WHERE [condition];|
|Delete      |DELETE FROM table_name WHERE [condition];                      |
