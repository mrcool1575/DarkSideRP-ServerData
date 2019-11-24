$(function()
{
    window.addEventListener('message', function(event)
    {
        var item = event.data;
        var buf = $('#wrap');
        if (item.meta && item.meta == 'close')
        {
            document.getElementById("ptbl").innerHTML = "";
            $('#wrap').hide();
            return;
        }
		document.getElementById("ptbl").innerHTML = "<tr><td></td></tr>" +  item.text;
        $('#wrap').show();
    }, false);
});