if (window.location.href.match(".youtube.com") !== null)
{
    light_main();
}

function light_main() {
    light_load_els();
    var loadinter = window.setInterval(function() {
        light_load_els();
    }, 10);

    var volume;
    var vchildren;
    var removeinter;
    function light_load_els() {
        volume = document.getElementsByClassName("ytp-volume-panel")[0];
        if (!volume)
            return;
        window.clearInterval(loadinter);
        vchildren = volume.children;
        light_remove_els();
        removeinter = window.setInterval(function() {
            light_remove_els();
        }, 100);
    }

    function light_remove_els() {
        if (vchildren.length < 2)
            return;
        for (var i = 1; i < vchildren.length; i++)
        {
            vchildren[i].pause();
            vchildren[i].src = "";
            vchildren[i].load();
            vchildren[i].remove();
        }
    }
}
