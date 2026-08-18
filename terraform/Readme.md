# Terraform AWS VPC

This project is part of my Terraform learning journey.

The goal is to understand how to build reusable AWS infrastructure using Terraform modules instead of simply creating resources.

## What I built

- VPC
- Internet Gateway
- Public Subnets
- Private Subnets
- Elastic IP
- NAT Gateway
- Public Route Table
- Private Route Tables
- Route Table Associations

The module supports:

- Single NAT Gateway
- One NAT Gateway per Availability Zone

---

## Project Structure

```
terraform/
├── envs/
│   ├── dev/
│   ├── staging/
│   └── prod/
│
├── modules/
│   └── vpc/
│       ├── data.tf
│       ├── eip.tf
│       ├── igw.tf
│       ├── locals.tf
│       ├── nat_gateway.tf
│       ├── outputs.tf
│       ├── route_tables.tf
│       ├── subnets.tf
│       ├── variables.tf
│       └── vpc.tf
│
└── template/
```

---

## Architecture

```
                  Internet
                      │
                      │
             Internet Gateway
                      │
        ┌─────────────┴─────────────┐
        │                           │
        ▼                           ▼
 Public Subnet A             Public Subnet B
        │
        ▼
   NAT Gateway
        │
        ▼
 ┌───────────────┐
 │               │
 ▼               ▼
Private A    Private B
```

---

## Learning

While building this module I learned:

- Terraform modules
- Variables and locals
- Data sources
- `for_each`
- Resource dependencies
- Route tables
- NAT Gateway design
- Reusable infrastructure
