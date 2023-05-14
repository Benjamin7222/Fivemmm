const bd = document.body,
    cur = document.getElementById("cursor");
bd.addEventListener("mousemove", function(n) {
    (cur.style.left = n.clientX + "px"), (cur.style.top = n.clientY + "px")
})

const instance = new Typewriter('#typewriter', {
    strings: ['LazyDev', 'discord.gg/aVpVepauZx', 'RôlePlay Sérieux', 'Chargement ...'],
    autoStart: true,
    loop: true,
});