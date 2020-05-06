git_repo   = gitlab
git_branch = canel

all:

git-push:
	expr $(shell cat .tag.txt) + 1 > .tag.txt
	git tag -a $(shell cat .tag.txt) -m "Version $(shell cat .tag.txt)"
	git push -u $(git_repo) $(git_branch) --follow-tags
