jQuery(function($) {
	$(".deleteAction").click(function(){
		var income_category_tr = $(this).parents('tr')[0];
		if(confirm("Confirm delete")) {
		  $.ajax({
			url: '/income_categories/' + $(income_category_tr).attr('data-income_category_id'),
			type: 'POST',
			data: { _method: 'DELETE' },
			success: function() {
				$(income_category_tr).fadeOut(200);
			}
		  });
		};
	});
});