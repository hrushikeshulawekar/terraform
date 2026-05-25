#!/bin/bash

# Update system and install required packages
sudo yum update -y
sudo yum install -y httpd git

# Start and enable Apache service
sudo systemctl start httpd
sudo systemctl enable httpd

# Fetch instance metadata
export TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
export META_INST_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id -H "X-aws-ec2-metadata-token: $TOKEN")
export META_INST_TYPE=$(curl http://169.254.169.254/latest/meta-data/instance-type -H "X-aws-ec2-metadata-token: $TOKEN")
export META_INST_AZ=$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone -H "X-aws-ec2-metadata-token: $TOKEN")

# Navigate to the web server directory
cd /var/www/html

# Create a modern HTML page with CPU load simulation
echo "<!DOCTYPE html>" > index.html
echo "<html lang=\"en\">" >> index.html
echo "<head>" >> index.html
echo "    <meta charset=\"UTF-8\">" >> index.html
echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> index.html
echo "    <title>CPU Load Monitor</title>" >> index.html
echo "    <style>" >> index.html
echo "        body {" >> index.html
echo "            font-family: Arial, sans-serif;" >> index.html
echo "            background-color: #f4f4f9;" >> index.html
echo "            margin: 0;" >> index.html
echo "            padding: 0;" >> index.html
echo "            display: flex;" >> index.html
echo "            justify-content: center;" >> index.html
echo "            align-items: center;" >> index.html
echo "            height: 100vh;" >> index.html
echo "            color: #333;" >> index.html
echo "        }" >> index.html
echo "        .container {" >> index.html
echo "            text-align: center;" >> index.html
echo "            padding: 20px;" >> index.html
echo "            background: white;" >> index.html
echo "            border-radius: 8px;" >> index.html
echo "            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);" >> index.html
echo "            width: 90%;" >> index.html
echo "            max-width: 600px;" >> index.html
echo "        }" >> index.html
echo "        h1 {" >> index.html
echo "            font-size: 2rem;" >> index.html
echo "            margin-bottom: 10px;" >> index.html
echo "        }" >> index.html
echo "        p {" >> index.html
echo "            margin: 5px 0;" >> index.html
echo "        }" >> index.html
echo "        .chart {" >> index.html
echo "            margin-top: 20px;" >> index.html
echo "        }" >> index.html
echo "        .load-bar {" >> index.html
echo "            width: 100%;" >> index.html
echo "            height: 20px;" >> index.html
echo "            background: #e0e0e0;" >> index.html
echo "            border-radius: 10px;" >> index.html
echo "            overflow: hidden;" >> index.html
echo "            position: relative;" >> index.html
echo "        }" >> index.html
echo "        .load-bar div {" >> index.html
echo "            height: 100%;" >> index.html
echo "            background: #76c7c0;" >> index.html
echo "            width: 0;" >> index.html
echo "            transition: width 0.5s ease;" >> index.html
echo "        }" >> index.html
echo "    </style>" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "    <div class=\"container\">" >> index.html
echo "        <h1>CPU Load Monitor</h1>" >> index.html
echo "        <p>Instance ID: <strong>" $META_INST_ID "</strong></p>" >> index.html
echo "        <p>Instance Type: <strong>" $META_INST_TYPE "</strong></p>" >> index.html
echo "        <p>Availability Zone: <strong>" $META_INST_AZ "</strong></p>" >> index.html
echo "        <div class=\"chart\">" >> index.html
echo "            <h2>CPU Load</h2>" >> index.html
echo "            <div class=\"load-bar\">" >> index.html
echo "                <div id=\"cpu-load\" style=\"width: 0%;\"></div>" >> index.html
echo "            </div>" >> index.html
echo "            <p id=\"cpu-percentage\">0%</p>" >> index.html
echo "        </div>" >> index.html
echo "    </div>" >> index.html
echo "    <script>" >> index.html
echo "        function simulateCPULoad() {" >> index.html
echo "            const loadElement = document.getElementById('cpu-load');" >> index.html
echo "            const percentageElement = document.getElementById('cpu-percentage');" >> index.html
echo "            setInterval(() => {" >> index.html
echo "                const load = Math.floor(Math.random() * 100);" >> index.html
echo "                loadElement.style.width = load + '%';" >> index.html
echo "                percentageElement.textContent = load + '%';" >> index.html
echo "            }, 2000);" >> index.html
echo "        }" >> index.html
echo "        simulateCPULoad();" >> index.html
echo "    </script>" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html

# Restart Apache to apply changes
sudo systemctl restart httpd
