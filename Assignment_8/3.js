let isRunning = false;
let time = 0;  // Time in milliseconds
let interval;
const timeDisplay = document.getElementById("timeDisplay");
const toggleButton = document.getElementById("toggleButton");
const resetButton = document.getElementById("resetButton");

toggleButton.addEventListener("click", toggleStopwatch);
resetButton.addEventListener("click", resetStopwatch);

function toggleStopwatch() {
    if (isRunning) {
        clearInterval(interval);
        toggleButton.textContent = "Start";
        toggleButton.classList.remove("clicked");  // Remove clicked class to reset color
    } else {
        interval = setInterval(updateTime, 1);
        toggleButton.textContent = "Stop";
        toggleButton.classList.add("clicked");  // Add clicked class for light green
    }
    isRunning = !isRunning;
}

function updateTime() {
    time++;

    const hours = Math.floor(time / 3600000);
    const minutes = Math.floor((time % 3600000) / 60000);
    const seconds = Math.floor((time % 60000) / 1000);
    const milliseconds = time % 1000;

    // Format time to display in HH:MM:SS.mm
    const timeString = `${pad(hours)}:${pad(minutes)}:${pad(seconds)}.${padMilliseconds(milliseconds)}`;

    // Update the display with a random color
    timeDisplay.textContent = timeString;
    timeDisplay.style.color = getRandomColor();
}

function resetStopwatch() {
    clearInterval(interval);
    time = 0;
    timeDisplay.textContent = "00:00:00.00";
    toggleButton.textContent = "Start";
    toggleButton.classList.remove("clicked");  // Reset button color to green
    resetButton.classList.add("clicked");  // Light red on reset
    isRunning = false;

    // Optional: After resetting, remove the clicked state from reset button after a short time
    setTimeout(() => {
        resetButton.classList.remove("clicked");
    }, 200);  // Delay before resetting to original color
}

function pad(num) {
    return num < 10 ? "0" + num : num;
}

function padMilliseconds(ms) {
    return ms < 10 ? "00" + ms : ms < 100 ? "0" + ms : ms;
}

function getRandomColor() {
    const letters = '0123456789ABCDEF';
    let color = '#';
    for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
