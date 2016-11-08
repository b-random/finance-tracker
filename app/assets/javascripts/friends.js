var init_friend_lookup;

init_friend_lookup = function() {
    $('#friend-lookup-form').on('ajax:before', function(event, data, status){
        show_spinner();
    });
    $('#friend-lookup-form').on('ajax:after', function(event, data, status){
        hide_spinner();
    });
    //calls spinner after ajax, stops after successful ajax call.  upon error will continue spinning
    $('#friend-lookup-form').on('ajax:success', function(event, data, status){
        $('#friend-lookup').replaceWith(data);
        init_friend_lookup();
        //call init to use it again
    });
    
    $("#friend-lookup-form").on('ajax:error', function(event, xhr, status, error){
        hide_spinner()
        //kills spinner upon error
        $('#friend-lookup-results').replaceWith('');
        $('#friend-lookup-errors ').replaceWith('Person not found.');
    });
};
//js function using jq


$(document).ready(function() {
    init_friend_lookup();
});
//copy/paste stocks.js and replaced 'stock' with 'friend'