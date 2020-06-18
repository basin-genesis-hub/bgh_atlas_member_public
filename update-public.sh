#!/bin/bash

python3 parse_yaml.py
xargs --arg-file=public_posts.txt cp --target-directory=Public_site_posts

echo "Done!"
