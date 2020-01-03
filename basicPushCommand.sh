#!/bin/bash
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

echo Enter commit message

read commitMessage

git add .
git commit -m "$commitMessage"

if [ ! $branch ]
then 
  $branch = "master"
fi

if [ $branch = "master" ]
then 
  git push --set-upstream origin master
else
  git push --set-upstream origin $branch
fi

