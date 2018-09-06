# do not format ./source/Calculator.mint since it will mess with button array
# Keep this file formatted manually for now
files = "source/CalculatorStore.mint source/DownloadButton.mint source/Main.mint"

format:
	mint format {{files}}

deploy:
    mint build
    git checkout deploy
    git reset --hard
    cp -rlf dist/* ./
    rm -rf dist
    git add .
    git rm -rf --cached .mint/
    git commit -m "Deploy `date "+%Y-%m-%d %H:%M:%S"`"
    git checkout master
