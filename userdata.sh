#!/bin/bash
yum update -y
yum install python3 -y
pip3 install flask
cat <<EOF > /home/ec2-user/app.py
from flask import Flask
app = Flask(__name__)
@app.route('/')
def home():
    return "Hello from EC2!"
app.run(host='0.0.0.0', port=80)
EOF
python3 /home/ec2-user/app.py &

