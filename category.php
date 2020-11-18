<?php get_header();?>

<div class="container">
  <h1 class="category-title"><?php single_cat_title(); ?></h1>
  <div class="post-list">
    <?php while ( have_posts() ){ the_post(); ?>
      <div class="post-card">
        <img class="post-card-thumb" src="<?php 
					if( has_post_thumbnail() ) {
						the_post_thumbnail_url(null, 'thumbnail');
					}
					else {
						echo get_template_directory_uri().'/assets/images/img-default.png"';
					}?>
					" alt="<?php the_title(); ?>">    
        <div class="post-card-text">
          <h2 class="post-card-title"><?php the_title(); ?></h2>
          <p><?php echo mb_strimwidth(get_the_excerpt(), 0, 90, "..."); ?></p>
          <div class="author">
            <?php $author_id=get_the_author_meta( 'ID' );?>
            <img src="<?php echo get_avatar_url($author_id);?>" alt="<?php the_title(); ?>" class="avatar">
            <div class="author-info">
              <span class="author-name"><strong><?php the_author(); ?></strong></span>                       
              <span class="date"><?php the_time('F j'); ?></span>
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
              <!-- ./author-info  -->
          </div>
          <!-- ./author -->
          </div>
          <!-- /.post-card-text -->
      </div>
      <!-- /.card -->
    <?php } ?>
    <?php if ( ! have_posts() ){ ?>
      Записей нет.
    <?php } ?>
  </div>
  <!-- /.posts-list -->

</div>

<?php get_footer();?>