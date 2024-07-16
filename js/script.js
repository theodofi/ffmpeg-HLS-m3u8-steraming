document.addEventListener('DOMContentLoaded', function () {
    var videoSources = [
        { url: 'https://cctv-jepara.lifemedia.id/live/rbra1logo.m3u8', name: 'RBRA 1' },
        { url: 'https://cctv-jepara.lifemedia.id/live/rbra2logo.m3u8', name: 'RBRA 2' },
        { url: 'https://cctv-jepara.lifemedia.id/live/rbra3logo.m3u8', name: 'RBRA 3' },
        { url: 'https://cctv-jepara.lifemedia.id/live/rbra4logo.m3u8', name: 'RBRA 4' },
        { url: 'https://cctv-jepara.lifemedia.id/live/rbra5logo.m3u8', name: 'RBRA 5' },
        { url: 'https://cctv-jepara.lifemedia.id/live/masjidagunglogo.m3u8', name: 'Masjid Agung' },
        { url: 'https://cctv-jepara.lifemedia.id/live/simpangtamankeranglogo.m3u8', name: 'Simpang Taman Kerang' },
        { url: 'https://cctv-jepara.lifemedia.id/live/alunalun2logo.m3u8', name: 'Alun Alun 2' },
        { url: 'https://cctv-jepara.lifemedia.id/live/depanmpplogo.m3u8', name: 'Depan MPP' },
        { url: 'https://cctv-jepara.lifemedia.id/live/scjkaliwisologo.m3u8', name: 'Simpang SCJ Kali Wiso' },
        { url: 'https://cctv-jepara.lifemedia.id/live/kamaljunaidilogo.m3u8', name: 'Stadion Kamal Junaidi' },
        { url: 'https://cctv-jepara.lifemedia.id/live/jlkartinilogo.m3u8', name: 'Jl. Kartini' },
        { url: 'https://cctv-jepara.lifemedia.id/live/jlpemudalogo.m3u8', name: 'Jl. Pemuda' },
        { url: 'https://cctv-jepara.lifemedia.id/live/jlhoscokrologo.m3u8', name: 'Jl. HOS Cokroaminoto' },
        { url: 'https://cctv-jepara.lifemedia.id/live/simpangdprdlogo.m3u8', name: 'Simpang DPRD' },
        { url: 'https://cctv-jepara.lifemedia.id/live/tugupkklogo.m3u8', name: 'Tugu PKK' },
    ];

    var videoSelect = document.getElementById('videoSelect');
    var videoPlayer = document.getElementById('videoPlayer');

    videoSources.forEach(function (video, index) {
        var option = document.createElement('option');
        option.value = video.url;
        option.textContent = video.name;
        videoSelect.appendChild(option);
    });

    videoSelect.addEventListener('change', function () {
        var selectedSource = videoSelect.value;

        if (selectedSource) {
            if (Hls.isSupported()) {
                var hls = new Hls();
                hls.loadSource(selectedSource);
                hls.attachMedia(videoPlayer);
                hls.on(Hls.Events.MANIFEST_PARSED, function () {
                    videoPlayer.play();
                });
            } else if (videoPlayer.canPlayType('application/vnd.apple.mpegurl')) {
                videoPlayer.src = selectedSource;
                videoPlayer.addEventListener('loadedmetadata', function () {
                    videoPlayer.play();
                });
            } else {
                alert("Tidak dapat melakukan stream HLS");
            }
        } else {
            videoPlayer.pause();
            videoPlayer.removeAttribute('src'); // empty source
        }
    });
    videoPlayer.addEventListener('click', function () {
        if (videoPlayer.paused) {
            videoPlayer.play();
        } else {
            videoPlayer.pause();
        }
    });
});