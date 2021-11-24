document.addEventListener('turbolinks:load', function () {

    var timerSelector = document.querySelector('.timer')

    if (timerSelector) {
        timer = timerSelector.dataset.timer

        function startTime() {
            timerSelector.innerHTML = 'Время на прохождение: ' + Math.round(timer) + ' минут'
            if (timer <= 0) {
                window.location.href = window.location.href + '/result'
                return
            }
            setTimeout(startTime, 60000);
            timer--
        }

        startTime();
    }
})