# Switch to SSH

function push {
  git add --all && git commit -m "$1" && git push origin master
}

function gitsw {
  # $1 is the username of the repo
  git remote rm origin
  git remote rm upstream
	CWD=${PWD##*/}
	if [[ "$CWD" =~ ^\. ]]; then
		GWD="${CWD#.}"
	  if [[ -n "$1" ]]
	    then
	      git remote add origin git@github.com:$1/$GWD.git
	      git remote add upstream git@github.com:$1/$GWD.git
	    else
	      git remote add origin git@github.com:fusion809/$GWD.git
	      git remote add upstream git@github.com:fusion809/$GWD.git
	  fi
	else
		if [[ -n "$1" ]]
			then
				git remote add origin git@github.com:$1/$CWD.git
				git remote add upstream git@github.com:$1/$CWD.git
			else
				git remote add origin git@github.com:fusion809/$CWD.git
				git remote add upstream git@github.com:fusion809/$CWD.git
		fi
	fi
}

alias SSH=gitsw
alias gitssh=gitsw
alias gits=gitsw

## Update local arch-scripts repo
function cps {
  sudo chmod +x -R {$HOME,/root}/Shell/
  rm -rf $GS/Shell && mkdir $GS/Shell
  sudo rm -rf $GS/root/Shell
  cp -a $HOME/Shell/* $GS/Shell
  cp -a $HOME/{.bashrc,.zshrc} $GS/
  sudo cp -a /root/{Shell,.bashrc,.zshrc} $GS/root/
}

function cdas {
  cd $GS
}

## Update sabayon-scripts GitHub repo
function shup {
  cps && cdas && push "$1" && cd - && szsh
}

function gitc {
  for i in "$@"
  do

    if ! [[ -d $GHUBM ]]; then
      mkdir -p $GHUBM
    fi

    if [[ $i == 'atom' ]]; then

      if ! [[ -d $HOME/.atom ]]; then
        mkdir $HOME/.atom
      fi

      cd $HOME/.atom
      gitsw
      git pull origin master
      cd -

    elif ! [[ -d $GHUBM/$i ]]; then

      git clone https://github.com/fusion809/$i.git $GHUBM/$i

    fi

    pushd $GHUBM/$i
      gitsw
    popd
    
  done
}

function gitco {
        git clone https://github.com/$1/$2 $GHUBO/$2
}

#############################################################
# The following script was taken from
# http://stackoverflow.com/a/18915067/1876983
#############################################################
# Sign in with SSH at startup
# Makes contributing to GitHub projects a lot simpler.
if [[ -a $HOME/.ssh/environment ]]
then
  SSH_ENV=$HOME/.ssh/environment
elif [[ $USER == fusion809 ]]
then
  ssh-keygen -t rsa -b 4096 -C "brentonhorne77@gmail.com"
  SSH_ENV=$HOME/.ssh/environment
  git config --global user.name "fusion809"
  git config --global user.email "brentonhorne77@gmail.com"
fi

# start the ssh-agent
# Remember, for this to work you need your SSH keys setup
# https://help.github.com/articles/generating-ssh-keys/
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | /bin/sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [[ -f "${SSH_ENV}" ]]; then
     . "${SSH_ENV}" > /dev/null
     /bin/ps -ef | /bin/grep ${SSH_AGENT_PID} | /bin/grep ssh-agent > /dev/null || {
      start_agent;
    }
else
    start_agent;
fi
#############################################################
