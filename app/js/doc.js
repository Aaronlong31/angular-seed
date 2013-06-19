$(function() {
    $(document).on('click', '.card', function(){
		if ($(this).next().is(":hidden")){
			$(this).next().slideDown('fast');
		} else {
			$(this).next().slideUp('fast');
		}
	});
});
