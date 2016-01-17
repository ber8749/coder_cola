$( document ).ready(function() {

    // expands specified sibling elements
    $('.expander').click(function() {
        console.log('expander clicked');
        $(this).siblings('.expanded').slideToggle();
    });
});
