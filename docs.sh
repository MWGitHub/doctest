#!/bin/bash
## used in "prepush": "bash ./doc/docs.sh"
## requires husky as a dev dependancy

current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')


if [ $current_branch = 'master' ]
then
  echo "On MASTER! Generating Documentation."
  rm -rf ./doc/api.md
  mkdir -p doc && jsdoc2md 'lib/**/*.js' -P  > ./doc/api.md
  if [[ "$?" == "0" ]]
  then
    if [[ -e "./doc/api.md" ]]
    then
      echo "Documentation ready. Committing!"
      git add ./doc/api.md
      git commit -m "update api documentation"
      git push origin $current_branch
      echo "Documentation committed continuing."
    else
      exit 1
    fi
  else
    exit 1
  fi
fi
