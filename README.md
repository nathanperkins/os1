# Description

This is a simple Docker image intended to be used for local development of Linux programming homework assignments that typically run on a Centos server.

- [Docker Hub](https://hub.docker.com/r/nathanperkins/os1)
- [GitHub](https://github.com/nathanperkins/os1)
- [More info about docker](http://johncodes.com/2018/11/12/docker_centos/) (from OSU's John McBride)

# Instructions

1. [Install Docker](https://docs.docker.com/install/).
1. Open a terminal.
1. Navigate to your local assignment workspace: `cd ~/cs344/`
1. Create and run a container from the image: `docker run --rm -it -v "$PWD:/workspace" -w "/workspace" --name os1 --user=$UID nathanperkins/os1`
1. Stop container with `exit`


# Example

```bash
# navigate to your workspace and create the container
$ cd ~/git/osu-cs344/
$ docker run --rm -it -v "$PWD:/workspace" -w "/workspace" --user=$UID nathanperkins/os1

# you are now inside the container and your workspace should be here as well
bash-4.2$ ls
README.md  Vagrantfile  assignment_1  assignment_2  assignment_3  assignment_4  assignment_py  playground  test

# exit the container
bash-4.2$ exit
exit
```

# Explanation

Let's break down this command
```
$ docker run --rm -it -v "$PWD:/workspace" -w "/workspace" --name os1 --user=$UID nathanperkins/os1
```

- [docker run](https://docs.docker.com/engine/reference/commandline/run/) - creates and starts a new container from an image.
- `-it` - runs the container in interactive mode and attaches a terminal.
- `-v "$PWD:/workspace"` - uses [docker volumes](https://docs.docker.com/storage/volumes/) to map the current local directory to a directory inside the container. This allows you to use your local files inside the container and have the changes synced both ways.
- `--rm` - deletes the container itself and any anonymous volumes when done. This does not affect your workspace volume that was explicitly mapped above.
- `-w "/workspace"` - opens the container `/workspace` as the current working directory.
- `--user=$UID` - Runs the container with the uid and thus permissions of the current user.
- `nathanperkins/os1` - the name of the image on Docker Hub, [found here](https://hub.docker.com/r/nathanperkins/os1)

You can optionally have your container run a single command instead of the one provided by the image (/bin/bash). For example, the following command will run the command `./p1graindgscript matrix` in your container and redirect the output to the file 'results':
```
$ docker run --rm -it -v "$PWD:/workspace" -w "/workspace" --name os1 --user=$UID  nathanperkins/os1 ./p1gradingscript matrix > results
```
