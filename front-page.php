<?php get_header();?>

<main class="front-page-header">
  <div class="container">
    <div class="hero">
      <div class="left">
        <?php
        global $post;

        $myposts = get_posts([ 
          'numberposts' => 1,
          'category_name' => 'javascript, css, html, web-design'
        ]);
        // есть ли посты
        if( $myposts ){
          // если есть, запускаем цикл
          foreach( $myposts as $post ){
            setup_postdata( $post );
            ?>
            <!-- Вывода постов, функции цикла: the_title() и т.д. -->            
        <img src="<?php the_post_thumbnail_url() ?>" alt="" class="post-thumb">
        <?php $author_id=get_the_author_meta( 'ID' );?>
        <a href="<?php echo get_author_posts_url( $author_id );?>" class="author">
          <img src="<?php echo get_avatar_url($author_id);?>" alt="<?php the_author(); ?>" class="avatar">
          <div class="author-bio">
            <span class="author-name"><?php the_author(); ?></span>
            <span class="author-rank">Должность</span>
          </div>
        </a>
        <div class="post-text">
          <?php the_category(); ?>
          <h2 class="post-title"> <?php echo mb_strimwidth(get_the_title(), 0, 70, "..."); ?></h2>
          <a href="<?php the_permalink(); ?>" class="more">Читать далее</a>
        </div>
        <?php 
          }
        } else {
          ?> <p>Постов нет</p> <?php
        }

        wp_reset_postdata(); // Сбрасываем $post
        ?>
      </div>
      <!-- /.left -->
      <div class="right">
        <h3 class="recommend">Рекомендуем</h3>
        <ul class="posts-list">
        <?php
          global $post;

          $myposts = get_posts([ 
            'numberposts' => 5,
            'offset'      => 1,
            'category_name' => 'javascript, css, html, web-design'
          ]);
          // есть ли посты
          if( $myposts ){
            // если есть, запускаем цикл
            foreach( $myposts as $post ){
              setup_postdata( $post );
        ?>
            <!-- Вывода постов, функции цикла: the_title() и т.д. -->   
          <li class="post">
            <?php the_category(); ?>
            <a href="<?php the_permalink(); ?>" class="post-permalink">
              <h4 class="post-title"><?php echo mb_strimwidth(get_the_title(), 0, 70, "..."); ?></h4>
            </a>
          </li>
        <?php 
          }
        } else {
          ?> <p>Постов нет</p> <?php
        }
        wp_reset_postdata(); // Сбрасываем $post
        ?> 
        </ul>
      </div>
      <!-- /.right -->
    </div>
    <!-- /.hero -->   
  </div>
</main>

<div class="container">
<ul class="articles-list">
    <?php
      global $post;

      $myposts = get_posts([ 
        'numberposts' => 4,
        'category_name' => 'articles',
        'category' => -20
      ]);
      // есть ли посты
      if( $myposts ){
        // если есть, запускаем цикл
        foreach( $myposts as $post ){
          setup_postdata( $post );
    ?>
        <!-- Вывода постов, функции цикла: the_title() и т.д. -->   
      <li class="articles-item">
        <a href="<?php the_permalink(); ?>" class="articles-permalink">
          <h4 class="articles-title"><?php echo mb_strimwidth(get_the_title(), 0, 50, "..."); ?></h4>
        </a>
        <img src="<?php the_post_thumbnail_url(null, 'thumbnail') ?>" alt="<?php the_title(); ?>" class="articles-thumb" width="65" height="65">
      </li>
    <?php 
      }
    } else {
      ?> <p>Постов нет</p> <?php
    }
    wp_reset_postdata(); // Сбрасываем $post
    ?> 
  </ul>
  <!-- ./articles-list -->
  <div class="articles-grid">
    <?php		
      global $post;
