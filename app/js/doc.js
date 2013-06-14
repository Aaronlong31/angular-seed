$(function() {
    $(document).on('click', ".key, .request-method", function(event){
    	event.stopPropagation();
        $("html").scope().query = $(this).text();
        $("html").scope().$apply();
    }).on('click', '.card', function(){
		if ($(this).next().is(":hidden")){
			$(this).next().slideDown('fast');
		} else {
			$(this).next().slideUp('fast');
		}
	});
});
