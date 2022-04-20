FROM httpd:2.4

WORKDIR /home/ubuntu/cicd-3120-pittman31/website

RUN pwd

COPY * /usr/local/apache2/htdocs/

EXPOSE 80
