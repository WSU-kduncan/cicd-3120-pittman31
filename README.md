## Project Overview
In this project I will be completing the following tasks:  

- Containerize an application with Docker
- Automate the project pipeline with GitHub Actions
- Explore usage of webhooks to keep production up to date

## Part 1 - Dockerize it

### Documentation

- Run Project Locally
  - how you installed docker + dependencies (WSL2, for example)
    1. I am installing docker on an ubuntu aws instance.
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

## Part 2 - GitHub Actions and DockerHub

### Documentation  
- Create DockerHub public repo
  - process to create  
    1. Login to Docker Hub
    2. Click on repositories along the top banner
    3. Click the Create Repository Button
    4. Enter a name for the repository
    5. Verify that public is selected and click create
- Allow DockerHub authentication via CLI using Dockhub credentials  
  1. I entered the following command in the cli
    > docker login -u DOCKER_USERNAME
  2. I entered my password when prompted
- Configure GitHub Secrets
  - what credentials are needed - DockerHub credentials (do not state your credentials)
    - Docker Username and Password are needed
  - set secrets and secret names
    1. Cicked on the settings button for https://github.com/WSU-kduncan/cicd-3120-pittman31
    2. Selected Environments from the side bar
    3. Clicked on New Respository Secret
    6. Enter Information for Username secret
    7. Repeat steps 3-4 for Password secret
- Configure GitHub Workflow
  - variables to change (repository, etc.)
    1. I clicked add file on https://github.com/WSU-kduncan/cicd-3120-pittman31 repository and created .github/workflow/github-actions-project5.yml
    2. I copied the contents of the template on https://docs.github.com/en/actions/guides/publishing-docker-images#publishing-images-to-docker-hub into the github-actions-project5.yml file
    3. I changed images: my-docker-hub-namespace/my-docker-hub-repository to:
        > images: pittman31/ceg3120_project5
    4. I changed tags: ${{ steps.meta.outputs.tags }} to:
        >tags: pittman31/ceg3120_project5:1.0
    5. I created a new release on github tagged as 1.0
     I 