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
        <h2 class="contacts-title">Через форму обратной связи</h2>      
         <?php echo do_shortcode('[contact-form-7 id="201" title="Контактная форма"]')?>
      </div>
      <!-- ./left -->
      <div class="right">        
        <!-- <form action="#" method="POST" class="contacts-form wpcf7-form">
          <input name="contact_name" type="text" class="input contacts-input" placeholder="Ваше имя">
          <input name="contact_email" type="email" class="input contacts-input" placeholder="Ваш Email">
          <textarea name="contact_comment" id="" class="textarea contacts-textarea" placeholder="Ваш вопрос"></textarea>
          <button type="submit" class="button more">Отправить</button>
        </form> -->
        <h2 class="contacts-title">Или по этим контактам</h2>
        <!-- проверяем есть ли произвольное поле email -->
         <?php 
          $email = get_field('email');
          if ($email) {
            echo '<a href="mailto:' . $email . '">' . $email . '</a>';
          }
        ?>  
         <!-- проверяем есть ли произвольное поле адрес -->     
        <?php 
          $address = get_field('address');
          if ($address) {
            echo '<address>' . $address . '</address>';
          }
        ?>        
         <?php 
          $phone = get_field('phone');
          if ($phone) {
            echo '<a href="tel:' . $phone . '">' . $phone . '</a>';
          }
        ?> 
      </div>
    </div>
    <!-- /.contacts-wrapper -->
  </div>
  <!-- /.container -->
</section>
<!-- /.section-dark -->

<?php get_footer();?>