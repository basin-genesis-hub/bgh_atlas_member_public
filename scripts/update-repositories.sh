#!/bin/bash

git config --global user.name "michaelchin"
git config --global user.email "michael.chin@sydney.edu.au"

cd member_backend
touch Gemfile.lock
chmod a+w Gemfile.lock
jekyll build
git add -A
git commit --message "GitHub Action to re-build the website"
git push origin
cd ..

cp -rf ./member_backend/_site/* ./member_frontend/

cd ./member_frontend

apk add python
python3 replace_html.py

git add -A
git commit --message "GitHub Action to update website frontend"
git push origin

echo "Done!"
