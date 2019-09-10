##############
# BMG
##############
alias www="cd /var/www/v3/"
alias tech="ssh ubuntu@bemyguest.tech -i ~/.ssh/bemyguest_build.pem"

##############
# General
##############
alias cd...="cd ../.."
alias cd..="cd .."
alias cd.="cd."
alias chmodd="find ./ -type d -exec chmod 755 {} +"
alias chmodf="find ./ -type f -exec chmod 644 {} +"
alias ports="sudo lsof -i -P -n | grep LISTEN"

##############
# Laravel
##############
alias a="php artisan"
alias at="php artisan tinker"
alias acc="php artisan cache:clear"

alias ccc="composer clear-cache"
alias ccd="composer dump-autoload"

##############
# Git
##############
alias gitc="git checkout"
alias gitcm="git commit -m"
alias gits="git status"
alias gitcb="git checkout -b"
alias gitb="git branch"
alias gitp="git push"
alias gitpl="git pull"

##############
# Docker
##############
function dnames-fn {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
    	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

function dip-fn {
	echo "IP addresses of all named running containers"

	for DOC in `dnames-fn`
	do
  		IP=`docker inspect $DOC | grep -m3 IPAddress | cut -d '"' -f 4 | tr -d "\n"`
  		echo $DOC : $IP
	done
}

function dex-fn {
	docker exec -it $1 /bin/bash
}

function di-fn {
	docker inspect $1
}

function dl-fn {
	docker logs -f $1
}

function drun-fn {
	docker run -it $1 /bin/bash
}

function dsr-fn {
	docker stop $1;docker rm $1
}

alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dex=dex-fn
alias di=di-fn
alias dim="docker images"
alias dip=dip-fn
alias dl=dl-fn
alias dnames=dnames-fn
alias dps="docker ps"
alias dpsa="docker ps -a"
alias drmc="docker rm $(docker ps --all -q -f status=exited)"
alias drmid="docker rmi $( docker images -q -f dangling=true)"
alias drun=drun-fn
alias dsr=dsr-fn
