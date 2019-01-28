// add product to cart using post ajax call
// Show modal popup with success & error response
$(function(){
  var showMessageModal = function (msg) {
    $('.js-modal_body').html(msg);
    $('#myModal').modal('show')
  };

  $('.js-add_to_basket').on('click', function (event) {
    event.preventDefault();
    var productId = $(this).data('productId');

    if(productId && productId != '') {
      $.ajax({
        url: '/cart/add',
        dataType: 'json',
        type: 'post',
        contentType: 'application/json',
        data: JSON.stringify( { 'product_id': productId } ),
        processData: false,
        success: function( data, textStatus, jQxhr ) {
          if(jQxhr.status == 201) {
            $('.js-cart_info').html('Basket: ' + data.cart_count +' items $' + data.total);
          }
          showMessageModal(data.message);
        },
        error: function( jqXhr, textStatus, errorThrown ) {
          showMessageModal(errorThrown);
        }
      });
    } else {
      showMessageModal('Product is invalid.');
    }
  });
});
