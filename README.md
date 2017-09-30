# dropwhale
A Drop-in Docker environment for Drupal module testing

## Purpose

Dropwhale is a drop-in Docker environment aimed at Drupal module
developers. Instead of maintaining a separate Drupal installation,
Dropwhale does all the downloading and initialization of Drupal with a
few easy commands. No need for you to download and install core. No
need to argue with xdebug or get Drush installed. It's all built in!

## Use

1. Download Dropwhale and copy the following files to the root of your module repository:
  * The .dropwhale/ directory
  * docker-compose.yml
  * dropwhale.settings.example
2. You can choose to commit the directory to your module repository, or gitignore it. Dropwhale doesn't care.
3. Rename dropwhale.settings.examples to dropwhale.settings.
4. Edit dropwhale.settings, replace your_module_name with your module machine name.
5. Make any other changes to dropwhale.settings, if desired.
6. cd to the root of your module repository. Execute .dropwhale/start.sh

If you need to rebuild from a clean version of Drupal, run .dropwhale/reset.sh

## License

Dropwhale is licensed under the GPLv3.

## Changelog

## Version 2.3
* Fixed longstanding testing issues with permissions!
* Re-enabled Drupal console now that it's stable.
* Switched to the apache user for shell environment, updated permissions.
* Switched to Ansible to build container.

## Version 2.2
* Switched to Drush 9.x stable.
* Configured phpunit.xml.
* Internal improvements.

## Version 2.1
* Switched [TEN7/Dockstack](https://github.com/ten7/dockstack) as a base.
* Included phpMyAdmin and Mailhog for DB access and email debugging.
* phpunit.php now will run your module's tests when no parameters are given.
* Ansible was added to the web container to power builds.

## Version 2.0
* New containers based on Alpine Linux for a smaller download size.
* build.sh renamed to reset.sh for better clarity.
* Settings moved from Docker override file to dropwhale.settings.
* start.sh will now display an error if dropwhale.settings isn't found.
* New MODULE_NAME setting and ADDITIONAL_MODULES settings.
* run-tests.php now will run your module's tests when no parameters are given.
* The parent directory is now mounted at /module, and symlinked into drupal/modules when built.
* delete.sh now asks with a more friendly message before deleting.
* nuke.sh now deletes volumes too.

### Version 0.5
* Various fixes
* Added phpcs.sh script.

### Version 0.4
* Use DRUPAL_USER and DRUPAL_PASSWORD to set login credentials.
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
