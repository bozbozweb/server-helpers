# .bashrc

# User specific aliases and functions

# Standard entries for CentOS
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'

##
# The below section adds the path and git branch/staus to your promt. The status can be a bit slow
##

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	c_reset='\[\e[0m\]'
	c_user='\[\e[1;37m\]'
	c_path='\[\e[0;33m\]'
	c_git_cleancleann='\[\e[0;36m\]'
	c_git_dirty='\[\e[0;31m\]'
	c_git_staged='\[\e[0;32m\]'
fi


# Function to assemble the Git parsingart of our prompt.
git_prompt ()
{
	#check if it is a git repo - if not retun
	if ! git rev-parse --git-dir > /dev/null 2>&1; then
		return 0
	fi
	# get the current branch
	git_branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')

	##
	# The following bit is to do a git status and change the branch colour depending on the returned results.
	# WARNING: Can be quite slow on big repos
	# <colour>
	# #

	if current_git_status=$(git status --porcelain | grep '^ [MD]' 2> /dev/null > /dev/null); then
		PENDING="y"
	fi
	if current_git_status=$(git status --porcelain | grep '^[MADRC]' 2> /dev/null > /dev/null); then
		STAGED="y"
	fi
	if [ "$PENDING" = "y" ] && [ "$STAGED" = "y" ]; then
		 git_color="$c_git_staged"
	elif [ "$PENDING" = "y" ]; then
		 git_color="$c_git_dirty"
	elif [ "$STAGED" = "y" ]; then
		 git_color="$c_git_staged"
	else
		 git_color="$c_git_clean"
	fi

	##
	# </colour>
	# #

	echo " [$git_color$git_branch${c_reset}]"
}

# Thy holy prompt.
PROMPT_COMMAND='PS1="${c_user}\u${c_reset}@${c_user}\h${c_reset}:${c_path}\w${c_reset}$(git_prompt)\$ "'

