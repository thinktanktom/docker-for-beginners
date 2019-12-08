# Purpose
### A basic docker tutorial for the absolute beginner.
# Why use Docker?
### Docker is a light-weight container based deployment system used by product developers to ensure that their product works no matter what system the consumer happens to be using.
### Its working is similar to that of a virtual machine configuration except for the fact that the operating system percieves it as a normal process. Therefore important resources like memory and the kernel itself do not have to be split for the container. Docker instead uses resource isolation features that allow us to create more than one container for the same instance.
### For a more in-depth explanation I suggest you go [here](https://en.wikipedia.org/wiki/Docker_(software)).
# Prerequisites
### - You must first install Docker. For linux users, simply open your terminal and copy the following command:
### `sudo apt install docker`
### For downloads on any other operating system please click [here](https://docs.docker.com/v17.09/engine/installation/#supported-platforms). You may check if it is installed by typing `docker` in the terminal.
### - Next you must create a new working directory in which you can store your Docker related files. I trust you can do that without too much hassle.
### - In this tutorial we'll be using a simple Hello World program written in Java. You can either write it yourself or copy it from [here](https://www.geeksforgeeks.org/beginning-java-programming-with-hello-world-example/)
### After saving it with the `.java` extension move a copy of the file over to the working directory you created earlier
# Creating the Docker Container
### Now we move on to the actual container creation process. Our aim here is to compile and execute the `.java` file without actually installing Java on our operating system. Ofcourse if you have Java already installed you need not delete it, rather you can use it to compile your Hello World program and debug it in case of errors.
### - Our first step is to create a Dockerfile. This file governs how the system image is created. I recommend you use VSCode to create this file. You can download VSCode from [here](https://code.visualstudio.com/download)
### Copy the following commands into your Dockerfile:
### `FROM java:8`
### `WORKDIR /home/java-docker-app`
### `COPY . /home/java-docker-app`
### `RUN javac helloworld.java`

### `CMD ["/usr/bin/java","helloworld"]`
### An indepth explanation of these commands and their significance can be found [here](https://kapeli.com/cheat_sheets/Dockerfile.docset/Contents/Resources/Documents/index). Do not forgot to save the Dockerfile without an extension. It must be stored in the working directory.
### - We must then build the docker image. We can do this by running the following in our terminal:
### `docker build .`
### This outputs a couple of steps in the following fashion:
### - `docker build .`
 Sending build context to Docker daemon  58.88kB<br/>
 Step 1/5 : FROM java:8
  ---> d23bdf5b1b1b<br/>
Step 2/5 : WORKDIR /home/java-docker-app<br/>
 ---> Using cache
 ---> c3e6f7477902<br/>
Step 3/5 : COPY . /home/java-docker-app
 ---> 3f785fe05c97<br/>
Step 4/5 : RUN javac helloworld.java
 ---> Running in d2af1f4f0362
Removing intermediate container d2af1f4f0362
 ---> 4992b15c0312<br/>
Step 5/5 : CMD ["/usr/bin/java","helloworld"]<br/>
 ---> Running in ef03ebcde1a7
Removing intermediate container ef03ebcde1a7
 ---> 0bc24ec77d5c<br/>
Successfully built 0bc24ec77d5c
### - `docker run <image tag>`
### Here the image tag is the hash issued to us at the end of the build output. In our case it is 0bc24ec77d5c.
### After running the docker run command we should arrive at the following output:
### `Hello World`
# Fin
### Congratulations! You've managed to create your first docker container. If you still have any trouble creating a container I recommend taking a look at the official Docker Documentation which you can find [here](https://docs.docker.com/)