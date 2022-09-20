// thumb-img
$(".thumb-img.thumb1").addClass('vienvang');
$('.thumb-img').on('click', function() {
  $('.product-image').attr('src', this.src);
  $('.thumb-img:not(:hover)').removeClass('vienvang');
  $(this).addClass('vienvang');
});

// btn spin 
$('.btn-inc').on('click', function() {
  var strval = $(this).parent().prev().val();
  var val = parseInt(strval) + 1;
  $(this).parent().prev().attr('value', val);
});

$('.btn-dec').on('click', function() {
  var strval = $(this).parent().next().val();
  var val = parseInt(strval) - 1;
  if (val < 1) {
    $(this).parent().next().attr('value', 1);
  } else {
    $(this).parent().next().attr('value', val);
  }
});

// gui danh gia 
$('.formdanhgia').hide(200);
$('.vietdanhgia').on('click', function() {
  $('.formdanhgia').toggle(200);
});

var check_click = false;
var current_click = 0;
$('.star-x').on('click', function(e) {
  check_click = true;
  current_click = parseInt(e.target.id.slice(-1));
});

// neu chua click 
$('.star-x').hover(
  function(e) {
    var id_buffer = 0;
    id = parseInt(e.target.id.slice(-1));
    if(!check_click) {
      for (let i = 1; i <= id; i++) {
        var selector = "#star" + i.toString();
        $(selector).css("color", "#f7a623");
      }
    } else {
      for (let i = 1; i <= id; i++) {
        var selector = "#star" + i.toString();
        $(selector).css("color", "#f7a623");
      }
    }
  },
  function(e) {
    if (!check_click) {
      for (let i = 1; i <= 5; i++) {
        var selector = "#star" + i.toString();
        $(selector).css("color", "#d1cccc");
      }
    } else {
      for (let i = current_click+1; i <= 5; i++) {
        var selector = "#star" + i.toString();
        $(selector).css("color", "#d1cccc");
      }
    }
  }
);