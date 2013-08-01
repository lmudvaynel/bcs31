$(function () {
        $('#online_courier_date').datepicker({
            onSelect: function (text) {
                $(this).attr('value', text);
                $(this).closest(".field").find(".error_message").remove();
            }
        });
});