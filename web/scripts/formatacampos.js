function formatarCampos(campoTexto) {
    if (campoTexto.value.length === 6) {
        campoTexto.value = mascaraHoraMinutosSegundos(campoTexto.value);
    }     
    if (campoTexto.value.length === 8) {
        campoTexto.value = mascaraData(campoTexto.value);
    }         
    if (campoTexto.value.length === 11) {
        campoTexto.value = mascaraCelular(campoTexto.value);
    } 
    if (campoTexto.value.length === 10) {
        campoTexto.value = mascaraFoneFixo(campoTexto.value);
    } 
}

/* LIMPA FORMATAÇÃO PARA PODER DIGITAR A FORAMTAÇÃO CORRETA   */
function retirarFormatacao(campoTexto) {
    campoTexto.value = campoTexto.value.replace(/(\.|\/|\-)/g,"");
}

/* FORMATAÇÃO DE HORA (HR:MM)  */
function mascaraHoraMinutosSegundos(valor) {
        return valor.replace(/(\d{2})(\d{2})(\d{2})/g,"\$1:\$2:\$3");
}    

/* FORMATAÇÃO DE DATA (DD/MM/AAAA)    */
function mascaraData(valor) {
        return valor.replace(/(\d{2})(\d{2})(\d{4})/g,"\$1\/\$2/\$3");
}    

/* FORMATAÇÃO DE FONES CELULAR E FIXO */

function mascaraCelular(valor) {
    return valor.replace(/(\d{2})(\d{5})(\d{4})/g,"(\$1\)\$2-\$3");
}                                                        
function mascaraFoneFixo(valor) {
    return valor.replace(/(\d{2})(\d{4})(\d{4})/g,"(\$1\)\$2-\$3");
}       