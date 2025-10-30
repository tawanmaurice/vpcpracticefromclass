# Terraform: VPC + ALB + Auto Scaling Group

## Overview
This project provisions a multi-AZ VPC network with public/private subnets, NAT, an Application Load Balancer (ALB), a Launch Template, and an Auto Scaling Group (ASG). It is a reusable foundation for deploying applications in AWS.

---

## Features
- **Networking**
  - VPC with CIDR `10.0.0.0/16`
  - Public subnets (10.0.3.0/24, 10.0.4.0/24)
  - Private subnets (10.0.10.0/24, 10.0.11.0/24)
  - Internet Gateway + NAT Gateway
  - Public & private route tables

- **Security**
  - ALB Security Group (HTTP/HTTPS inbound)
  - App Security Group (restricted to ALB traffic)

- **Compute**
  - Launch Template (latest Amazon Linux 2)
  - Auto Scaling Group in private subnets
  - CPU target tracking policy at 75%

- **Load Balancing**
  - Application Load Balancer (across 2 AZs)
  - Target Group (port 80, health checks)

---

## Repo Structure
