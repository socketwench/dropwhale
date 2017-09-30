#!/usr/bin/env sh

# Run coding standard tests.
if [ -n $MODULE_NAME ] && [ -z $* ]; then
  phpcs --standard=Drupal --extensions=php,module,inc,install,test,profile,theme,css,info,txt,md /var/www/html/modules/$MODULE_NAME
else
  phpcs --standard=Drupal --extensions=php,module,inc,install,test,profile,theme,css,info,txt,md $*
fi
