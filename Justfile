deploy:
	git diff-index --quiet HEAD --
	mint build
	git checkout deploy
	git add -f dist/*
	git commit -m "Deploy $(date)"
