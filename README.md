# GooglePlaceAutocomplete
Mink extension for [Google Place Autocomplete](https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-addressform)

## Installing Development Pre-Requisites

Install [Docker](https://www.docker.com).

Login to with your docker.com account (so you can pull private images)

```
docker login
```

You will also want to ensure that `./bin` is in your `$PATH` and is the highest priority. You can do so by adding the
following to the end of the same profile mentioned above:

```
export PATH=./bin:$PATH
```

## Installing The Project for Development

Clone the repository:

```bash
git clone git@github.com:Medology/behat-google-place-autocomplete.git
cd behat-google-place-autocomplete
```

```bash
containers up
```

Note : The ./bin/containers executable is just a wrapper for docker-compose, and saves you from having to specify the
project name and docker-compose.yml paths each time you want to work with the containers.

Update your hosts file:

```bash
echo -e "\n\
127.0.0.1 behatgoogleplaceautocomplete.local www.behatgoogleplaceautocomplete.local\n\
" | sudo tee -a /etc/hosts
```

Initialize the project:

```bash
init_project
```

You can now access the site at http://behatgoogleplaceautocomplete.local

## Executing tests

The project is configured to the headless Chrome container by default.

If you wish to view the browser, you can use a VNC client to connect to the Chrome container. The password is "secret".
For example, if you're environment is the Medology standard setup, you can use Safari and navigate to
`vnc://behatgoogleplaceautocomplete.local`.

Once the browser is running, you can execute your Behat tests as follows:

```bash
behat
```

## Tooling

In addition to the Docker server containers for running the site, the project also includes a set of command line tools
(such as php, bower, composer, etc) located in the bin folder. These can be run from anywhere on your Mac and will
execute as if they were installed locally on your machine.

These commands will either spin up temporary Docker containers to run your commands, or will connect to the running
Docker server containers that you started with docker-compose.

These command line tools have no requirements other than having Docker toolbox installed.

Note: If you are using the zsh terminal, you will need to unset the cdablevars option, otherwise you will be unable
to execute any of the binaries that match usernames on your system, such as mysql:

.zshrc
```
# Options
unsetopt cdablevars
```
