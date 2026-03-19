# Terraform Reflection

## 1. Why were the import blocks important in this lab?
Because AWS infrastructure was already created before Terraform start.
Instead of ceating new resources, Terraform connects to existing AWS resources, allowing it to recognize and manage the infrastructure through code.

In a project from scratch, resources need to be defined the in Terraform before apply, so importing is not required.


## 2. Why did you not use Terraform to manage the secrets in Parameter Store?
Because Terraform stores infrastructure state, and secret values can be exposed through files, creating a security risk.During the lab, I noticed that it is safer to reference parameters without put secret values into configuration.
It's better to manage secrets in a controlled environment where they are securely protected, encrypted, and access is restricted.