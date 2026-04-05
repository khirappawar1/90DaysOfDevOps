Day 61 -- Introduction to Terraform and Your First AWS Infrastructure
Task
You have been deploying containers, writing CI/CD pipelines, and orchestrating workloads on Kubernetes. But who creates the servers, networks, and clusters underneath? Today you start your Infrastructure as Code journey with Terraform -- the tool that lets you define, provision, and manage cloud infrastructure by writing code.

By the end of today, you will have created real AWS resources using nothing but a .tf file and a terminal.

Expected Output
Terraform installed and working on your machine
AWS CLI configured with valid credentials
An S3 bucket and EC2 instance created and destroyed via Terraform
A markdown file: day-61-terraform-intro.md
Challenge Tasks
Task 1: Understand Infrastructure as Code
Before touching the terminal, research and write short notes on:

What is Infrastructure as Code (IaC)? Why does it matter in DevOps?
What problems does IaC solve compared to manually creating resources in the AWS console?
How is Terraform different from AWS CloudFormation, Ansible, and Pulumi?
What does it mean that Terraform is "declarative" and "cloud-agnostic"?
Write this in your own words -- not copy-pasted definitions.

Task 2: Install Terraform and Configure AWS
Install Terraform:
# macOS
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Linux (amd64)
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# Windows
choco install terraform
Verify:
terraform -version
Install and configure the AWS CLI:
aws configure
# Enter your Access Key ID, Secret Access Key, default region (e.g., ap-south-1), output format (json)
Verify AWS access:
aws sts get-caller-identity
You should see your AWS account ID and ARN.

Task 3: Your First Terraform Config -- Create an S3 Bucket
Create a project directory and write your first Terraform config:

mkdir terraform-basics && cd terraform-basics
Create a file called main.tf with:

A terraform block with required_providers specifying the aws provider
A provider "aws" block with your region
A resource "aws_s3_bucket" that creates a bucket with a globally unique name
Run the Terraform lifecycle:

terraform init      # Download the AWS provider
terraform plan      # Preview what will be created
terraform apply     # Create the bucket (type 'yes' to confirm)
Go to the AWS S3 console and verify your bucket exists.

Document: What did terraform init download? What does the .terraform/ directory contain?

Task 4: Add an EC2 Instance
In the same main.tf, add:

A resource "aws_instance" using AMI ami-0f5ee92e2d63afc18 (Amazon Linux 2 in ap-south-1 -- use the correct AMI for your region)
Set instance type to t2.micro
Add a tag: Name = "TerraWeek-Day1"
Run:




terraform plan      # You should see 1 resource to add (bucket already exists)
terraform apply
Go to the AWS EC2 console and verify your instance is running with the correct name tag.

Document: How does Terraform know the S3 bucket already exists and only the EC2 instance needs to be created?

Task 5: Understand the State File
Terraform tracks everything it creates in a state file. Time to inspect it.

Open terraform.tfstate in your editor -- read the JSON structure
Run these commands and document what each returns:
terraform show                          # Human-readable view of current state
terraform state list                    # List all resources Terraform manages
terraform state show aws_s3_bucket.<name>   # Detailed view of a specific resource
terraform state show aws_instance.<name>
Answer these questions in your notes:
What information does the state file store about each resource?
Why should you never manually edit the state file?
Why should the state file not be committed to Git?
Task 6: Modify, Plan, and Destroy
Change the EC2 instance tag from "TerraWeek-Day1" to "TerraWeek-Modified" in your main.tf
Run terraform plan and read the output carefully:
What do the ~, +, and - symbols mean?
Is this an in-place update or a destroy-and-recreate?
Apply the change
Verify the tag changed in the AWS console
Finally, destroy everything:
terraform destroy
Verify in the AWS console -- both the S3 bucket and EC2 instance should be gone
Hints
S3 bucket names must be globally unique -- use something like terraweek-<yourname>-2026
AMI IDs are region-specific -- search "Amazon Linux 2 AMI" in your region's EC2 launch wizard
terraform fmt auto-formats your .tf files -- run it before committing
terraform validate checks for syntax errors without connecting to AWS
The .terraform/ directory contains downloaded provider plugins
Add *.tfstate, *.tfstate.backup, and .terraform/ to your .gitignore
Documentation
Create day-61-terraform-intro.md with:

IaC explanation in your own words (3-4 sentences)
Screenshot of terraform apply creating your S3 bucket and EC2 instance
Screenshot of the resources in the AWS console
What each Terraform command does (init, plan, apply, destroy, show, state list)
What the state file contains and why it matters
Submission
Add day-61-terraform-intro.md to 2026/day-61/
Commit and push to your fork
Learn in Public
Share on LinkedIn: "Started the TerraWeek Challenge -- installed Terraform, created my first S3 bucket and EC2 instance using code, and destroyed it all with one command. Infrastructure as Code just clicked."

#90DaysOfDevOps #TerraWeek #DevOpsKaJosh #TrainWithShubham

Happy Learning! TrainWithShubham