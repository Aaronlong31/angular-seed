$(function() {
    $(document).on('click', ".key", function(){
        //alert("1");
        //$("#search").val($(this).text());
        $("#views").scope().query = $(this).text();
    });
});
