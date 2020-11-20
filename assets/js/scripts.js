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

// отправка форм
let contactsForm = $('.contacts-form');
contactsForm.on('submit', function (event) {
  event.preventDefault();
  var formData = new FormData(this);
  formData.append('action', 'contacts_form')
 $.ajax({
   type: "POST",
   url: adminAjax.url,
   data: formData,
   contentType: false,
   processData: false,
   success: function (response) {
     console.log(response);
   },
   error: function(data) {
    alert(data);
   }
 });
});