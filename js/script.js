document.addEventListener('DOMContentLoaded', function () {
    const baseURL ='https://yourdomain.com/';

    const videoSources = [
        { id: 'output_file1.m3u8', name: 'File 1' },
        { id: 'output_file2.m3u8', name: 'File 2' },
        { id: 'output_file3.m3u8', name: 'File 3' }
    ];

    const videoSelect = document.getElementById('videoSelect');
    const videoPlayer = document.getElementById('videoPlayer');

    videoSources.forEach(function (video) {
        const option = document.createElement('option');
        option.value = baseURL + video.id;
        option.textContent = video.name;
        videoSelect.appendChild(option);
    });

    videoSelect.addEventListener('change', function () {
        const selectedSource = videoSelect.value;
        if (selectedSource) {
            if (Hls.isSupported()) {
                const hls = new Hls();
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
