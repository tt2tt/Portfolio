$(document).on('turbolinks:load',function () {
  // silder
  $('.slider').slick({
    arrows: true,
    infinite: false,
    dots: true,
  });

// comment_reply
 $(function () {
   $(".reply").click( function() {
     event.preventDefault();
     var link_url = $(this).attr('href');
     var reply_count = $(this).attr('id').split(' ')[0];
     location.href = link_url;
     $("#comment_form").val(`>>${reply_count}`);
   });
 });

// change_next_count
 $(function () {
   $("#comment_submit").click( function() {
     var next_count = $("#count_form").attr('value') - 0 + 1
     console.log(next_count);
     $("#count_form").val(`${next_count}`);
   });
 });

 // set_reply_count
 $(function () {
   $(".reply").click( function() {
     var reply_id = $(this).attr('id').split(' ')[1];
     console.log(reply_id);
     $("#reply_form").val(`${reply_id}`);
   });
 });
});
