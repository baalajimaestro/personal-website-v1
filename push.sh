#!/bin/bash
cd /public
git remote rm origin
git remote add origin https://baalajimaestro:${GH_PERSONAL_TOKEN}@github.com/baalajimaestro/personal-website

echo -e "Deploying updates to GitHub..."
cd /app
hugo -d /public

# Go To Public folder
cd /public

# Add changes to git.
git add .

# Commit changes.
git commit -m "[MaestroCI]: Push Built Site"

# Push source and build repos.
git push origin master
