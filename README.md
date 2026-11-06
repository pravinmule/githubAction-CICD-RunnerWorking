#   paste EC2

#install terrafrom ((https://developer.hashicorp.com/terraform/install))

sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install terraform


# file must be present in github 
# github/workflows/tf.yml
# main.tf
# varibale.tf

###################copy paste ###########
# 1. Update OS and install dependencies
sudo yum update -y
sudo yum install -y git curl tar gzip
sudo dnf install libicu -y

# 2. Create directory
mkdir actions-runner && cd actions-runner

# 3. Download runner
curl -o actions-runner-linux-x64-2.338.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.338.2/actions-runner-linux-x64-2.338.2.tar.gz
tar xzf ./actions-runner-linux-x64-2.338.2.tar.gz

# 4. Configure runner (from GitHub UI setting --action--runnerr--new selfhost runner)
./config.sh --url https://github.com/pravinmule/pravingithubaction --token AWSPN5N5PJWTH3PRXIB3SOTK5WUYG --labels amazonlinux,dev --name ec2-runner

# 5. Start runner
./run.sh &

# 6. Optional: install as service
sudo ./svc.sh install
sudo ./svc.sh start

# to run pipeline
# Action select workflow ---start workflow 


#Note: to check inside te ec2 by runing this command ps -ef | grep Runner.Listener
