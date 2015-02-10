(cd introduction; ./build.sh)
(cd week1; ./build.sh)
(cd week2; ./build.sh)
(cd week3; ./build.sh)
git status
git add --all .
git commit -m "Regenerate slides and notes"
git push
git co master
