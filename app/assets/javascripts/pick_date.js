/* global $ */
$(document).on("turbolinks:load", function(){
  var select = $('#year');
  var form = $('#year_form');
  
  //On value change in select
  select.change(function(){
    //Submit the form
    form.get(0).submit();
  });
    
});