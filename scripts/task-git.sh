#!/bin/bash

# Get task command
TASK_COMMAND="task ${@}"
# Get data dir
DATA_DIR=$HOME/.task

if [ ! -d "$DATA_DIR" ]; then
  echo 'Could not load data directory!'
  exit 1
fi

PULL=0
for i
do
  if [ "$i" == "--pull" ]; then
    PULL=1
    shift
  fi
done

# Check if --task-git-push is passed as an argument.
PUSH=0
for i
do
  if [ "$i" == "--push" ]; then
    # Set the PUSH flag, and remove this from the arguments list.
    PUSH=1
    shift
  fi
done

# Call task, commit files and push if flag is set.

cd $DATA_DIR
if [ "$PULL" == 1 ]; then
  git pull > /dev/null
fi

/usr/bin/task $@
git add .
git commit -m "$TASK_COMMAND" > /dev/null

if [ "$PUSH" == 1 ]; then
  git push > /dev/null
fi
exit 0
