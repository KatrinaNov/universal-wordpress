<?php get_header();?>

<div class="container">
<?php if ( function_exists( 'the_breadcrumbs' ) ) the_breadcrumbs(); ?>
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