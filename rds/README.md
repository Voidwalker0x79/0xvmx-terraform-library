Essentially, this will deploy a primary RDS instance to AWS RDS service. Along with 1 read replica that is in multi-az mode and another read replica that is in a single az mode. 

## How to deploy. 
Pull the repo with `git clone Voidwalker0x79/0xvmx-terraform-library` then cd in the `rds` directory. Create environment variables for your AWS LAB using the TF_VAR prefix.
Example: TF_VAR_AWS_ACCESS_KEY, TF_VAR_AWS_SECRET_ACCESS_KEY. Or you can hardcode them into your code. idc this is your journey, but practice like you play. 

After variables are set, you can do `terraform init, plan and apply`. Go to your AWS console to see the magic once it is complete.
