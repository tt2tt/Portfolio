$(document).on('turbolinks:load', function(){
  // change_next_count
   $(function () {
     $("#comment_submit").click( function() {
       var next_count = $("#count_form").attr('value') - 0 + 1
       $("#count_form").val(`${next_count}`);
     });
   });
});

 $(document).bind('turbolinks:load ajax:complete', function() {
   // sidebar-on
   $('.fa-bars').click(function(){
     $('.small').removeClass('none');
   });

   // sidebar-off
   $(document).on('click',function(e) {
   if(!$(e.target).closest('.trigger').length) {
     $('.small').addClass('none');
   } else {

   }
});

   // scroll
   $('.inside_link').click(function() {
    var links = $('#links').offset().top;

    $('html, body').animate({scrollTop:links});

});

  // set_comment_reply_id
  $(function () {
   $(".click").click( function() {
     var position = $("#comment_form").offset().top;
     var reply_count = $(this).children('.reply').attr('id').split(' ')[0];
     $("html,body").animate({scrollTop : position});
     $("#comment_form").val(`>>${reply_count}
`);
    });
  });

  // reset_comment_reply_id
  $("#reply_form").val("");

   // set_reply_count
   $(function () {
     $(".click").click( function() {
       var reply_id = $(this).children('.reply').attr('id').split(' ')[1];
       $("#reply_form").val(`${reply_id}`);
     });
   });

   // stages
   $("div:has(.call1)").addClass("call_count1");
   $("div:has(.call2)").addClass("call_count2");
   $("div:has(.call3)").addClass("call_count3");
   $("div:has(.call4)").addClass("call_count4");
   $("div:has(.call5)").addClass("call_count5");
   $("div:has(.call6)").addClass("call_count6");

   // silder
   $('.slider').slick({
     arrows: true,
     infinite: false,
     dots: true,
   });
 });
