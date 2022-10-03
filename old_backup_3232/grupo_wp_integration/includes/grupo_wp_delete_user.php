<?php

function grupo_pro_wp_delete_user($user_id)
{
    $user_info = get_user_by('id', $user_id);

    if (isset($user_info->user_email)) {

        $grupo_wp_post_data = [
          'api_secret_key' => GRUPO_PRO_WP_OPTIONS['secret_key'],
          'remove' => 'site_users',
          'user' => $user_info->user_email
        ];

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
        }
    }
}
