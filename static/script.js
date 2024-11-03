const audioElements = document.querySelectorAll("audio");
let currentlyPlaying = null

audioElements.forEach(audio => {
    audio.addEventListener("play", () => {
        if (currentlyPlaying && currentlyPlaying !== audio) {
            currentlyPlaying.pause();
        }
        // Update currentlyPlaying to the new audio
        currentlyPlaying = audio;

        audio.addEventListener("ended", () => {
            currentlyPlaying = null;
        });
    })
})

const cards = document.querySelectorAll(".song-card");
const selectedSongInput = document.getElementById("selected-song-id");
let currentCard = null;

cards.forEach(card => {
    card.addEventListener("click", () => {
        // Remove active class from previous card
        if (currentCard) {
            currentCard.classList.remove("active");
        }

        // If clicking the same card, deselect it
        if (currentCard === card) {
            currentCard = null;
            selectedSongInput.value = ""; // Clear the hidden input
        }
        // If clicking a different card, select it
        else {
            card.classList.add("active");
            currentCard = card;

            // Get the song ID from the card's data attribute
            const songId = card.getAttribute("data-song-id");
            // Store it in the hidden input
            selectedSongInput.value = songId;
        }
    });
});