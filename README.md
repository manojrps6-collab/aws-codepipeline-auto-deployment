
# AWS CodePipeline Automated Deployments

A hands-on AWS CI/CD project that automates the deployment of a static web application to an Amazon EC2 instance using GitHub, AWS CodePipeline, AWS CodeBuild, and AWS CodeDeploy.

## Architecture

GitHub → AWS CodePipeline → AWS CodeBuild → AWS CodeDeploy → Amazon EC2 → Apache HTTP Server

## Technologies

- Amazon Web Services (AWS)
- AWS CodePipeline
- AWS CodeBuild
- AWS CodeDeploy
- Amazon EC2
- AWS Identity and Access Management (IAM)
- Git and GitHub
- Apache HTTP Server
- HTML and Bash scripting

## Project Features

- Source control using GitHub
- Automated pipeline execution on source changes
- Build-time validation of application and deployment files
- EC2 deployment using AWS CodeDeploy
- Apache web server installation and service management
- Deployment verification and troubleshooting

## Repository Structure

```text
aws-codepipeline-auto-deployment/
├── index.html
├── appspec.yml
├── buildspec.yml
├── scripts/
│   ├── install_dependencies.sh
│   ├── start_server.sh
│   └── stop_server.sh
├── .gitignore
└── README.md
```

## Deployment Workflow

1. Push application changes to GitHub.
2. AWS CodePipeline detects the source change.
3. AWS CodeBuild validates the application files and generates build artifacts.
4. AWS CodeDeploy deploys the artifacts to the configured EC2 instance.
5. Apache serves the updated website.
6. Verify the pipeline execution, deployment status, and website response.

## AWS Region

Asia Pacific (Sydney) — `ap-southeast-2`

## Implementation Status

- [x] GitHub repository created
- [x] Sample HTML application created
- [x] CodeBuild build specification created
- [x] CodeDeploy AppSpec and lifecycle scripts created
- [ ] Initial Git commit and push
- [ ] EC2 instance and IAM roles configured
- [ ] CodeDeploy agent installed and verified
- [ ] CodeBuild project created and tested
- [ ] CodePipeline configured
- [ ] Automated deployment tested
- [ ] Screenshots and deployment results documented

## Security and Cost Considerations

- Never commit AWS credentials, private keys, or access tokens.
- Use IAM roles instead of hardcoded AWS credentials.
- Restrict security group access to required ports.
- Review AWS pricing and Free Tier eligibility before provisioning resources.
- Delete unneeded billable resources after testing.

## Learning Outcomes

This project demonstrates practical experience with CI/CD fundamentals, Git-based automation, AWS IAM, build artifacts, EC2 deployments, Linux service management, and deployment troubleshooting.

---

**Status:** In progress
