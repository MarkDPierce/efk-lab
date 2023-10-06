# EFK in Docker Compose

This should make it easier to develop and prototype fluentd configurations and how the interact with elastic all from your local device.

## Instructions

A make file is provided to make deployment pretty simple and easy. You can run `make nginx` or `make httpd` to deploy an EFK stack with a corsiponding web server to generate some logs. You can also run `make nginx_down` or `make httpd_down` to remove the deployment

#### Generating credentials

Execute an interactive shell to the elastic container. `docker exec -it elastic /bin/bash`

Once you have a shell session into the elastic instance you can run the following command to generate credential information. `bash bin/elasticsearch-setup-passwords auto`

Copy the generated output somewhere you can return to and make sure you update `kibana.yml` and the fluentd config file `fluent.conf` and rerun your make command to redeploy with the configured credentials.

If you have already deployed the stack and generated the password information. Be aware the storage volume can persist making a new deployment fail due to the credentials being stored in this docker volume from a prior deployment. Just run `docker volume rm esdata` to scrub that storage.

#### Generate some logs

Before anything will show up in elastic you will need to generate the log information fluentd is listening for. A simple curl command to the web server you deployed should be enough.

Once you curl a few times, you can head over to the elastic instance `localhost:5601` and log in with the elastic user and the generated password.

In elastic you will have to create a data view for the fluentd logs `http://localhost:5601/app/management/kibana/dataViews` and name the index pattern `fluentd-*`

If you receive and error or there is nothing to display, there might be something wrong with auth on any of the machines in the stack, just remove all containers and redeploy.