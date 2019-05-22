# Description

This is a simple Docker image intended to be used for local development of Linux programming homework assignments that typically run on a Centos server.

[Docker Hub](https://hub.docker.com/r/nathanperkins/os1)

# Instructions

1. [Install Docker](https://docs.docker.com/install/).
1. Open a terminal.
1. Navigate to your local assignment workspace: `cd ~/cs344/`
1. Create a container from the image: `docker run --rm -it -v "$(pwd):/workspace" -w "/workspace" --name os1 nathanperkins/os1`
1. Stop container with `exit`
1. Start the container again with `docker start -a os1`

# Example

```bash
# navigate to your workspace and create the container
$ cd ~/git/osu-cs344/
$ docker run --rm -it -v "$(pwd):/workspace" -w "/workspace" --name os1 nathanperkins/os1

# you are now inside the container and your workspace should be here as well
[root@2d51aa00977b workspace]# ls
README.md  Vagrantfile  assignment_1  assignment_2  assignment_3  assignment_4  assignment_py  playground  test

# exit the container
[root@2d51aa00977b assignment_2]# exit
exit
```

# Explanation

Let's break down this command
```
$ docker run --rm -it -v "$(pwd):/workspace" -w "/workspace" --name os1 nathanperkins/os1
```

- [docker run](https://docs.docker.com/engine/reference/commandline/run/) - creates and starts a new container from an image.
- `--rm` - delete anonymous (unnamed) docker volumes once the container is stopped.
- `-it` - runs the container in interactive mode and attaches a terminal.
- `-v "$(pwd):/workspace"` - uses [docker volumes](https://docs.docker.com/storage/volumes/) to map a local directory to a directory inside the container. This allows you to use your local files inside the container and have the changes synced both ways.
- `-w "/workspace"` - opens the container `/workspace` as the current working directory.
- `--name os1` - names the container "os1" so that you can easily start it again as needed.
- `nathanperkins/os1` - the name of the image on Docker Hub, [found here](https://hub.docker.com/r/nathanperkins/os1)
