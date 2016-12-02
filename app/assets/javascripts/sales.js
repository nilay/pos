$(document).ready(function () {
    $('#sale_submit').click(function(e){
        postSale();
    });

    $('#pay-button').click(function(e){
        postPayment();
    });

    $('.dish-items').click(function(e){
        e.preventDefault();
        var el = $(this);
        $.post($('.item-list-box').attr('data-url') + '.js', {'line_item[dish_id]': el.attr('data-id')})
            .done(function (data) {
                $('#message_confirmation').show();
            });
    });


});


function postSale() {
    $('#message_confirmation').hide();
    $.post($("#sform").attr('action'), $("#sform").serialize())
        .done(function (data) {
            $('#message_confirmation').show();
        });
}

function postPayment(){
    $.post($("#pform").attr('action')+'.js', $("#pform").serialize())
        .done(function (data) {
            // close modal
            $('#payModal').modal('toggle');
        });

}