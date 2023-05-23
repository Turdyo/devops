docker build . -t jenkins
docker run -p 8080:8080 --name Jenkins jenkins