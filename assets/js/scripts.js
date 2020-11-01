var mySwiper = new Swiper('.photo-report-slider', {
  // Optional parameters
  loop: true,
  autoplay: {
    delay: 5000
  },
  spaceBetween: 10,
  // If we need pagination
  pagination: {
    el: '.swiper-pagination',
    clickable: true
  }
});

const menuToggle = $('.header-menu-toggle');
menuToggle.on('click', function (event) {
  event.preventDefault();
  $('.header-nav').slideToggle();
});