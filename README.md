# Serweron Docker
We are using awesome itzg/minecraft-server for PaperMC server in Docker.

## Usage
```yml
version: '3.3'
services:
    minecraft:
        image: masnypen/serweron:latest
        environment:
            VERSION: 1.21
        ports:
            - "25565:25565"
        volumes:
            - ./server:/data
        stdin_open: true
        tty: true
        restart: "no"
```
In `enviroment` section you can use [itzg/minecraft-server's variables](https://docker-minecraft-server.readthedocs.io/en/latest/variables/)

## Features
 - Bukkit and spigot config patches
 - A lot of environment variables for easier development
 - Move compiled plugin to `plugins/`
 - Support for Java Debugger

## EULA
By using this image you agree to Minecraft's EULA!
