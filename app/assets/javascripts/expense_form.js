/* global $ */
$(document).on("turbolinks:load", function(){
  
  //Runs enableSelect from ajax form
  $('#new-expense').on('change', '#recurring',  function(){
    enableSelect();
  });
  
  //Runs enableSelect from old form
  $('#recurring').click(function(){
    enableSelect();
  });
  
  function enableSelect(){
    var checkBox = $('#recurring');
    var end_date = $('#end_date');
    var select = $('#frequency');
    
    // Enables or disables the element based on its' current status
    if (checkBox.is(':checked')){
      select.attr('disabled', false);
      end_date.attr('disabled', false);
    }else{
      select.attr('disabled', true);
      end_date.attr('disabled', true);
    }

  }

});