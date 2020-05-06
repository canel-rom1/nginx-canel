prefix  ?= canelrom1
name    ?= nginx-canel
tag     ?= $(shell date +%Y%m%d.%H%M%S)

build_dir = ./src

git_repo   = github
git_branch = canel

all:

build: src/Dockerfile
	docker build -t $(prefix)/$(name):$(tag) $(build_dir)
	docker tag $(prefix)/$(name):$(tag) $(prefix)/$(name):$(shell cat .tag.txt) 
	docker tag $(prefix)/$(name):$(tag) $(prefix)/$(name):latest 

git-push:
	expr $(shell cat .tag.txt) + 1 > .tag.txt
	echo $(cat .tag.txt) >> ./src/www/index.html
	git tag -a $(shell cat .tag.txt) -m "Version $(shell cat .tag.txt)"
	git push -u $(git_repo) $(git_branch) --follow-tags
