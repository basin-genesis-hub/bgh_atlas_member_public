#### Do the following steps first and then go to https://github.com/basin-genesis-hub/bgh_atlas_member_public

Step 1: Put the new ".md" file in "_post" folder and check in

Step 2: Run the following command in the terminal at the bgh_atlas directory level
```bash
docker run --rm --volume="$PWD:/srv/jekyll"  -it julesg/atlas jekyll build
```

Step 3: Check in the files in folder "_site"

