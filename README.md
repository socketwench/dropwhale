# dropwhale is obsolete

While this project remains up, it is no longer actively maintained. A more maintained approach would be to use another Docker-based local development environment such as:

* [TEN7's Flight Deck](https://github.com/ten7/flight-deck)
* [Lando](https://docs.lando.dev/)
* [DDev](https://www.ddev.com/)

## License

Dropwhale is licensed under the GPLv3.

## Changelog

## Version 2.4
* Added FunctionalJavascript testing support via PhantomJS
* Set Drush to 9.0.0-beta4 due to breakage in beta5.

## Version 2.3
* Fixed longstanding testing issues with permissions!
* Re-enabled Drupal console now that it's stable.
* Updated and fixed phpcs to run coding standard tests.
* Switched to the apache user for shell environment, updated permissions.
* Switched to Ansible to build container.

## Version 2.2
* Switched to Drush 9.x.
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
