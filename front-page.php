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
        <img class="post-thumb" src="<?php 
					if( has_post_thumbnail() ) {
						the_post_thumbnail_url(null, 'thumbnail');
					}
					else {
						echo get_template_directory_uri().'/assets/images/img-default.png"';
					}?>
					" alt="<?php the_title(); ?>">            
        <?php $author_id=get_the_author_meta( 'ID' );?>
        <a href="<?php echo get_author_posts_url( $author_id );?>" class="author">
          <img src="<?php echo get_avatar_url($author_id);?>" alt="<?php the_author(); ?>" class="avatar">
          <div class="author-bio">
            <span class="author-name"><?php the_author(); ?></span>
            <span class="author-rank">Должность</span>
          </div>
        </a>
        <div class="post-text">
          <?php 
            foreach(get_the_category() as $category) {
              printf(
                '<a href="%s" class="category-link %s">%s</a>',
                esc_url(get_category_link( $category )),
                esc_html($category -> slug),
                esc_html($category -> name)
              );
            }
          ?>
          <h2 class="post-title"> <?php echo mb_strimwidth(get_the_title(), 0, 70, "..."); ?></h2>
          <a href="<?php the_permalink(); ?>" class="more">Читать далее
            <svg class="more-icon">
              <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#arrow"></use>
            </svg> 
          </a>
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
            <?php 
              foreach(get_the_category() as $category) {
                printf(
                  '<a href="%s" class="category-link %s">%s</a>',
                  esc_url(get_category_link( $category )),
                  esc_html($category -> slug),
                  esc_html($category -> name)
                );
              }
            ?>
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
        <img class="articles-thumb" width="65" height="65" src="<?php 
					if( has_post_thumbnail() ) {
						the_post_thumbnail_url(null, 'thumbnail');
					}
					else {
						echo get_template_directory_uri().'/assets/images/img-default.png"';
					}?>
					" alt="<?php the_title(); ?>">         
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
                    <img src="<?php 
                      if( has_post_thumbnail() ) {
                        the_post_thumbnail_url(null, 'thumbnail');
                      }
                      else {
                        echo get_template_directory_uri().'/assets/images/img-default.png"';
                      }?>
                      " alt="<?php the_title(); ?>"> 
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
                        <svg class="comments-icon">
                          <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#comment"></use>
                        </svg>                     
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
                <img class="articles-grid-thumb" src="<?php 
                  if( has_post_thumbnail() ) {
                    the_post_thumbnail_url(null, 'thumbnail');
                  }
                  else {
                    echo get_template_directory_uri().'/assets/images/img-default.png"';
                  }?>
                  " alt="<?php the_title(); ?>"> 
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
                            <svg class="comments-icon comments-icon--white">
                              <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#comment"></use>
                            </svg> 
                           
                            <span class="comments-counter"><?php comments_number( '0', '1', '%' ); ?></span>
                          </div>
                          <!-- /.comments -->
                          <div class="likes">
                            <svg class="comments-icon comments-icon--white">
                              <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#heart"></use>
                            </svg>
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
                  <img class="articles-grid-thumb" src="<?php 
                    if( has_post_thumbnail() ) {
                      the_post_thumbnail_url(null, 'thumbnail');
                    }
                    else {
                      echo get_template_directory_uri().'/assets/images/img-default.png"';
                    }?>
                  " alt="<?php the_title(); ?>">                  
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
            <a href="<?php the_permalink(); ?>" class="more">Читать далее
              <svg class="more-icon">
                <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#arrow"></use>
              </svg> 
            </a>
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
                <button class="favorites">
                  <svg class="favorites-icon">
                    <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#bookmark"></use>
                  </svg> 
                </button>
                <a href="<?php the_permalink(); ?>" class="articles-news-grid-permalink">
                  <img class="articles-news-grid-thumb" src="<?php 
                    if( has_post_thumbnail() ) {
                      the_post_thumbnail_url(null, 'thumbnail');
                    }
                    else {
                      echo get_template_directory_uri().'/assets/images/img-default.png"';
                    }?>
                  " alt="<?php the_title(); ?>">  
                  <div class="articles-news-grid-right">
                    <?php 
                      foreach(get_the_category() as $category) {
                        printf(
                          '<span href="%s" class="category-name %s">%s</span>',
                          esc_url(get_category_link( $category )),
                          esc_html($category -> slug),
                          esc_html($category -> name)
                        );
                      }
                    ?>
                    <!-- <?php $category = get_the_category(); echo $category[0]->name; ?></span> -->
                    <div class="articles-news-grid-text">
                      <h4 class="articles-news-grid-title"><?php echo mb_strimwidth(get_the_title(), 0, 66, "..."); ?></h4>
                      <p class="articles-news-grid-excerpt"><?php echo mb_strimwidth(get_the_excerpt(), 0, 170, "..."); ?></p>
                    </div>                    
                    <div class="articles-news-grid-info">
                      <span class="date"><?php the_time('j F'); ?></span>
                      <div class="comments">
                        <svg class="comments-icon">
                          <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#comment"></use>
                        </svg> 
                        <span class="comments-counter"><?php comments_number( '0', '1', '%' ); ?></span>
                      </div>
                      <!-- /.comments -->
                      <div class="likes">
                        <svg class="comments-icon">
                          <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#heart"></use>
                        </svg> 
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
   <?php get_sidebar('posts');?>
      </div>
      <!-- ./articles-news-grid -->
    </div>
  </div>
  <!-- ./articles-news -->

  <div class="special">
      <div class="container">
        <div class="special-grid">
        <?php		
          global $post;
          // формируем запрос в базу данных
          $query = new WP_Query( [
            'posts_per_page' => 1,
            'category_name' => 'photo-report',
            'order' => 'ASC'
          ] );

          if ( $query->have_posts() ) {        
            // пока посты есть, выводим их
            while ( $query->have_posts() ) {
              $query->the_post();         
              ?>             
            <div class="photo-report">
              <!-- Slider main container -->
              <div class="swiper-container photo-report-slider">
                  <!-- Additional required wrapper -->
                  <div class="swiper-wrapper">
                      <!-- Slides -->
                      <?php  $images = get_attached_media( 'image' );
                        foreach ($images as $image) {
                          echo '<div class="swiper-slide"><img src="';
                          print_r($image -> guid);
                          echo '"></div>';
                        }
                      ?>
                  </div>
                  <!-- If we need pagination -->
                  <div class="swiper-pagination"></div>
              </div>
          <div class="photo-report-content">
            <?php 
                foreach(get_the_category() as $category) {
                  printf(
                    '<a href="%s" class="category-link">%s</a>',
                    esc_url(get_category_link( $category )),
                    esc_html($category -> name)
                  );
                }
              ?>            
                <?php $author_id=get_the_author_meta( 'ID' );?>
                <a href="<?php echo get_author_posts_url( $author_id );?>" class="author">
                  <img src="<?php echo get_avatar_url($author_id);?>" alt="<?php the_author(); ?>" class="avatar">
                  <div class="author-bio">
                    <span class="author-name"><?php the_author(); ?></span>
                    <span class="author-rank">Должность</span>
                  </div>
                </a>
                <h3 class="photo-report-title"><?php the_title(); ?></h3>
                <a href="<?php echo get_the_permalink(); ?>" class="button photo-report-button">                
                <svg class="photo-report-icon">
                  <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#images"></use>
                </svg>
                  Смотреть фото
                  <span class="photo-report-counter"><?php echo count($images);?></span>
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
          <!-- /.photo-report-content -->
            <?php		
            global $post;
            // формируем запрос в базу данных
            $query = new WP_Query( [
              'posts_per_page' => 1,
              'category_name' => 'career',
              'order' => 'ASC'
            ] );

            if ( $query->have_posts() ) {        
              // пока посты есть, выводим их
              while ( $query->have_posts() ) {
                $query->the_post();         
                ?>             
              <div class="career">            
                <span class="category-name"><?php $category = get_the_category(); echo $category[0]->name; ?></span>      
                <h3 class="career-title"><?php the_title(); ?></h3>
                <p class="career-excerpt"><?php echo mb_strimwidth(get_the_excerpt(), 0, 85, "..."); ?></p>
                <a href="<?php the_permalink(); ?>" class="more">Читать далее
                  <svg class="more-icon">
                    <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#arrow"></use>
                  </svg> 
                </a>
              </div>         
                <?php 
              }
            } else {
              // Постов не найдено
            }
            wp_reset_postdata(); // Сбрасываем $post
          ?>
          <?php		
            global $post;
            // формируем запрос в базу данных
            $query = new WP_Query( [
              'posts_per_page' => 2,
              'category_name' => 'other',
              'order' => 'ASC'
            ] );

            if ( $query->have_posts() ) {        
              // пока посты есть, выводим их
              while ( $query->have_posts() ) {
                $query->the_post();         
                ?>             
                <a href="<?php the_permalink(); ?>" class="other">            
                  <h3 class="other-title"><?php the_title(); ?></h3>
                  <p class="other-excerpt"><?php echo mb_strimwidth(get_the_excerpt(), 0, 80, "..."); ?></p> 
                  <span class="other-date"><?php the_time('j F'); ?></span>                
                </a>         
                <?php 
              }
            } else {
              // Постов не найдено
            }
            wp_reset_postdata(); // Сбрасываем $post
          ?>
        </div>
        <!-- /.special-grid -->
      </div>
  </div>
<?php
get_footer();
?>
