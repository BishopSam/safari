# Safari

An app for viewing various tourist destinations and booking dates for visitations.

#### N/B: This application is built solely to showcase my skills in flutter development and not a real app that you can use to book real appointments with these tourist destinations.  

Table of contents
=================
<!--ts-->
   * [Project Structure](#project-structure)
   * [Features](#features)
      * [Authentication](#authentication)
      * [Destinations](#destinations)
      * [Bookings](#bookings)
   * [Tests](#tests)
   * [Todos](#todos)
   * [App Demo](#app-demo)
   
<!--te-->


Project Structure
=================
For this project, I am making use of the feature-first project structure, such that each feature is broken down into different layers as follows;
| Layers | Description |
| ------- | ------- |
| presentaton | All `widget` and `controller` classes go in here |
| application | All service classes go in here |
| domain | All `model` classes go in here |
| data | Api and repository classes go in here |

An example of the above stricture can be seen in this screenshot 👇

![Screenshot 2022-10-10 172429](https://user-images.githubusercontent.com/59648161/194912185-5ffc78f0-d632-464a-8f5b-e99174848e9f.png)

This will ensure scalability as i intend to improve on the app in the future


Features
========
There are 3 major features for this app (for now), they are listed below

Authentication
--------------
For this feature, I am making use of the Firebase Authentication API because the app design only requires google sign in.

Here is the link to the folder if you want to jump right in!

Destinations
------------
Although i intend on using an API endpoint to supply various destination data to the app, I will first off use dummy destination data to set things up. 

Here is the link to the folder if you want to jump right in!

Bookings
--------
This feature will communicate with the Firebase Firestore Api, where a list of user's saved destinations/bookings will be saved and called upon when needed.

Here is the link to the folder if you want to jump right in!

Tests
=====
Links to various test user flows will be provided here. 

Todos
=====

- [x] Integrate firebase authentication 
- [ ] Implement Destinations feature
- [ ] Implement Bookings Feature
- [ ] Integrate Cloud Functions for Notifications/Booking Reminders
- [ ] Get an API endpoint for supplying destinations data
- [ ] Write Full Integration Tests
- [ ] Host app on [appetizer.io](https://appetize.io)

App Demo
========
A link to the hosted app will be provided here.
