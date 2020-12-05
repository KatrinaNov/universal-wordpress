<?php
/**
 * Template part for displaying posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package universal-theme
 */

?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header <?php echo get_post_type(); ?>-header" style="background: linear-gradient(0deg, rgba(38, 45, 51, 0.75), rgba(38, 45, 51, 0.75));">
		<div class="container">				 
				<div class="post-header-wrapper">
					<div class="post-nav">
						<?php
						foreach(get_the_category() as $category) {
							printf(
								'<span href="%s" class="category-link %s">%s</span>',
								esc_url(get_category_link( $category )),
								esc_html($category -> slug),
								esc_html($category -> name)
							);
						} 
					 ?>
					</div>
					<!-- ./post-nav -->
					<div class="video">
						<?php 
							$video_link = get_field('video_link');						
								if (stripos($video_link, '?v=')) {
									$tmp = explode('?v=', get_field('video_link'));
								} else {
									$tmp = explode('/', get_field('video_link'));								
								} 
								if (stripos($video_link, 'youtu')) { 
								?>
									<iframe width="100%" height="500" src="https://www.youtube.com/embed/<?php echo explode('&', end($tmp))[0]; ?>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>							
									<?php } 
								if (stripos($video_link, 'vimeo')) {	
								?>
								<iframe src="https://player.vimeo.com/video/<?php echo end($tmp); ?>?title=0&byline=0&portrait=0" width="100%" height="650" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>								
								<?php }	?>
					
					</div>
					<!-- /.video -->
					<div class="lesson-header-title">
						<?php 
							// заголовок
							if ( is_singular() ) :
								the_title( '<h1 class="lesson-title">', '</h1>' );
							else :
								the_title( '<h2 class="lesson-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></h2>' );
							endif;
						?>						
					</div>				
					<!-- информация: дата, комменты, лайки -->
					<div class="post-header-info">
						<div class="date">
							<svg class="date-icon">
								<use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#clock"></use>
							</svg> 
							<?php the_time('j F, G:i'); ?>		
							<span class="lesson-taxonomies"><?php the_taxonomies( $args ); ?></span>		
						</div>								
					</div>
					<!-- ./post-header-info -->				
				</div>
				<!-- /.post-header-wrapper -->
			</div>
			<!-- ./container -->
	</header><!-- .entry-header -->	

	<div class="container">
		<div class="post-content">		
			<?php
				the_content(
					sprintf(
						wp_kses(
							/* translators: %s: Name of current post. Only visible to screen readers */
							__( 'Continue reading<span class="screen-reader-text"> "%s"</span>', 'universal-theme' ),
							array(
								'span' => array(
									'class' => array(),
								),
							)
						),
						wp_kses_post( get_the_title() )
					)
				);

				wp_link_pages(
					array(
						'before' => '<div class="page-links">' . esc_html__( 'Страницы:', 'universal-theme' ),
						'after'  => '</div>',
					)
				);
		?>
		</div><!-- .post-content -->

		</div>
		<footer class="post-footer">
			<div class="container">
				<?php 
				$tags_list = get_the_tag_list( '', esc_html_x( '', 'list item separator', 'universal-example' ) );
					if ( $tags_list ) {
						/* translators: 1: list of tags. */
						printf( '<span class="tags-links">' . esc_html__( '%1$s', 'universal-example' ) . '</span>', $tags_list ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
					} 
					// поделиться в соцсетях
					meks_ess_share();					
				?>
			</div>
			<!-- подключаем сайдбар -->
			<?php get_sidebar('post-content')?>		
		</footer><!-- .entry-footer -->

	
</article><!-- #post-<?php the_ID(); ?> -->
