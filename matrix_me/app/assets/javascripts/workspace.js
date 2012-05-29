$(document).ready(function(){
	$('#new_object_button').click(showObjectPopup);
	$('#show_context').click(showContext);
	$('#hide_context').click(hideContext);
	$('#full_screen_popup').click(hidePopup);
	$('#popup_container').click(function(event) { event.stopPropagation(); });
	$('#separator').mousedown(beginDrag);

	$(window).resize(doLayout);
	doLayout();
});

function doLayout ()
{
	totalHeight = $('body').height();
	totalWidth = $('body').width();
	$('#content').height(totalHeight - $('#header').height());
	$('#detail').width(totalWidth - $('#context').width() - $('#tiles').width() - $('#separator').width() - 100 );
}
function showObjectPopup ()
{

	$('#full_screen_popup').removeClass('hidden');
	$('#full_screen_popup').addClass('visible');
}
function showContext ()
{
	
	$('#context').removeClass('collapsed');
	$('#context').addClass('expanded');
	$('#show_context').addClass('hidden');
	$('#hide_context').removeClass('hidden');
	doLayout();
}
function hideContext ()
{
	
	$('#context').removeClass('expanded');
	$('#context').addClass('collapsed');
	$('#hide_context').addClass('hidden');
	$('#show_context').removeClass('hidden');
	doLayout();
}
function hidePopup ()
{
	$('#full_screen_popup').removeClass('visible');
	$('#full_screen_popup').addClass('hidden');
}
var drag_start = 0;
var initial_width = 0;
function beginDrag(event)
{
	drag_start = event.pageX;
	$('#content').mousemove(doDrag);
	$('#content').mouseup(endDrag);
	$('#content').addClass('draggable');
	
	initial_width = $('#tiles').width();
}

function endDrag(event)
{
	$('#content').unbind('mousemove');
	$('#content').removeClass('draggable');
	$('#workspace_tiles_width').val($('#tiles').width() + "px");
	$('#submit_interface').click();
}

function doDrag(event)
{
	move = drag_start - event.pageX;
	$('#tiles').width(initial_width - move);
	doLayout();
}
