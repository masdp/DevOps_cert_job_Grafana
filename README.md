##Target

Write a Jenkins pipeline that deploys instances to AWS, builds Java applications on them, and deploys the application to the stage. Must use Terraform and Ansible code. The application must be deployed in a container and use a database.

##Requirements

on host: Jenkins, Ansible, Terraform, git, configured aws and dockerhub.

##How to start?

Run Jenkins pipeline.

##How to check?

Follow link http://stage-ip/ 

##How to use Grafana?

Browse to http://stage-ip:3000 . You will see javamelody on Grafana.
Use the following data for authorization:
User: admin
Password: admin 

