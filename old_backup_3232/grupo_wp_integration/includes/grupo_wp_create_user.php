<?php

function grupo_pro_wp_create_user($user_id, $private_data = array())
{
    $user_info = get_user_by('id', $user_id);
    $user_avatar = null;
    $grupo_wp_post_data = [
      'api_secret_key' => GRUPO_PRO_WP_OPTIONS['secret_key'],
      'add' => 'site_users',
      'full_name' => 'Unknown',
      'username' => $user_info->user_login,
      'email_address' => $user_info->user_email,
      'password' => $user_info->user_pass,
    ];

    if (isset($private_data['alter_username'])) {
        $grupo_wp_post_data['username'] = $user_info->user_login.'_'.rand(123456, 12345678);
    }

    if (empty($user_info->display_name)) {
        $grupo_wp_post_data['full_name'] = $user_info->user_login;
    } else {
        $grupo_wp_post_data['full_name'] = $user_info->display_name;
    }

    if (function_exists('WPF')) {
        $user_avatar = WPF()->member->get_avatar($user_id);
        preg_match("/src='([^']*)'/i", $user_avatar, $user_avatar_url) ;
        if (isset($user_avatar_url[0])) {
            $user_avatar = $user_avatar_url[0];
            $user_avatar= str_replace("src='",'',$user_avatar);
            $user_avatar= str_replace("'",'',$user_avatar);
        } else {
            $user_avatar = null;
        }
    }
    if (empty($user_avatar) && function_exists('bp_core_fetch_avatar')) {
        $user_avatar = bp_core_fetch_avatar(array('item_id' => $user_id,'type' => 'full', 'html' => false));
    } else {
        $user_avatar = get_avatar_url($user_id);
    }

    if (!empty($user_avatar)) {
        $grupo_wp_post_data['avatarURL'] = $user_avatar;
    }

    if (user_can($user_id, 'manage_options')) {
        $grupo_wp_post_data['site_role_attribute'] = 'administrators';
    }

    $grupo_wp_post_args = [
      'body' => $grupo_wp_post_data,
      'timeout' => '20',
      'redirection' => '5',
      'httpversion' => '1.0',
      'blocking' => true,
      'headers' => array(),
      'cookies' => array()
    ];

    $grupo_api_request_url = rtrim(GRUPO_PRO_WP_OPTIONS['web_address'], '/').'/api_request/';
    $grupo_wp_curl_response = wp_remote_post($grupo_api_request_url, $grupo_wp_post_args);

    if (is_wp_error($grupo_wp_curl_response)) {
        $grupo_wp_curl_response = null;
    } else {
        $grupo_wp_curl_response = json_decode($grupo_wp_curl_response['body']);
    }

    if (!empty($grupo_wp_curl_response) && is_object($grupo_wp_curl_response)) {
        if (isset($grupo_wp_curl_response->error_key)) {
            if ($grupo_wp_curl_response->error_key === 'username_exists') {
                $private_data['alter_username'] = true;
                grupo_pro_wp_create_user($user_id, $private_data);
            }
        }
    }
}
