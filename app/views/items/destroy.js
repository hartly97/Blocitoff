$('#item-check' + <%= @item.id %>).remove();

$('.complete-icon').bind('ajax:success', function() {
   $(this).closest('li').fadeOut();
});
