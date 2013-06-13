$(function() {
	$(".navbar").next().hide();
	$(".navbar").toggle(function() {
		$(this).next().show();
	}, function() {
		$(this).next().hide();
	});

	$(".request-method").each(function(i) {
		if ($(this).text() == "[POST]") {
			$(this).parent().parent().addClass("post");
            $(this).addClass("btn-primary");
		}
		if ($(this).text() == "[DELETE]") {
			$(this).parent().parent().addClass("delete");
            $(this).addClass("btn-danger");
		}
		if ($(this).text() == "[PUT]") {
			$(this).parent().parent().addClass("put");
            $(this).addClass("btn-warning");
		}
		if ($(this).text() == "[GET]") {
			$(this).parent().parent().addClass("get");
            $(this).addClass("btn-success");
		}
	});

    $(".request-method").click(function(){
        var method = $(this).text();
        $(".request-method").each(function(){
            if ($(this).text() == method) {
                $(this).parent().parent().show("slow");
            } else {
                $(this).parent().parent().hide();
            }
        });
    });
	
	$("#search").keyup(function(){
		var searchText = $(this).val();
		if($.trim(searchText) == ""){
			$(".doc").show("slow");
			return;
		}
		$(".doc").each(function(){
			if( $(this).find(".path").text().indexOf(searchText) > 0
						||$(this).find(".description").text().indexOf(searchText) > 0){
				$(this).show("slow");
			} else {
				$(this).hide();
			}
		});
	});


    $(".path").each(function(){
        var $path = $(this);
        var ss = $path.text().replace(/\[|\]|\s+/g, '').split('/');
        $path.data('path', ss);
        var pathHtml = "";
        $.each(ss,function(){
            if(this!='')
                pathHtml += "/<a href='#' class='key'>" + this + "</a>";
        });
        $path.html(pathHtml);
    });

    $(".key").click(function(){
        var key = $(this).text();
        $(".path").each(function(){
            var path = $(this);
            var find = false;
            $.each($(this).data("path"), function(){
                if (this == key) {
                    find = true;
                    return false;
                }
            });
            if (!find) {
                path.parent().parent().hide();
            } else {
                path.parent().parent().show("slow");
            }

        });
    });

    $(".description").toggle(function(){
        $(this).next().show();
    }, function(){
        $(this).next().hide();
    });

    if (window.location.toString().indexOf('#') > 0) {
	    var navbar = $("a[name='" + window.location.toString().split('#')[1] + "']").parent().parent();
	    navbar.click();
	    $("body").animate({scrollTop:navbar.offset().top-55}, 500);
	}
});
