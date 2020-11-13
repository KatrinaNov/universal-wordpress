<?php
/**
 * The sidebar containing the main widget area
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package universal-example
 */

if ( ! is_active_sidebar( 'sidebar-post-content' ) ) {
	return;
}
?>

<aside id="third" class="sidebar-post-content">
	<?php dynamic_sidebar( 'sidebar-post-content' ); ?>
</aside><!-- #secondary -->
