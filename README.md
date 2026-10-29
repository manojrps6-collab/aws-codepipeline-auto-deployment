# AWS CodePipeline Automated Web Application Deployment

A CI/CD project that automates the deployment of a static web application to an Amazon EC2 instance using AWS CodePipeline, AWS CodeBuild, and AWS CodeDeploy.

## Project Overview

This project demonstrates how to build an automated deployment workflow in AWS. When changes are pushed to the GitHub repository, CodePipeline retrieves the source code, CodeBuild validates the application and deployment files, and CodeDeploy deploys the application to an EC2 instance running Apache HTTP Server.

**Project Status:** Successfully deployed and tested.

## Architecture

**GitHub → AWS CodePipeline → AWS CodeBuild → AWS CodeDeploy → Amazon EC2 → Apache HTTP Server**

### AWS Services Used

- **AWS CodePipeline:** Orchestrates the CI/CD workflow.
- **AWS CodeBuild:** Validates the application files and deployment configuration.
- **AWS CodeDeploy:** Automates application deployment to EC2.
- **Amazon EC2:** Hosts the web application.
- **Amazon S3:** Stores pipeline artifacts.
- **AWS IAM:** Manages permissions and service roles.
- **Amazon CloudWatch:** Provides access to build logs when logging is enabled.

## Features

- Automated source retrieval from GitHub.
- Build-stage validation of required application and deployment files.
- Automated deployment to an EC2 instance.
- Apache HTTP Server installation and startup through deployment scripts.
- AppSpec configuration for deployment lifecycle hooks.
- Automatic pipeline execution when changes are pushed to the configured GitHub branch.
- Automatic rollback configured for deployment-stage failures.

## Repository Structure

```text
aws-codepipeline-auto-deployment/
├── index.html
├── buildspec.yml
├── appspec.yml
├── .gitignore
├── scripts/
│   ├── install_dependencies.sh
│   ├── start_server.sh
│   └── stop_server.sh
└── README.md
```

## How It Works

### 1. Source Stage — GitHub

AWS CodePipeline connects to the GitHub repository through a GitHub App connection and retrieves the source code from the `main` branch.

### 2. Build Stage — AWS CodeBuild

CodeBuild uses `buildspec.yml` to validate the required files, including:

- `index.html`
- `appspec.yml`
- Deployment lifecycle scripts

This is a validation build; the static HTML application does not require compilation.

### 3. Deploy Stage — AWS CodeDeploy

CodeDeploy uses `appspec.yml` to copy `index.html` to `/var/www/html` and execute the deployment scripts.

The scripts install Apache HTTP Server when required, stop the existing service when applicable, and start Apache after deployment.

### 4. Application Hosting — Amazon EC2

The EC2 instance runs Amazon Linux 2023 and Apache HTTP Server, serving the deployed website over HTTP.

## Deployment Configuration

### Build Specification

The `buildspec.yml` file defines the validation commands and specifies the files to include in the build artifact.

### Application Specification

The `appspec.yml` file defines the destination for application files and the CodeDeploy lifecycle hooks.

### Deployment Scripts

- `install_dependencies.sh` — Installs Apache and creates the web root directory.
- `stop_server.sh` — Stops Apache if it is running.
- `start_server.sh` — Enables and restarts Apache, then verifies that the service is active.

## Testing and Validation

The project was tested through an initial pipeline execution.

- GitHub source stage: **Succeeded**
- CodeBuild stage: **Succeeded**
- CodeDeploy stage: **Succeeded**
- Website accessibility: Verified in a browser

The deployment workflow can also be tested by modifying `index.html`, committing the change, pushing it to GitHub, and verifying that a new pipeline execution deploys the updated content.

## Technologies and Tools

- Amazon Web Services (AWS)
- AWS CodePipeline
- AWS CodeBuild
- AWS CodeDeploy
- Amazon EC2
- Amazon S3
- AWS IAM
- Amazon CloudWatch
- Git and GitHub
- Linux
- Apache HTTP Server
- HTML
- Bash scripting
- YAML

## Learning Outcomes

- Understanding CI/CD pipeline architecture.
- Integrating GitHub with AWS CodePipeline.
- Configuring build validation with AWS CodeBuild.
- Automating EC2 deployments with AWS CodeDeploy.
- Working with IAM roles and permissions.
- Configuring deployment lifecycle hooks and Linux service management.
- Understanding automated deployment workflows and failure rollback configuration.

## Future Improvements

- Add automated application tests.
- Introduce HTTPS using AWS Certificate Manager and an Application Load Balancer.
- Add infrastructure as code using AWS CloudFormation or Terraform.
- Integrate monitoring and notifications for deployment failures.
- Extend the application to use Auto Scaling for higher availability.

## Repository

GitHub: [aws-codepipeline-auto-deployment](https://github.com/manojrps6-collab/aws-codepipeline-auto-deployment)

---

**Note:** This project uses a static web application to demonstrate automated deployment. Build-stage validation is not equivalent to a full automated test suite. AWS resources may be stopped or deleted after testing to manage costs.
