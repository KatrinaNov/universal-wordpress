<?php
// Добавление расширенных возможностей
if ( ! function_exists( 'universal_theme_setup' ) ) :
	function universal_theme_setup() {
		// подключение title
		add_theme_support( 'title-tag' );
		// добавление миниатюр
		add_theme_support( 'post-thumbnails', array( 'post' ) );    
		// добавление пользовательского логотипа
		add_theme_support( 'custom-logo', [
			'width'       => 163,
			'flex-height' => true,
			'header-text' => 'Universal',
			'unlink-homepage-logo' => false, // WP 5.5
		] );
		// регистрация меню
		register_nav_menus( [
			'header_menu' => 'Header menu',
			'footer_menu' => 'Footer menu'
		] );
	}
endif;
add_action( 'after_setup_theme', 'universal_theme_setup' );

/**
 * Register widget area. Подключение сайдбара
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function universal_theme_widgets_init() {
	register_sidebar(
		array(
			'name'          => esc_html__( 'Main sidebar', 'universal-theme' ),
			'id'            => 'main-sidebar',
			'description'   => esc_html__( 'Добавьте виджеты сюда', 'universal-theme' ),
			'before_widget' => '<div id="%1$s" class="widget %2$s">',
			'after_widget'  => '</div>',
			'before_title'  => '<h2 class="widget-title">',
			'after_title'   => '</h2>',
		)
	);
	register_sidebar(
		array(
			'name'          => esc_html__( 'Posts sidebar', 'universal-theme' ),
			'id'            => 'posts-sidebar',
			'description'   => esc_html__( 'Добавьте виджеты сюда', 'universal-theme' ),
			'before_widget' => '<div id="%1$s" class="widget %2$s">',
			'after_widget'  => '</div>',
			'before_title'  => '<h2 class="widget-title">',
			'after_title'   => '</h2>',
		)
	);
}
add_action( 'widgets_init', 'universal_theme_widgets_init' );

/**
 * Добавление нового виджета Downloader_Widget.
 */
class Downloader_Widget extends WP_Widget {

	// Регистрация виджета используя основной класс
	function __construct() {
		// вызов конструктора выглядит так:
		// __construct( $id_base, $name, $widget_options = array(), $control_options = array() )
		parent::__construct(
			'downloader_widget', // ID виджета, если не указать (оставить ''), то ID будет равен названию класса в нижнем регистре: downloader_widget
			'Полезные файлы',
			array( 'description' => 'Файлы для скачивания', 'classname' => 'widget-downloader' )
		);

		// скрипты/стили виджета, только если он активен
		if ( is_active_widget( false, false, $this->id_base ) || is_customize_preview() ) {
			add_action('wp_enqueue_scripts', array( $this, 'add_downloader_widget_scripts' ));
			add_action('wp_head', array( $this, 'add_downloader_widget_style' ) );
		}
	}

	/**
	 * Вывод виджета во Фронт-энде
	 *
	 * @param array $args     аргументы виджета.
	 * @param array $instance сохраненные данные из настроек
	 */
	function widget( $args, $instance ) {
		$title = apply_filters( 'widget_title', $instance['title'] );
		$description = apply_filters( 'widget_description', $instance['description'] );
		$link = apply_filters( 'widget_link', $instance['link'] );

		echo $args['before_widget'];
		echo '<svg class="widget-downloader-icon">
						<use xlink:href="'.get_template_directory_uri().'/assets/images/sprite.svg#file"></use>
					</svg>';
		if ( ! empty( $title ) ) {
			echo $args['before_title'] . $title . $args['after_title'];
		}
		if ( ! empty( $description ) ) {
			echo '<p class="description">' . $description . '</p>';
		}
		if ( ! empty( $link ) ) {
			echo '<a class="widget-link" href="' . $link . '" target="_blank">
				<svg class="widget-link-icon">
					<use xlink:href="'.get_template_directory_uri().'/assets/images/sprite.svg#download"></use>
				</svg>
				Скачать
			</a>';
		}
		echo $args['after_widget'];
	}

