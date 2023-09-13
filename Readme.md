# EFK in Docker Compose

This should make it easier to develop and prototype fluentd configurations and how the interact with elastic all from your local device.


## Instructions

To stand up all services you can simply run `docker-compose up --build`. This should initially deploy the EFK stack for you. Once everything is deployed kibana and Fluentd services will not work due to access constraints.

#### Generating credentials

Execute an interactive shell to the elastic container. `docker exec -it elastic /bin/bash`

Once you have a shell session into the elastic instance you can run the following command to generate credential information. `bash bin/elasticsearch-setup-passwords auto`

Copy the generated output somewhere you can return to and make sure you update `elasticsearch.yml` and the fluentd config file `fluent.conf`