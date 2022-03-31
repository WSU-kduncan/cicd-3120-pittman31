## Project Overview
In this project I will be completing the following tasks:  

- Containerize an application with Docker
- Automate the project pipeline with GitHub Actions
- Explore usage of webhooks to keep production up to date

## Part 1 - Dockerize it
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
    1. I am installing docker on an ubuntu aws instance.
    2. Steps 2-6 are to set up the repository
    3. I ran the following command
        > sudo apt-get update  
    4. I ran the following command
        > sudo apt-get install \\  
    ca-certificates \\  
    curl \\  
    gnupg \\
    5. I ran the following command
        >   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    6. I ran the following command.
        > echo \\  
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    lsb-release
    7. Steps 8- are to install the docker engine.
    8. I ran the following command
        > sudo apt-get update
    9. I ran the following command
        > sudo apt-get install docker-ce docker-ce-cli containerd.io
    10. I added the ubuntu user to the docker group with the following  2 commands
        > sudo usermod -a -G docker ubuntu  
        > newgrp docker
  - how to build the container
    - I created a docker file with the following text
        > FROM httpd:2.4  
        >COPY website /usr/local/apache2/htdocs/  
        >EXPOSE 80
    - I ran the following command to build the container
        > docker build -t apache-server:4.0 /home/ubuntu/cicd-3120-pittman31/Projects/Project5
  - how to run the container
    - I ran the following command to run my container
        >  docker run -d --name ApacheServer -p 80:80 apache-server:4.0
  - how to view the project (open a browser...go to ip and port...)
    - I viewed the project by entering my public ip for the instance in the web browser
        > 44.196.112.55:80