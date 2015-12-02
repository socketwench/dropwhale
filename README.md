# dropwhale
A Drop-in Docker environment for Drupal module testing

## Purpose

Dropwhale is a drop-in Docker environment aimed at Drupal module developers. Instead of maintaining a separate Drupal installation, Dropwhale does all the downloading and initialization of Drupal with a few easy commands. No need for you to download and install core. No need to argue with xdebug or get Drush installed. It's all built in!

## Use

1. Download Dropwhale and copy the .docker directory to the root of your module repository. 
2. You can choose to commit the directory to your module repository, or gitignore it. Dropwhale doesn't care.
3. Copy .docker/docker-compose.override.yml.dist to .docker/docker-compose.override.yml (no .dist).
4. Edit docker/docker-compose.override.yml, replace your_module_name with your module machine name.
5. Run .docker/build.sh.

## License

Dropwhale is licensed under the GPLv3. 
