git clone git@github.com:steven-chong-tec/tec-hosts-file.git ~/repos/tec-hosts-file 2>nil
cd ~/repos/tec-hosts-file
aws ecs list-tasks --cluster arn:aws:ecs:ap-southeast-1:949519472813:cluster/prd-etg-docker --family prd-marketing-website --desired-status RUNNING |
  jq -r ".taskArns[0]" |
  xargs -I {} aws ecs describe-tasks --cluster arn:aws:ecs:ap-southeast-1:949519472813:cluster/prd-etg-docker --tasks {} |
  jq -r ".tasks[0].attachments[0].details[3].value" |
  xargs -I {} echo $'# Pre-Production\n{}    executivecentre.com www.executivecentre.com executivecentre.com.cn www.executivecentre.com.cn executivecentre.co.kr www.executivecentre.co.kr' > pre-production.txt
git add --all
git commit -a -m "auto commit"
git push

