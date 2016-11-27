#!/usr/bin/env sh
#
# init.sh
#
# Downloads Drupal core and copies it to the web docroot.
#

# If no one set the branch name in the Compose override, set DRUPAL_BRANCH to a placeholder.
DRUPAL_BRANCH=${DRUPAL_BRANCH:-HEAD}

cd /tmp

# If there's an existing Drupal repo in the data container, do a git pull.
if [ -d /tmp/drupal ]; then
  cd /tmp/drupal
  git pull
elif [ "$DRUPAL_BRANCH" != "HEAD" ]; then
  # If there's no existing drupal directory, and a branch name specified, do a clone with branch.
  echo Using branch $DRUPAL_BRANCH
  git clone --branch $DRUPAL_BRANCH http://git.drupal.org/project/drupal.git
else
  # Otherwise, just clone the active branch.
  git clone http://git.drupal.org/project/drupal.git
fi

# Copy files from the repo to the web docroot.
rsync -azh --delete \
  --exclude=.git \
  --exclude=./vendor \
  --exclude=./modules \
  --exclude=./themes \
  /tmp/drupal/ /var/www/html/
