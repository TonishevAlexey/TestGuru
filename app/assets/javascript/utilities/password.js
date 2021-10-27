document.addEventListener('turbolinks:load', function () {
    const buttonElement = document.querySelectorAll("#user_password_confirmation, #user_password");
    const confirm = document.getElementById('confirmation');
    buttonElement.forEach(function(item) {
        item.addEventListener('input', function (event) {
            var password = document.getElementById('user_password').value;
            var confirm_password = document.getElementById('user_password_confirmation').value;
            if (password === confirm_password && confirm_password !== '') {
                confirm.lastChild.nodeValue = '✅';
            } else if (confirm_password !== '' && password.length <= confirm_password.length) {
                confirm.lastChild.nodeValue = '⛔'
            }
        });

    });
})

