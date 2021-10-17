$(document).ready(function () {
    $('#loginFamiliar').click(function () {
        $.ajax({
            url: 'PostUsuarioServlet',
            data: {
             'loginFamiliar': document.GetElementById("id").value
            },
            success: function (responseText) {
                $('#ajaxGetUsuarioServletResponse').text(responseText);
                alert('Successfully called');
            },
            error: function (jqxhr, status, exception) {
                alert('Exception:', exception);
            }
        });
    });
});