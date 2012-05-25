$(document).ready(function(){
$('#matrix_object__type').change(changeOptions).trigger('change');
  changeOptions();
});

function changeOptions ()
{
$('#attributes').html($('#' + $('#matrix_object__type option:selected').first().text() + '-attributes').html());
}