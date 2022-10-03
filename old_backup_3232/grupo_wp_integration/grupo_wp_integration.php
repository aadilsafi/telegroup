<?php
/**
 * @package Grupo Chatroom WP Integration
 * @version 1.0
 */
/*
Plugin Name: Grupo Chatroom WP Integration
Plugin URI: https://1.envato.market/N110v
Description: Integrate Grupo Chat with your Wordpress Website. Requires Grupo Chat Version >= 3.1
Author: BaeVox
Version: 1.0.0
Author URI: https://baevox.com
*/


define('GRUPO_PRO_WP_PLUGIN_DIR', plugin_dir_path(__FILE__));
define('GRUPO_PRO_WP_OPTIONS', get_option('grupo_pro_wp_options'));

require_once(GRUPO_PRO_WP_PLUGIN_DIR . 'includes/grupo_wp_dashboard.php');


if (isset(GRUPO_PRO_WP_OPTIONS['status']) && GRUPO_PRO_WP_OPTIONS['status'] === 'enable') {

    require_once(GRUPO_PRO_WP_PLUGIN_DIR . 'includes/grupo_wp_create_user.php');
    require_once(GRUPO_PRO_WP_PLUGIN_DIR . 'includes/grupo_wp_update_user_details.php');
    require_once(GRUPO_PRO_WP_PLUGIN_DIR . 'includes/grupo_wp_update_user_avatar.php');
    require_once(GRUPO_PRO_WP_PLUGIN_DIR . 'includes/grupo_wp_delete_user.php');
    require_once(GRUPO_PRO_WP_PLUGIN_DIR . 'includes/grupo_wp_user_logout.php');
    require_once(GRUPO_PRO_WP_PLUGIN_DIR . 'includes/grupo_wp_embed_chat.php');

    add_action('user_register', 'grupo_pro_wp_create_user');
    add_action('profile_update', 'grupo_pro_wp_update_user_details', 10, 2);
    add_action('xprofile_avatar_uploaded', 'grupo_pro_wp_update_user_avatar');
    add_action('wp_logout', 'grupo_pro_wp_user_logout');
    add_action('delete_user', 'grupo_pro_wp_delete_user');
    add_shortcode('embed_grupo_pro', 'grupo_pro_wp_embed_chat');
}
