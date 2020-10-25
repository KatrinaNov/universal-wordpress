<?php
/**
 * The sidebar containing the main widget area
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package universal-example
 */

if ( ! is_active_sidebar( 'posts-sidebar' ) ) {
	return;
}
?>

<aside id="secondary" class="sidebar-front-page-second">
	<?php dynamic_sidebar( 'posts-sidebar' ); ?>
</aside><!-- #secondary -->
