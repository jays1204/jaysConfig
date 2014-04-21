c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`
 
parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
    return 0
  fi
  echo -e $gitver
}

branch_color ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    color=""
    if git diff --quiet 2>/dev/null >&2
    then
      color="${c_green}"
    else
      color=${c_red}
    fi
  else
    return 0
  fi
  echo -ne $color
}

export PS1='\u@\h\[${c_sgr0}\]:\W\[${c_sgr0}\] (\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\])\$ '

#set GRADLE_HOME
export GRADLE_HOME=/usr/local/gradle

#set JAVA_ENV
export JAVA_HOME=/usr/local/jdk1.7.0_51

#set ANT_HOME
export ANT_HOME=/usr/share/ant

#set mysql_path
export MYSQL_PATH=/usr/local/mysql
export PATH=$PATH:$ANT_HOME/bin:$JAVA_HOME/bin:$MYSQL_PATH/bin:$GRADLE_HOME/bin

#Alias ls -alh
alias "ll=ls -alh"
alias "st=git status"

#Load Git auto completion
source ~/.git-completion.sh
source ~/.git-flow-completion.sh
