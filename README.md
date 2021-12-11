# CSCE431-Project
## Introduction
Group project for the Feminism4Aggies club
This project is designed to solve the following issues for the Feminism4Aggies club:
1. Tracking Membership points which can be earned through attending meetings or participating through events
2. Be able to show members announcements on the website
3. Allow members to make posts and like other posts
4. show very general information about the club 
  a. Since this is an internal tool and will be mainly static after development we do not want to
     include very topical/time oriented information on the website
     
## Challenges
1. One of the main challenges we faced were with data design and being naive in ruby on rails
2. Google Oauth issues

## Requirements
This code has been run and tested on:

For this project we used the following tools:
Ruby - 3.0.2p107

Rails - 6.1.4.1

Ruby Gems - See Gemfile

Google Oauth V2.0 for authentication - https://developers.google.com/identity/protocols/oauth2

Yarn - 1.22.11

PostgreSQL - psql (PostegreSQL) 13.3 (Debian 13.3-1)

CSS and HTML for the frontend (we did not use a frontend framework such as React or Angular)

Docker for environment virtualization - https://www.docker.com/products/docker-desktop

Heroku for hosting and deployment - https://devcenter.heroku.com/articles/heroku-cli

Jira for Project Management - https://www.atlassian.com/software/jira

Github for version Control - You are here (https://github.com/FA21-CSCE431/project-final-code-feminism4aggiestracker)

Alternatve Github - (https://github.com/oriyonay/CSCE431-Project)
                                          
Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

MS Teams as primary communication channel - https://www.microsoft.com/en-us/microsoft-teams/download-app


## Installation
Download this code repository by using git:

git clone https://github.com/FA21-CSCE431/project-final-code-feminism4aggiestracker.git

## Tests
You can run test functions using the command below:

rspec spec/

## Execute Code
Run the following code in Powershell if using windows or the terminal using Linux/Mac


docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest

Install the app using the github links above

bundle install && rails webpacker:install && rails db:create && db:migrate 
(dont worry if this takes a bit if time, we are installing/linking a lot of dependencies)

Run the app rails server --binding:0.0.0.0

You can view the website locally from http://localhost:3000/

## Deployment
Sign into youre heroku account

Click the New button in the top right of your app list and select Create new pipeline and name your new pipeline

Connect your pipeline to your github environment

Click Create new pipeline

Next you will click "Enable Review Apps"

Click "New app" in review apps and choose the branch you wish to deploy

## CI/CD
For continuous development, we set up Heroku to automatically deploy our apps when changes were made to either the test or main branch shown below:

Review app: test branch

Production app: main branch

For continuous integration, we used Github actions to run tests for TDD, Security, Style to automatically check that our code deployed correctly.

## References
https://guides.rubyonrails.org/getting_started.html
https://www.youtube.com/watch?v=fmyvWz5TUWg
https://medium.com/@adamlangsner/google-oauth-rails-5-using-devise-and-omniauth-1b7fa5f72c8e
https://guides.rubyonrails.org/action_mailer_basics.html
https://www.youtube.com/watch?v=yqxORosQQbo

## Support
Please use the need Help Page under the Need Help? tab located on the navigation bar

## Credits
Product Owner - Ori Yonay
Scrum Master - Nate Krall
Developers - Andrew Han, Haoning Wang, Cassidy Frier, Tyler Lachney, Nate Krall, Ori Yonay

## Special Thanks
We would like to thank Professor Pauline Wade, Diego Martinez, and Yihao Xie
We would also like to mention the tremendous job and effort put in by Andrew Han as a developer. He went above and beyond in both development and helping others.
