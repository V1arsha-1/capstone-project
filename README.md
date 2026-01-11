**CI/CD Pipeline for Containerized Web Application using GitHub Actions**

Project Overview

This project focuses on building a complete CI/CD pipeline for a containerized web application using GitHub Actions and Docker. The main objective is to automate the process of building Docker images, running tests, scanning images for security vulnerabilities, pushing images to a container registry, and deploying the application to a staging environment.

The project demonstrates real-world DevOps practices, including automation, containerization, security scanning, environment separation, and deployment scripting.

1.Application Architecture

The application follows a multi-service architecture:

Frontend: A web-based frontend application containerized using Docker
<img width="1024" height="353" alt="image" src="https://github.com/user-attachments/assets/6025d811-d341-4266-ab17-9536aacd7721" />

<img width="774" height="352" alt="image" src="https://github.com/user-attachments/assets/c82c9fa8-20f6-4dd2-a776-2b7503ccafa6" />
<img width="1570" height="396" alt="image" src="https://github.com/user-attachments/assets/4b4969ee-3925-4438-9f8e-32634ab00a96" />


Backend: A backend service containerized using Docker
<img width="1230" height="547" alt="image" src="https://github.com/user-attachments/assets/9b48ac99-9af5-462e-aa42-0c5ab2775114" />
<img width="536" height="368" alt="image" src="https://github.com/user-attachments/assets/57ca0d98-d128-4e47-9f4e-cb9eef60b82d" />

Database: Used by the backend service (configured via environment variables)

CI/CD System: GitHub Actions handles automation

<img width="1581" height="444" alt="image" src="https://github.com/user-attachments/assets/b62c5f58-7ae3-4452-87fa-6437f1f312c9" />

<img width="886" height="114" alt="image" src="https://github.com/user-attachments/assets/59c00437-3a97-4f49-932f-750a1243aee5" />

2.Workflow overview:

Developer pushes code to the GitHub repository
<img width="840" height="110" alt="image" src="https://github.com/user-attachments/assets/f0ec62e5-386f-4e45-9d3c-3bfb7b849192" />
<img width="845" height="314" alt="image" src="https://github.com/user-attachments/assets/1b869a6c-f0e1-4537-9572-9b592dee2b5a" />

The below image is the github repository where the files are automatically pushed from vscode to the github.
<img width="1366" height="788" alt="image" src="https://github.com/user-attachments/assets/a0370f5a-5713-449c-b27d-a6f78902965a" />

GitHub Actions triggers the CI pipeline
<img width="1405" height="167" alt="image" src="https://github.com/user-attachments/assets/7e0e5ba9-4a52-437a-8d10-16614d47f00f" />


Docker images are built and tested

Images are scanned for vulnerabilities

Images are pushed to Docker Hub

CD workflow deploys the application to a staging environment (simulated)

3.CI Pipeline Implementation

The Continuous Integration (CI) pipeline is implemented using GitHub Actions and is automatically triggered on every push to the main branch.

CI pipeline stages include:

Checking out the source code

Building backend and frontend Docker images

Running unit tests

Scanning Docker images using Trivy

Tagging and pushing images to Docker Hub
<img width="1406" height="171" alt="image" src="https://github.com/user-attachments/assets/8720f067-2549-4932-a4c6-cb13f8343984" />


The CI pipeline runs automatically without any manual intervention, ensuring fast feedback and consistent builds.
<img width="1051" height="526" alt="image" src="https://github.com/user-attachments/assets/61163013-bec4-41a1-a9d1-e782e241c86f" />


 4.Docker Image Build and Push

Docker is used to containerize both backend and frontend services.

Key highlights:

Docker images are built using Docker Buildx

Images are tagged appropriately

Images are pushed to Docker Hub using GitHub Actions

Docker registry credentials are securely managed using GitHub Secrets

This ensures that the latest application images are always available for deployment.

5️. Security Scanning with Trivy
<img width="1390" height="247" alt="image" src="https://github.com/user-attachments/assets/221c06aa-fcee-4a02-978a-45bbb3952210" />

To improve application security, Trivy is integrated into the CI pipeline.

Docker images are scanned for known vulnerabilities

The pipeline checks for HIGH and CRITICAL severity issues

If vulnerabilities are detected, the pipeline fails automatically

This step ensures that only secure container images move forward in the pipeline.

6️. CD Deployment (Staging Environment)

A Continuous Deployment (CD) workflow is implemented to deploy the application to a staging environment.

<img width="1336" height="133" alt="image" src="https://github.com/user-attachments/assets/be685ef8-20b0-48ec-b84f-0e6177ecd785" />

Due to the absence of a real staging server, the deployment is implemented as a simulated CD workflow that demonstrates the complete deployment logic:

Pulling the latest Docker images

Stopping old containers

Starting new containers

Running database migrations

Verifying deployment success

The CD workflow runs successfully and provides a clear indication of deployment completion.

7️⃣ Deployment Scripts

Deployment automation is handled using shell scripts stored in the scripts/ directory.

Key scripts:

deploy-staging.sh:

<img width="1595" height="587" alt="image" src="https://github.com/user-attachments/assets/fe3537d1-ea6d-4dcf-90ca-b243846fa1e2" />


Pulls latest Docker images

Stops existing containers

Starts new containers

Runs database migrations

Verifies running containers

rollback.sh:

Stops current containers

Restarts the previous stable setup

These scripts demonstrate how deployments can be automated outside the CI/CD pipeline.

8️. Environment-Specific Configuration

The project uses environment-specific configuration files to separate different environments:

.env.dev – Development environment
<img width="563" height="226" alt="image" src="https://github.com/user-attachments/assets/a4140ac5-d250-4fb7-94cf-83af736e27ff" />

.env.staging – Staging environment
<img width="627" height="359" alt="image" src="https://github.com/user-attachments/assets/179f1750-22bb-421c-9c53-cd50a961743f" />

.env.prod – Production environment
<img width="539" height="296" alt="image" src="https://github.com/user-attachments/assets/a57f6ae2-797a-4546-bf32-f6b2fd54c6e3" />

Separate Docker Compose files are also used:

docker-compose.dev.yml

docker-compose.prod.yml

This approach ensures clean configuration management and improves security and flexibility.

9️. Automation and Runners

The entire CI/CD process runs on GitHub-hosted runners, which execute all pipeline jobs automatically.

Key points:

Pipelines are event-driven

No manual action is required for CI execution

CD workflow can be triggered manually when needed
<img width="1411" height="268" alt="image" src="https://github.com/user-attachments/assets/e0cfac69-bac9-4b64-a16a-374eb0ee2cd8" />


This confirms the project’s full automation capability.

10. Conclusion

This project successfully demonstrates the design and implementation of a modern CI/CD pipeline using GitHub Actions, Docker, and Trivy. It automates building, testing, security scanning, image publishing, and deployment workflows while following DevOps best practices.

Although a real staging server was not available, the deployment logic is fully demonstrated through scripts and a simulated CD workflow. The project can be easily extended to real cloud or on-premise environments in the future.
