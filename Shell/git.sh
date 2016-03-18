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

function cps {
   cp -a ~/Shell/* ~/GitHub/gentoo-scripts/Shell
   if [[ -f ~/.zshrc ]]; then
   	cp -a ~/{.bashrc,.zshrc} ~/GitHub/gentoo-scripts/
   else
	cp -a ~/.bashrc ~/GitHub/gentoo-scripts/
   fi
   if [[ -f /root/.zshrc ]]; then
	sudo cp -a /root/{Shell,.bashrc,.zshrc} ~/GitHub/gentoo-scripts/root/
   else
	sudo cp -a /root/{Shell,.bashrc} ~/GitHub/gentoo-scripts/root/
   fi
}

function shup {
  cps && pushd ~/GitHub/gentoo-scripts && push "$1" && szsh && popd
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
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [[ -f "${SSH_ENV}" ]]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
      start_agent;
    }
else
    start_agent;
fi
#############################################################
