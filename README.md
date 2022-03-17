# Docker container for treeseg
A docker container for apburt's treeseg

**What is docker ?**

Docker is a program to run virtual machines easily.


**How to run treeseg-docker container ?**

First you have to do one of the following options:

Build the container by typing in a terminal :

`docker build git://github.com/Ciaran1981/treeseg-docker -t treeseg`

Clone it then point docker cmd at the cloned directory:

`sudo docker build treeseg-docker -t treeseg`

**How can I delete this thing ?**

Just remove it with docker : 

`docker rmi -f treeseg`



