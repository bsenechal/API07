$(document).ready(function () {

    $('#dossier-form').validate({ // initialize the plugin
        rules: {
        	etatCivil: {
                required: true
            },
            coordonnees: {
                required: true
            },
            type: {
                required: true
            },
            antecedents: {
                required: true,
            },
            
            vaccinations: {
                required: true,
            },
        }
    });

});