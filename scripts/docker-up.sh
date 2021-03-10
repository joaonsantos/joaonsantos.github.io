set -x
docker rm -f contact
docker network rm contact
docker network create contact
docker build -f Dockerfile -t contact .
docker run --name contact --network contact -p 3001:3000 -d contact
