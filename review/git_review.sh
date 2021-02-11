#!/bin/zsh

# デフォルトブランチ記載ファイル
BRANCH_INFO=".git_review"

# レビュー用ブランチ名
REVIEW_BRANCH="review"

function is_exists_branch() {
  if [ "`git branch | grep $1`" == "" ]; then
    return 99
  fi
  return 0
}

if [ $# -ne 1 ]; then
  echo "[ERROR]: A mount of parameter is worng."
  exit 99
fi
target_branch=$1

git rev-parse &>/dev/null
if [ $? -ne 0 ]; then
  echo "[ERROR]: Here is not git repository."
  exit 99
fi

if [ ! -e ${BRANCH_INFO} ]; then
  echo "[WARN ]: Default branch info is not exist."
  echo -n "Input default branch name. ex)main :"
  read default_branch
  echo ${default_branch} > ${BRANCH_INFO}
fi

default_branch=`cat ${BRANCH_INFO}`

is_exists_branch ${default_branch}
if [ $? -ne 0 ]; then
  echo "[ERROR]: ${default_branch} branch is not exists."
  exit 99
fi

git checkout ${default_branch} &>/dev/null
if [ $? -ne 0 ]; then
  echo "[ERROR]: Switching ${default_branch} branch failed."
  exit 99
fi

git fetch &>/dev/null

is_exists_branch ${REVIEW_BRANCH}
if [ $? -eq 0 ]; then
  git branch -D ${REVIEW_BRANCH} &>/dev/null
fi

git checkout -b ${REVIEW_BRANCH} origin/${target_branch}
