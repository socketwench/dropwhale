# dropwhale
A Drop-in Docker environment for Drupal module testing

## Purpose

Dropwhale is a drop-in Docker environment aimed at Drupal module
developers. Instead of maintaining a separate Drupal installation,
Dropwhale does all the downloading and initialization of Drupal with a
few easy commands. No need for you to download and install core. No
need to argue with xdebug or get Drush installed. It's all built in!

## Use

1. Download Dropwhale and copy the `.docker` directory to the root of your module repository.
2. You can choose to commit the directory to your module repository, or gitignore it. Dropwhale doesn't care.
3. Copy `.docker/docker-compose.override.yml.dist` to `.docker/docker-compose.override.yml` (no `.dist`).
4. Edit `.docker/docker-compose.override.yml`, replace `your_module_name` with your module machine name.
5. Edit the `.docker/docker-compose-override.yml` file, adding the
   installation directory of your module, and adding your module name to
   the MODULE_ENABLE environment variable.
6. cd to the root of your module repository. Execute `.docker/start.sh`
7. To stop your containers execute `.docker/stop.sh`

## Readymade scripts
Repository has some readymade scripts to help you to manage your local environment.

1. If you need to rebuild Drupal at any time, execute  
`.docker/build.sh`

2. To get a command line in a CLI container, execute  
`.docker/bash.sh`

3. Kill and delete the containers (but keep Docker images), execute  
`.docker/delete.sh`

4. To run Drupal Console in the CLI container, execute  
`.docker/drupal.sh`

5. To run Drush in the CLI container, execute  
`.docker/drush.sh`

6. To kill **all** containers, delete **all** containers and images, execute  
`.docker/nuke.sh`  
**WARNING:** This leaves your entire system squeaky clean, but also deletes all
docker resources, not just Dropwhale containers.

7. To run PHPUnit in the cli container, execute  
`.docker/run-tests.sh`  

8. To run PHPUnit tests for a single module "mymodule" in the cli container, execute  
`.docker/run-tests.sh --module mymodule`

## License

Dropwhale is licensed under the GPLv3.

## Changelog

### Version 0.4
* Use DRUPAL_USER and DRUPAL_PASSWORD to set login credientals.
* Switched to socketwench/drupal-base:8-xdebug and socketwench/drupal-cli.
* Moved docker-compose.*.yml files into root directory.
* Removed hardcoded 8.0.x branch pull in init.sh, now pulls from default branch.
* Added composer install to init.sh.
* Commented helper scripts for MOAR HACKABILITY.
* Added run-tests.sh script so you never have to log in.
* Updated helper scripts to preserve working directory.

### Version 0.3
* Switched to more standardized containers to speed build process.
* PHP 7 with OpCache.
* Added missing php.ini to web container.
* Added helper scripts for PHPUnit testing and nuking docker.
* XDebug Support!
