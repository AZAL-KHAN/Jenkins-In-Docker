# Initialize Terraform backend (run once)
init:
	cd terraform && terraform init

# Show Terraform execution plan (safe)
plan:
	cd terraform && terraform plan

# Create infrastructure and install Docker
apply:
	cd terraform && terraform apply -auto-approve
	cd ansible && ansible-playbook -i inventory/inventory.aws_ec2.yml playbooks/docker.yml
	cd ansible && ansible-playbook -i inventory/inventory.aws_ec2.yml playbooks/jenkins.yml

# Apply Terraform changes only 
infra-apply:
	cd terraform && terraform apply -auto-approve

# Run Ansible only (no infra changes)
ansible:
	cd ansible && ansible-playbook -i inventory/inventory.aws_ec2.yml playbooks/docker.yml

# Run Jenkins only
jenkins:
	cd ansible && ansible-playbook -i inventory/inventory.aws_ec2.yml playbooks/jenkins.yml

# Destroy all Terraform-managed infrastructure
destroy:
	cd terraform && terraform destroy -auto-approve
