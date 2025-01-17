# Terraform Project

This repository contains Terraform configurations for provisioning and managing infrastructure on AWS.

## Prerequisites

Before using this project, ensure the following are installed:

- [Terraform](https://www.terraform.io/downloads.html) (version X.X.X or higher)
- [Cloud provider CLI](https://cloud-provider-cli-link) (for authenticating to your cloud account)
- [AWS CLI](https://aws.amazon.com/cli/) (if using AWS as your cloud provider)

## Setup

1. Clone this repository:

    ```bash
    git clone https://github.com/ShanukaLakshan/aws-vps-terraform.git
    cd aws-vps-terraform/src
    ```

2. Initialize the Terraform configuration:

    ```bash
    terraform init
    ```

3. Configure your cloud provider credentials (e.g., AWS credentials):

    - For AWS:

      ```bash
      export AWS_ACCESS_KEY_ID="your-access-key-id"
      export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
      ```

4. (Optional) Modify `variables.tf` to suit your infrastructure needs.

## Usage

1. Validate the Terraform configuration files:

    ```bash
    terraform validate
    ```

2. Plan the infrastructure changes:

    ```bash
    terraform plan
    ```

3. Apply the configuration to provision the resources:

    ```bash
    terraform apply
    ```

    Follow the prompts to approve the changes.

4. To destroy the resources:

    ```bash
    terraform destroy
    ```


## Directory Structure

- `main.tf`: The main Terraform configuration file defining the resources.
- `variables.tf`: The file to define variables for your configuration.
- `outputs.tf`: The file to define outputs from the provisioned resources.
- `terraform.tfvars`: The file to set the values for the variables defined in `variables.tf`.

## Remote State (Optional)

If you're using remote state (e.g., S3 for AWS), configure the backend by updating the `backend.tf` file.

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.

## License

This project is licensed under the MIT License.