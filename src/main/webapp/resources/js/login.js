$(document).ready(function () {

    $('#login-form').validate({ // initialize the plugin
        rules: {
        	username: {
                required: true
            },
            password: {
                required: true,
            }
        }
    });
});