document.addEventListener('turbolinks:load', function () {

    var timerSelector = document.querySelector('.timer')

    if (timerSelector) {
        timer = timerSelector.dataset.timer

        function startTime() {
            timerSelector.innerHTML = 'Время на прохождение: ' + Math.round(timer) + ' минут'
            if (timer <= 0) {
                document.querySelector('form').submit();
            }
            setTimeout(startTime, 1000);
            timer--
        }

        startTime();
    }
})