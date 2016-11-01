var init_stock_lookup;

init_stock_lookup = function() {
    $('#stock-lookup-form').on('ajax:before', function(event, data, status){
        show_spinner();
    });
    $('#stock-lookup-form').on('ajax:after', function(event, data, status){
        hide_spinner();
    });
    //calls spinner after ajax, stops after successful ajax call.  upon error will continue spinning
    $('#stock-lookup-form').on('ajax:success', function(event, data, status){
        $('#stock-lookup').replaceWith(data);
        init_stock_lookup();
        //call init to use it again
    });
    
    $("#stock-lookup-form").on('ajax:error', function(event, xhr, status, error){
        hide_spinner()
        //kills spinner upon error
        $('#stock-lookup-results').replaceWith('');
        $('#stock-lookup-errors ').replaceWith('Stock not found.');
    });
};
//js function using jq


$(document).ready(function() {
    init_stock_lookup();
});
//call init_stock_lookup on the whole doc, when doc is loaded(ready)