// формируем запрос в базу данных
      $query = new WP_Query( [
        'posts_per_page' => 7,
        'tag' => 'popular'
      ] );

      if ( $query->have_posts() ) {
        //  создаем счетчик постов
        $cnt = 0;
        // пока посты есть, выводим их
        while ( $query->have_posts() ) {
          $query->the_post();
          // увеличиваем счетчик постов
          $cnt++;
          switch ($cnt) {
            // выводим первый пост
            case '1':
              ?>
                <div class="articles-grid-item articles-grid-item-1">
                  <a href="<?php the_permalink(); ?>" class="articles-grid-permalink">
                    <div class="articles-grid-thumb">
                      <img src="<?php echo get_the_post_thumbnail_url()?>" alt="<?php the_title(); ?>">
                    </div>
                    <span class="category-name"><?php $category = get_the_category(); echo $category[0]->name; ?></span>
                    <h4 class="articles-grid-title"><?php echo mb_strimwidth(get_the_title(), 0, 30, "..."); ?></h4>
                    <p class="articles-grid-excerpt"><?php echo mb_strimwidth(get_the_excerpt(), 0, 110, "..."); ?></p>
                    <div class="articles-grid-info">
                      <div class="author">
                      <?php $author_id=get_the_author_meta( 'ID' );?>
                        <img src="<?php echo get_avatar_url($author_id);?>" alt="<?php the_author(); ?>" class="author-avatar">
                        <span class="author-name"><strong><?php the_author(); ?></strong> : <?php the_author_meta( 'description' )?></span>
                      </div>
                      <div class="comments">
                        <img src="<?php echo get_template_directory_uri() .'/assets/images/comment.svg'?>" alt="icon: comment" class="comments-icon">
                        <span class="comments-counter"><?php comments_number( '0', '1', '%' ); ?></span>
                      </div>
                      <!-- /.comments -->
                    </div>
                  </a>
                </div>
               <?php
              break;
            // выводим второй пост
            case '2': ?>
              <div class="articles-grid-item articles-grid-item-2">
                  <img src="<?php echo get_the_post_thumbnail_url()?>" alt="<?php the_title(); ?>" class="articles-grid-thumb">
                  <a href="<?php the_permalink(); ?>" class="articles-grid-permalink">
                    <span class="tag">
                    <?php  $posttags = get_the_tags();
                      if ( $posttags ) {
                        echo $posttags[0]->name . ' ';
                      }
                    ?>
                    </span>
                    <span class="category-name"><?php $category = get_the_category(); echo $category[0]->name; ?></span>
                    <h4 class="articles-grid-title"><?php the_title(); ?></h4>
                    <div class="articles-grid-info">
                      <div class="author">
                      <?php $author_id=get_the_author_meta( 'ID' );?>
                        <img src="<?php echo get_avatar_url($author_id);?>" alt="<?php the_title(); ?>" class="avatar">
                        <div class="author-info">
                          <span class="author-name"><strong><?php the_author(); ?></strong></span>                       
                          <span class="date"><?php the_time('j F'); ?></span>
                          <div class="comments">
                            <img src="<?php echo get_template_directory_uri() .'/assets/images/comment-white.svg'?>" alt="icon: comment" class="comments-icon">
                            <span class="comments-counter"><?php comments_number( '0', '1', '%' ); ?></span>
                          </div>
                          <!-- /.comments -->
                          <div class="likes">
                            <img src="<?php echo get_template_directory_uri() .'/assets/images/heart.svg'?>" alt="icon: like" class="likes-icon">
                            <span class="likes-counter"><?php comments_number( '0', '1', '%' ); ?></span>
                          </div>
                          <!-- /.likes -->
                        </div>                        
                      </div>
                    </div>
                  </a>
                </div>
            <?php break;
            // вывод третьего поста
            case '3': ?>
              <div class="articles-grid-item articles-grid-item-3">
                  <a href="<?php the_permalink(); ?>" class="articles-grid-permalink">
                    <img src="<?php the_post_thumbnail_url(null, 'thumbnail') ?>" alt="<?php the_title(); ?>" class="articles-grid-thumb">
                    <h4 class="articles-grid-title"><?php the_title(); ?></h4>
                  </a>
                </div>
            <?php break;
            default: ?>
                <div class="articles-grid-item articles-grid-item-default">
                  <a href="<?php the_permalink(); ?>" class="articles-grid-permalink">
                    <h4 class="articles-grid-title"><?php echo mb_strimwidth(get_the_title(), 0, 40, "..."); ?></h4>
                    <p class="articles-grid-excerpt"><?php echo mb_strimwidth(get_the_excerpt(), 0, 50, "..."); ?></p>
                    <span class="articles-grid-date"><?php the_time('j F');?></span>
                  </a>
                </div>
              <?php break;
          }
          ?>   
         
          <?php 
        }
      } else {
        // Постов не найдено
      }

      wp_reset_postdata(); // Сбрасываем $post
  ?>
   <!-- подключаем сайдбар -->
   <?php get_sidebar();?>
  </div>
  <!-- /.articles-grid -->
  
