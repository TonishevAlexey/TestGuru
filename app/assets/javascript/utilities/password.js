document.addEventListener('turbolinks:load', function () {
    const buttonElement = document.getElementById('user_password_confirmation');
    const confirm = document.getElementById('confirmation');
    buttonElement.addEventListener('input', function (event) {
        var password = document.getElementById('user_password').value;
        var confirm_password = document.getElementById('user_password_confirmation').value;
        if (confirm_password !== '') {
             confirm.lastChild.nodeValue = '⛔'
        }
        if (password === confirm_password) {
             confirm.lastChild.nodeValue = '✅';
        }
        if (confirm_password === '') {
             confirm.lastChild.nodeValue = '';
        }

    });
})

