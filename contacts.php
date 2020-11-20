<?php
/*
Template Name: Страница Контакты
Template Post Type: page
*/

get_header();?>

<section class="section-dark">
  <div class="container">
    <?php the_title('<h1 class="page-title">', '</h1>', true);?>
    <div class="contacts-wrapper">
      <div class="left">
        <p class="page-text">Через форму обратной связи</p>
        <form action="#" method="POST" class="contacts-form">
          <input name="contact_name" type="text" class="input contacts-input" placeholder="Ваше имя">
          <input name="contact_email" type="email" class="input contacts-input" placeholder="Ваш Email">
          <textarea name="contact_comment" id="" class="textarea contacts-textarea" placeholder="Ваш вопрос"></textarea>
          <button type="submit" class="button more">Отправить</button>
        </form>
      </div>
      <!-- ./left -->
      <div class="right"></div>
    </div>
    <!-- /.contacts-wrapper -->
  </div>
  <!-- /.container -->
</section>
<!-- /.section-dark -->

<?php get_footer();?>