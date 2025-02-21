**Play HLS Streaming using m3u8 with RTMP file**

Prequiresite
1. Linux server
2. Nginx/Apache for web server

Description
1. Place recipe_file.sh and inputreinput.sh file and src directory in /root
2. File recipe_file.sh is used for as blueprint for each screen.
3. Run inputreinput.sh for input/reinput the ts and m3u8 files.
4. Install web server on that system
5. Then place css, js directory and index.html on web directory. Align your website file with your server that has been installed.
6. Run the web with http:/your_domain/
7. Create cronjob rule for inputreinput.sh and clear-junkfile.sh 


