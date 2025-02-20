#!/bin/bash

# Log file location
LOGFILE="/var/log/reinput-cctv.log"

log() {
    local MSG=$1
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $MSG" | tee -a $LOGFILE
}

log "Script started."

#Keluar dari screen sebelumnya

log "Quitting existing screen sessions..."
screen -X -S rbra1logo quit && log  "Quiting rbra1logo screen" || log "Failed to quit rbra1logo screen"
screen -X -S rbra2logo quit && log  "Quiting rbra2logo screen" || log "Failed to quit rbra2logo screen"
screen -X -S rbra3logo quit && log  "Quiting rbra3logo screen" || log "Failed to quit rbra3logo screen"
screen -X -S rbra4logo quit && log  "Quiting rbra4logo screen" || log "Failed to quit rbra4logo screen"
screen -X -S rbra5logo quit && log  "Quiting rbra5logo screen" || log "Failed to quit rbra5logo screen"
screen -X -S masjidagunglogo quit && log  "Quiting masjidagunglogo screen" || log "Failed to quit masjidagunglogo screen"
screen -X -S simpangtamankeranglogo quit && log  "Quiting simpangtamankeranglogo screen" || log "Failed to quit simpangtamankeranglogo screen"
screen -X -S alunalun2logo quit && log  "Quiting alunalun2logo screen" || log "Failed to quit alunalun2logo screen"
screen -X -S depanmpplogo quit && log  "Quiting depanmpplogo screen" || log "Failed to quit depanmpplogo screen"
screen -X -S scjkaliwisologo quit && log  "Quiting scjkaliwisologo screen" || log "Failed to quit scjkaliwisologo screen"
screen -X -S kamaljunaidilogo quit && log  "Quiting kamaljunaidilogo screen" || log "Failed to quit kamaljunaidilogo screen"
screen -X -S jlkartinilogo quit && log  "Quiting jlkartinilogo screen" || log "Failed to quit jlkartinilogo screen"
screen -X -S jlpemudalogo quit && log  "Quiting jlpemudalogo screen" || log "Failed to quit jlpemudalogo screen"
screen -X -S jlhoscokrologo quit && log  "Quiting jlhoscokrologo screen" || log "Failed to quit jlhoscokrologo screen"
screen -X -S simpangdprdlogo quit && log  "Quiting simpangdprdlogo screen" || log "Failed to quit simpangdprdlogo screen"
screen -X -S tugupkklogo quit && log  "Quiting tugupkklogo screen" || log "Failed to quit tugupkklogo screen"

#Memulai screen baru
log "Starting new screen sessions..."
screen -S rbra1logo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/102 /var/www/html/live/rbra1logo.m3u8 && log  "Starting rbra1logo screen" || log "Failed to start rbra1logo screen"
screen -S rbra2logo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/202 /var/www/html/live/rbra2logo.m3u8 && log  "Starting rbra2logo screen" || log "Failed to start rbra2logo screen"
screen -S rbra3logo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/302 /var/www/html/live/rbra3logo.m3u8 && log  "Starting rbra3logo screen" || log "Failed to start rbra3logo screen"
screen -S rbra4logo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/502 /var/www/html/live/rbra4logo.m3u8 && log  "Starting rbra4logo screen" || log "Failed to start rbra4logo screen"
screen -S rbra5logo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/602 /var/www/html/live/rbra5logo.m3u8 && log  "Starting rbra5logo screen" || log "Failed to start rbra5logo screen"
screen -S masjidagunglogo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/402 /var/www/html/live/masjidagunglogo.m3u8 && log  "Starting masjidagunglogo screen" || log "Failed to start masjidagunglogo screen"
screen -S simpangtamankeranglogo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/702 /var/www/html/live/simpangtamankeranglogo.m3u8 && log  "Starting simpangtamankeranglogo screen" || log "Failed to start simpangtamankeranglogo screen"
screen -S alunalun2logo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/802 /var/www/html/live/alunalun2logo.m3u8 && log  "Starting alunalun2logo screen" || log "Failed to start alunalun2logo screen"
screen -S depanmpplogo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/902 /var/www/html/live/depanmpplogo.m3u8 && log  "Starting depanmpplogo screen" || log "Failed to start depanmpplogo screen"
screen -S scjkaliwisologo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/1002 /var/www/html/live/scjkaliwisologo.m3u8 && log  "Starting scjkaliwisologo screen" || log "Failed to start scjkaliwisologo screen"
screen -S kamaljunaidilogo -dm /root/cctv_recipe-1.sh  rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/1102 /var/www/html/live/kamaljunaidilogo.m3u8 && log  "Starting kamaljunaidilogo screen" || log "Failed to start kamaljunaidilogo screen"
screen -S jlkartinilogo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/1202 /var/www/html/live/jlkartinilogo.m3u8 && log  "Starting jlkartinilogo screen" || log "Failed to start jlkartinilogo screen"
screen -S jlpemudalogo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/1302 /var/www/html/live/jlpemudalogo.m3u8 && log  "Starting jlpemudalogo screen" || log "Failed to start jlpemudalogo screen"
screen -S jlhoscokrologo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/1402 /var/www/html/live/jlhoscokrologo.m3u8 && log  "Starting jlhoscokrologo screen" || log "Failed to start jlhoscokrologo screen"
screen -S simpangdprdlogo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/1502 /var/www/html/live/simpangdprdlogo.m3u8 && log  "Starting simpangdprdlogo screen" || log "Failed to start simpangdprdlogo screen"
screen -S tugupkklogo -dm /root/cctv_recipe-1.sh rtsp://stream:s0t02024@103.167.114.97:8555/Streaming/Channels/1602 /var/www/html/live/tugupkklogo.m3u8 && log  "Starting tugupkklogo screen" || log "Failed to start tugupkklogo screen"

log "Script finished"
