<?php
/**
 * The sidebar containing the main widget area
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package universal-example
 */

if ( ! is_active_sidebar( 'main-sidebar' ) ) {
	return;
}
?>

<aside id="first" class="sidebar-front-page">
	<?php dynamic_sidebar( 'main-sidebar' ); ?>
</aside><!-- #first -->
