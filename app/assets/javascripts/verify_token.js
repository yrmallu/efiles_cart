function validateTokenForm() {
 var token = $('.js-token');
 if (token.val().length === 0) {
   $('.js-token_error').removeClass('hide');
   return false;
 } else {
   $('.js-token_error').addClass('hide');
   return true;
 }
}
