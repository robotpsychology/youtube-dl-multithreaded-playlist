
# Downloads the entire playlist with a special archive file so that anytime you download the whole playlist again, it’ll check the archive and only download new ones
# Also uses aria2 for multi-threaded downloads
## The -x option specified the number of allowed connections, while the -k option specified the size of chunks.
## -s split: Download a file using N connections. -j option specifies the number of parallel downloads.
# -o is used to specify the file path output
# -f format, no better than 1080p
youtube-dl "https://www.youtube.com/playlist?list=PLd8gNAxPUcJy-G84fTsMQcDsCQDi8g5B9" --download-archive "~/Desktop/youtube-dl/youtube-dl-archive.txt"  -o "~/Desktop/youtube-dl/%(title)s-%(id)s.%(ext)s" -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" --external-downloader aria2c --external-downloader-args "-x 16 -j 3 -s 16 -k 1M "