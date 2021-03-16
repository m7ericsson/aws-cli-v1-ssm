## Docker CLI usage

The AWS CLI can be executed from the Docker CLI with the docker run command:
```shell
$ docker run --rm -it m7ericsson/aws-cli-v1-ssm --version
```

In order to run a command that makes an AWS API call, credentials and configuration may need to be shared from the host system to the container. Assuming credentials and configuration are being set in the ~/.aws/credentials and ~/.aws/config file on the host system, they can be shared by mounting the ~/.aws directory to the /root/.aws directory of the container:
```shell
$ docker run --rm -ti -v ~/.aws:/.aws m7ericsson/aws-cli-v1-ssm ecs execute-command \
    --cluster {cluster_name} \
    --task {task_id} \
    --container {container_name} \
    --interactive \
    --command "ash"
```

In order to shorten the length of docker commands, you can add the following alias:
```shell
$ alias aws='docker run --rm -ti -v ~/.aws:/.aws m7ericsson/aws-cli-v1-ssm'
```
