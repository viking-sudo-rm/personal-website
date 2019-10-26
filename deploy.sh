#!/bin/bash

# Commit message.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# echo -e "\033[0;32mUpdating source on GitHub...\033[0m"
# git commit -am '$msg'
# git push origin master

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t academic # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
