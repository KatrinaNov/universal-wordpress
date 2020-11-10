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
	<header class="entry-header <?php echo get_post_type(); ?>-header" style="background: linear-gradient(0deg, rgba(38, 45, 51, 0.75), rgba(38, 45, 51, 0.75)), url(<?php 
		if( has_post_thumbnail() ) {
			the_post_thumbnail_url();
		}
		else {
			echo get_template_directory_uri().'/assets/images/img-default.png"';
		}?>);">
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
						} ?>
						<a class="post-home-link" href="<?php echo get_home_url(); ?>">	
							<svg class="post-home-link-icon">
								<use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#home"></use>
							</svg> На главную</a>
						<?php
						// выводим ссылки на предыдущий и следующий пост
						the_post_navigation(
							array(
								'prev_text' => '<span class="post-nav-prev"> 
									<svg class="prev-icon">
										<use xlink:href="' .  get_template_directory_uri() .'/assets/images/sprite.svg#arrow"></use>
									</svg> ' . esc_html__( 'Назад', 'universal-theme' ) . '</span> ',
								'next_text' => '<span class="post-nav-next">' . esc_html__( 'Вперед', 'universal-theme' ) . '
								<svg class="next-icon">
									<use xlink:href="' . get_template_directory_uri() . '/assets/images/sprite.svg#arrow"></use>
								</svg> </span>',
							)
						); ?>
					</div>
					<!-- ./post-nav -->
					<div class="post-header-title">
						<?php 
							// заголовок
							if ( is_singular() ) :
								the_title( '<h1 class="post-title">', '</h1>' );
							else :
								the_title( '<h2 class="post-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></h2>' );
							endif;
						?>
						<button class="favorites">
							<svg class="favorites-icon">
								<use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#bookmark"></use>
							</svg> 
						</button>
					</div>
					<p><?php echo mb_strimwidth(get_the_excerpt(), 0, 200, "..."); ?></p>
					<!-- информация: дата, комменты, лайки -->
					<div class="post-header-info">
						<div class="date">
							<svg class="date-icon">
								<use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#clock"></use>
							</svg> 
							<?php the_time('j F, G:i'); ?>
						</div>
						<div class="likes">
							<svg class="comments-icon">
								<use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#heart"></use>
							</svg> 
							<span class="likes-counter"><?php comments_number( '0', '1', '%' ); ?></span>
						</div>
						<!-- /.likes -->
						<div class="comments">
							<svg class="comments-icon">
								<use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#comment"></use>
							</svg> 
							<span class="comments-counter"><?php comments_number( '0', '1', '%' ); ?></span>
						</div>
						<!-- /.comments -->					
					</div>
					<!-- ./post-header-info -->
					<div class="post-author">
						<div class="post-author-info">
							<?php $author_id=get_the_author_meta( 'ID' );?>
									<img src="<?php echo get_avatar_url($author_id);?>" alt="<?php the_author(); ?>" class="post-author-avatar">
									<span class="post-author-name"><?php the_author(); ?></span>
									<span class="post-author-rank">Должность</span>
									<span class="post-author-posts">
										<?php plural_form(
											count_user_posts($author_id),
											array('статья','статьи','статей')
										); ?>
									</span>
						</div>
						<!-- /.post-author-info -->
						<a href="<?php echo get_author_posts_url( $author_id );?>" class="post-author-link">Страница автора</a>
					</div>
					<!-- /.post-author -->
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


		<footer class="post-footer">
			<?php 
				$tags_list = get_the_tag_list( '', esc_html_x( '', 'list item separator', 'universal-example' ) );
					if ( $tags_list ) {
						/* translators: 1: list of tags. */
						printf( '<span class="tags-links">' . esc_html__( '%1$s', 'universal-example' ) . '</span>', $tags_list ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
					} 
				?>
		</footer><!-- .entry-footer -->
	</div>
</article><!-- #post-<?php the_ID(); ?> -->
