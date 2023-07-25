docker build . -t jenkins
docker -H tcp://localhost:2375 run -u root -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 --name jenkins jenkins