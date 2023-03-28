# Denote

An Open source documents-sharing app using firebase and flutter.

## Introduction

Denote is an open source application built for my classmates to easily manage and access class notes.
The core objectives are:

* To have all notes related to a specific unit together.
* Authenticated uses can access the notes any time they need.
* Save on space taken by the notes when stored locally.
* Students can access notes of previous semesters.

## Stack

* Flutter UI
* Firebase

# Main Features

## Firebase Auth

Email-Password Authentication is done by the firebase_auth package

![auth_login](https://user-images.githubusercontent.com/56781148/220371846-23169c59-8942-4c83-9a32-1b8c258ac0b2.png) ![auth_register](https://user-images.githubusercontent.com/56781148/220376687-15904c28-4980-43d4-b836-8841d60f3812.png) ![auth_forgotpw](https://user-images.githubusercontent.com/56781148/220376737-6e1bf3f3-dc27-41a0-b79a-b09c3c19728b.png)


## Firebase Firestore

User data is stored in firebase cloud firestore which is used to retrieve the notes as per their selected course

## Firebase Storage

All the notes are stored in firebase storage in the _course/semester/unit_ order

## Homepage

These are the homepage views:

![homepage](https://user-images.githubusercontent.com/56781148/225244592-556dc666-ab46-4c8b-a3b6-22df29f7d219.png)
![units](https://user-images.githubusercontent.com/56781148/225244908-3942ba79-3b1e-48f3-bb74-3758eee739c9.png)
![account](https://user-images.githubusercontent.com/56781148/225244941-12cde4d4-4f34-4078-81fd-94af99acb490.png)

## PDF Viewer
![pdfview](https://user-images.githubusercontent.com/56781148/225245369-25bd7b9e-84e2-4673-ab91-ee02070fcb57.png)


