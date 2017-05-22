const detectAudioSupport = () => {
    const a = document.createElement('audio');
    return !!(a.canPlayType && a.canPlayType('audio/mpeg;').replace(/no/, ''));
}

const app = Elm.Main.embed(
    document.getElementById("cold"),
    { isCapable : detectAudioSupport() })

audioHookup(app.ports)
