# - Downloads the entire playlist with a special archive file so that anytime you download the whole playlist again, it’ll check the archive and only download new ones
# - Uses aria2 for multi-threaded downloads
# - The  --download-archive option for youtube-dl specifies a path to save the list of already downloaded videos from the playlist.
# - The -o option for youtube-dl is used to specify the file path output.
# - The -f option for youtube-dl limits the video to no better than 1080p.
# - The -x option for aria2 specifies the number of allowed connections.
# - The -k option for aria2 specifies the size of chunks.
# - The -s option for aria2 is downloads a file using N connections. 
# - The -j option for aria2 specifies the number of parallel downloads.

youtube-dl "https://www.youtube.com/playlist?list=PLd8gNAxPUcJy-G84fTsMQcDsCQDi8g5B9" --download-archive "~/Desktop/youtube-dl/youtube-dl-archive.txt"  -o "~/Desktop/youtube-dl/%(title)s-%(id)s.%(ext)s" -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" --external-downloader aria2c --external-downloader-args "-x 16 -j 3 -s 16 -k 1M"