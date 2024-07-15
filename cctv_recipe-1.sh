#!/bin/bash

# Check if the required arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <rtsp_url> <output_m3u8_file>"
    exit 1
fi

rtsp_url=$1
output_m3u8=$2
meta_title="CDN Life media"
meta_comment="CCTV Diskominfo Jepara - Life media"
meta_publisher="Life media"

logo_lm="/root/logolifemedia2-modified.png"
logo_jepara="/root/logojepara.png"

max_retries=5
retry_count=0

while true; do
    ffmpeg -threads 12 -thread_queue_size 1024 -rtsp_transport tcp -i "$rtsp_url" \
        -i "$logo_lm" -i "$logo_jepara" \
        -filter_complex "nullsrc=size=640x360 [base];[0:v] setpts=PTS-STARTPTS, scale=640x360 [utama]; \
        [1:v] setpts=PTS-STARTPTS, scale=110x45 [logolm]; \
        [2:v] setpts=PTS-STARTPTS, scale=35x45 [logojpr]; \
        [base][utama] overlay=shortest=1 [tmp1]; \
        [tmp1][logojpr] overlay=x=(main_w-overlay_w)-12:y=10 [tmp2]; \
        [tmp2][logolm] overlay=x=(main_w-overlay_w)-525:y=10 " \
        -c:v h264_nvenc -cq:v 29 -preset:v fast -b:v 1536K  -maxrate 2048K -bufsize 2048K \
        -metadata title="$meta_title" -metadata comment="$meta_comment" \
	-f hls -hls_time 2 -r 24 -hls_flags delete_segments  "$output_m3u8"

	# Check if ffmpeg failed
    	if [ $? -ne 0 ]; then
            echo "ffmpeg encountered an error."
	    retry_count=$((retry_count + 1))

	    if [ $retry_count -ge $max_retries ]; then
		echo "Max retries reached. Exiting."
		exit 1
	    fi
	    echo "Retrying in 1 second..."
	    sleep 1
    	else
	    retry_count=0
	fi
done
