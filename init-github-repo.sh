git init -b main
git add . 
git commit -m "."
gh repo create tstest2 --public
git remote add origin https://github.com/tfynes-pivotal/tstest2
git branch -M main
git push -u origin main


