## Project Overview
In this project I will be completing the following tasks:  

- Containerize an application with Docker
- Automate the project pipeline with GitHub Actions
- Explore usage of webhooks to keep production up to date

## Part 1 - Dockerize it

### Tasks

- Create new GitHub repo (link to create located in Pilot in Content -> Project 5)
- In a folder named `website`, add the contents of your website
  - this can be a site you created in another class, pet project of yours, or just a vanilla html file
- Install Docker
  - You can install Docker in WSL2 or in an EC2 instance. You'll need your Project 5 repo on wherever you are working
- Create a container image that will run a webserver and contains your "website"
  - you can use apache2 or nginx as the webserver
- Create a Dockerfile with instructions on how to build the image
- Add site content & Dockerfile to repo

### Documentation

- Run Project Locally
  - how you installed docker + dependencies (WSL2, for example)
  - how to build the container
  - how to run the container
  - how to view the project (open a browser...go to ip and port...)