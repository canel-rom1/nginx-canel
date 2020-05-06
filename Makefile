git_repo   = gitlab
git_branch = canel
#git_version = $(shell cat ./.tag.txt)

all:

git-push:
	git tag -a $(git_version) -m "Version $(git_version)"
	git push -u $(git_repo) $(git_branch) --follow-tags
