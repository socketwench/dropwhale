# dropwhale
A Drop-in Docker environment for Drupal module testing

## Purpose

Dropwhale is a drop-in Docker environment aimed at Drupal module
developers. Instead of maintaining a separate Drupal installation,
Dropwhale does all the downloading and initialization of Drupal with a
few easy commands. No need for you to download and install core. No
need to argue with xdebug or get Drush installed. It's all built in!

## Use

1. Download Dropwhale and copy the .docker directory to the root of your module repository.
2. You can choose to commit the directory to your module repository, or gitignore it. Dropwhale doesn't care.
3. Reanme docker-compose.override.yml.dist to docker-compose.override.yml (no .dist).
4. Edit docker-compose.override.yml, replace your_module_name with your module machine name.
5. Edit the docker-compose-override.yml file, adding the
   installation directory of your module, and adding your module name to
   the MODULE_ENABLE environment variable.
6. cd to the root of your module repository. Execute .docker/start.sh

If you need to rebuild Drupal at any time, execute .docker/build.sh

## License

Dropwhale is licensed under the GPLv3.

## Changelog

### Version 0.4
* Switched to socketwench/drupal-base:8-xdebug and socketwench/drupal-cli.
* Moved docker-compose.*.yml files into root directory.

### Version 0.3
* Switched to more standardized containers to speed build process.
* PHP 7 with OpCache.
* Added missing php.ini to web container.
* Added helper scripts for PHPUnit testing and nuking docker.
* XDebug Support!
