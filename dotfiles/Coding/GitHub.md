### Add new Repo
```sh
git init 
git add .
git commit -m "your message"
#connecting to remote repo
git remote add origin git@github.com:Terminator5931/dotfiles.git
#push changes to remote repo
git push -u origin main 
```
```sh
# for pulling changes and putting local commits on top of remote commits
git fetch --depth=1 origin main && git rebase origin/main
```
or just use push force for overwriting the files in stash to remote repo

[[sparse checkout]]