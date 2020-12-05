<form class="search-form" role="search" id="searchform" action="<?php echo home_url( '/' ) ?>" >
	<input type="text" class="search-input" placeholder="<?php _e('Search', 'universal')?>" value="<?php echo get_search_query() ?>" name="s" id="s" />
	<button class="search-button" type="submit" id="searchsubmit">
		<svg class="search-button-icon">
			<use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#search"></use>
		</svg> 
	</button>
</form>