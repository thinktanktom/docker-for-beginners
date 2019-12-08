FROM java:8
WORKDIR /home/java-docker-app
COPY . /home/java-docker-app
RUN javac helloworld.java

CMD ["/usr/bin/java","helloworld"]

