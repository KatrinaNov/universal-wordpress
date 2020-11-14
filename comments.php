<?php
/**
 * The template for displaying comments
 *
 * This is the template that displays the area of the page that contains both the current comments
 * and the comment form.
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package universal-theme
 */

/*
 * If the current post is protected by a password and
 * the visitor has not yet entered the password we will
 * return early without loading the comments.
 */

//  создаем свою функцию вывода каждого коммента

function universal_theme_comment( $comment, $args, $depth ) {
  // Проверяем в каком стиле у нас родитель (ol, ul, div)
	if ( 'div' === $args['style'] ) {
    // если style -> div
		$tag       = 'div';
		$add_below = 'comment';
	} else {
		$tag       = 'li';
		$add_below = 'div-comment';
	}
// Какие классы вешаем на каждый коммент
	$classes = ' ' . comment_class( empty( $args['has_children'] ) ? '' : 'parent', null, null, false );
	?>

	<<?php echo $tag, $classes; ?> id="comment-<?php comment_ID() ?>">
	<?php if ( 'div' != $args['style'] ) { ?>
		<div id="div-comment-<?php comment_ID() ?>" class="comment-body"><?php
	} ?>
  <div class="comment-author-avatar">
   <?php if ( $args['avatar_size'] != 0 ) {
			echo get_avatar( $comment, $args['avatar_size'] );
		}?>
  </div>
  <div class="comment-content">
      <!-- /.author-avatar -->
    <div class="comment-author vcard">
      <?php		
      printf(
        __( '<cite class="comment-author-name">%s</cite>' ),
        get_comment_author_link()
      );
      ?>
      <span class="comment-meta commentmetadata">
      <a href="<?php echo htmlspecialchars( get_comment_link( $comment->comment_ID ) ); ?>">
        <?php
        printf(
          __( '%1$s, %2$s' ),
          get_comment_date('F jS'),
          get_comment_time()
        ); ?>
      </a>

      <?php edit_comment_link( __( '(Edit)' ), '  ', '' ); ?>
      </span>
    </div>
  <!-- если коммент не прошел модерацию -->
    <?php if ( $comment->comment_approved == '0' ) { ?>
      <em class="comment-awaiting-moderation">
        <?php _e( 'Your comment is awaiting moderation.' ); ?>
      </em><br/>
    <?php } ?>	

	  <?php comment_text(); ?>

    <div class="comment-reply">
      <svg width="15" height="15" class="comments-add-icon">
        <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#comment"></use>
      </svg>
      <?php
      comment_reply_link(
        array_merge(
          $args,
          array(
            'add_below' => $add_below,
            'depth'     => $depth,
            'max_depth' => $args['max_depth']
          )
        )
      ); ?>
    </div>
  </div>
  <!-- /.comment-content -->  

	<?php if ( 'div' != $args['style'] ) { ?>
		</div>
	<?php }
}



if ( post_password_required() ) {
	return;
}
?>
<div class="container">
  <div id="comments" class="comments-area">

    <?php
    // You can start editing here -- including this comment!
    if ( have_comments() ) :
      ?>
      <div class="comments-header">
        <h2 class="comments-title">
          <?php
          echo 'Комментарии ' . 
          '<span class="comments-count">' . get_comments_number() . '</span>';
          ?>
        </h2><!-- .comments-title -->
        <a href="#commentform" class="comments-add-button">
         <svg width="18" height="18" class="comments-add-icon">
            <use xlink:href="<?php echo get_template_directory_uri()?>/assets/images/sprite.svg#pencil"></use>
          </svg>
        Добавить комментарий</a>
      </div>
      <!-- /.comments-header -->
      
      <?php the_comments_navigation(); ?>
      <!-- выводим список комментариев -->
      <ol class="comments-list">
        <?php
        // выводим отдельный комментарий
        wp_list_comments(
          array(
            'style'      => 'ol',
            'short_ping' => true,
            'avatar_size' => 75,
            'callback' => 'universal_theme_comment',
            'login_text' => 'Зарегистрируйтесь, если хотите прокомментрировать'
          )
        );
        ?>
      </ol><!-- .comment-list -->

      <?php
      the_comments_navigation();

      // If comments are closed and there are comments, let's leave a little note, shall we?
      if ( ! comments_open() ) :
        ?>
        <p class="no-comments"><?php esc_html_e( 'Comments are closed.', 'universal-theme' ); ?></p>
        <?php
      endif;

    endif; // Check for have_comments().

    comment_form(array(
      'title_reply' => '',
      'comment_field'  => '<div class="comment-form-comment">
          <label class="comment-label" for="comment">' . _x( 'Что вы думаете на этот счет? ', 'noun' ) . '</label>
         
          <div class="comment-wrapper">   
           ' . get_avatar( get_current_user_id(), 75) . ' 
           <div class="comment-textarea-wrapper">
             <textarea class="comment-textarea" id="comment" name="comment" cols="45" rows="8"  aria-required="true" required="required"></textarea>
           </div>        
          </div>
        </div>',
      'label_submit' => 'Отправить',
      'class_submit' => 'comment-submit more',
      'submit_button'  => '<button name="%1$s" type="submit" id="%2$s" class="%3$s">%4$s</button>',
      'must_log_in'  => '<p class="must-log-in">' . 
        sprintf( __( 'You must be <a href="%s">logged in</a> to post a comment.' ), wp_login_url( apply_filters( 'the_permalink', get_permalink() ) ) ) . '
        </p>',
      'logged_in_as' => '',
    ));
    ?>

  </div><!-- #comments -->
</div>

