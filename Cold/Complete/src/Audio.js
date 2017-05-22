
const audioHookup = (ports) => {


    const audio = new Audio()
    audio.src = "/cold.mp3"

    ports.play_.subscribe(() => audio.play())
    ports.stop_.subscribe(() => audio.pause())
    ports.seek_.subscribe((delta) => audio.currentTime = delta)

    setDuration = () => {
        ports.setDuration_.send(audio.duration)
        audio.removeEventListener("canplaythrough", setDuration)
    }

    audio.addEventListener("canplaythrough", setDuration)


    const clickSoft = new Audio()
    clickSoft.src = "/click-soft.mp3"
    ports.clickSoft_.subscribe(() => clickSoft.play())


    const clickHard = new Audio()
    clickHard.src = "/click-hard.mp3"
    ports.clickHard_.subscribe(() => clickHard.play())

    audio.addEventListener("ended", () => ports.ended_.send(null))

}
