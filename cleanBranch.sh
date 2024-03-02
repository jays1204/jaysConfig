#!/usr/bin/env bash

function cleanUpMergedBranch() {
  # update repository info
  git fetch -p
  git fetch --all

  CRITERIA_BRANCH="main"

  for criteria in ${CRITERIA_BRANCH[@]}
  do
    branchList=`git branch --merged=$criteria | egrep -v "(^\*|master|dev)"`

    for branchName in ${branchList[@]}
    do
      #echo ${branchName}
      deleteBranch ${branchName}
    done
  done

  # 삭제된 리모트 브랜치에 대한 로컬 트래킹 정보 삭제
  # update remote tracking info
}

# delete remote(origin) branch
function deleteBranch() {
  branchName=$1

  if [ -z ${branchName} ];
  then
    echo "Specify branch Name!"
  fi


  if [ ${branchName} == "master" ] || [ ${branchName} == "dev" ];
  then
    echo "Don't delete ${branchName}! "
    exit 0
  fi

  if [ -n ${branchName} ];
  then
    echo "delete branch:${branchName}"
    git branch -D ${branchName}
  else
    echo "Specify branch Name!"
  fi
}

cleanUpMergedBranch
