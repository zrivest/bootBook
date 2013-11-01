// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  $('#edit-profile').on('submit', function(event){
    event.preventDefault();

    $(this).hide();

    var url = $(this).attr('href');
    console.log(url);

    $.get(url, function(form){
      $('.profile_user').replaceWith(form);
    });
  });

  $('body').on('submit', '.edit_user', function(event){
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();

    $.post(url, data, function(response){
      $('body').html(response);
    });
  });

});


$(document).ready(function() {
  $("#sign_up").submit(function(event) {

    var first_name = $("#user_first_name").val();
    var last_name = $("#user_last_name").val();
    var email = $("#user_email").val();
    var password = $("#user_password").val();
    var interest = $("#user_interest").val();

    if(first_name != "" && last_name != "" && email != "" && password != "" && interest  != "")
    {
      $(this).submit();
    }
    else {
      event.preventDefault();

    validateFirstName(first_name);
    validateLastName(last_name);
    validateEmail(email);
    validatePassword(password);
    validateInterest(interest);


    function validateFirstName(name) {
        if(name == "") {
          $("#error_name").slideDown( "slow" );
          return false;
        }
        else
          $("#error_name").fadeOut();
          return true;
    }
    function validateLastName(name) {
        if(name == "") {
          $("#error_last_name").fadeIn();
          return false;
        }
        else
          $("#error_last_name").fadeOut();
          return true;
    }
    function validateEmail(name) {
        if(name == "") {
          $("#error_email").fadeIn();
          return false
        }
        else
          $("#error_email").fadeOut();
          return true;
    }
    function validatePassword(name) {
        if(name == "") {
          $("#error_password").fadeIn();
          return false;
        }
        else
          $("#error_password").fadeOut();
          return true;
    }
    function validateInterest(name) {
        if(name == "") {
          $("#error_interest").fadeIn();
          return false;
        }
        else{
          $("#error_interest").fadeOut();
          return true;
        }
    }
  }
  });
});