	/**
	 * Админ-часть виджета
	 *
	 * @param array $instance сохраненные данные из настроек
	 */
	function form( $instance ) {
		$title = @ $instance['title'] ?: 'Полезные файлы';
		$description = @ $instance['description'] ?: 'Описание';
		$link = @ $instance['link'] ?: 'http://yandex.ru';

		?>
		<p>
			<label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Title:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php echo $this->get_field_name( 'title' ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>">
		</p>
		<p>
			<label for="<?php echo $this->get_field_id( 'description' ); ?>"><?php _e( 'Описание:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'description' ); ?>" name="<?php echo $this->get_field_name( 'description' ); ?>" type="text" value="<?php echo esc_attr( $description ); ?>">
		</p>
		<p>
			<label for="<?php echo $this->get_field_id( 'link' ); ?>"><?php _e( 'Ссылка на файл:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'link' ); ?>" name="<?php echo $this->get_field_name( 'link' ); ?>" type="text" value="<?php echo esc_attr( $link ); ?>">
		</p>
		<?php 
	}

	/**
	 * Сохранение настроек виджета. Здесь данные должны быть очищены и возвращены для сохранения их в базу данных.
	 *
	 * @see WP_Widget::update()
	 *
	 * @param array $new_instance новые настройки
	 * @param array $old_instance предыдущие настройки
	 *
	 * @return array данные которые будут сохранены
	 */
	function update( $new_instance, $old_instance ) {
		$instance = array();
		$instance['title'] = ( ! empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
		$instance['description'] = ( ! empty( $new_instance['description'] ) ) ? strip_tags( $new_instance['description'] ) : '';
		$instance['link'] = ( ! empty( $new_instance['link'] ) ) ? strip_tags( $new_instance['link'] ) : '';

		return $instance;
	}

	// скрипт виджета
	function add_downloader_widget_scripts() {
		// фильтр чтобы можно было отключить скрипты
		if( ! apply_filters( 'show_downloader_widget_script', true, $this->id_base ) )
			return;

		$theme_url = get_stylesheet_directory_uri();

		wp_enqueue_script('downloader_widget_script', $theme_url .'/downloader_widget_script.js' );
	}

	// стили виджета
	function add_downloader_widget_style() {
		// фильтр чтобы можно было отключить стили
		if( ! apply_filters( 'show_downloader_widget_style', true, $this->id_base ) )
			return;
		?>
		<style type="text/css">
			.downloader_widget a{ display:inline; }
		</style>
		<?php
	}

} 
// конец класса Downloader_Widget

// регистрация Downloader_Widget в WordPress
function register_downloader_widget() {
	register_widget( 'Downloader_Widget' );
}
add_action( 'widgets_init', 'register_downloader_widget' );


/**
 * Добавление нового виджета Social_Widget.
 */
class Social_Widget extends WP_Widget {

	// Регистрация виджета используя основной класс
	function __construct() {
		// вызов конструктора выглядит так:
		// __construct( $id_base, $name, $widget_options = array(), $control_options = array() )
		parent::__construct(
			'social_widget', // ID виджета, если не указать (оставить ''), то ID будет равен названию класса в нижнем регистре: social_widget
			'Социальные сети',
			array( 'description' => 'Ссылки на социальные сети', 'classname' => 'widget-social' )
		);

		// скрипты/стили виджета, только если он активен
		if ( is_active_widget( false, false, $this->id_base ) || is_customize_preview() ) {
			add_action('wp_enqueue_scripts', array( $this, 'add_social_widget_scripts' ));
			add_action('wp_head', array( $this, 'add_social_widget_style' ) );
		}
	}

	/**
	 * Вывод виджета во Фронт-энде
	 *
	 * @param array $args     аргументы виджета.
	 * @param array $instance сохраненные данные из настроек
	 */
	function widget( $args, $instance ) {
		$title = $instance['title'];
		$link_facebook = $instance['link_facebook'];
		$link_twitter = $instance['link_twitter'];
		$link_youtube = $instance['link_youtube'];
		$link_insta = $instance['link_insta'];

		echo $args['before_widget'];
		if ( ! empty( $title ) ) {
			echo $args['before_title'] . $title . $args['after_title'];
		}	
		if ( ! empty( $link_facebook ) ) {
			echo '<a class="widget-link widget-link-facebook" href="' . $link_facebook . '" target="_blank">
				<svg class="widget-link-icon">
					<use xlink:href="'.get_template_directory_uri().'/assets/images/sprite.svg#facebook"></use>
				</svg>
			</a>';
		}
		if ( ! empty( $link_twitter ) ) {
			echo '<a class="widget-link widget-link-twitter" href="' . $link_twitter . '" target="_blank">
				<svg class="widget-link-icon">
					<use xlink:href="'.get_template_directory_uri().'/assets/images/sprite.svg#twitter"></use>
				</svg>
			</a>';
		}
		if ( ! empty( $link_youtube ) ) {
			echo '<a class="widget-link widget-link-youtube" href="' . $link_youtube . '" target="_blank">
				<svg class="widget-link-icon">
					<use xlink:href="'.get_template_directory_uri().'/assets/images/sprite.svg#youTube"></use>
				</svg>
			</a>';
		}
		if ( ! empty( $link_insta ) ) {
			echo '<a class="widget-link widget-link-insta" href="' . $link_insta . '" target="_blank">
				<svg class="widget-link-icon">
					<use xlink:href="'.get_template_directory_uri().'/assets/images/sprite.svg#instagram"></use>
				</svg>
			</a>';
		}
		echo $args['after_widget'];
	}

	/**
	 * Админ-часть виджета
	 *
	 * @param array $instance сохраненные данные из настроек
	 */
	function form( $instance ) {
		$title = @ $instance['title'] ?: 'Наши соцсети';
		$link_facebook = @ $instance['link_facebook'] ?: 'https://www.facebook.com/';
		$link_twitter = @ $instance['link_twitter'] ?: 'https://twitter.com/';
		$link_youtube = @ $instance['link_youtube'] ?: 'https://www.youtube.com/';
		$link_insta = @ $instance['link_insta'] ?: 'https://www.instagram.com/';

		?>
		<p>
			<label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Title:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php echo $this->get_field_name( 'title' ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>">
		</p>	
		<p>
			<label for="<?php echo $this->get_field_id( 'link_facebook' ); ?>"><?php _e( 'Ссылка на facebook:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'link_facebook' ); ?>" name="<?php echo $this->get_field_name( 'link_facebook' ); ?>" type="text" value="<?php echo esc_attr( $link_facebook ); ?>">
		</p>
		<p>
			<label for="<?php echo $this->get_field_id( 'link_twitter' ); ?>"><?php _e( 'Ссылка на twitter:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'link_twitter' ); ?>" name="<?php echo $this->get_field_name( 'link_twitter' ); ?>" type="text" value="<?php echo esc_attr( $link_twitter ); ?>">
		</p>
		<p>
			<label for="<?php echo $this->get_field_id( 'link_youtube' ); ?>"><?php _e( 'Ссылка на youtube:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'link_youtube' ); ?>" name="<?php echo $this->get_field_name( 'link_youtube' ); ?>" type="text" value="<?php echo esc_attr( $link_youtube ); ?>">
		</p>
		<p>
			<label for="<?php echo $this->get_field_id( 'link_insta' ); ?>"><?php _e( 'Ссылка на Instagram:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'link_insta' ); ?>" name="<?php echo $this->get_field_name( 'link_insta' ); ?>" type="text" value="<?php echo esc_attr( $link_insta ); ?>">
		</p>
		<?php 
	}

	/**
	 * Сохранение настроек виджета. Здесь данные должны быть очищены и возвращены для сохранения их в базу данных.
	 *
	 * @see WP_Widget::update()
	 *
	 * @param array $new_instance новые настройки
	 * @param array $old_instance предыдущие настройки
	 *
	 * @return array данные которые будут сохранены
	 */
	function update( $new_instance, $old_instance ) {
		$instance = array();
		$instance['title'] = ( ! empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
		$instance['link_facebook'] = ( ! empty( $new_instance['link_facebook'] ) ) ? strip_tags( $new_instance['link_facebook'] ) : '';
		$instance['link_twitter'] = ( ! empty( $new_instance['link_twitter'] ) ) ? strip_tags( $new_instance['link_twitter'] ) : '';
		$instance['link_youtube'] = ( ! empty( $new_instance['link_youtube'] ) ) ? strip_tags( $new_instance['link_youtube'] ) : '';
		$instance['link_insta'] = ( ! empty( $new_instance['link_insta'] ) ) ? strip_tags( $new_instance['link_insta'] ) : '';

		return $instance;
	}

	// скрипт виджета
	function add_social_widget_scripts() {
		// фильтр чтобы можно было отключить скрипты
		if( ! apply_filters( 'show_social_widget_script', true, $this->id_base ) )
			return;

		$theme_url = get_stylesheet_directory_uri();

		wp_enqueue_script('social_widget_script', $theme_url .'/social_widget_script.js' );
	}

	// стили виджета
	function add_social_widget_style() {
		// фильтр чтобы можно было отключить стили
		if( ! apply_filters( 'show_social_widget_style', true, $this->id_base ) )
			return;
		?>
		<style type="text/css">
			.social_widget a{ display:inline; }
		</style>
		<?php
	}

} 
// конец класса Social_Widget

// регистрация Social_Widget в WordPress
function register_social_widget() {
	register_widget( 'Social_Widget' );
}
add_action( 'widgets_init', 'register_social_widget' );


/**
 * Добавление нового виджета Recent_Posts_Widget.
 */
class Recent_Posts_Widget extends WP_Widget {

	// Регистрация виджета используя основной класс
	function __construct() {
		// вызов конструктора выглядит так:
		// __construct( $id_base, $name, $widget_options = array(), $control_options = array() )
		parent::__construct(
			'recent_posts_widget', // ID виджета, если не указать (оставить ''), то ID будет равен названию класса в нижнем регистре: recent_posts_widget
			'Недавно опубликовано',
			array( 'description' => 'Последние посты', 'classname' => 'widget-recent-posts' )
		);

		// скрипты/стили виджета, только если он активен
		if ( is_active_widget( false, false, $this->id_base ) || is_customize_preview() ) {
			add_action('wp_enqueue_scripts', array( $this, 'add_recent_posts_widget_scripts' ));
			add_action('wp_head', array( $this, 'add_recent_posts_widget_style' ) );
		}
	}

	/**
	 * Вывод виджета во Фронт-энде
	 *
	 * @param array $args     аргументы виджета.
	 * @param array $instance сохраненные данные из настроек
	 */
	function widget( $args, $instance ) {
		$title = $instance['title'];
		$count = $instance['count'];		

		echo $args['before_widget'];		
		if ( ! empty( $count ) ) {
			if ( ! empty( $title ) ) {
				echo $args['before_title'] . $title . $args['after_title'];
			}		
			global $post;
			$postslist = get_posts( array( 'posts_per_page' => $count ) );
			foreach ( $postslist as $post ){
				setup_postdata($post);
				?>
				<a href="<?php the_permalink();?>" class="recent-post-link">			
					<img class="recent-post-thumb" src="<?php 
					if( has_post_thumbnail() ) {
						the_post_thumbnail_url(null, 'thumbnail');
					}
					else {
						echo get_template_directory_uri().'/assets/images/img-default.png"';
					}?>
					" alt="<?php the_title(); ?>">
					<div class="recent-post-info">
						<h4 class="recent-post-title"><?php echo mb_strimwidth(get_the_title(), 0, 35, "..."); ?></h4>
						<span class="recent-post-time">
							<?php 
								$time_diff = human_time_diff( get_post_time('U'), current_time('timestamp') );
								echo "$time_diff назад";
							?>
						</span>
						
					</div>
				</a>
				<?php
			}
			wp_reset_postdata();	
			}	
	
		echo $args['after_widget'];
	}

	/**
	 * Админ-часть виджета
	 *
	 * @param array $instance сохраненные данные из настроек
	 */
	function form( $instance ) {
		$title = @ $instance['title'] ?: 'Недавно опубликовано';
		$count = @ $instance['count'] ?: '7';
		?>
		<p>
			<label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Title:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php echo $this->get_field_name( 'title' ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>">
		</p>	
		<p>
			<label for="<?php echo $this->get_field_id( 'count' ); ?>"><?php _e( 'Количество постов:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'count' ); ?>" name="<?php echo $this->get_field_name( 'count' ); ?>" type="text" value="<?php echo esc_attr( $count ); ?>">
		</p>	
		
		<?php 
	}
	/**
	 * Сохранение настроек виджета. Здесь данные должны быть очищены и возвращены для сохранения их в базу данных.
	 *
	 * @see WP_Widget::update()
	 *
	 * @param array $new_instance новые настройки
	 * @param array $old_instance предыдущие настройки
	 *
	 * @return array данные которые будут сохранены
	 */
	function update( $new_instance, $old_instance ) {
		$instance = array();
		$instance['title'] = ( ! empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
		$instance['count'] = ( ! empty( $new_instance['count'] ) ) ? strip_tags( $new_instance['count'] ) : '';
		

		return $instance;
	}

	// скрипт виджета
	function add_recent_posts_widget_scripts() {
		// фильтр чтобы можно было отключить скрипты
		if( ! apply_filters( 'show_recent_posts_widget_script', true, $this->id_base ) )
			return;

		$theme_url = get_stylesheet_directory_uri();

		wp_enqueue_script('recent_posts_widget_script', $theme_url .'/recent_posts_widget_script.js' );
	}

	// стили виджета
	function add_recent_posts_widget_style() {
		// фильтр чтобы можно было отключить стили
		if( ! apply_filters( 'show_recent_posts_widget_style', true, $this->id_base ) )
			return;
		?>
		<style type="text/css">
			.recent_posts_widget a{ display:inline; }
		</style>
		<?php
	}

} 
// конец класса Recent_Posts_Widget

// регистрация Recent_Posts_Widget в WordPress
function register_recent_posts_widget() {
	register_widget( 'Recent_Posts_Widget' );
}
add_action( 'widgets_init', 'register_recent_posts_widget' );



// правильный способ подключить стили и скрипты
	add_action( 'wp_enqueue_scripts', 'enqueue_universal_style' );
	function enqueue_universal_style() {
		wp_enqueue_style( 'style', get_stylesheet_uri() );
		wp_enqueue_style( 'Roboto-Slab', '//fonts.googleapis.com/css2?family=Roboto+Slab:wght@700&display=swap');
		wp_enqueue_style( 'swiper-slider-style', get_template_directory_uri().'/assets/css/swiper-bundle.min.css', time());
		wp_enqueue_style( 'universal-theme-style', get_template_directory_uri().'/assets/css/universal-theme.css', 'style', time() );
		wp_enqueue_script('swiper', get_template_directory_uri().'/assets/js/swiper-bundle.min.js', null , time(), true );
		wp_enqueue_script('scripts', get_template_directory_uri().'/assets/js/scripts.js', 'swiper' , time(), true );
	}

	// изменяем настройки облака тегов
	add_filter( 'widget_tag_cloud_args', 'edit_widget_tag_cloud_args');
	function edit_widget_tag_cloud_args( $args ){
		$args['unit'] = 'px';
		$args['smallest'] = '14';
		$args['largest'] = '14';
		$args['number'] = '11';

	
		return $args;
	}

# отключаем создание миниатюр файлов для указанных размеров
add_filter( 'intermediate_image_sizes', 'delete_intermediate_image_sizes' );
function delete_intermediate_image_sizes( $sizes ){
	// размеры которые нужно удалить
	return array_diff( $sizes, [
		'medium_large',
		'large',
		'1536x1536',
		'2048x2048',
	] );
}
