#!/bin/bash

git config --global user.name "michaelchin"
git config --global user.email "michael.chin@sydney.edu.au"

cd member_backend
touch Gemfile.lock
chmod a+w Gemfile.lock

mv _maps_template.html maps_template.html

jekyll build

cp -f _site/maps_template/index.html _site/maps/index.html 

mv maps_template.html _maps_template.html

cd ..

rm -f ./member_backend/_site/Gemfile.lock
rm -f ./member_backend/_site/README.md

#copy the files, but do not overwrite
grep -l -e "privacy:[ ]*public" ./member_backend/_posts/*.md | while read -r filename; do echo $filename; false | cp -i $filename ./public/_posts/; done

cp -rf ./member_backend/_site/* ./member_backend_jekyll_build/_site/
cd ./member_backend_jekyll_build
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
cd ..

cd ./public
git add -A
git commit --message "GitHub Action to update public website"
git push origin

echo "Done!"
