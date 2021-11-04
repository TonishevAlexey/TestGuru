document.addEventListener('turbolinks:load', function () {

    var progressBar = document.querySelector('.progress-bar')

    if (progressBar) {
        var progress = Math.floor(parseInt(progressBar.dataset.currentTest) / parseInt(progressBar.dataset.allTests) * 100)
        var percent = progress + '%'
        progressBar.innerHTML = percent
        progressBar.style.width = percent
    }
})