function muestra_oculta(id) {
    if (document.getElementById) { //se obtiene el id
        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
        el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
    }
    
}

//--- Funcion mejorada de mostar y ocultar ---//
function muestra(id) { //Si le da al radio que si muestra 
    if (document.getElementById) { //se obtiene el id
        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
        el.style.display = (el.style.display == 'block') ? 'block' : 'block'; //damos un atributo display:none que oculta el div
    }
}


function oculta(id) {//Si le da al radio que no oculta 
    if (document.getElementById) { //se obtiene el id
        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
        el.style.display = (el.style.display == 'none') ? 'none' : 'none'; //damos un atributo display:none que oculta el div
    }
}


/*  Script que permite deplegar el menu */
/*  Si se activa uno los otros se cierran*/

$(document).ready(function () {
    $("#accordian a").click(function () {

        var link = $(this);
        var closest_ul = link.closest("ul");
        var parallel_active_links = closest_ul.find(".active");
        var closest_li = link.closest("li");
        var link_status = closest_li.hasClass("active");
        var count = 0;
        
        closest_ul.find("ul").slideUp(function () {
            if (++count === closest_ul.find("ul").length)
                parallel_active_links.removeClass("active");
            if ($('#contenido').is(':visible')) oculta("contenido");
            if ($('#tablaestudiantes').is(':visible')) oculta("tablaestudiantes");
        });

        if (!link_status)
        {
            closest_li.children("ul").slideDown();
            closest_li.addClass("active");
        }
    });
});