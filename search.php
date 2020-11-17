<?php get_header(); ?>

<div class="container">
  <h1 class="search-title">Результаты поиска по запросу:</h1>
  <div class="articles-news-grid search-grid">
    <div class="articles-news-grid-list">
    <?php while ( have_posts() ){ the_post(); ?>
      <div class="articles-news-grid-item">       
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
                  '<span href="%s" class="category-link category-%s">%s</span>',
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
              <span class="date">
                  <svg class="comments-icon">
                  <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#comment"></use>
                </svg> 
              <?php the_time('j F'); ?></span>
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
    <?php } ?>
    <?php if ( ! have_posts() ){ ?>
      Записей нет.
    <?php } ?>    
    </div>
    <?php 
    $args = array(
      'prev_text'          => __('
        <svg class="pagination-prev-icon">
          <use xlink:href="' .  get_template_directory_uri() .'/assets/images/sprite.svg#arrow"></use>
        </svg>  Назад'),
        'next_text'          => __('Вперед 
        <svg class="pagination-next-icon">
          <use xlink:href="' .  get_template_directory_uri() .'/assets/images/sprite.svg#arrow"></use>
        </svg>'),
    );
    the_posts_pagination($args); ?>
     <!-- подключаем сайдбар -->
   <?php get_sidebar('posts');?>
  </div>
  <!-- ./articles-news-grid -->
    </div> 
</div>
<!-- /.container -->
<?php get_footer(); ?>