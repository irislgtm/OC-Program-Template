# Setup

## First time

1. Push your code to GitHub.
2. Open your repo on GitHub. Go to Settings > Pages. Under "Branch" select "gh-pages" and click Save.
3. Go to Settings > Actions > General. Under "Workflow permissions" select "Read and write permissions" and Save.
4. Push another commit to main to trigger the deploy. The CI will lint your code, generate a manifest, and publish everything to GitHub Pages.

You only need to do steps 2 and 3 once. After that, every push to main auto-deploys.

## Install on your OpenComputers computer

Your computer needs an internet card (Tier 2 or Wireless) and the network must allow HTTP requests. OpenOS must be installed.

Run this command in the OpenComputers shell:

```
wget -f https://username.github.io/reponame/bin/update.lua /bin/update
```
Of course, when you use this as a template, please adjust the command to your specifications.
Then run the updater:

```
update
```

It will download all the programs and libraries from your repo onto the computer. From now on, every time you push code to GitHub the CI deploys it to Pages. Run `update` on your computer to pull the latest versions. It only downloads files that changed, so it is fast.

## Write programs

Place programs in `src/bin/` and libraries in `src/lib/`. The filesystem structure matches what OpenComputers expects. Example programs are included to get you started.

## Check your code

Run `make lint` to check for errors. The CI does this automatically on every push.

## Running the updater on boot (optional)

If you want the computer to auto-update when it starts up:

```
echo 'os.execute("/bin/update")' > /etc/rc.d/auto-update.lua
```

Or just call `update` at the top of your own programs before your main logic.

The update script checks if files have changed by comparing file sizes. If nothing changed, it does nothing. If a file changed, it downloads the new version.
