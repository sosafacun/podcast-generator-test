#! /bin/bash

set -e

echo "STARTING"
git config --global user.name "${GITHUB_ACTOR:-github-actions}"
git config --global user.email "${INPUT_EMAIL-github-actions@localhost}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A
git commit -m "Update Feed"

git push --set-upstream origin main

/venv/bin/python /usr/bin/feed.py

echo "DONE"