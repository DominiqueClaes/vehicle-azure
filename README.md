# Vehicles

## Development environment
Configure your local development environment with the following tools (Download and install. Further instructions on configurations are below):

* [IntelliJ](https://www.jetbrains.com/idea)
* [JDK 17](https://jdk.java.net/java-se-ri/17)
* [Apache Maven 3.9.2](https://archive.apache.org/dist/maven/maven-3/3.9.2)
* [Quarkus](https://quarkus.io)

### Build
Build the Docker image using the Maven command: mvn clean package

### Run
Run the Docker image with command: docker run --rm -p 8080:8080 [REPOSITORY]:[VERSION]