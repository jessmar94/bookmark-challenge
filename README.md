# Bookmark Challenge README

# How to Use SQL Queries
### Bookmark Manager
1. Connect to ```psql```
2. Create the database using the ```psql``` command ```CREATE DATABASE bookmark_manager;```
3. Connect to the database using the ```psql``` command ```\c bookmark_manager;```
4. Run the query we have saved in the file ```01_create_bookmarks_table.sql```  
### Bookmark Manager Test
1. Connect to ```psql```
2. Create the database using the ```psql``` command ```CREATE DATABASE bookmark_manager_test;```
3. Connect to the database using the ```psql``` command ```\c bookmark_manager_test;```
4. Run the query we have saved in the file ```01_create_bookmarks_table.sql```  

## User Story 1
As a user,
So I can visit my favourite websites,
I want to see a list of my bookmarks in a Bookmark Manager.

### Domain Mapping
| bookmarks | <-- display -->

Database --> Model layer --> Control Layer --> View layer
View = homepage to show list of bookmarks, erb :bookmarks
Controller = contains the different paths - class Bookmarks and app.rb file
Model = interacts with the database and contains Ruby code - class Bookmark

| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate bookmark data in a class    |
| View        | Display the result to a user                  | Show the bookmark data in a list        |
| Controller  | Get data from the model and put in the view   | Render bookmark data into to the view

# User Story 2
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

| bookmark | <-- add

User flow:
1. Visit page /bookmarks/new
2. Type URl and title into a form
3. Submit the form
4. See the new book on /bookmarks page

# User Story 3
As a user,
So that I can remove a bookmark
I would like to add a delete button that removes bookmarks

User flow:
1. Visit bookmarks page
2. Click a delete button next to a bookmark
3. See the bookmarks page without that bookmark 

# User Story 4
As a user
So I can change a bookmark in Bookmark Manager
I want to update a bookmark

User flow:
1. Visit 'update bookmark' form for a particular bookmark
2. Fill in the form with new data and submit it
3. See the homepage with the updated title/url
