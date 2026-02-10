# Jenkins in Docker on AWS

This project hosts **Jenkins on AWS using Docker**, providing a clean, isolated, and immutable CI setup.  
The infrastructure is fully automated using **Infrastructure as Code (IaC)** and **configuration management**, with no manual SSH required.

Jenkins runs inside a Docker container with **persistent storage** managed via Docker volumes, ensuring data durability across container restarts.

---

## 🚀 Project Overview

- AWS EC2 infrastructure is provisioned using **Terraform**
- Terraform state is stored remotely in **AWS S3**
- **DynamoDB state locking** is enabled to prevent concurrent Terraform operations
- Docker is installed on the EC2 instance using **Ansible**
- **Dynamic Ansible inventory** is used (no hardcoded IPs, no manual SSH)
- Jenkins is hosted as a **Docker container**
- Jenkins data is persisted using **Docker volumes**
- The entire workflow is automated using a **Makefile**

---

## 🧱 Architecture Summary

- **Cloud Provider:** AWS
- **Infrastructure Provisioning:** Terraform
- **State Management:** S3 backend with DynamoDB locking
- **Configuration Management:** Ansible (dynamic inventory)
- **CI Tool:** Jenkins
- **Containerization:** Docker
- **Automation:** Makefile

---

## 📂 Repository Structure

```text
Jenkins-In-Docker
├── ansible
│   ├── ansible.cfg
│   ├── inventory
│   │   └── inventory.aws_ec2.yml
│   └── playbooks
│       ├── docker.yml
│       └── jenkins.yml
├── jenkins
│   ├── docker-compose.yml
│   └── Dockerfile
├── Makefile
├── README.md
└── terraform
    ├── ec2.tf
    ├── main.tf
    ├── outputs.tf
    ├── secrurity-group.tf
    ├── variables.tf
    └── vpc.tf
```
---

## ⚙️ Prerequisites

- Make sure you have the following installed locally:

- Terraform

- Ansible

- AWS CLI (configured)

- Make

---

## ▶️ How to Run the Infrastructure

Everything is automated using a Makefile.

---

## 1️⃣ Create Infrastructure & Deploy Jenkins

Run the following command:

```
make apply
```

This will:

- Provision an EC2 instance using Terraform

- Configure the Terraform backend (S3 + DynamoDB)

- Install Docker on the EC2 instance using Ansible

- Run the Ansible playbook to host Jenkins in Docker

- No manual SSH is required at any stage.

---

## 🔄 Automated Jenkins Deployment

Jenkins is deployed automatically using Ansible playbooks.

The first playbook installs and configures Docker on the AWS EC2 instance.
The second playbook runs the Docker Compose file to start Jenkins as a Docker
container on the EC2 instance.

A dynamic Ansible inventory is used to discover the EC2 instance automatically,
so no manual SSH access or hardcoded IP addresses are required at any stage.

---

## 🔑 Get Jenkins Initial Admin Password

Once Jenkins is up and running, copy and paste the command below to retrieve the initial admin password:

```
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

Use this password to complete the Jenkins setup via the web UI.

---

## 💾 Persistent Storage

- Jenkins data is stored using Docker volumes

- Ensures Jenkins configuration, jobs, and plugins persist across container restarts

- Supports an immutable Jenkins setup while retaining data durability

---

## 🏁 Conclusion

This project demonstrates a fully automated Jenkins setup on AWS using modern
DevOps practices. From infrastructure provisioning to application deployment,
everything is handled through code, ensuring a clean, repeatable, and reliable
CI environment.
