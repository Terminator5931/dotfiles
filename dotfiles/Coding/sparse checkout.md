#### Step 1: Initialize Git
```sh
git init
```
#### Step 2: Add the Remote Repository
```sh
git remote add origin https://github.com/user/repo.git
```
#### Step 3: Enable Sparse Checkout
```sh
git sparse-checkout init --cone # for cone mode only
```
#### Step 4: Select Specific Files
```sh
git sparse-checkout set wezterm.lua
```
#### Step 5: Fetch & Checkout the Remote Branch
```sh
git fetch --depth=1 origin main
git checkout -b main origin/main
```
#### Step 6: Work on File & Commit Changes
```sh
echo "# Modified wezterm.lua" >> wezterm.lua
git add wezterm.lua
git commit -m "Updated wezterm.lua"
```
#### Step 7: Push Changes
```sh
git push origin main
```
Miscellaneous
- change