<?php

function grupo_pro_wp_update_user_avatar($user_id, $private_data=array())
{
    $user_info = get_user_by('id', $user_id);
    $user_avatar = null;

    $grupo_wp_post_data = [
      'api_secret_key' => GRUPO_PRO_WP_OPTIONS['secret_key'],
      'update' => 'site_users',
      'user' => $user_info->user_email,
    ];

    if (function_exists('WPF')) {
        $user_avatar = WPF()->member->get_avatar($user_id);
        preg_match("/src='([^']*)'/i", $user_avatar, $user_avatar_url) ;
        if (isset($user_avatar_url[0])) {
            $user_avatar = $user_avatar_url[0];
            $user_avatar= str_replace("src='", '', $user_avatar);
            $user_avatar= str_replace("'", '', $user_avatar);
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
                    grupo_pro_wp_update_user_details($user_id, $old_user_data, $private_data);
                }
            }
        }
    }
}
