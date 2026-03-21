## Para instalar aws
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
aws configure
```
## Para verificar la arquitectura de un AMI
```bash
aws ec2 describe-images --image-ids ami-0ec10929233384c7f --query "Images[].Arquitecture"
```
## Para listar todos los Instance Types del plan gratuito
```bash
aws ec2 describe-instance-types \
--filters "Name=free-tier-eligible,Values=true" \
--query "InstanceTypes[].InstanceType" \
--output table
``` 

# Proceso de creación de proyecto Terraform y ejecución
```bash
terraform init
terraform plan
terraform apply
```

## Con confirmación automática
```bash
terraform apply -auto-approve
terraform destroy -auto-approve
```
