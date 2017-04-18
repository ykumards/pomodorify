# pomodify
You can use this script to run a simple pomodoro timer that plays music from Spotify while you work from the command line on Mac. 

### Prereqs
* Spotify desktop app (obviously)
* Macvim is used as the default editor, you can use anything else (I've also tested it with sublime)

### Installing
* Clone this repo
* Change the permissions for `pomodify.sh` and `spotify` using `chmod 700`
* Change the logger file path (or comment out all lines related to logging)
* Open Spotify app
* Change the Spotify playlist URI in `pomodify.sh` file. The default is a [coding playlist](https://open.spotify.com/user/125937873/playlist/5SgJR30RfzR5hO21TsQhBp) that I love.
* Run the script using `./pomodify.sh`. You could also add an alias to the `.bash_profile`.

### How it works
1. You can point the script to any Spotify playlist of your choice
2. The music plays when you work (default 25 minute work sessions)
3. The music pauses for 5 mins during the break time 
4. A logger file opens up during the break time, you can type anything you like here
5. The process repeats until you hit Ctrl + C

### Why does this logger thingy popup during breaks?
You can disable this by commenting out the appropriate lines if you'd like, but the main idea was to keep a log of the task that was done, or copying some nagging thoughts onto the dump file, or anything else you want.

### Default Editor
I've use MacVim as the deafult editor here coz vim is lightweight and is configurable (like, you can open it in such a way that the cursor is always at the end)

### Credits
- The inspiration for this was `christiangenco`'s  comment on [this](https://news.ycombinator.com/item?id=12585670) HN thread.
- The credit for spotify cli integration ENTIRELY goes to `@hnarayanan` and the other contributors of [shpotify](https://github.com/hnarayanan/shpotify).

### License
Meh.



