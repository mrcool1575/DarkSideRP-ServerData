$(function() {
  moment.locale('da-DK');
  function iniciarHorario() {
    document.getElementById('horario').innerHTML = "<h3>SERVER #1 | " + moment().format(`DD/MM/YYYY HH:mm:ss`) +  "</h3>";
    t = setTimeout(function() {
      iniciarHorario()
    }, 500);
  }
  iniciarHorario();
});
