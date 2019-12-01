# Bookmark Challenge 
Week 4 challenge to build a bookmark manager. A bookmark manager is a website to maintain a collection of bookmarks (URLs). You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse bookmarks other users have added. You can comment on the bookmarks. This project is broken down into 19 steps. 

## Action Plan
### User Story 1
```bash 
As a user,
So I can visit my favourite websites,
I want to see a list of my bookmarks in a Bookmark Manager.
```
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

### User Story 2
```bash 
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```
| bookmark | <-- add

User flow:
1. Visit page /bookmarks/new
2. Type URl and title into a form
3. Submit the form
4. See the new book on /bookmarks page

# User Story 3
```bash 
As a user,
So that I can remove a bookmark
I would like to add a delete button that removes bookmarks
```
User flow:
1. Visit bookmarks page
2. Click a delete button next to a bookmark
3. See the bookmarks page without that bookmark

# User Story 4
```bash 
As a user
So I can change a bookmark in Bookmark Manager
I want to update a bookmark
```
User flow:
1. Visit 'update bookmark' form for a particular bookmark
2. Fill in the form with new data and submit it
3. See the homepage with the updated title/url

# User Story 5
```bash 
As a user
So I don't enter an invalid URL
I want to see an error message when I enter an invalid URL
```
User flow:
1. Visit the new bookmark page
2. Submit a new bookmark with an invalid url
3. See an error message and don't see the invalid bookmark in the full list of bookmarks

# User Story 6
```bash 
As a user
So I can make notes about my bookmark
I want to add a comment to a bookmark
```
- A bookmark can have many comments --> one-many relationship 
- A comment belongs to a bookmark

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

### Comments Table
1. Connect to ```psql```
2. Connect to the database using the ```psql``` command ```\c bookmark_manager_test;```
3. Run the query we have saved in the file ```03_create_comments_table.sql```  

### Comments Table
1. Connect to ```psql```
2. Connect to the database using the ```psql``` command ```\c bookmark_manager;```
3. Run the query we have saved in the file ```03_create_comments_table.sql```

## Evidence Plan 
> Feedback from Pam Mezue: You guided me to the right solution through dense parts of the week's challenge. You had a methodical approach to problem solving: you stuck quite closely to the TDD process which helped me better understand how to think through the problem. 

## Project Status
- On Day 1 of the challenge, I worked through steps 1-7 with Josh Davie via [my repo](https://github.com/jessmar94/bookmark-challenge). 
- On Day 2 of the challenge, I completed steps 7-10 with Jay Issuree on [his repo](https://github.com/JayIssuree/bookmark_manager). 
- On Day 3 of the challenge, I completed steps 11-12 with Duncan Skinner on my repo. 
- On Day 4 of the challenge, I completed steps 11-13 with Pam Mezue on [her repo](https://github.com/Mezela/bookmark_manager/tree/master/bookmark-0). 
- On Day 5 of the challenge, I completed steps 13-15 on Heli Sullivan's repo. 

