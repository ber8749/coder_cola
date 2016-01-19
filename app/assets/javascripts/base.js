$(document).ready(function() {
    // expands specified sibling elements
    $('.expander').click(function() {
        $(this).siblings('.expanded').slideToggle();
    });
});
