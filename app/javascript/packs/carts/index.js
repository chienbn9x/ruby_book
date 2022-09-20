$('#step1contentid').on('show.bs.collapse', function() {
  $(this).prev().addClass('active');
});
$('#step1contentid').on('hide.bs.collapse', function() {
  $(this).prev().removeClass('active');
});
$('#step2contentid').on('show.bs.collapse', function() {
  $(this).prev().addClass('active');
});
$('#step2contentid').on('hide.bs.collapse', function() {
  $(this).prev().removeClass('active');
});
$('#step3contentid').on('show.bs.collapse', function() {
  $(this).prev().addClass('active');
});
$('#step3contentid').on('hide.bs.collapse', function() {
  $(this).prev().removeClass('active');
});

// nut btn-shopping-without-signup
$('#step1contentid').removeClass('show');
$('.btn-shoping-without-signup').on('click', function(e) {
  $('#step1contentid').removeClass('hide');
  $('#step2contentid').removeClass('show');
}); 