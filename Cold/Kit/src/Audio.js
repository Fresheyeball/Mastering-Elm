
const audioHookup = (ports) => {


    const audio = new Audio()
    audio.src = "/cold.mp3"
    
    ports.play_.subscribe(() => audio.play())
    ports.stop_.subscribe(() => audio.pause())

    setDuration = () => {
        ports.setDuration_.send(audio.duration)
        audio.removeEventListener("canplaythrough", setDuration)
    }

    audio.addEventListener("canplaythrough", setDuration)

    /*
        TODO: Hookup ended_ port. This port should
        fire when the audio object fires the "ended"
        event. audio.addEventListener("ended" ...

        TODO: Hookup seek_ port. The function should
        seek the audio by setting the `audio.currentTime`
        property on the audio object. If the seek position
        is less than 0, or greater than `audio.duration`.
        Then fire the ended port.

    */

    const clickSoft = new Audio()
    clickSoft.src = "/click-soft.mp3"
    ports.clickSoft_.subscribe(() => clickSoft.play())


    const clickHard = new Audio()
    clickHard.src = "/click-hard.mp3"
    ports.clickHard_.subscribe(() => clickHard.play())

}
