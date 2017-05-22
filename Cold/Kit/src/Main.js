const detectAudioSupport = () => {
    const a = document.createElement('audio');
    return !!(a.canPlayType && a.canPlayType('audio/mpeg;').replace(/no/, ''));
}

/*
    TODO: Use `Elm.Main.embed` to place the cold audio app into the Html.
    TODO: Use "Flags" to inform the Elm app of browser support for audio.    
*/
