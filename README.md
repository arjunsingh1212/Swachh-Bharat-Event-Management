
## ** SWACHH BHARAT EVENT MANAGEMENT **
> Project - Swachh Bharat Event Management is a web application that manages the Events related to Cleanliness Campaigns and helps in assigning duties to volunteers. (Involves HTML, CSS,  Bootstrap, SQL and Flask for backend)

## Content
* [Overview of the Project](#overview) 
    * [Deployed web application address/link](#deployed-web-app) 
    * [What is it all about?](#what-is-it-all-about?)
* [Technical details](#technical-details) 
    * [The tech-stack used in the development of the project](#tech-stack) 
    * [How to download/clone and execute the Project (including server-side scripts) on your machine](#how-to-execute-on-your-machine) 



# Overview

## Deployed Web App
The working version of this web-app is deployed on Heroku platform. Go to [https://swachh-bharat-events.herokuapp.com](https://swachh-bharat-events.herokuapp.com) to have a look.


## What is it all about?
This Project is made in order to digitalize the Event Management operations in Cleanliness Campaigns organized over various regions. The details of the Cleanliness event can be hosted online on the web-app and people who wish to volunteer for the good work can Register themselves as volunteers for the event. In this way, it would be much easier to host such events on regular basis. This would increase the awareness in the society and people may take part for the events more often. Moreover, duties to different volunteers can also be assigned easily and the whole process of organizing such events can be done in an efficient manner.

# Technical details

## Tech Stack
The technologies used to develop this web applications are 
* HTML
* CSS
* Bootstrap
* Flask micro-framework
* XAMPP local web server (and SQL)
* SQLite
* SQLAlchemy - Object Relational Mapper and SQL Toolkit

#### Brief Information
> HTML, CSS and Bootstrap have been used in front-end for structuring and designing of the project. 

> Flask is used to build the web application server-script, connect all the web pages appropriately and writing the logic part of the project and dealing with the various tables of the database.

> XAMPP web server was used in the development phase which further includes the use of phpmyadmin server and MySQL database

> SQLite database is used in the phase of deployment(free tier) to Heroku using the SQLAlchemy package of python (Object Relational Mapper)


## How to execute on your machine

> Follow/Understand the steps to execute/run the project on your machine.

* Download and extract the zip bundle of the project or clone the project using git cloning commands.
* Download and install python if your system doesn’t have python. It is assumed that you are downloading the project on the python-installed machine.
* Now, a virtual environment has already been created for the ease of sharing and collaborating with different users. Hence, you can easily activate the virtual environment by using the following commands.
```python    
    pip install virtualenv 
	source env/Scripts/activate
```
This executes the ` activate.bat ` file and the virtual environment named (env) will be activated. This environment will have the requirement packages and modules already installed for your use.

* Now, simply run the following command to run the web application on your browser on port `5000`	
```python
    python app.py
```

> Verify the deployment by navigating to your server address in your preferred browser.
```python
    127.0.0.1:5000
```

* In case you are using the MAC or Linux based machine, the python virtual environment would not work. So, you can run the web application by either creating a new virtual environment for your machine or by simply installing the Flask and Flask SQLAlchemy packages (and their dependencies) and then running the web app. Execute the following command to run the application in that situation
```python
	pip install flask flask-sqlalchemy
	python app.py
```
If all the dependencies are satisfied, then you are good to go. The application would run successfully. :)


#### Note
If you want ot use the SQL database of XAMPP server then, change the Database configuration used in the app.py source code file from remote_server to local_server, import the swachh-bharat-mission.sql database on the phpmyadmin local server and you’ll be good to go. :)
