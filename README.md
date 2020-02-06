 # ASE Interview Project

- [Table of Contents](#table-of-contents)
  * [Overview](#overview)
  * [How to Run](#how-to-run)
  * [Running with Jenkins](#running-with-jenkins)
  * [Sources](#sources)
   
  
## [Overview](#overview)
This repository contains the files for a web-based user directory that utilizes [Node.JS](https://www.w3schools.com/nodejs/nodejs_intro.asp) and the [Express framework](https://expressjs.com/). It creates a simple web page that allows you to view the user directory and add/delete users from it using [AJAX](https://www.w3schools.com/whatis/whatis_ajax.asp) API requests. The user directory is hosted using a [MongoDB](https://www.mongodb.com/what-is-mongodb) database. Each component has the ability to be ran in a separate container 
  
   
## [How to Run](#how-to-run)
To run this application you must have [Docker](https://docs.docker.com/install/) and [Docker-Compose](https://docs.docker.com/compose/install/)
- Note that for Docker Desktop, Docker compose is included as part of those desktop installs
1. Clone this repository on your local machine
`git clone https://github.com/kamieliz/ASE-Interview-P1.git`
2. Change directory into directory for Repo
`cd ASE-Interview-P1`
3. Start up application
`docker-compose up`
	- flags like `-d` let you run the app detached from your terminal
	- use `docker-compose ps` to see what is currently running
4. Enter [http://localhost:8080/](http://localhost:8080/) in a browser to see the application running
5. Test add user and delete user functions
6. If you started Compose with `docker-compose up -d` use `docker-compose stop` to stop your service once done.
	- If you did not use detach flag hit `CTRL` + `C`

# [Running with Jenkins](#running-with-jenkins)

I created a Docker image that builds Jenkins with Docker in the same container.
1. Using the same repository run:
	```
	docker run -it -v /var/run/docker.sock:/var/run/docker.sock -p8080:8080 
	kamehardy/jenkins-withdocker:latest
	```
2. Open jenkins webpage `http://localhost:8080`
3. Log in with suggested admin password thats printed out in success code
4. Install suggested plugins and continue as admin
5. Create a new item
	- Name: node-express
	- Item Type: Pipeline
	Next Page:
	- Build Trigger: github hook
	- Pipeline Script: pipeline script from SCM
	- SCM: git
	- git repo url: https://github.com/kamieliz/ASE-Interview-P1.git
	- Save
6. Go back to dashboard and Select Credentials to add Docker Hub credentials
	- username: Docker user name
	- password: Docker password
	- ID: docker-hub-credential
	- Save
7. Go back to the dashboard and select pipeline 
8. Select Build Now
9. Once task starts click on the build number and select console output
10. Wait for Success


## [Sources](#sources)
To Build the Web Application, I used materials from the following tutorials:
- [Step-by-step guide to getting up and running with Node.Js, Express, and MongoDB](https://closebrace.com/tutorials/2017-03-02/the-dead-simple-step-by-step-guide-for-front-end-developers-to-getting-up-and-running-with-nodejs-express-and-mongodb)
- [Creating a simple RESTful Web App with Node.js, Express, and MongoDB](https://closebrace.com/tutorials/2017-03-02/creating-a-simple-restful-web-app-with-nodejs-express-and-mongodb)

To connect to Docker and utilize Docker-Compose:
- [Dockerizing a Node.js Web App](https://nodejs.org/de/docs/guides/nodejs-docker-webapp/)
- [Docker for Beginners](https://docker-curriculum.com/)
- [Dockerize a Node.js app connected to MongoDB](https://docker-curriculum.com/)
- Videos from [Get Into DevOps](https://www.udemy.com/course/devops-masterclass/) course on Udemy

Using Jenkins for automation:
- Videos from [Get Into DevOps](https://www.udemy.com/course/devops-masterclass/) course on Udemy
- [Using Jenkins CI/CD on your NodeJS app](https://blog.harveydelaney.com/jenkins-build-test-deploy-node-app/)

Ansible and Orchestration:
To view ansible attempt check out ansible folder
- [How to Deploy a container with Ansible](https://www.techrepublic.com/article/how-to-deploy-a-container-with-ansible/)
- [Automation vs. Orchestration](https://www.burwood.com/blog-archive/automation-vs-orchestration-whats-the-difference)
- [How to Deploy Docker Container](https://www.codementor.io/@mamytianarakotomalala/how-to-deploy-docker-container-with-ansible-on-debian-8-mavm48kw0)
- Lab from [Cloud Academy](https://cloudacademy.com/lab/getting-started-ansible/)





 