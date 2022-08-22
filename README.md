# youtube-dl Multithreaded Playlist Download Script
This is a script for downloading all videos in a youtube playlist over a multithreaded download coonnection.

<!-- GETTING STARTED -->
## Getting Started

You'll need the following tools installed on your machine. You can use Homebrew on a Mac.
```sh
brew install youtube-dl aria2
```

## Run script
### Copy the command from the shell script or below:
Replace the youtube playlist id in the first link with the playlist id you'd like. You can find the if after the 'list=' in the youtube link.<br />
Also replace the paths after --download-archive and -o.
#### Real example
```sh
youtube-dl "https://www.youtube.com/playlist?list=PLd8gNAxPUcJy-G84fTsMQcDsCQDi8g5B9" --download-archive "~/Desktop/youtube-dl/youtube-dl-archive.txt"  -o "~/Desktop/youtube-dl/%(title)s-%(id)s.%(ext)s" -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" --external-downloader aria2c --external-downloader-args "-x 16 -j 3 -s 16 -k 1M"
```

#### Template
```sh
youtube-dl "https://www.youtube.com/playlist?list={PLAYLIST_ID_HERE}" --download-archive "~/{ARCHIVE_FILE_PATH_HERE}/youtube-dl-archive.txt"  -o "~/{VIDEO_OUTPUT_PATH_HERE}/%(title)s-%(id)s.%(ext)s" -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" --external-downloader aria2c --external-downloader-args "-x 16 -j 3 -s 16 -k 1M"
```

- Downloads the entire playlist with a special archive file so that anytime you download the whole playlist again, it’ll check the archive and only download new ones
- Uses aria2 for multi-threaded downloads
- The ```--download-archive``` option for youtube-dl specifies a path to save the list of already downloaded videos from the playlist.
- The ```-o``` option for youtube-dl is used to specify the file path output.
- The ```-f``` option for youtube-dl limits the video to no better than 1080p.
- The ```-x``` option for aria2 specifies the number of allowed connections.
- The ```-k``` option for aria2 specifies the size of chunks.
- The ```-s``` option for aria2 is downloads a file using N connections. 
- The ```-j``` option for aria2 specifies the number of parallel downloads.