</div>
<!-- /.container -->
<!-- секция со статьей с расследованиями -->
<?php		
  global $post;

  $query = new WP_Query( [
    'posts_per_page' => 1,
    'category_name'        => 'investigation',
  ] );

  if ( $query->have_posts() ) {
    while ( $query->have_posts() ) {
      $query->the_post();
      ?>
      <section class="investigation" style="background: linear-gradient(0deg, rgba(64, 48, 61, 0.35), rgba(64, 48, 61, 0.35)), url(<?php the_post_thumbnail_url(); ?>) no-repeat center/cover;">
        <div class="container">
            <h2 class="investigation-title"><?php the_title(); ?></h2>
            <a href="<?php the_permalink(); ?>" class="more">Читать далее</a>
        </div>
        <!-- /.container -->
      </section>
      <?php 
    }
  } else {
    // Постов не найдено
  }
  wp_reset_postdata(); // Сбрасываем $post
  ?>

  <div class="articles-news">
    <div class="container">
      <div class="articles-news-grid">
        <div class="articles-news-grid-list">
        <?php		
        global $post;
        // формируем запрос в базу данных
        $query = new WP_Query( [
          'posts_per_page' => 6,
          'category_name' => 'news',
          'order' => 'ASC'
        ] );

        if ( $query->have_posts() ) {        
          // пока посты есть, выводим их
          while ( $query->have_posts() ) {
            $query->the_post();         
            ?>              
              <div class="articles-news-grid-item">
                <button class="favorites"></button>
                <a href="<?php the_permalink(); ?>" class="articles-news-grid-permalink">
                  <img src="<?php echo get_the_post_thumbnail_url()?>" alt="<?php the_title(); ?>" class="articles-news-grid-thumb">
                  <div class="articles-news-grid-right">
                    <span class="category-name"><?php $category = get_the_category(); echo $category[0]->name; ?></span>
                    <div class="articles-news-grid-text">
                      <h4 class="articles-news-grid-title"><?php echo mb_strimwidth(get_the_title(), 0, 66, "..."); ?></h4>
                      <p class="articles-news-grid-excerpt"><?php echo mb_strimwidth(get_the_excerpt(), 0, 170, "..."); ?></p>
                    </div>                    
                    <div class="articles-news-grid-info">
                      <span class="date"><?php the_time('j F'); ?></span>
                      <div class="comments">
                        <img src="<?php echo get_template_directory_uri() .'/assets/images/comment.svg'?>" alt="icon: comment" class="comments-icon">
                        <span class="comments-counter"><?php comments_number( '0', '1', '%' ); ?></span>
                      </div>
                      <!-- /.comments -->
                      <div class="likes">
                        <img src="<?php echo get_template_directory_uri() .'/assets/images/heart-grey.svg'?>" alt="icon: like" class="likes-icon">
                        <span class="likes-counter"><?php comments_number( '0', '1', '%' ); ?></span>
                      </div>
                      <!-- /.likes -->
                    </div>                        
                  </div>                  
                </a>
              </div>           
          <?php 
        }
      } else {
        // Постов не найдено
      }
      wp_reset_postdata(); // Сбрасываем $post
    ?>
        </div>
   <!-- подключаем сайдбар -->
   <?php get_sidebar();?>
      </div>
      <!-- ./articles-news-grid -->
    </div>
  </div>
  <!-- ./articles-news -->

<?php
get_footer();
?>
