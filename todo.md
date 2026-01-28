ASSIGNMENT 1

"Aarhus Space Program (ASP) is starting a new digital modernization initiative. Before your team can build the full mission management system, they need a reliable way to build and run services in containers. Your first task is to create a minimal Web API and make it runnable through Docker and Docker Compose on any machine."

1. A minimal web API

   [x] Open a terminal and in your projects folder run the following commands
   dotnet new webapi -n AarhusSpaceProgram.Api
   cd AarhusSpaceProgram.Api

   [x] Add these two packages
   dotnet add package Microsoft.AspNetCore.OpenApi
   dotnet add package Scalar.AspNetCore

   [x] Open the project in your IDE of choice, locate the program.cs file and replace it’s content with code from PDF

   [x] Run and verify your project (<port> must be replaced with the specific port your project uses)
   In your project folder in a terminal run dotnet run
   Open a browser and verify

2. Containerize your Web API

   [] Containerize your solution and create a Dockerfile to build a docker image.

   [] The image creation must be multi-staged.

3. Publish to Docker Hub + Docker Compose

   [] Publish your docker image to Docker Hub and create a compose.yml that runs your image from Docker Hub.

   [] The docker compose file should work on any computer with Docker installed.

4. Deliverables

   [] A compose.yml

   A readme.md containing:
   [] the Docker Hub image name
   [] how to run the system
   [] which URL to open for Scalar

   Hand-in file name:
   BAD*MA1C_Docker*<auid>.zip uploaded to Brightspace
   (Must contain compose.yml + README.md)
