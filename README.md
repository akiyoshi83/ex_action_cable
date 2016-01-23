## README

### Ruby & Rails version

* Ruby version 2.3.0
* Rails version 5.0.0.beta1

### System dependencies

* sqlite
* redis

### Configuration

```bash
$ cp config/settings.yml config/settings.local.yml
```

Overwrite docker settings.

How to show docker configuration (if you use docker-machine).

```bash
$ docker-machine env default
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/path/to/home/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell: 
# eval "$(docker-machine env default)"
```

`config/settings.local.yml` example.

```yaml
docker:
  host: tcp://192.168.99.100:2376
  scheme: https
  client_cert: /path/to/home/.docker/machine/machines/default/cert.pem
  client_key: /path/to/home/.docker/machine/machines/default/key.pem
  ssl_ca_file: /path/to/home/.docker/machine/machines/default/ca.pem
```

### Database creation

```bash
$ rails db:create
```

### Database initialization

```bash
$ rails db:migrate
$ rails db:seed
```

### How to run the test suite

### Services (job queues, cache servers, search engines, etc.)

### Deployment instructions

