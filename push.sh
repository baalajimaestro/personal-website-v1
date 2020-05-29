#!/bin/bash
git remote rm origin
git remote add origin https://baalajimaestro:${GH_PERSONAL_TOKEN}@github.com/baalajimaestro/baalajimaestro.github.io
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
hugo -d /public

# Go To Public folder

cd $PUBLIC

# Add changes to git.
git add .

# Commit changes.
git commit -m "[MaestroCI]: Push Built Site"

# Push source and build repos.
git push origin master
