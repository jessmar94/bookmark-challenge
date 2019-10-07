# Bookmark Challenge README

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

| bookmark | <-- add >> bookmarks_array 
