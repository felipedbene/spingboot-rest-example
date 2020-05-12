
#Builder Container
docker run -it --rm --name my-maven-project -v "$PWD":/usr/src/app  -v "$HOME"/.m2:/root/.m2 -w /usr/src/app maven:3.2-jdk-8 mvn clean install

#Run Container
 docker run -it --rm --name webapp -p 8090:8090 -p 8091:8091 webapp

#From the Builder

docker run -it --rm -v "$(pwd)"/target:/usr/src/app/target springbuild package -T 1C -o -Dmaven.test.skip=true

http http://localhost:8091/env
http http://localhost:8091/health
http http://localhost:8091/info
http http://localhost:8091/metrics

# Test
http POST http://localhost:8090/example/v1/hotels < test-hotel.json
http http://localhost:8090/example/v1/hotels
