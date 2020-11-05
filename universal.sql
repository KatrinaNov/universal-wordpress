-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 05 2020 г., 17:46
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `universal`
--

-- --------------------------------------------------------

--
-- Структура таблицы `universal_commentmeta`
--

CREATE TABLE `universal_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `universal_comments`
--

CREATE TABLE `universal_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_comments`
--

INSERT INTO `universal_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Автор комментария', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-10-02 20:18:40', '2020-10-02 17:18:40', 'Привет! Это комментарий.\nЧтобы начать модерировать, редактировать и удалять комментарии, перейдите на экран «Комментарии» в консоли.\nАватары авторов комментариев загружаются с сервиса <a href=\"https://ru.gravatar.com\">Gravatar</a>.', 0, 'post-trashed', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `universal_links`
--

CREATE TABLE `universal_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `universal_options`
--

CREATE TABLE `universal_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_options`
--

INSERT INTO `universal_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://universal.local', 'yes'),
(2, 'home', 'http://universal.local', 'yes'),
(3, 'blogname', 'Universal', 'yes'),
(4, 'blogdescription', 'Ещё один сайт на WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'katrina.new13@yandex.ru', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd.m.Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:96:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:22:\"cyr2lat/cyr-to-lat.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'universal-theme', 'yes'),
(41, 'stylesheet', 'universal-theme', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '48748', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '0', 'yes'),
(60, 'medium_size_h', '0', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '0', 'yes'),
(63, 'large_size_h', '0', 'yes'),
(64, 'image_default_link_type', '', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:3:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}i:3;a:4:{s:5:\"title\";s:18:\"Категории\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:3:{i:1;a:0:{}i:2;a:4:{s:5:\"title\";s:0:\"\";s:4:\"text\";s:25191:\"<!--(figmeta)eyJmaWxlS2V5IjoiSVN1SkQ4WUhIbWhCQTJTZnNXckpIMSIsInBhc3RlSUQiOi0xLCJkYXRhVHlwZSI6InNjZW5lIn0K(/figmeta)--><!--(figma)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(/figma)-->Universal — это онлайн издание, в котором мы публикуем полезные материалы о веб разработке: статьи, новости, видеоуроки, подборки, ссылки и курсы. Материалы на сайте бесплатны, но при копировании, указывайте ссылку.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '38', 'yes'),
(87, 'medium_large_size_w', '0', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1617211115', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'initial_db_version', '48748', 'yes'),
(96, 'universal_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(97, 'fresh_site', '0', 'yes'),
(98, 'WPLANG', 'ru_RU', 'yes'),
(99, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'sidebars_widgets', 'a:6:{s:19:\"wp_inactive_widgets\";a:7:{i:0;s:12:\"categories-3\";i:1;s:8:\"search-2\";i:2;s:14:\"recent-posts-2\";i:3;s:17:\"recent-comments-2\";i:4;s:10:\"archives-2\";i:5;s:12:\"categories-2\";i:6;s:6:\"meta-2\";}s:12:\"main-sidebar\";a:3:{i:0;s:19:\"downloader_widget-2\";i:1;s:11:\"tag_cloud-3\";i:2;s:15:\"social_widget-2\";}s:13:\"posts-sidebar\";a:1:{i:0;s:21:\"recent_posts_widget-2\";}s:14:\"sidebar-footer\";a:6:{i:0;s:10:\"nav_menu-2\";i:1;s:10:\"nav_menu-3\";i:2;s:10:\"nav_menu-4\";i:3;s:10:\"nav_menu-5\";i:4;s:10:\"nav_menu-6\";i:5;s:10:\"nav_menu-7\";}s:19:\"sidebar-footer-text\";a:1:{i:0;s:6:\"text-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(105, 'cron', 'a:7:{i:1604589521;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1604596721;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604596722;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1604596747;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604596748;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604769521;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_tag_cloud', 'a:2:{i:3;a:3:{s:5:\"title\";s:8:\"Теги\";s:5:\"count\";i:0;s:8:\"taxonomy\";s:8:\"post_tag\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_nav_menu', 'a:7:{i:2;a:2:{s:5:\"title\";s:14:\"Новости\";s:8:\"nav_menu\";i:34;}i:3;a:2:{s:5:\"title\";s:12:\"Статьи\";s:8:\"nav_menu\";i:35;}i:4;a:2:{s:5:\"title\";s:20:\"Видеоуроки\";s:8:\"nav_menu\";i:36;}i:5;a:2:{s:5:\"title\";s:10:\"Курсы\";s:8:\"nav_menu\";i:37;}i:6;a:2:{s:5:\"title\";s:20:\"Информация\";s:8:\"nav_menu\";i:38;}i:7;a:2:{s:5:\"title\";s:18:\"Категории\";s:8:\"nav_menu\";i:39;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'recovery_keys', 'a:0:{}', 'yes'),
(118, 'theme_mods_twentytwenty', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1601878983;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}', 'yes'),
(134, 'can_compress_scripts', '1', 'no'),
(147, 'finished_updating_comment_type', '1', 'yes'),
(156, '_transient_health-check-site-status-result', '{\"good\":11,\"recommended\":8,\"critical\":1}', 'yes'),
(186, 'current_theme', 'Universal Theme', 'yes'),
(187, 'theme_mods_universal-theme', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:8:{s:11:\"header_menu\";i:2;s:11:\"footer_menu\";i:33;s:9:\"news_menu\";i:34;s:13:\"articles_menu\";i:35;s:10:\"video_menu\";i:36;s:12:\"courses_menu\";i:37;s:9:\"info_menu\";i:38;s:13:\"category_menu\";i:39;}s:18:\"custom_css_post_id\";i:-1;s:11:\"custom_logo\";i:5;}', 'yes'),
(188, 'theme_switched', '', 'yes'),
(221, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(337, 'widget_foo_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(338, 'widget_downloader_widget', 'a:2:{i:2;a:3:{s:5:\"title\";s:73:\"Чек-лист сдачи верстки вашему заказчику\";s:11:\"description\";s:13:\"PDF, 125 Мб\";s:4:\"link\";s:18:\"https://yandex.by/\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(363, 'widget_social_widget', 'a:2:{i:2;a:5:{s:5:\"title\";s:23:\"Наши соцсети\";s:13:\"link_facebook\";s:26:\"https://www.facebook.com/1\";s:12:\"link_twitter\";s:21:\"https://twitter.com/1\";s:12:\"link_youtube\";s:25:\"https://www.youtube.com/1\";s:10:\"link_insta\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(425, 'recovery_mode_email_last_sent', '1603993148', 'yes'),
(426, 'widget_recent_posts_widget', 'a:2:{i:2;a:2:{s:5:\"title\";s:39:\"Недавно опубликовано\";s:5:\"count\";s:1:\"7\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(486, 'category_children', 'a:2:{i:18;a:1:{i:0;i:20;}i:23;a:3:{i:0;i:24;i:1;i:25;i:2;i:26;}}', 'yes'),
(497, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:23:\"katrina.new13@yandex.ru\";s:7:\"version\";s:5:\"5.5.3\";s:9:\"timestamp\";i:1604135530;}', 'no'),
(516, '_site_transient_timeout_php_check_f9714bbe413cc376a70847d9c1f86fcc', '1604775144', 'no'),
(517, '_site_transient_php_check_f9714bbe413cc376a70847d9c1f86fcc', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(546, 'recently_activated', 'a:0:{}', 'yes');
INSERT INTO `universal_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(623, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.5.3.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.5.3.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.3\";s:7:\"version\";s:5:\"5.5.3\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1604582317;s:15:\"version_checked\";s:5:\"5.5.3\";s:12:\"translations\";a:0:{}}', 'no'),
(624, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1604582321;s:7:\"checked\";a:5:{s:14:\"twentynineteen\";s:3:\"1.7\";s:15:\"twentyseventeen\";s:3:\"2.4\";s:12:\"twentytwenty\";s:3:\"1.5\";s:17:\"universal-example\";s:5:\"1.0.0\";s:15:\"universal-theme\";s:3:\"1.0\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.7.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}', 'no'),
(629, '_site_transient_timeout_theme_roots', '1604584120', 'no'),
(630, '_site_transient_theme_roots', 'a:5:{s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";s:17:\"universal-example\";s:7:\"/themes\";s:15:\"universal-theme\";s:7:\"/themes\";}', 'no'),
(631, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1604582321;s:7:\"checked\";a:3:{s:19:\"akismet/akismet.php\";s:5:\"4.1.6\";s:22:\"cyr2lat/cyr-to-lat.php\";s:5:\"4.5.0\";s:9:\"hello.php\";s:5:\"1.7.2\";}s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.3\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:22:\"cyr2lat/cyr-to-lat.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/cyr2lat\";s:4:\"slug\";s:7:\"cyr2lat\";s:6:\"plugin\";s:22:\"cyr2lat/cyr-to-lat.php\";s:11:\"new_version\";s:5:\"4.5.0\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/cyr2lat/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/cyr2lat.4.5.0.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:60:\"https://ps.w.org/cyr2lat/assets/icon-256x256.jpg?rev=2022835\";s:2:\"1x\";s:52:\"https://ps.w.org/cyr2lat/assets/icon.svg?rev=2022835\";s:3:\"svg\";s:52:\"https://ps.w.org/cyr2lat/assets/icon.svg?rev=2022835\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/cyr2lat/assets/banner-1544x500.png?rev=2022835\";s:2:\"1x\";s:62:\"https://ps.w.org/cyr2lat/assets/banner-772x250.png?rev=2022835\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `universal_postmeta`
--

CREATE TABLE `universal_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_postmeta`
--

INSERT INTO `universal_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_wp_attached_file', '2020/10/logo.png'),
(4, 5, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:163;s:6:\"height\";i:40;s:4:\"file\";s:16:\"2020/10/logo.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"logo-150x40.png\";s:5:\"width\";i:150;s:6:\"height\";i:40;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(5, 5, '_wp_attachment_image_alt', 'logo'),
(6, 6, '_wp_trash_meta_status', 'publish'),
(7, 6, '_wp_trash_meta_time', '1602089001'),
(8, 7, '_menu_item_type', 'custom'),
(9, 7, '_menu_item_menu_item_parent', '0'),
(10, 7, '_menu_item_object_id', '7'),
(11, 7, '_menu_item_object', 'custom'),
(12, 7, '_menu_item_target', ''),
(13, 7, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(14, 7, '_menu_item_xfn', ''),
(15, 7, '_menu_item_url', '#'),
(17, 8, '_menu_item_type', 'custom'),
(18, 8, '_menu_item_menu_item_parent', '0'),
(19, 8, '_menu_item_object_id', '8'),
(20, 8, '_menu_item_object', 'custom'),
(21, 8, '_menu_item_target', ''),
(22, 8, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(23, 8, '_menu_item_xfn', ''),
(24, 8, '_menu_item_url', '#'),
(26, 9, '_menu_item_type', 'custom'),
(27, 9, '_menu_item_menu_item_parent', '0'),
(28, 9, '_menu_item_object_id', '9'),
(29, 9, '_menu_item_object', 'custom'),
(30, 9, '_menu_item_target', ''),
(31, 9, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(32, 9, '_menu_item_xfn', ''),
(33, 9, '_menu_item_url', '#'),
(35, 10, '_menu_item_type', 'custom'),
(36, 10, '_menu_item_menu_item_parent', '0'),
(37, 10, '_menu_item_object_id', '10'),
(38, 10, '_menu_item_object', 'custom'),
(39, 10, '_menu_item_target', ''),
(40, 10, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(41, 10, '_menu_item_xfn', ''),
(42, 10, '_menu_item_url', '#'),
(44, 11, '_menu_item_type', 'custom'),
(45, 11, '_menu_item_menu_item_parent', '0'),
(46, 11, '_menu_item_object_id', '11'),
(47, 11, '_menu_item_object', 'custom'),
(48, 11, '_menu_item_target', ''),
(49, 11, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(50, 11, '_menu_item_xfn', ''),
(51, 11, '_menu_item_url', '#'),
(53, 12, '_menu_item_type', 'custom'),
(54, 12, '_menu_item_menu_item_parent', '0'),
(55, 12, '_menu_item_object_id', '12'),
(56, 12, '_menu_item_object', 'custom'),
(57, 12, '_menu_item_target', ''),
(58, 12, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(59, 12, '_menu_item_xfn', ''),
(60, 12, '_menu_item_url', '#'),
(62, 13, '_menu_item_type', 'custom'),
(63, 13, '_menu_item_menu_item_parent', '0'),
(64, 13, '_menu_item_object_id', '13'),
(65, 13, '_menu_item_object', 'custom'),
(66, 13, '_menu_item_target', ''),
(67, 13, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(68, 13, '_menu_item_xfn', ''),
(69, 13, '_menu_item_url', '#'),
(71, 1, '_wp_trash_meta_status', 'publish'),
(72, 1, '_wp_trash_meta_time', '1602497533'),
(73, 1, '_wp_desired_post_slug', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80'),
(74, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:\"1\";}'),
(75, 16, '_edit_lock', '1602503346:1'),
(76, 17, '_wp_attached_file', '2020/10/img.jpg'),
(77, 17, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1279;s:4:\"file\";s:15:\"2020/10/img.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:15:\"img-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:16:\"img-1024x682.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"img-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:15:\"img-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:17:\"img-1536x1023.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1023;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(99, 27, '_edit_lock', '1602503356:1'),
(103, 29, '_edit_lock', '1602503365:1'),
(107, 31, '_edit_lock', '1602842015:1'),
(111, 33, '_edit_lock', '1602841996:1'),
(114, 35, '_edit_lock', '1602841984:1'),
(117, 35, '_thumbnail_id', '17'),
(119, 38, '_wp_attached_file', '2020/10/favicon.png'),
(120, 38, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:40;s:6:\"height\";i:40;s:4:\"file\";s:19:\"2020/10/favicon.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(121, 39, '_wp_trash_meta_status', 'publish'),
(122, 39, '_wp_trash_meta_time', '1602502508'),
(123, 40, '_wp_attached_file', '2020/10/nikita-kachanovsky-OVbeSXRk_9E-unsplash.jpg'),
(124, 40, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2400;s:6:\"height\";i:1644;s:4:\"file\";s:51:\"2020/10/nikita-kachanovsky-OVbeSXRk_9E-unsplash.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:51:\"nikita-kachanovsky-OVbeSXRk_9E-unsplash-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(125, 41, '_wp_attached_file', '2020/10/lauren-mancke-aOC7TSLb1o8-unsplash.jpg'),
(126, 41, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2400;s:6:\"height\";i:1596;s:4:\"file\";s:46:\"2020/10/lauren-mancke-aOC7TSLb1o8-unsplash.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:46:\"lauren-mancke-aOC7TSLb1o8-unsplash-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(127, 42, '_wp_attached_file', '2020/10/john-schnobrich-FlPc9_VocJ4-unsplash-1.jpg'),
(128, 42, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2400;s:6:\"height\";i:1600;s:4:\"file\";s:50:\"2020/10/john-schnobrich-FlPc9_VocJ4-unsplash-1.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:50:\"john-schnobrich-FlPc9_VocJ4-unsplash-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(129, 43, '_wp_attached_file', '2020/10/xps-YNliXm_hMn8-unsplash-1.jpg'),
(130, 43, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2400;s:6:\"height\";i:2400;s:4:\"file\";s:38:\"2020/10/xps-YNliXm_hMn8-unsplash-1.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:38:\"xps-YNliXm_hMn8-unsplash-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(133, 16, '_thumbnail_id', '43'),
(136, 27, '_thumbnail_id', '42'),
(139, 29, '_thumbnail_id', '41'),
(142, 31, '_thumbnail_id', '40'),
(145, 33, '_thumbnail_id', '43'),
(146, 44, '_edit_lock', '1602841966:1'),
(147, 45, '_wp_attached_file', '2020/10/f66d3553715845150d0103206ba942b4.png'),
(148, 45, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:800;s:4:\"file\";s:44:\"2020/10/f66d3553715845150d0103206ba942b4.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"f66d3553715845150d0103206ba942b4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(149, 46, '_wp_attached_file', '2020/10/a51fd6f14848a62f767493c4835011bc.png'),
(150, 46, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:750;s:6:\"height\";i:450;s:4:\"file\";s:44:\"2020/10/a51fd6f14848a62f767493c4835011bc.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"a51fd6f14848a62f767493c4835011bc-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(151, 47, '_wp_attached_file', '2020/10/97e99825f222424f62aefd9b1ba7d9a4.png'),
(152, 47, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:534;s:4:\"file\";s:44:\"2020/10/97e99825f222424f62aefd9b1ba7d9a4.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"97e99825f222424f62aefd9b1ba7d9a4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(155, 44, '_thumbnail_id', '47'),
(156, 49, '_edit_lock', '1602841808:1'),
(159, 49, '_thumbnail_id', '46'),
(160, 51, '_edit_lock', '1602841793:1'),
(163, 51, '_thumbnail_id', '45'),
(166, 54, '_edit_lock', '1602841787:1'),
(169, 54, '_thumbnail_id', '47'),
(178, 44, '_edit_last', '1'),
(181, 35, '_edit_last', '1'),
(184, 33, '_edit_last', '1'),
(187, 31, '_edit_last', '1'),
(190, 56, '_edit_lock', '1603353613:1'),
(191, 57, '_wp_attached_file', '2020/10/skolko-zarabotatyvaet-razrabotchik.jpg'),
(192, 57, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:934;s:4:\"file\";s:46:\"2020/10/skolko-zarabotatyvaet-razrabotchik.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:46:\"skolko-zarabotatyvaet-razrabotchik-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(193, 57, '_wp_attachment_image_alt', 'money'),
(196, 56, '_thumbnail_id', '57'),
(197, 59, '_edit_lock', '1603435470:1'),
(198, 60, '_wp_attached_file', '2020/10/2914b6ea0df998c52c300fce01dd0b62.png'),
(199, 60, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1500;s:6:\"height\";i:1000;s:4:\"file\";s:44:\"2020/10/2914b6ea0df998c52c300fce01dd0b62.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"2914b6ea0df998c52c300fce01dd0b62-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(200, 61, '_wp_attached_file', '2020/10/311cee8bf0a5f3c6d16eccf8efd891ad.png'),
(201, 61, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1500;s:6:\"height\";i:1000;s:4:\"file\";s:44:\"2020/10/311cee8bf0a5f3c6d16eccf8efd891ad.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"311cee8bf0a5f3c6d16eccf8efd891ad-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(202, 62, '_wp_attached_file', '2020/10/1d9dba774bdb3a921ecdc9282bae86bd.png'),
(203, 62, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1494;s:6:\"height\";i:1000;s:4:\"file\";s:44:\"2020/10/1d9dba774bdb3a921ecdc9282bae86bd.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"1d9dba774bdb3a921ecdc9282bae86bd-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(204, 63, '_wp_attached_file', '2020/10/488da55c5837f68066cd785ed95c4881.png'),
(205, 63, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:44:\"2020/10/488da55c5837f68066cd785ed95c4881.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"488da55c5837f68066cd785ed95c4881-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(206, 64, '_wp_attached_file', '2020/10/14d7df03d2b443e53e00cc4e6a983eb2.png'),
(207, 64, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1500;s:6:\"height\";i:1000;s:4:\"file\";s:44:\"2020/10/14d7df03d2b443e53e00cc4e6a983eb2.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"14d7df03d2b443e53e00cc4e6a983eb2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(208, 65, '_wp_attached_file', '2020/10/95c24b408dbcaa9fcc4fe1c132fcf231.png'),
(209, 65, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1500;s:6:\"height\";i:1000;s:4:\"file\";s:44:\"2020/10/95c24b408dbcaa9fcc4fe1c132fcf231.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"95c24b408dbcaa9fcc4fe1c132fcf231-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(210, 65, '_wp_attachment_image_alt', 'Новый налоговый режим для фрилансеров'),
(213, 59, '_thumbnail_id', '65'),
(214, 67, '_edit_lock', '1603435974:1'),
(215, 64, '_wp_attachment_image_alt', 'Платные курсы'),
(218, 67, '_thumbnail_id', '64'),
(219, 69, '_edit_lock', '1603436044:1'),
(220, 63, '_wp_attachment_image_alt', 'telegram'),
(223, 69, '_thumbnail_id', '63'),
(224, 71, '_edit_lock', '1603436122:1'),
(225, 62, '_wp_attachment_image_alt', 'портфолио'),
(228, 71, '_thumbnail_id', '62'),
(229, 73, '_edit_lock', '1603436162:1'),
(232, 73, '_thumbnail_id', '61'),
(233, 75, '_edit_lock', '1603436529:1'),
(236, 75, '_thumbnail_id', '60'),
(237, 77, '_edit_lock', '1604587442:1'),
(240, 79, '_wp_attached_file', '2020/10/Vosstanovlenie-buhgalterskogo-uchyota_2.jpg'),
(241, 79, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:375;s:6:\"height\";i:240;s:4:\"file\";s:51:\"2020/10/Vosstanovlenie-buhgalterskogo-uchyota_2.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:51:\"Vosstanovlenie-buhgalterskogo-uchyota_2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(242, 80, '_wp_attached_file', '2020/10/photo-1578601789053-1c00ea465c7b.jpg'),
(243, 80, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1050;s:6:\"height\";i:700;s:4:\"file\";s:44:\"2020/10/photo-1578601789053-1c00ea465c7b.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"photo-1578601789053-1c00ea465c7b-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(244, 81, '_wp_attached_file', '2020/10/a51fd6f14848a62f767493c4835011bc-1.png'),
(245, 81, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:750;s:6:\"height\";i:450;s:4:\"file\";s:46:\"2020/10/a51fd6f14848a62f767493c4835011bc-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:46:\"a51fd6f14848a62f767493c4835011bc-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(248, 83, '_wp_attached_file', '2020/10/00bff314fb3e5c46fb745b8f485ccb35-scaled.jpg'),
(249, 83, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1706;s:4:\"file\";s:51:\"2020/10/00bff314fb3e5c46fb745b8f485ccb35-scaled.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"00bff314fb3e5c46fb745b8f485ccb35-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:36:\"00bff314fb3e5c46fb745b8f485ccb35.jpg\";}'),
(253, 86, '_edit_lock', '1603817934:1'),
(256, 88, '_edit_lock', '1603888016:1'),
(259, 88, '_thumbnail_id', '81'),
(260, 90, '_edit_lock', '1603818804:1'),
(263, 90, '_thumbnail_id', '61'),
(302, 97, '_edit_lock', '1603990532:1'),
(303, 99, '_edit_lock', '1603990553:1'),
(304, 101, '_edit_lock', '1603990568:1'),
(305, 103, '_edit_lock', '1603990584:1'),
(306, 105, '_menu_item_type', 'post_type'),
(307, 105, '_menu_item_menu_item_parent', '0'),
(308, 105, '_menu_item_object_id', '103'),
(309, 105, '_menu_item_object', 'page'),
(310, 105, '_menu_item_target', ''),
(311, 105, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(312, 105, '_menu_item_xfn', ''),
(313, 105, '_menu_item_url', ''),
(315, 106, '_menu_item_type', 'post_type'),
(316, 106, '_menu_item_menu_item_parent', '0'),
(317, 106, '_menu_item_object_id', '101'),
(318, 106, '_menu_item_object', 'page'),
(319, 106, '_menu_item_target', ''),
(320, 106, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(321, 106, '_menu_item_xfn', ''),
(322, 106, '_menu_item_url', ''),
(324, 107, '_menu_item_type', 'post_type'),
(325, 107, '_menu_item_menu_item_parent', '0'),
(326, 107, '_menu_item_object_id', '99'),
(327, 107, '_menu_item_object', 'page'),
(328, 107, '_menu_item_target', ''),
(329, 107, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(330, 107, '_menu_item_xfn', ''),
(331, 107, '_menu_item_url', ''),
(333, 108, '_menu_item_type', 'post_type'),
(334, 108, '_menu_item_menu_item_parent', '0'),
(335, 108, '_menu_item_object_id', '97'),
(336, 108, '_menu_item_object', 'page'),
(337, 108, '_menu_item_target', ''),
(338, 108, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(339, 108, '_menu_item_xfn', ''),
(340, 108, '_menu_item_url', ''),
(342, 109, '_menu_item_type', 'custom'),
(343, 109, '_menu_item_menu_item_parent', '0'),
(344, 109, '_menu_item_object_id', '109'),
(345, 109, '_menu_item_object', 'custom'),
(346, 109, '_menu_item_target', ''),
(347, 109, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(348, 109, '_menu_item_xfn', ''),
(349, 109, '_menu_item_url', '#'),
(351, 110, '_menu_item_type', 'custom'),
(352, 110, '_menu_item_menu_item_parent', '0'),
(353, 110, '_menu_item_object_id', '110'),
(354, 110, '_menu_item_object', 'custom'),
(355, 110, '_menu_item_target', ''),
(356, 110, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(357, 110, '_menu_item_xfn', ''),
(358, 110, '_menu_item_url', '#'),
(360, 111, '_menu_item_type', 'custom'),
(361, 111, '_menu_item_menu_item_parent', '0'),
(362, 111, '_menu_item_object_id', '111'),
(363, 111, '_menu_item_object', 'custom'),
(364, 111, '_menu_item_target', ''),
(365, 111, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(366, 111, '_menu_item_xfn', ''),
(367, 111, '_menu_item_url', '#'),
(369, 112, '_menu_item_type', 'custom'),
(370, 112, '_menu_item_menu_item_parent', '0'),
(371, 112, '_menu_item_object_id', '112'),
(372, 112, '_menu_item_object', 'custom'),
(373, 112, '_menu_item_target', ''),
(374, 112, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(375, 112, '_menu_item_xfn', ''),
(376, 112, '_menu_item_url', '#'),
(378, 113, '_menu_item_type', 'taxonomy'),
(379, 113, '_menu_item_menu_item_parent', '0'),
(380, 113, '_menu_item_object_id', '3'),
(381, 113, '_menu_item_object', 'category'),
(382, 113, '_menu_item_target', ''),
(383, 113, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(384, 113, '_menu_item_xfn', ''),
(385, 113, '_menu_item_url', ''),
(387, 114, '_menu_item_type', 'taxonomy'),
(388, 114, '_menu_item_menu_item_parent', '0'),
(389, 114, '_menu_item_object_id', '12'),
(390, 114, '_menu_item_object', 'category'),
(391, 114, '_menu_item_target', ''),
(392, 114, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(393, 114, '_menu_item_xfn', ''),
(394, 114, '_menu_item_url', ''),
(396, 115, '_menu_item_type', 'taxonomy'),
(397, 115, '_menu_item_menu_item_parent', '0'),
(398, 115, '_menu_item_object_id', '6'),
(399, 115, '_menu_item_object', 'category'),
(400, 115, '_menu_item_target', ''),
(401, 115, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(402, 115, '_menu_item_xfn', ''),
(403, 115, '_menu_item_url', ''),
(405, 116, '_menu_item_type', 'taxonomy'),
(406, 116, '_menu_item_menu_item_parent', '0'),
(407, 116, '_menu_item_object_id', '9'),
(408, 116, '_menu_item_object', 'category'),
(409, 116, '_menu_item_target', ''),
(410, 116, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(411, 116, '_menu_item_xfn', ''),
(412, 116, '_menu_item_url', ''),
(414, 117, '_menu_item_type', 'custom'),
(415, 117, '_menu_item_menu_item_parent', '0'),
(416, 117, '_menu_item_object_id', '117'),
(417, 117, '_menu_item_object', 'custom'),
(418, 117, '_menu_item_target', ''),
(419, 117, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(420, 117, '_menu_item_xfn', ''),
(421, 117, '_menu_item_url', '#'),
(423, 118, '_menu_item_type', 'custom'),
(424, 118, '_menu_item_menu_item_parent', '0'),
(425, 118, '_menu_item_object_id', '118'),
(426, 118, '_menu_item_object', 'custom'),
(427, 118, '_menu_item_target', ''),
(428, 118, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(429, 118, '_menu_item_xfn', ''),
(430, 118, '_menu_item_url', '#'),
(432, 119, '_menu_item_type', 'custom'),
(433, 119, '_menu_item_menu_item_parent', '0'),
(434, 119, '_menu_item_object_id', '119'),
(435, 119, '_menu_item_object', 'custom'),
(436, 119, '_menu_item_target', ''),
(437, 119, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(438, 119, '_menu_item_xfn', ''),
(439, 119, '_menu_item_url', '#'),
(441, 120, '_menu_item_type', 'custom'),
(442, 120, '_menu_item_menu_item_parent', '0'),
(443, 120, '_menu_item_object_id', '120'),
(444, 120, '_menu_item_object', 'custom'),
(445, 120, '_menu_item_target', ''),
(446, 120, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(447, 120, '_menu_item_xfn', ''),
(448, 120, '_menu_item_url', '#'),
(450, 121, '_menu_item_type', 'custom'),
(451, 121, '_menu_item_menu_item_parent', '0'),
(452, 121, '_menu_item_object_id', '121'),
(453, 121, '_menu_item_object', 'custom'),
(454, 121, '_menu_item_target', ''),
(455, 121, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(456, 121, '_menu_item_xfn', ''),
(457, 121, '_menu_item_url', '#'),
(459, 122, '_menu_item_type', 'custom'),
(460, 122, '_menu_item_menu_item_parent', '0'),
(461, 122, '_menu_item_object_id', '122'),
(462, 122, '_menu_item_object', 'custom'),
(463, 122, '_menu_item_target', ''),
(464, 122, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(465, 122, '_menu_item_xfn', ''),
(466, 122, '_menu_item_url', '#'),
(468, 123, '_menu_item_type', 'custom'),
(469, 123, '_menu_item_menu_item_parent', '0'),
(470, 123, '_menu_item_object_id', '123'),
(471, 123, '_menu_item_object', 'custom'),
(472, 123, '_menu_item_target', ''),
(473, 123, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(474, 123, '_menu_item_xfn', ''),
(475, 123, '_menu_item_url', '#'),
(477, 124, '_menu_item_type', 'custom'),
(478, 124, '_menu_item_menu_item_parent', '0'),
(479, 124, '_menu_item_object_id', '124'),
(480, 124, '_menu_item_object', 'custom'),
(481, 124, '_menu_item_target', ''),
(482, 124, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(483, 124, '_menu_item_xfn', ''),
(484, 124, '_menu_item_url', '#'),
(486, 125, '_menu_item_type', 'custom'),
(487, 125, '_menu_item_menu_item_parent', '0'),
(488, 125, '_menu_item_object_id', '125'),
(489, 125, '_menu_item_object', 'custom'),
(490, 125, '_menu_item_target', ''),
(491, 125, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(492, 125, '_menu_item_xfn', ''),
(493, 125, '_menu_item_url', '#'),
(495, 126, '_menu_item_type', 'custom'),
(496, 126, '_menu_item_menu_item_parent', '0'),
(497, 126, '_menu_item_object_id', '126'),
(498, 126, '_menu_item_object', 'custom'),
(499, 126, '_menu_item_target', ''),
(500, 126, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(501, 126, '_menu_item_xfn', ''),
(502, 126, '_menu_item_url', '#'),
(504, 127, '_menu_item_type', 'custom'),
(505, 127, '_menu_item_menu_item_parent', '0'),
(506, 127, '_menu_item_object_id', '127'),
(507, 127, '_menu_item_object', 'custom'),
(508, 127, '_menu_item_target', ''),
(509, 127, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(510, 127, '_menu_item_xfn', ''),
(511, 127, '_menu_item_url', '#'),
(513, 128, '_menu_item_type', 'custom'),
(514, 128, '_menu_item_menu_item_parent', '0'),
(515, 128, '_menu_item_object_id', '128'),
(516, 128, '_menu_item_object', 'custom'),
(517, 128, '_menu_item_target', ''),
(518, 128, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(519, 128, '_menu_item_xfn', ''),
(520, 128, '_menu_item_url', '#'),
(521, 128, '_menu_item_orphaned', '1603993360'),
(522, 129, '_menu_item_type', 'post_type'),
(523, 129, '_menu_item_menu_item_parent', '0'),
(524, 129, '_menu_item_object_id', '97'),
(525, 129, '_menu_item_object', 'page'),
(526, 129, '_menu_item_target', ''),
(527, 129, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(528, 129, '_menu_item_xfn', ''),
(529, 129, '_menu_item_url', ''),
(531, 130, '_menu_item_type', 'taxonomy'),
(532, 130, '_menu_item_menu_item_parent', '0'),
(533, 130, '_menu_item_object_id', '30'),
(534, 130, '_menu_item_object', 'category'),
(535, 130, '_menu_item_target', ''),
(536, 130, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(537, 130, '_menu_item_xfn', ''),
(538, 130, '_menu_item_url', ''),
(540, 131, '_menu_item_type', 'taxonomy'),
(541, 131, '_menu_item_menu_item_parent', '0'),
(542, 131, '_menu_item_object_id', '25'),
(543, 131, '_menu_item_object', 'category'),
(544, 131, '_menu_item_target', ''),
(545, 131, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(546, 131, '_menu_item_xfn', ''),
(547, 131, '_menu_item_url', ''),
(549, 132, '_menu_item_type', 'taxonomy'),
(550, 132, '_menu_item_menu_item_parent', '0'),
(551, 132, '_menu_item_object_id', '24'),
(552, 132, '_menu_item_object', 'category'),
(553, 132, '_menu_item_target', ''),
(554, 132, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(555, 132, '_menu_item_xfn', ''),
(556, 132, '_menu_item_url', ''),
(558, 133, '_menu_item_type', 'taxonomy'),
(559, 133, '_menu_item_menu_item_parent', '0'),
(560, 133, '_menu_item_object_id', '26'),
(561, 133, '_menu_item_object', 'category'),
(562, 133, '_menu_item_target', ''),
(563, 133, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(564, 133, '_menu_item_xfn', ''),
(565, 133, '_menu_item_url', ''),
(567, 134, '_menu_item_type', 'taxonomy'),
(568, 134, '_menu_item_menu_item_parent', '0'),
(569, 134, '_menu_item_object_id', '40'),
(570, 134, '_menu_item_object', 'category'),
(571, 134, '_menu_item_target', ''),
(572, 134, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(573, 134, '_menu_item_xfn', ''),
(574, 134, '_menu_item_url', ''),
(576, 7, '_wp_old_slug', 'статьи'),
(577, 8, '_wp_old_slug', 'новости'),
(578, 9, '_wp_old_slug', 'курсы'),
(579, 16, '_wp_old_slug', 'возможности-css-grid-layout-которые-уже-можно-при'),
(580, 27, '_wp_old_slug', 'топ-10-плагинов-для-figma'),
(581, 29, '_wp_old_slug', 'правильно-вставляем-картинку-на-сайт'),
(582, 31, '_wp_old_slug', 'на-каком-стандарте-писать-скрипты-есл'),
(583, 33, '_wp_old_slug', 'как-использовать-css-float-после-того-как-выш'),
(584, 35, '_wp_old_slug', 'расширение-chrome-защищает-от-атак'),
(585, 44, '_wp_old_slug', '25-способов-настроить-слайдер'),
(586, 49, '_wp_old_slug', 'главные-фишки-фрилансера'),
(587, 51, '_wp_old_slug', 'техника-управлеия-временем-помодор'),
(588, 54, '_wp_old_slug', 'что-нужно-знать-о-git-и-github'),
(589, 56, '_wp_old_slug', 'расследование-недели-сколько-зараба'),
(590, 57, '_wp_old_slug', 'сколько-заработатывает-разработчик'),
(591, 59, '_wp_old_slug', 'новый-налоговый-режим-для-фрилансеро'),
(592, 67, '_wp_old_slug', 'платные-курсы-это-не-быстрый-способ'),
(593, 69, '_wp_old_slug', 'из-за-ограничений-стали-недоступны-се'),
(594, 71, '_wp_old_slug', 'в-вашем-портфолио-могут-быть-фейковые'),
(595, 73, '_wp_old_slug', 'список-стран-куда-можно-улететь'),
(596, 75, '_wp_old_slug', 'список-youtube-каналов-для-тех-кто-только-на'),
(597, 77, '_wp_old_slug', 'выбор-читателей-где-удобнее-работать'),
(598, 79, '_wp_old_slug', 'восстановление-бухгалтерского-учёта'),
(599, 86, '_wp_old_slug', 'вопросы-на-собеседовании-для-джуна'),
(600, 88, '_wp_old_slug', 'зарядка-для-глаз'),
(601, 90, '_wp_old_slug', 'топ-плагинов-jquery'),
(602, 97, '_wp_old_slug', 'контакты'),
(603, 99, '_wp_old_slug', 'работа-у-нас'),
(604, 101, '_wp_old_slug', 'реклама'),
(605, 103, '_wp_old_slug', 'партнерство'),
(606, 109, '_wp_old_slug', 'обновления'),
(607, 110, '_wp_old_slug', 'экспресс'),
(608, 117, '_wp_old_slug', 'скринкасты'),
(609, 118, '_wp_old_slug', 'уроки'),
(610, 119, '_wp_old_slug', 'вебинары'),
(611, 120, '_wp_old_slug', 'платные-интенсивы'),
(612, 121, '_wp_old_slug', 'бесплатные-стримы'),
(613, 122, '_wp_old_slug', 'мастер-классы'),
(614, 123, '_wp_old_slug', 'менторство'),
(615, 124, '_wp_old_slug', 'буткемпы'),
(616, 125, '_wp_old_slug', 'политика-данных'),
(617, 126, '_wp_old_slug', 'оферта-сайта'),
(618, 127, '_wp_old_slug', 'реквизиты');

-- --------------------------------------------------------

--
-- Структура таблицы `universal_posts`
--

CREATE TABLE `universal_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_posts`
--

INSERT INTO `universal_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-10-02 20:18:40', '2020-10-02 17:18:40', '<!-- wp:paragraph -->\n<p>Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите ее, затем начинайте создавать!</p>\n<!-- /wp:paragraph -->', 'Привет, мир!', '', 'trash', 'open', 'open', '', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80__trashed', '', '', '2020-10-12 13:12:13', '2020-10-12 10:12:13', '', 0, 'http://universal.local/?p=1', 0, 'post', '', 1),
(2, 1, '2020-10-02 20:18:40', '2020-10-02 17:18:40', '<!-- wp:paragraph -->\n<p>Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице &laquo;Детали&raquo; владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Привет! Днём я курьер, а вечером &#8212; подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...или так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Компания &laquo;Штучки XYZ&raquo; была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href=\"http://universal.local/wp-admin/\">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Пример страницы', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2020-10-02 20:18:40', '2020-10-02 17:18:40', '', 0, 'http://universal.local/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-10-02 20:18:40', '2020-10-02 17:18:40', '<!-- wp:heading --><h2>Кто мы</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Наш адрес сайта: http://universal.local.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Какие персональные данные мы собираем и с какой целью</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Комментарии</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если посетитель оставляет комментарий на сайте, мы собираем данные указанные в форме комментария, а также IP адрес посетителя и данные user-agent браузера с целью определения спама.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Анонимизированная строка создаваемая из вашего адреса email (\"хеш\") может предоставляться сервису Gravatar, чтобы определить используете ли вы его. Политика конфиденциальности Gravatar доступна здесь: https://automattic.com/privacy/ . После одобрения комментария ваше изображение профиля будет видимым публично в контексте вашего комментария.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Медиафайлы</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы зарегистрированный пользователь и загружаете фотографии на сайт, вам возможно следует избегать загрузки изображений с метаданными EXIF, так как они могут содержать данные вашего месторасположения по GPS. Посетители могут извлечь эту информацию скачав изображения с сайта.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Формы контактов</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Куки</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы оставляете комментарий на нашем сайте, вы можете включить сохранение вашего имени, адреса email и вебсайта в куки. Это делается для вашего удобства, чтобы не заполнять данные снова при повторном комментировании. Эти куки хранятся в течение одного года.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Если у вас есть учетная запись на сайте и вы войдете в неё, мы установим временный куки для определения поддержки куки вашим браузером, куки не содержит никакой личной информации и удаляется при закрытии вашего браузера.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>При входе в учетную запись мы также устанавливаем несколько куки с данными входа и настройками экрана. Куки входа хранятся в течение двух дней, куки с настройками экрана - год. Если вы выберете возможность \"Запомнить меня\", данные о входе будут сохраняться в течение двух недель. При выходе из учетной записи куки входа будут удалены.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>При редактировании или публикации статьи в браузере будет сохранен дополнительный куки, он не содержит персональных данных и содержит только ID записи отредактированной вами, истекает через 1 день.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Встраиваемое содержимое других вебсайтов</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Статьи на этом сайте могут включать встраиваемое содержимое (например видео, изображения, статьи и др.), подобное содержимое ведет себя так же, как если бы посетитель зашел на другой сайт.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Эти сайты могут собирать данные о вас, использовать куки, внедрять дополнительное отслеживание третьей стороной и следить за вашим взаимодействием с внедренным содержимым, включая отслеживание взаимодействия, если у вас есть учетная запись и вы авторизовались на том сайте.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Веб-аналитика</h3><!-- /wp:heading --><!-- wp:heading --><h2>С кем мы делимся вашими данными</h2><!-- /wp:heading --><!-- wp:heading --><h2>Как долго мы храним ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы оставляете комментарий, то сам комментарий и его метаданные сохраняются неопределенно долго. Это делается для того, чтобы определять и одобрять последующие комментарии автоматически, вместо помещения их в очередь на одобрение.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Для пользователей с регистрацией на нашем сайте мы храним ту личную информацию, которую они указывают в своем профиле. Все пользователи могут видеть, редактировать или удалить свою информацию из профиля в любое время (кроме имени пользователя). Администрация вебсайта также может видеть и изменять эту информацию.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Какие у вас права на ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>При наличии учетной записи на сайте или если вы оставляли комментарии, то вы можете запросить файл экспорта персональных данных, которые мы сохранили о вас, включая предоставленные вами данные. Вы также можете запросить удаление этих данных, это не включает данные, которые мы обязаны хранить в административных целях, по закону или целях безопасности.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Куда мы отправляем ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Комментарии пользователей могут проверяться автоматическим сервисом определения спама.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Ваша контактная информация</h2><!-- /wp:heading --><!-- wp:heading --><h2>Дополнительная информация</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Как мы защищаем ваши данные</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Какие принимаются процедуры против взлома данных</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>От каких третьих сторон мы получаем данные</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Какие автоматические решения принимаются на основе данных пользователей</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Требования к раскрытию отраслевых нормативных требований</h3><!-- /wp:heading -->', 'Политика конфиденциальности', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2020-10-02 20:18:40', '2020-10-02 17:18:40', '', 0, 'http://universal.local/?page_id=3', 0, 'page', '', 0),
(5, 1, '2020-10-07 19:42:48', '2020-10-07 16:42:48', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2020-10-07 19:42:58', '2020-10-07 16:42:58', '', 0, 'http://universal.local/wp-content/uploads/2020/10/logo.png', 0, 'attachment', 'image/png', 0),
(6, 1, '2020-10-07 19:43:21', '2020-10-07 16:43:21', '{\n    \"universal-theme::custom_logo\": {\n        \"value\": 5,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-10-07 16:43:21\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '2765adaa-6ec9-44c2-be50-68867aa53b54', '', '', '2020-10-07 19:43:21', '2020-10-07 16:43:21', '', 0, 'http://universal.local/2020/10/07/2765adaa-6ec9-44c2-be50-68867aa53b54/', 0, 'customize_changeset', '', 0),
(7, 1, '2020-10-07 20:05:37', '2020-10-07 17:05:37', '', 'Статьи', '', 'publish', 'closed', 'closed', '', 'stati', '', '', '2020-10-07 20:11:00', '2020-10-07 17:11:00', '', 0, 'http://universal.local/?p=7', 1, 'nav_menu_item', '', 0),
(8, 1, '2020-10-07 20:05:37', '2020-10-07 17:05:37', '', 'Новости', '', 'publish', 'closed', 'closed', '', 'novosti', '', '', '2020-10-07 20:11:00', '2020-10-07 17:11:00', '', 0, 'http://universal.local/?p=8', 2, 'nav_menu_item', '', 0),
(9, 1, '2020-10-07 20:05:37', '2020-10-07 17:05:37', '', 'Курсы', '', 'publish', 'closed', 'closed', '', 'kursy', '', '', '2020-10-07 20:11:00', '2020-10-07 17:11:00', '', 0, 'http://universal.local/?p=9', 3, 'nav_menu_item', '', 0),
(10, 1, '2020-10-07 20:05:37', '2020-10-07 17:05:37', '', 'HTML', '', 'publish', 'closed', 'closed', '', 'html', '', '', '2020-10-07 20:11:00', '2020-10-07 17:11:00', '', 0, 'http://universal.local/?p=10', 4, 'nav_menu_item', '', 0),
(11, 1, '2020-10-07 20:05:37', '2020-10-07 17:05:37', '', 'CSS', '', 'publish', 'closed', 'closed', '', 'css', '', '', '2020-10-07 20:11:00', '2020-10-07 17:11:00', '', 0, 'http://universal.local/?p=11', 5, 'nav_menu_item', '', 0),
(12, 1, '2020-10-07 20:05:37', '2020-10-07 17:05:37', '', 'Javascript', '', 'publish', 'closed', 'closed', '', 'javascript', '', '', '2020-10-07 20:11:01', '2020-10-07 17:11:01', '', 0, 'http://universal.local/?p=12', 6, 'nav_menu_item', '', 0),
(13, 1, '2020-10-07 20:05:37', '2020-10-07 17:05:37', '', 'Web Design', '', 'publish', 'closed', 'closed', '', 'web-design', '', '', '2020-10-07 20:11:01', '2020-10-07 17:11:01', '', 0, 'http://universal.local/?p=13', 7, 'nav_menu_item', '', 0),
(15, 1, '2020-10-12 13:12:13', '2020-10-12 10:12:13', '<!-- wp:paragraph -->\n<p>Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите ее, затем начинайте создавать!</p>\n<!-- /wp:paragraph -->', 'Привет, мир!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2020-10-12 13:12:13', '2020-10-12 10:12:13', '', 1, 'http://universal.local/2020/10/12/1-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2020-10-12 13:26:40', '2020-10-12 10:26:40', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Возможности CSS Grid Layout , которые уже можно применять', '', 'publish', 'open', 'open', '', 'vozmozhnosti-css-grid-layout-kotorye-uzhe-mozhno-pri', '', '', '2020-10-12 14:51:27', '2020-10-12 11:51:27', '', 0, 'http://universal.local/?p=16', 0, 'post', '', 0),
(17, 1, '2020-10-12 13:18:27', '2020-10-12 10:18:27', '', 'img', '', 'inherit', 'open', 'closed', '', 'img', '', '', '2020-10-12 13:18:27', '2020-10-12 10:18:27', '', 16, 'http://universal.local/wp-content/uploads/2020/10/img.jpg', 0, 'attachment', 'image/jpeg', 0),
(26, 1, '2020-10-12 13:26:40', '2020-10-12 10:26:40', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Возможности CSS Grid Layout , которые уже можно применять', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2020-10-12 13:26:40', '2020-10-12 10:26:40', '', 16, 'http://universal.local/2020/10/12/16-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2020-10-12 13:29:43', '2020-10-12 10:29:43', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'ТОП-10 плагинов для Figma', '', 'publish', 'open', 'open', '', 'top-10-plaginov-dlya-figma', '', '', '2020-10-12 14:51:38', '2020-10-12 11:51:38', '', 0, 'http://universal.local/?p=27', 0, 'post', '', 0),
(28, 1, '2020-10-12 13:29:43', '2020-10-12 10:29:43', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'ТОП-10 плагинов для Figma', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2020-10-12 13:29:43', '2020-10-12 10:29:43', '', 27, 'http://universal.local/2020/10/12/27-revision-v1/', 0, 'revision', '', 0),
(29, 1, '2020-10-12 13:30:51', '2020-10-12 10:30:51', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Правильно вставляем картинку на сайт для Retina дисплея', '', 'publish', 'open', 'open', '', 'pravilno-vstavlyaem-kartinku-na-sajt', '', '', '2020-10-12 14:51:48', '2020-10-12 11:51:48', '', 0, 'http://universal.local/?p=29', 0, 'post', '', 0),
(30, 1, '2020-10-12 13:30:51', '2020-10-12 10:30:51', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Правильно вставляем картинку на сайт для Retina дисплея', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2020-10-12 13:30:51', '2020-10-12 10:30:51', '', 29, 'http://universal.local/2020/10/12/29-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2020-10-12 13:31:47', '2020-10-12 10:31:47', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'На каком стандарте писать скрипты, если я фрилансер', '', 'publish', 'open', 'open', '', 'na-kakom-standarte-pisat-skripty-esl', '', '', '2020-10-16 12:53:35', '2020-10-16 09:53:35', '', 0, 'http://universal.local/?p=31', 0, 'post', '', 0),
(32, 1, '2020-10-12 13:31:47', '2020-10-12 10:31:47', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'На каком стандарте писать скрипты, если я фрилансер', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2020-10-12 13:31:47', '2020-10-12 10:31:47', '', 31, 'http://universal.local/2020/10/12/31-revision-v1/', 0, 'revision', '', 0),
(33, 1, '2020-10-12 13:32:37', '2020-10-12 10:32:37', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'Как использовать CSS float после того, как вышел Flexbox', '', 'publish', 'open', 'open', '', 'kak-ispolzovat-css-float-posle-togo-kak-vysh', '', '', '2020-10-16 12:53:16', '2020-10-16 09:53:16', '', 0, 'http://universal.local/?p=33', 0, 'post', '', 0),
(34, 1, '2020-10-12 13:32:37', '2020-10-12 10:32:37', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'Как использовать CSS float после того, как вышел Flexbox', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2020-10-12 13:32:37', '2020-10-12 10:32:37', '', 33, 'http://universal.local/2020/10/12/33-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2020-10-12 13:33:21', '2020-10-12 10:33:21', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Расширение Chrome защищает от атак', '', 'publish', 'closed', 'open', '', 'rasshirenie-chrome-zashhishhaet-ot-atak', '', '', '2020-10-16 12:53:04', '2020-10-16 09:53:04', '', 0, 'http://universal.local/?p=35', 0, 'post', '', 0),
(36, 1, '2020-10-12 13:33:21', '2020-10-12 10:33:21', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Расширение Chrome защищает от атак', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-10-12 13:33:21', '2020-10-12 10:33:21', '', 35, 'http://universal.local/2020/10/12/35-revision-v1/', 0, 'revision', '', 0),
(38, 1, '2020-10-12 14:34:55', '2020-10-12 11:34:55', '', 'favicon', '', 'inherit', 'open', 'closed', '', 'favicon', '', '', '2020-10-12 14:34:55', '2020-10-12 11:34:55', '', 0, 'http://universal.local/wp-content/uploads/2020/10/favicon.png', 0, 'attachment', 'image/png', 0),
(39, 1, '2020-10-12 14:35:08', '2020-10-12 11:35:08', '{\n    \"site_icon\": {\n        \"value\": 38,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-10-12 11:35:08\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '3562f05e-985d-430c-a7c7-02a780d9679a', '', '', '2020-10-12 14:35:08', '2020-10-12 11:35:08', '', 0, 'http://universal.local/2020/10/12/3562f05e-985d-430c-a7c7-02a780d9679a/', 0, 'customize_changeset', '', 0),
(40, 1, '2020-10-12 14:51:14', '2020-10-12 11:51:14', '', 'nikita-kachanovsky-OVbeSXRk_9E-unsplash', '', 'inherit', 'open', 'closed', '', 'nikita-kachanovsky-ovbesxrk_9e-unsplash', '', '', '2020-10-12 14:51:14', '2020-10-12 11:51:14', '', 16, 'http://universal.local/wp-content/uploads/2020/10/nikita-kachanovsky-OVbeSXRk_9E-unsplash.jpg', 0, 'attachment', 'image/jpeg', 0),
(41, 1, '2020-10-12 14:51:15', '2020-10-12 11:51:15', '', 'lauren-mancke-aOC7TSLb1o8-unsplash', '', 'inherit', 'open', 'closed', '', 'lauren-mancke-aoc7tslb1o8-unsplash', '', '', '2020-10-12 14:51:15', '2020-10-12 11:51:15', '', 16, 'http://universal.local/wp-content/uploads/2020/10/lauren-mancke-aOC7TSLb1o8-unsplash.jpg', 0, 'attachment', 'image/jpeg', 0),
(42, 1, '2020-10-12 14:51:16', '2020-10-12 11:51:16', '', 'john-schnobrich-FlPc9_VocJ4-unsplash (1)', '', 'inherit', 'open', 'closed', '', 'john-schnobrich-flpc9_vocj4-unsplash-1', '', '', '2020-10-12 14:51:16', '2020-10-12 11:51:16', '', 16, 'http://universal.local/wp-content/uploads/2020/10/john-schnobrich-FlPc9_VocJ4-unsplash-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(43, 1, '2020-10-12 14:51:16', '2020-10-12 11:51:16', '', 'xps-YNliXm_hMn8-unsplash (1)', '', 'inherit', 'open', 'closed', '', 'xps-ynlixm_hmn8-unsplash-1', '', '', '2020-10-12 14:51:16', '2020-10-12 11:51:16', '', 16, 'http://universal.local/wp-content/uploads/2020/10/xps-YNliXm_hMn8-unsplash-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(44, 1, '2020-10-12 15:18:10', '2020-10-12 12:18:10', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', '25 способов настроить слайдер', '', 'publish', 'open', 'open', '', '25-sposobov-nastroit-slajder', '', '', '2020-10-16 12:52:45', '2020-10-16 09:52:45', '', 0, 'http://universal.local/?p=44', 0, 'post', '', 0),
(45, 1, '2020-10-12 15:18:04', '2020-10-12 12:18:04', '', 'f66d3553715845150d0103206ba942b4', '', 'inherit', 'open', 'closed', '', 'f66d3553715845150d0103206ba942b4', '', '', '2020-10-12 15:18:04', '2020-10-12 12:18:04', '', 44, 'http://universal.local/wp-content/uploads/2020/10/f66d3553715845150d0103206ba942b4.png', 0, 'attachment', 'image/png', 0),
(46, 1, '2020-10-12 15:18:04', '2020-10-12 12:18:04', '', 'a51fd6f14848a62f767493c4835011bc', '', 'inherit', 'open', 'closed', '', 'a51fd6f14848a62f767493c4835011bc', '', '', '2020-10-12 15:18:04', '2020-10-12 12:18:04', '', 44, 'http://universal.local/wp-content/uploads/2020/10/a51fd6f14848a62f767493c4835011bc.png', 0, 'attachment', 'image/png', 0),
(47, 1, '2020-10-12 15:18:05', '2020-10-12 12:18:05', '', '97e99825f222424f62aefd9b1ba7d9a4', '', 'inherit', 'open', 'closed', '', '97e99825f222424f62aefd9b1ba7d9a4', '', '', '2020-10-12 15:18:05', '2020-10-12 12:18:05', '', 44, 'http://universal.local/wp-content/uploads/2020/10/97e99825f222424f62aefd9b1ba7d9a4.png', 0, 'attachment', 'image/png', 0),
(48, 1, '2020-10-12 15:18:10', '2020-10-12 12:18:10', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', '25 способов настроить слайдер', '', 'inherit', 'closed', 'closed', '', '44-revision-v1', '', '', '2020-10-12 15:18:10', '2020-10-12 12:18:10', '', 44, 'http://universal.local/2020/10/12/44-revision-v1/', 0, 'revision', '', 0),
(49, 1, '2020-10-12 15:18:32', '2020-10-12 12:18:32', '', 'Главные фишки фрилансера', '', 'publish', 'open', 'open', '', 'glavnye-fishki-frilansera', '', '', '2020-10-16 12:52:26', '2020-10-16 09:52:26', '', 0, 'http://universal.local/?p=49', 0, 'post', '', 0),
(50, 1, '2020-10-12 15:18:32', '2020-10-12 12:18:32', '', 'Главные фишки фрилансера', '', 'inherit', 'closed', 'closed', '', '49-revision-v1', '', '', '2020-10-12 15:18:32', '2020-10-12 12:18:32', '', 49, 'http://universal.local/2020/10/12/49-revision-v1/', 0, 'revision', '', 0),
(51, 1, '2020-10-12 15:19:14', '2020-10-12 12:19:14', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'Техника управления  временем “Помодоро”', '', 'publish', 'open', 'open', '', 'tehnika-upravleiya-vremenem-pomodor', '', '', '2020-10-15 20:04:17', '2020-10-15 17:04:17', '', 0, 'http://universal.local/?p=51', 0, 'post', '', 0),
(52, 1, '2020-10-12 15:19:14', '2020-10-12 12:19:14', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'Техника управлеия  временем “Помодоро”', '', 'inherit', 'closed', 'closed', '', '51-revision-v1', '', '', '2020-10-12 15:19:14', '2020-10-12 12:19:14', '', 51, 'http://universal.local/2020/10/12/51-revision-v1/', 0, 'revision', '', 0),
(53, 1, '2020-10-12 15:19:18', '2020-10-12 12:19:18', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'Техника управления  временем “Помодоро”', '', 'inherit', 'closed', 'closed', '', '51-revision-v1', '', '', '2020-10-12 15:19:18', '2020-10-12 12:19:18', '', 51, 'http://universal.local/2020/10/12/51-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2020-10-12 15:19:46', '2020-10-12 12:19:46', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'Что нужно знать о Git и GitHub', '', 'publish', 'open', 'open', '', 'chto-nuzhno-znat-o-git-i-github', '', '', '2020-10-16 12:52:10', '2020-10-16 09:52:10', '', 0, 'http://universal.local/?p=54', 0, 'post', '', 0),
(55, 1, '2020-10-12 15:19:46', '2020-10-12 12:19:46', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'Что нужно знать о Git и GitHub', '', 'inherit', 'closed', 'closed', '', '54-revision-v1', '', '', '2020-10-12 15:19:46', '2020-10-12 12:19:46', '', 54, 'http://universal.local/2020/10/12/54-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2020-10-22 10:34:40', '2020-10-22 07:34:40', '<!-- wp:paragraph -->\n<p>Таким образом реализация намеченных плановых заданий играет важную роль в формировании форм развития. Не следует, однако забывать, что новая модель организационной деятельности представляет собой интересный эксперимент проверки дальнейших направлений развития. С другой стороны дальнейшее развитие различных форм деятельности требуют от нас анализа новых предложений.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! консультация с широким активом позволяет оценить значение дальнейших направлений развития. Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности требуют от нас анализа позиций, занимаемых участниками в отношении поставленных задач. Повседневная практика показывает, что сложившаяся структура организации обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития. Задача организации, в особенности же реализация намеченных плановых заданий позволяет выполнять важные задания по разработке соответствующий условий активизации. Равным образом постоянное информационно-пропагандистское обеспечение нашей деятельности требуют определения и уточнения существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', '', 'publish', 'open', 'open', '', 'rassledovanie-nedeli-skolko-zaraba', '', '', '2020-10-22 10:34:40', '2020-10-22 07:34:40', '', 0, 'http://universal.local/?p=56', 0, 'post', '', 0),
(57, 1, '2020-10-22 10:33:55', '2020-10-22 07:33:55', '', 'money', '', 'inherit', 'open', 'closed', '', 'skolko-zarabotatyvaet-razrabotchik', '', '', '2020-10-22 10:34:09', '2020-10-22 07:34:09', '', 56, 'http://universal.local/wp-content/uploads/2020/10/сколько-заработатывает-разработчик.jpg', 0, 'attachment', 'image/jpeg', 0),
(58, 1, '2020-10-22 10:34:40', '2020-10-22 07:34:40', '<!-- wp:paragraph -->\n<p>Таким образом реализация намеченных плановых заданий играет важную роль в формировании форм развития. Не следует, однако забывать, что новая модель организационной деятельности представляет собой интересный эксперимент проверки дальнейших направлений развития. С другой стороны дальнейшее развитие различных форм деятельности требуют от нас анализа новых предложений.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! консультация с широким активом позволяет оценить значение дальнейших направлений развития. Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности требуют от нас анализа позиций, занимаемых участниками в отношении поставленных задач. Повседневная практика показывает, что сложившаяся структура организации обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития. Задача организации, в особенности же реализация намеченных плановых заданий позволяет выполнять важные задания по разработке соответствующий условий активизации. Равным образом постоянное информационно-пропагандистское обеспечение нашей деятельности требуют определения и уточнения существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', '', 'inherit', 'closed', 'closed', '', '56-revision-v1', '', '', '2020-10-22 10:34:40', '2020-10-22 07:34:40', '', 56, 'http://universal.local/2020/10/22/56-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2020-10-23 09:46:38', '2020-10-23 06:46:38', '<!-- wp:paragraph -->\n<p>Руководитель налоговой заявил, что этот режим “поможет выйти из тени” тем, кто работает неофициально. Разобрались, как работает режим и кому он подходит, а кому нет.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Новый налоговый режим для фрилансеров — налог на проф. доход', '', 'publish', 'open', 'open', '', 'novyj-nalogovyj-rezhim-dlya-frilansero', '', '', '2020-10-23 09:46:38', '2020-10-23 06:46:38', '', 0, 'http://universal.local/?p=59', 0, 'post', '', 0),
(60, 1, '2020-10-23 09:46:05', '2020-10-23 06:46:05', '', 'youtube', '', 'inherit', 'open', 'closed', '', '2914b6ea0df998c52c300fce01dd0b62', '', '', '2020-10-23 09:58:58', '2020-10-23 06:58:58', '', 59, 'http://universal.local/wp-content/uploads/2020/10/2914b6ea0df998c52c300fce01dd0b62.png', 0, 'attachment', 'image/png', 0),
(61, 1, '2020-10-23 09:46:05', '2020-10-23 06:46:05', '', 'страны', '', 'inherit', 'open', 'closed', '', '311cee8bf0a5f3c6d16eccf8efd891ad', '', '', '2020-10-23 09:58:16', '2020-10-23 06:58:16', '', 59, 'http://universal.local/wp-content/uploads/2020/10/311cee8bf0a5f3c6d16eccf8efd891ad.png', 0, 'attachment', 'image/png', 0),
(62, 1, '2020-10-23 09:46:06', '2020-10-23 06:46:06', '', 'портфолио', '', 'inherit', 'open', 'closed', '', '1d9dba774bdb3a921ecdc9282bae86bd', '', '', '2020-10-23 09:57:33', '2020-10-23 06:57:33', '', 59, 'http://universal.local/wp-content/uploads/2020/10/1d9dba774bdb3a921ecdc9282bae86bd.png', 0, 'attachment', 'image/png', 0),
(63, 1, '2020-10-23 09:46:07', '2020-10-23 06:46:07', '', 'telegram', '', 'inherit', 'open', 'closed', '', '488da55c5837f68066cd785ed95c4881', '', '', '2020-10-23 09:56:22', '2020-10-23 06:56:22', '', 59, 'http://universal.local/wp-content/uploads/2020/10/488da55c5837f68066cd785ed95c4881.png', 0, 'attachment', 'image/png', 0),
(64, 1, '2020-10-23 09:46:07', '2020-10-23 06:46:07', '', 'Платные курсы', '', 'inherit', 'open', 'closed', '', '14d7df03d2b443e53e00cc4e6a983eb2', '', '', '2020-10-23 09:51:38', '2020-10-23 06:51:38', '', 59, 'http://universal.local/wp-content/uploads/2020/10/14d7df03d2b443e53e00cc4e6a983eb2.png', 0, 'attachment', 'image/png', 0),
(65, 1, '2020-10-23 09:46:08', '2020-10-23 06:46:08', '', 'Новый налоговый режим для фрилансеров', '', 'inherit', 'open', 'closed', '', '95c24b408dbcaa9fcc4fe1c132fcf231', '', '', '2020-10-23 09:46:31', '2020-10-23 06:46:31', '', 59, 'http://universal.local/wp-content/uploads/2020/10/95c24b408dbcaa9fcc4fe1c132fcf231.png', 0, 'attachment', 'image/png', 0),
(66, 1, '2020-10-23 09:46:38', '2020-10-23 06:46:38', '<!-- wp:paragraph -->\n<p>Руководитель налоговой заявил, что этот режим “поможет выйти из тени” тем, кто работает неофициально. Разобрались, как работает режим и кому он подходит, а кому нет.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Новый налоговый режим для фрилансеров — налог на проф. доход', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2020-10-23 09:46:38', '2020-10-23 06:46:38', '', 59, 'http://universal.local/2020/10/23/59-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2020-10-23 09:51:41', '2020-10-23 06:51:41', '<!-- wp:paragraph -->\n<p>Среди новичков распространено мнение, что если пройти какой-то крутой онлайн-курс, то это решит все проблемы. Но они не берут в расчет, что лучшее обучение — это практика. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития. Таким образом консультация с широким активом способствует подготовки и реализации направлений</p>\n<!-- /wp:paragraph -->', 'Платные курсы — это не быстрый способ выйти на нужный уровень', '', 'publish', 'open', 'open', '', 'platnye-kursy-eto-ne-bystryj-sposob', '', '', '2020-10-23 09:51:41', '2020-10-23 06:51:41', '', 0, 'http://universal.local/?p=67', 0, 'post', '', 0),
(68, 1, '2020-10-23 09:51:41', '2020-10-23 06:51:41', '<!-- wp:paragraph -->\n<p>Среди новичков распространено мнение, что если пройти какой-то крутой онлайн-курс, то это решит все проблемы. Но они не берут в расчет, что лучшее обучение — это практика. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития. Таким образом консультация с широким активом способствует подготовки и реализации направлений</p>\n<!-- /wp:paragraph -->', 'Платные курсы — это не быстрый способ выйти на нужный уровень', '', 'inherit', 'closed', 'closed', '', '67-revision-v1', '', '', '2020-10-23 09:51:41', '2020-10-23 06:51:41', '', 67, 'http://universal.local/2020/10/23/67-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2020-10-23 09:56:26', '2020-10-23 06:56:26', '<!-- wp:paragraph -->\n<p>Сегодня мы узнали, что серверы Telegram не доступны на территории России. Разобрались, чем это грозит вам, если ваш бизнес зависит от этого мессенджера.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Из-за ограничений стали недоступны серверы Telegram. К чему это может привести.', '', 'publish', 'open', 'open', '', 'iz-za-ogranichenij-stali-nedostupny-se', '', '', '2020-10-23 09:56:26', '2020-10-23 06:56:26', '', 0, 'http://universal.local/?p=69', 0, 'post', '', 0),
(70, 1, '2020-10-23 09:56:26', '2020-10-23 06:56:26', '<!-- wp:paragraph -->\n<p>Сегодня мы узнали, что серверы Telegram не доступны на территории России. Разобрались, чем это грозит вам, если ваш бизнес зависит от этого мессенджера.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Из-за ограничений стали недоступны серверы Telegram. К чему это может привести.', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2020-10-23 09:56:26', '2020-10-23 06:56:26', '', 69, 'http://universal.local/2020/10/23/69-revision-v1/', 0, 'revision', '', 0),
(71, 1, '2020-10-23 09:57:40', '2020-10-23 06:57:40', '<!-- wp:paragraph -->\n<p>Один из читателей предположил, что если в портфолио положить несуществующий проект, то ничего страшного не произойдет. Он провел эксперимент и потенциальные заказчики...</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'В вашем портфолио могут быть фейковые проекты, если вы сделали следующее.', '', 'publish', 'open', 'open', '', 'v-vashem-portfolio-mogut-byt-fejkovye', '', '', '2020-10-23 09:57:40', '2020-10-23 06:57:40', '', 0, 'http://universal.local/?p=71', 0, 'post', '', 0),
(72, 1, '2020-10-23 09:57:40', '2020-10-23 06:57:40', '<!-- wp:paragraph -->\n<p>Один из читателей предположил, что если в портфолио положить несуществующий проект, то ничего страшного не произойдет. Он провел эксперимент и потенциальные заказчики...</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации</p>\n<!-- /wp:paragraph -->', 'В вашем портфолио могут быть фейковые проекты, если вы сделали следующее.', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2020-10-23 09:57:40', '2020-10-23 06:57:40', '', 71, 'http://universal.local/2020/10/23/71-revision-v1/', 0, 'revision', '', 0),
(73, 1, '2020-10-23 09:58:23', '2020-10-23 06:58:23', '<!-- wp:paragraph -->\n<p>Если вы приняли решение переехать в другую страну, чтобы найти там работу, сначала посмотрите на список стран, который мы подготовили для вас. Внутри важная информация про...</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития. Таким образом консультация с широким активом способствует подготовки и реализации направлений</p>\n<!-- /wp:paragraph -->', 'Список стран, куда можно улететь', '', 'publish', 'open', 'open', '', 'spisok-stran-kuda-mozhno-uletet', '', '', '2020-10-23 09:58:23', '2020-10-23 06:58:23', '', 0, 'http://universal.local/?p=73', 0, 'post', '', 0),
(74, 1, '2020-10-23 09:58:23', '2020-10-23 06:58:23', '<!-- wp:paragraph -->\n<p>Если вы приняли решение переехать в другую страну, чтобы найти там работу, сначала посмотрите на список стран, который мы подготовили для вас. Внутри важная информация про...</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития. Таким образом консультация с широким активом способствует подготовки и реализации направлений</p>\n<!-- /wp:paragraph -->', 'Список стран, куда можно улететь', '', 'inherit', 'closed', 'closed', '', '73-revision-v1', '', '', '2020-10-23 09:58:23', '2020-10-23 06:58:23', '', 73, 'http://universal.local/2020/10/23/73-revision-v1/', 0, 'revision', '', 0),
(75, 1, '2020-10-23 09:59:01', '2020-10-23 06:59:01', '<!-- wp:paragraph -->\n<p>Мы собрали на одной странице кучу ссылок на полезные русскоязычные каналы, посвященные айти. Тут можно найти видеоуроки, лекции и бесплатные курсы.</p>\n<!-- /wp:paragraph -->', 'Список Youtube каналов для тех, кто только начинает изучать разработку', '', 'publish', 'open', 'open', '', 'spisok-youtube-kanalov-dlya-teh-kto-tolko-na', '', '', '2020-10-23 09:59:01', '2020-10-23 06:59:01', '', 0, 'http://universal.local/?p=75', 0, 'post', '', 0);
INSERT INTO `universal_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(76, 1, '2020-10-23 09:59:01', '2020-10-23 06:59:01', '<!-- wp:paragraph -->\n<p>Мы собрали на одной странице кучу ссылок на полезные русскоязычные каналы, посвященные айти. Тут можно найти видеоуроки, лекции и бесплатные курсы.</p>\n<!-- /wp:paragraph -->', 'Список Youtube каналов для тех, кто только начинает изучать разработку', '', 'inherit', 'closed', 'closed', '', '75-revision-v1', '', '', '2020-10-23 09:59:01', '2020-10-23 06:59:01', '', 75, 'http://universal.local/2020/10/23/75-revision-v1/', 0, 'revision', '', 0),
(77, 1, '2020-10-26 15:31:13', '2020-10-26 12:31:13', '<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":80,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/photo-1578601789053-1c00ea465c7b.jpg\" alt=\"\" class=\"wp-image-80\"/><figcaption>Подпись</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":81,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/a51fd6f14848a62f767493c4835011bc-1.png\" alt=\"\" class=\"wp-image-81\"/><figcaption>Еще подпись</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":83,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/00bff314fb3e5c46fb745b8f485ccb35-scaled.jpg\" alt=\"\" class=\"wp-image-83\"/></figure>\n<!-- /wp:image -->', 'Выбор читателей: где удобнее работать фрилансеру', '', 'publish', 'open', 'open', '', 'vybor-chitatelej-gde-udobnee-rabotat', '', '', '2020-11-05 17:35:36', '2020-11-05 14:35:36', '', 0, 'http://universal.local/?p=77', 0, 'post', '', 0),
(78, 1, '2020-10-26 15:31:13', '2020-10-26 12:31:13', '<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":65,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/95c24b408dbcaa9fcc4fe1c132fcf231.png\" alt=\"Новый налоговый режим для фрилансеров\" class=\"wp-image-65\"/><figcaption>Подпись</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":64,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/14d7df03d2b443e53e00cc4e6a983eb2.png\" alt=\"Платные курсы\" class=\"wp-image-64\"/><figcaption>Еще подпись</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":63,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/488da55c5837f68066cd785ed95c4881.png\" alt=\"telegram\" class=\"wp-image-63\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":62,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/1d9dba774bdb3a921ecdc9282bae86bd.png\" alt=\"портфолио\" class=\"wp-image-62\"/></figure>\n<!-- /wp:image -->', 'Выбор читателей: где удобнее работать фрилансеру', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2020-10-26 15:31:13', '2020-10-26 12:31:13', '', 77, 'http://universal.local/2020/10/26/77-revision-v1/', 0, 'revision', '', 0),
(79, 1, '2020-10-26 16:28:58', '2020-10-26 13:28:58', '', 'Восстановление-бухгалтерского-учёта_2', '', 'inherit', 'open', 'closed', '', 'vosstanovlenie-buhgalterskogo-uchyota', '', '', '2020-10-26 16:28:58', '2020-10-26 13:28:58', '', 77, 'http://universal.local/wp-content/uploads/2020/10/Восстановление-бухгалтерского-учёта_2.jpg', 0, 'attachment', 'image/jpeg', 0),
(80, 1, '2020-10-26 16:29:22', '2020-10-26 13:29:22', '', 'photo-1578601789053-1c00ea465c7b', '', 'inherit', 'open', 'closed', '', 'photo-1578601789053-1c00ea465c7b', '', '', '2020-10-26 16:29:22', '2020-10-26 13:29:22', '', 77, 'http://universal.local/wp-content/uploads/2020/10/photo-1578601789053-1c00ea465c7b.jpg', 0, 'attachment', 'image/jpeg', 0),
(81, 1, '2020-10-26 16:29:51', '2020-10-26 13:29:51', '', 'a51fd6f14848a62f767493c4835011bc-1', '', 'inherit', 'open', 'closed', '', 'a51fd6f14848a62f767493c4835011bc-1', '', '', '2020-10-26 16:29:51', '2020-10-26 13:29:51', '', 77, 'http://universal.local/wp-content/uploads/2020/10/a51fd6f14848a62f767493c4835011bc-1.png', 0, 'attachment', 'image/png', 0),
(82, 1, '2020-10-26 16:30:00', '2020-10-26 13:30:00', '<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":80,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/photo-1578601789053-1c00ea465c7b.jpg\" alt=\"\" class=\"wp-image-80\"/><figcaption>Подпись</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":81,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/a51fd6f14848a62f767493c4835011bc-1.png\" alt=\"\" class=\"wp-image-81\"/><figcaption>Еще подпись</figcaption></figure>\n<!-- /wp:image -->', 'Выбор читателей: где удобнее работать фрилансеру', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2020-10-26 16:30:00', '2020-10-26 13:30:00', '', 77, 'http://universal.local/2020/10/26/77-revision-v1/', 0, 'revision', '', 0),
(83, 1, '2020-10-27 15:13:27', '2020-10-27 12:13:27', '', '00bff314fb3e5c46fb745b8f485ccb35', '', 'inherit', 'open', 'closed', '', '00bff314fb3e5c46fb745b8f485ccb35', '', '', '2020-10-27 15:13:27', '2020-10-27 12:13:27', '', 77, 'http://universal.local/wp-content/uploads/2020/10/00bff314fb3e5c46fb745b8f485ccb35.jpg', 0, 'attachment', 'image/jpeg', 0),
(84, 1, '2020-10-27 15:13:31', '2020-10-27 12:13:31', '<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":80,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/photo-1578601789053-1c00ea465c7b.jpg\" alt=\"\" class=\"wp-image-80\"/><figcaption>Подпись</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":81,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/a51fd6f14848a62f767493c4835011bc-1.png\" alt=\"\" class=\"wp-image-81\"/><figcaption>Еще подпись</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":83,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.local/wp-content/uploads/2020/10/00bff314fb3e5c46fb745b8f485ccb35-scaled.jpg\" alt=\"\" class=\"wp-image-83\"/></figure>\n<!-- /wp:image -->', 'Выбор читателей: где удобнее работать фрилансеру', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2020-10-27 15:13:31', '2020-10-27 12:13:31', '', 77, 'http://universal.local/2020/10/27/77-revision-v1/', 0, 'revision', '', 0),
(86, 1, '2020-10-27 20:01:06', '2020-10-27 17:01:06', '<!-- wp:paragraph -->\n<p>Каверзные и не очень вопросы, которых боятся новички, когда идут на собеседование.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->', 'Вопросы на собеседовании для джуна', '', 'publish', 'open', 'open', '', 'voprosy-na-sobesedovanii-dlya-dzhuna', '', '', '2020-10-27 20:01:06', '2020-10-27 17:01:06', '', 0, 'http://universal.local/?p=86', 0, 'post', '', 0),
(87, 1, '2020-10-27 20:01:06', '2020-10-27 17:01:06', '<!-- wp:paragraph -->\n<p>Каверзные и не очень вопросы, которых боятся новички, когда идут на собеседование.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->', 'Вопросы на собеседовании для джуна', '', 'inherit', 'closed', 'closed', '', '86-revision-v1', '', '', '2020-10-27 20:01:06', '2020-10-27 17:01:06', '', 86, 'http://universal.local/2020/10/27/86-revision-v1/', 0, 'revision', '', 0),
(88, 1, '2020-10-27 20:15:08', '2020-10-27 17:15:08', '<!-- wp:paragraph -->\n<p>Эти несколько упражнений помогут сохранить зрение. Можно делать их даже если</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->', 'Зарядка для глаз', '', 'publish', 'open', 'open', '', 'zaryadka-dlya-glaz', '', '', '2020-10-27 20:38:24', '2020-10-27 17:38:24', '', 0, 'http://universal.local/?p=88', 0, 'post', '', 0),
(89, 1, '2020-10-27 20:15:08', '2020-10-27 17:15:08', '<!-- wp:paragraph -->\n<p>Эти несколько упражнений помогут сохранить зрение. Можно делать их даже если...</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->', 'Зарядка для глаз', '', 'inherit', 'closed', 'closed', '', '88-revision-v1', '', '', '2020-10-27 20:15:08', '2020-10-27 17:15:08', '', 88, 'http://universal.local/2020/10/27/88-revision-v1/', 0, 'revision', '', 0),
(90, 1, '2020-10-27 20:15:45', '2020-10-27 17:15:45', '<!-- wp:paragraph -->\n<p>Какие плагины помогут быстро создать галерею, выпадающие списки или окна</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->', 'Топ плагинов jQuery', '', 'publish', 'open', 'open', '', 'top-plaginov-jquery', '', '', '2020-10-27 20:15:45', '2020-10-27 17:15:45', '', 0, 'http://universal.local/?p=90', 0, 'post', '', 0),
(91, 1, '2020-10-27 20:15:45', '2020-10-27 17:15:45', '<!-- wp:paragraph -->\n<p>Какие плагины помогут быстро создать галерею, выпадающие списки или окна</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->', 'Топ плагинов jQuery', '', 'inherit', 'closed', 'closed', '', '90-revision-v1', '', '', '2020-10-27 20:15:45', '2020-10-27 17:15:45', '', 90, 'http://universal.local/2020/10/27/90-revision-v1/', 0, 'revision', '', 0),
(92, 1, '2020-10-27 20:38:24', '2020-10-27 17:38:24', '<!-- wp:paragraph -->\n<p>Эти несколько упражнений помогут сохранить зрение. Можно делать их даже если</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Таким образом сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->', 'Зарядка для глаз', '', 'inherit', 'closed', 'closed', '', '88-revision-v1', '', '', '2020-10-27 20:38:24', '2020-10-27 17:38:24', '', 88, 'http://universal.local/2020/10/27/88-revision-v1/', 0, 'revision', '', 0),
(97, 1, '2020-10-29 19:57:38', '2020-10-29 16:57:38', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также реализация намеченных плановых заданий играет важную роль в формировании модели развития. Равным образом сложившаяся структура организации обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны начало повседневной работы по формированию позиции обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации. Не следует, однако забывать, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации модели развития.</p>\n<!-- /wp:paragraph -->', 'Контакты', '', 'publish', 'closed', 'closed', '', 'kontakty', '', '', '2020-10-29 19:57:38', '2020-10-29 16:57:38', '', 0, 'http://universal.local/?page_id=97', 0, 'page', '', 0),
(98, 1, '2020-10-29 19:57:38', '2020-10-29 16:57:38', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также реализация намеченных плановых заданий играет важную роль в формировании модели развития. Равным образом сложившаяся структура организации обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны начало повседневной работы по формированию позиции обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации. Не следует, однако забывать, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации модели развития.</p>\n<!-- /wp:paragraph -->', 'Контакты', '', 'inherit', 'closed', 'closed', '', '97-revision-v1', '', '', '2020-10-29 19:57:38', '2020-10-29 16:57:38', '', 97, 'http://universal.local/2020/10/29/97-revision-v1/', 0, 'revision', '', 0),
(99, 1, '2020-10-29 19:58:16', '2020-10-29 16:58:16', '<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом представляет собой интересный эксперимент проверки новых предложений. С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет оценить значение форм развития. Задача организации, в особенности же новая модель организационной деятельности требуют определения и уточнения направлений прогрессивного развития. Задача организации, в особенности же укрепление и развитие структуры влечет за собой процесс внедрения и модернизации дальнейших направлений развития. С другой стороны сложившаяся структура организации представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны укрепление и развитие структуры способствует подготовки и реализации системы обучения кадров, соответствует насущным потребностям. Идейные соображения высшего порядка, а также сложившаяся структура организации позволяет выполнять важные задания по разработке систем массового участия.</p>\n<!-- /wp:paragraph -->', 'Работа у нас', '', 'publish', 'closed', 'closed', '', 'rabota-u-nas', '', '', '2020-10-29 19:58:16', '2020-10-29 16:58:16', '', 0, 'http://universal.local/?page_id=99', 0, 'page', '', 0),
(100, 1, '2020-10-29 19:58:16', '2020-10-29 16:58:16', '<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом представляет собой интересный эксперимент проверки новых предложений. С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет оценить значение форм развития. Задача организации, в особенности же новая модель организационной деятельности требуют определения и уточнения направлений прогрессивного развития. Задача организации, в особенности же укрепление и развитие структуры влечет за собой процесс внедрения и модернизации дальнейших направлений развития. С другой стороны сложившаяся структура организации представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны укрепление и развитие структуры способствует подготовки и реализации системы обучения кадров, соответствует насущным потребностям. Идейные соображения высшего порядка, а также сложившаяся структура организации позволяет выполнять важные задания по разработке систем массового участия.</p>\n<!-- /wp:paragraph -->', 'Работа у нас', '', 'inherit', 'closed', 'closed', '', '99-revision-v1', '', '', '2020-10-29 19:58:16', '2020-10-29 16:58:16', '', 99, 'http://universal.local/2020/10/29/99-revision-v1/', 0, 'revision', '', 0),
(101, 1, '2020-10-29 19:58:31', '2020-10-29 16:58:31', '<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом представляет собой интересный эксперимент проверки новых предложений. С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет оценить значение форм развития. Задача организации, в особенности же новая модель организационной деятельности требуют определения и уточнения направлений прогрессивного развития. Задача организации, в особенности же укрепление и развитие структуры влечет за собой процесс внедрения и модернизации дальнейших направлений развития. С другой стороны сложившаяся структура организации представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны укрепление и развитие структуры способствует подготовки и реализации системы обучения кадров, соответствует насущным потребностям. Идейные соображения высшего порядка, а также сложившаяся структура организации позволяет выполнять важные задания по разработке систем массового участия.</p>\n<!-- /wp:paragraph -->', 'Реклама', '', 'publish', 'closed', 'closed', '', 'reklama', '', '', '2020-10-29 19:58:31', '2020-10-29 16:58:31', '', 0, 'http://universal.local/?page_id=101', 0, 'page', '', 0),
(102, 1, '2020-10-29 19:58:31', '2020-10-29 16:58:31', '<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом представляет собой интересный эксперимент проверки новых предложений. С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет оценить значение форм развития. Задача организации, в особенности же новая модель организационной деятельности требуют определения и уточнения направлений прогрессивного развития. Задача организации, в особенности же укрепление и развитие структуры влечет за собой процесс внедрения и модернизации дальнейших направлений развития. С другой стороны сложившаяся структура организации представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны укрепление и развитие структуры способствует подготовки и реализации системы обучения кадров, соответствует насущным потребностям. Идейные соображения высшего порядка, а также сложившаяся структура организации позволяет выполнять важные задания по разработке систем массового участия.</p>\n<!-- /wp:paragraph -->', 'Реклама', '', 'inherit', 'closed', 'closed', '', '101-revision-v1', '', '', '2020-10-29 19:58:31', '2020-10-29 16:58:31', '', 101, 'http://universal.local/2020/10/29/101-revision-v1/', 0, 'revision', '', 0),
(103, 1, '2020-10-29 19:58:48', '2020-10-29 16:58:48', '<!-- wp:paragraph -->\n<p>Не следует, однако забывать, что постоянное информационно-пропагандистское обеспечение нашей деятельности играет важную роль в формировании новых предложений. С другой стороны рамки и место обучения кадров требуют от нас анализа новых предложений. С другой стороны укрепление и развитие структуры в значительной степени обуславливает создание новых предложений. Товарищи! сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Значимость этих проблем настолько очевидна, что дальнейшее развитие различных форм деятельности влечет за собой процесс внедрения и модернизации систем массового участия. Значимость этих проблем настолько очевидна, что сложившаяся структура организации требуют определения и уточнения новых предложений.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что рамки и место обучения кадров в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности требуют от нас анализа форм развития. С другой стороны рамки и место обучения кадров влечет за собой процесс внедрения и модернизации новых предложений.</p>\n<!-- /wp:paragraph -->', 'Партнерство', '', 'publish', 'closed', 'closed', '', 'partnerstvo', '', '', '2020-10-29 19:58:48', '2020-10-29 16:58:48', '', 0, 'http://universal.local/?page_id=103', 0, 'page', '', 0),
(104, 1, '2020-10-29 19:58:48', '2020-10-29 16:58:48', '<!-- wp:paragraph -->\n<p>Не следует, однако забывать, что постоянное информационно-пропагандистское обеспечение нашей деятельности играет важную роль в формировании новых предложений. С другой стороны рамки и место обучения кадров требуют от нас анализа новых предложений. С другой стороны укрепление и развитие структуры в значительной степени обуславливает создание новых предложений. Товарищи! сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Значимость этих проблем настолько очевидна, что дальнейшее развитие различных форм деятельности влечет за собой процесс внедрения и модернизации систем массового участия. Значимость этих проблем настолько очевидна, что сложившаяся структура организации требуют определения и уточнения новых предложений.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что рамки и место обучения кадров в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности требуют от нас анализа форм развития. С другой стороны рамки и место обучения кадров влечет за собой процесс внедрения и модернизации новых предложений.</p>\n<!-- /wp:paragraph -->', 'Партнерство', '', 'inherit', 'closed', 'closed', '', '103-revision-v1', '', '', '2020-10-29 19:58:48', '2020-10-29 16:58:48', '', 103, 'http://universal.local/2020/10/29/103-revision-v1/', 0, 'revision', '', 0),
(105, 1, '2020-10-29 19:59:09', '2020-10-29 16:59:09', ' ', '', '', 'publish', 'closed', 'closed', '', '105', '', '', '2020-10-29 19:59:09', '2020-10-29 16:59:09', '', 0, 'http://universal.local/?p=105', 4, 'nav_menu_item', '', 0),
(106, 1, '2020-10-29 19:59:09', '2020-10-29 16:59:09', ' ', '', '', 'publish', 'closed', 'closed', '', '106', '', '', '2020-10-29 19:59:09', '2020-10-29 16:59:09', '', 0, 'http://universal.local/?p=106', 3, 'nav_menu_item', '', 0),
(107, 1, '2020-10-29 19:59:09', '2020-10-29 16:59:09', ' ', '', '', 'publish', 'closed', 'closed', '', '107', '', '', '2020-10-29 19:59:09', '2020-10-29 16:59:09', '', 0, 'http://universal.local/?p=107', 2, 'nav_menu_item', '', 0),
(108, 1, '2020-10-29 19:59:08', '2020-10-29 16:59:08', ' ', '', '', 'publish', 'closed', 'closed', '', '108', '', '', '2020-10-29 19:59:08', '2020-10-29 16:59:08', '', 0, 'http://universal.local/?p=108', 1, 'nav_menu_item', '', 0),
(109, 1, '2020-10-29 20:37:43', '2020-10-29 17:37:43', '', 'Обновления', '', 'publish', 'closed', 'closed', '', 'obnovleniya', '', '', '2020-10-29 20:38:19', '2020-10-29 17:38:19', '', 0, 'http://universal.local/?p=109', 1, 'nav_menu_item', '', 0),
(110, 1, '2020-10-29 20:38:19', '2020-10-29 17:38:19', '', 'Экспресс', '', 'publish', 'closed', 'closed', '', 'ekspress', '', '', '2020-10-29 20:38:19', '2020-10-29 17:38:19', '', 0, 'http://universal.local/?p=110', 2, 'nav_menu_item', '', 0),
(111, 1, '2020-10-29 20:38:19', '2020-10-29 17:38:19', '', 'Politics', '', 'publish', 'closed', 'closed', '', 'politics', '', '', '2020-10-29 20:38:19', '2020-10-29 17:38:19', '', 0, 'http://universal.local/?p=111', 3, 'nav_menu_item', '', 0),
(112, 1, '2020-10-29 20:38:19', '2020-10-29 17:38:19', '', 'Solar Eclipse', '', 'publish', 'closed', 'closed', '', 'solar-eclipse', '', '', '2020-10-29 20:38:19', '2020-10-29 17:38:19', '', 0, 'http://universal.local/?p=112', 4, 'nav_menu_item', '', 0),
(113, 1, '2020-10-29 20:40:09', '2020-10-29 17:40:09', ' ', '', '', 'publish', 'closed', 'closed', '', '113', '', '', '2020-10-29 20:40:09', '2020-10-29 17:40:09', '', 0, 'http://universal.local/?p=113', 2, 'nav_menu_item', '', 0),
(114, 1, '2020-10-29 20:40:09', '2020-10-29 17:40:09', ' ', '', '', 'publish', 'closed', 'closed', '', '114', '', '', '2020-10-29 20:40:09', '2020-10-29 17:40:09', '', 0, 'http://universal.local/?p=114', 3, 'nav_menu_item', '', 0),
(115, 1, '2020-10-29 20:40:09', '2020-10-29 17:40:09', ' ', '', '', 'publish', 'closed', 'closed', '', '115', '', '', '2020-10-29 20:40:09', '2020-10-29 17:40:09', '', 0, 'http://universal.local/?p=115', 4, 'nav_menu_item', '', 0),
(116, 1, '2020-10-29 20:40:08', '2020-10-29 17:40:08', ' ', '', '', 'publish', 'closed', 'closed', '', '116', '', '', '2020-10-29 20:40:08', '2020-10-29 17:40:08', '', 0, 'http://universal.local/?p=116', 1, 'nav_menu_item', '', 0),
(117, 1, '2020-10-29 20:40:59', '2020-10-29 17:40:59', '', 'Скринкасты', '', 'publish', 'closed', 'closed', '', 'skrinkasty', '', '', '2020-10-29 20:40:59', '2020-10-29 17:40:59', '', 0, 'http://universal.local/?p=117', 1, 'nav_menu_item', '', 0),
(118, 1, '2020-10-29 20:40:59', '2020-10-29 17:40:59', '', 'Уроки', '', 'publish', 'closed', 'closed', '', 'uroki', '', '', '2020-10-29 20:40:59', '2020-10-29 17:40:59', '', 0, 'http://universal.local/?p=118', 2, 'nav_menu_item', '', 0),
(119, 1, '2020-10-29 20:40:59', '2020-10-29 17:40:59', '', 'Вебинары', '', 'publish', 'closed', 'closed', '', 'vebinary', '', '', '2020-10-29 20:40:59', '2020-10-29 17:40:59', '', 0, 'http://universal.local/?p=119', 3, 'nav_menu_item', '', 0),
(120, 1, '2020-10-29 20:41:59', '2020-10-29 17:41:59', '', 'Платные интенсивы', '', 'publish', 'closed', 'closed', '', 'platnye-intensivy', '', '', '2020-10-29 20:41:59', '2020-10-29 17:41:59', '', 0, 'http://universal.local/?p=120', 1, 'nav_menu_item', '', 0),
(121, 1, '2020-10-29 20:41:59', '2020-10-29 17:41:59', '', 'Бесплатные стримы', '', 'publish', 'closed', 'closed', '', 'besplatnye-strimy', '', '', '2020-10-29 20:41:59', '2020-10-29 17:41:59', '', 0, 'http://universal.local/?p=121', 2, 'nav_menu_item', '', 0),
(122, 1, '2020-10-29 20:42:00', '2020-10-29 17:42:00', '', 'Мастер-классы', '', 'publish', 'closed', 'closed', '', 'master-klassy', '', '', '2020-10-29 20:42:00', '2020-10-29 17:42:00', '', 0, 'http://universal.local/?p=122', 3, 'nav_menu_item', '', 0),
(123, 1, '2020-10-29 20:42:00', '2020-10-29 17:42:00', '', 'Менторство', '', 'publish', 'closed', 'closed', '', 'mentorstvo', '', '', '2020-10-29 20:42:00', '2020-10-29 17:42:00', '', 0, 'http://universal.local/?p=123', 4, 'nav_menu_item', '', 0),
(124, 1, '2020-10-29 20:42:00', '2020-10-29 17:42:00', '', 'Буткемпы', '', 'publish', 'closed', 'closed', '', 'butkempy', '', '', '2020-10-29 20:42:00', '2020-10-29 17:42:00', '', 0, 'http://universal.local/?p=124', 5, 'nav_menu_item', '', 0),
(125, 1, '2020-10-29 20:42:57', '2020-10-29 17:42:57', '', 'Политика данных', '', 'publish', 'closed', 'closed', '', 'politika-dannyh', '', '', '2020-10-29 20:42:57', '2020-10-29 17:42:57', '', 0, 'http://universal.local/?p=125', 1, 'nav_menu_item', '', 0),
(126, 1, '2020-10-29 20:42:57', '2020-10-29 17:42:57', '', 'Оферта сайта', '', 'publish', 'closed', 'closed', '', 'oferta-sajta', '', '', '2020-10-29 20:42:57', '2020-10-29 17:42:57', '', 0, 'http://universal.local/?p=126', 2, 'nav_menu_item', '', 0),
(127, 1, '2020-10-29 20:42:57', '2020-10-29 17:42:57', '', 'Реквизиты', '', 'publish', 'closed', 'closed', '', 'rekvizity', '', '', '2020-10-29 20:42:57', '2020-10-29 17:42:57', '', 0, 'http://universal.local/?p=127', 3, 'nav_menu_item', '', 0),
(128, 1, '2020-10-29 20:42:40', '0000-00-00 00:00:00', '', 'Контакты', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-10-29 20:42:40', '0000-00-00 00:00:00', '', 0, 'http://universal.local/?p=128', 1, 'nav_menu_item', '', 0),
(129, 1, '2020-10-29 20:42:58', '2020-10-29 17:42:58', ' ', '', '', 'publish', 'closed', 'closed', '', '129', '', '', '2020-10-29 20:42:58', '2020-10-29 17:42:58', '', 0, 'http://universal.local/?p=129', 4, 'nav_menu_item', '', 0),
(130, 1, '2020-10-29 20:45:16', '2020-10-29 17:45:16', ' ', '', '', 'publish', 'closed', 'closed', '', '130', '', '', '2020-10-29 20:45:16', '2020-10-29 17:45:16', '', 0, 'http://universal.local/?p=130', 5, 'nav_menu_item', '', 0),
(131, 1, '2020-10-29 20:45:16', '2020-10-29 17:45:16', ' ', '', '', 'publish', 'closed', 'closed', '', '131', '', '', '2020-10-29 20:45:16', '2020-10-29 17:45:16', '', 23, 'http://universal.local/?p=131', 2, 'nav_menu_item', '', 0),
(132, 1, '2020-10-29 20:45:16', '2020-10-29 17:45:16', ' ', '', '', 'publish', 'closed', 'closed', '', '132', '', '', '2020-10-29 20:45:16', '2020-10-29 17:45:16', '', 23, 'http://universal.local/?p=132', 4, 'nav_menu_item', '', 0),
(133, 1, '2020-10-29 20:45:16', '2020-10-29 17:45:16', ' ', '', '', 'publish', 'closed', 'closed', '', '133', '', '', '2020-10-29 20:45:16', '2020-10-29 17:45:16', '', 23, 'http://universal.local/?p=133', 3, 'nav_menu_item', '', 0),
(134, 1, '2020-10-29 20:45:15', '2020-10-29 17:45:15', ' ', '', '', 'publish', 'closed', 'closed', '', '134', '', '', '2020-10-29 20:45:15', '2020-10-29 17:45:15', '', 0, 'http://universal.local/?p=134', 1, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `universal_termmeta`
--

CREATE TABLE `universal_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `universal_terms`
--

CREATE TABLE `universal_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_terms`
--

INSERT INTO `universal_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Без рубрики', 'bez-rubriki', 0),
(2, 'header menu', 'header-menu', 0),
(3, 'CSS', 'css', 0),
(4, 'css', 'css', 0),
(5, 'grid', 'grid', 0),
(6, 'Web design', 'web-design', 0),
(7, 'figma', 'figma', 0),
(8, 'web-design', 'web-design', 0),
(9, 'HTML', 'html', 0),
(10, 'retina', 'retina', 0),
(11, 'html', 'html', 0),
(12, 'javascript', 'javascript', 0),
(13, 'js', 'js', 0),
(14, 'фриланс', 'frilans', 0),
(15, 'flex', 'flex', 0),
(16, 'float', 'float', 0),
(17, 'chrome', 'chrome', 0),
(18, 'Статьи', 'articles', 0),
(19, 'Популярное', 'popular', 0),
(20, 'Расследования', 'investigation', 0),
(21, 'деньги', 'dengi', 0),
(22, 'трудоустройство', 'trudoustrojstvo', 0),
(23, 'Новости', 'news', 0),
(24, 'Мнения', 'opinions', 0),
(25, 'Горячее', 'hot', 0),
(26, 'Подборки', 'collections', 0),
(27, 'Фоторубрика', 'photo-report', 0),
(28, 'фото', 'foto', 0),
(29, 'фото репортаж', 'foto-reportazh', 0),
(30, 'Карьера', 'career', 0),
(31, 'карьера', 'karera', 0),
(32, 'Другое', 'other', 0),
(33, 'Footer menu', 'footer-menu', 0),
(34, 'Новости', 'novosti', 0),
(35, 'Статьи', 'stati', 0),
(36, 'Видеоуроки', 'videouroki', 0),
(37, 'Курсы', 'kursy', 0),
(38, 'Информация', 'informacziya', 0),
(39, 'Категории', 'kategorii', 0),
(40, 'Популярное', 'popular', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `universal_term_relationships`
--

CREATE TABLE `universal_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_term_relationships`
--

INSERT INTO `universal_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(7, 2, 0),
(8, 2, 0),
(9, 2, 0),
(10, 2, 0),
(11, 2, 0),
(12, 2, 0),
(13, 2, 0),
(16, 3, 0),
(16, 4, 0),
(16, 5, 0),
(27, 6, 0),
(27, 7, 0),
(27, 8, 0),
(29, 9, 0),
(29, 10, 0),
(29, 11, 0),
(31, 12, 0),
(31, 13, 0),
(31, 14, 0),
(31, 19, 0),
(33, 3, 0),
(33, 4, 0),
(33, 15, 0),
(33, 16, 0),
(33, 19, 0),
(35, 12, 0),
(35, 13, 0),
(35, 17, 0),
(35, 19, 0),
(44, 18, 0),
(44, 19, 0),
(49, 18, 0),
(49, 19, 0),
(51, 18, 0),
(51, 19, 0),
(54, 18, 0),
(54, 19, 0),
(56, 20, 0),
(56, 21, 0),
(56, 22, 0),
(59, 23, 0),
(67, 24, 0),
(69, 25, 0),
(71, 24, 0),
(73, 25, 0),
(75, 26, 0),
(77, 14, 0),
(77, 27, 0),
(77, 28, 0),
(77, 29, 0),
(86, 14, 0),
(86, 30, 0),
(86, 31, 0),
(88, 32, 0),
(90, 32, 0),
(105, 33, 0),
(106, 33, 0),
(107, 33, 0),
(108, 33, 0),
(109, 34, 0),
(110, 34, 0),
(111, 34, 0),
(112, 34, 0),
(113, 35, 0),
(114, 35, 0),
(115, 35, 0),
(116, 35, 0),
(117, 36, 0),
(118, 36, 0),
(119, 36, 0),
(120, 37, 0),
(121, 37, 0),
(122, 37, 0),
(123, 37, 0),
(124, 37, 0),
(125, 38, 0),
(126, 38, 0),
(127, 38, 0),
(129, 38, 0),
(130, 39, 0),
(131, 39, 0),
(132, 39, 0),
(133, 39, 0),
(134, 39, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `universal_term_taxonomy`
--

CREATE TABLE `universal_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_term_taxonomy`
--

INSERT INTO `universal_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'nav_menu', '', 0, 7),
(3, 3, 'category', '', 0, 2),
(4, 4, 'post_tag', '', 0, 2),
(5, 5, 'post_tag', '', 0, 1),
(6, 6, 'category', '', 0, 1),
(7, 7, 'post_tag', '', 0, 1),
(8, 8, 'post_tag', '', 0, 1),
(9, 9, 'category', '', 0, 1),
(10, 10, 'post_tag', '', 0, 1),
(11, 11, 'post_tag', '', 0, 1),
(12, 12, 'category', '', 0, 2),
(13, 13, 'post_tag', '', 0, 2),
(14, 14, 'post_tag', '', 0, 3),
(15, 15, 'post_tag', '', 0, 1),
(16, 16, 'post_tag', '', 0, 1),
(17, 17, 'post_tag', '', 0, 1),
(18, 18, 'category', '', 0, 4),
(19, 19, 'post_tag', '', 0, 7),
(20, 20, 'category', '', 18, 1),
(21, 21, 'post_tag', '', 0, 1),
(22, 22, 'post_tag', '', 0, 1),
(23, 23, 'category', '', 0, 1),
(24, 24, 'category', '', 23, 2),
(25, 25, 'category', '', 23, 2),
(26, 26, 'category', '', 23, 1),
(27, 27, 'category', '', 0, 1),
(28, 28, 'post_tag', '', 0, 1),
(29, 29, 'post_tag', '', 0, 1),
(30, 30, 'category', '', 0, 1),
(31, 31, 'post_tag', '', 0, 1),
(32, 32, 'category', '', 0, 2),
(33, 33, 'nav_menu', '', 0, 4),
(34, 34, 'nav_menu', '', 0, 4),
(35, 35, 'nav_menu', '', 0, 4),
(36, 36, 'nav_menu', '', 0, 3),
(37, 37, 'nav_menu', '', 0, 5),
(38, 38, 'nav_menu', '', 0, 4),
(39, 39, 'nav_menu', '', 0, 5),
(40, 40, 'category', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `universal_usermeta`
--

CREATE TABLE `universal_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_usermeta`
--

INSERT INTO `universal_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'k@tr1Na'),
(2, 1, 'first_name', 'Екатерина'),
(3, 1, 'last_name', 'Новик'),
(4, 1, 'description', 'Поверь в себя и у тебя обязательно все получится!'),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'universal_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'universal_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"86c66a68b586c0cad583df5b3aec159798a905ad0dd741fb545d90ff57b61352\";a:4:{s:10:\"expiration\";i:1604685475;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36\";s:5:\"login\";i:1604512675;}}'),
(17, 1, 'universal_dashboard_quick_press_last_post_id', '14'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19, 1, 'universal_user-settings', 'libraryContent=browse'),
(20, 1, 'universal_user-settings-time', '1602090145'),
(21, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(22, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(23, 1, 'nav_menu_recently_edited', '39'),
(24, 1, '_new_email', 'a:2:{s:4:\"hash\";s:32:\"9805a6060a9963f5c81a2ecc7efff683\";s:8:\"newemail\";s:23:\"katrina.nov13@gmail.com\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `universal_users`
--

CREATE TABLE `universal_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_users`
--

INSERT INTO `universal_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'k@tr1Na', '$P$BSK61aYiides/IL2mgupktFO9Kxt/41', 'ktr1na', 'katrina.new13@yandex.ru', 'http://universal.local', '2020-10-02 17:18:39', '', 0, 'Екатерина');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `universal_commentmeta`
--
ALTER TABLE `universal_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `universal_comments`
--
ALTER TABLE `universal_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Индексы таблицы `universal_links`
--
ALTER TABLE `universal_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Индексы таблицы `universal_options`
--
ALTER TABLE `universal_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Индексы таблицы `universal_postmeta`
--
ALTER TABLE `universal_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `universal_posts`
--
ALTER TABLE `universal_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Индексы таблицы `universal_termmeta`
--
ALTER TABLE `universal_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `universal_terms`
--
ALTER TABLE `universal_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Индексы таблицы `universal_term_relationships`
--
ALTER TABLE `universal_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Индексы таблицы `universal_term_taxonomy`
--
ALTER TABLE `universal_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Индексы таблицы `universal_usermeta`
--
ALTER TABLE `universal_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `universal_users`
--
ALTER TABLE `universal_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `universal_commentmeta`
--
ALTER TABLE `universal_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `universal_comments`
--
ALTER TABLE `universal_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `universal_links`
--
ALTER TABLE `universal_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `universal_options`
--
ALTER TABLE `universal_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=635;

--
-- AUTO_INCREMENT для таблицы `universal_postmeta`
--
ALTER TABLE `universal_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=621;

--
-- AUTO_INCREMENT для таблицы `universal_posts`
--
ALTER TABLE `universal_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT для таблицы `universal_termmeta`
--
ALTER TABLE `universal_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `universal_terms`
--
ALTER TABLE `universal_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `universal_term_taxonomy`
--
ALTER TABLE `universal_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `universal_usermeta`
--
ALTER TABLE `universal_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `universal_users`
--
ALTER TABLE `universal_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
