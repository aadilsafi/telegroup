<?php


function grupo_pro_wp_embed_chat($embed_params = array())
{
    $grupo_wp_response='';
    $short_code_parameters=[
      'load_url' => '',
      'width' => '411px',
      'height' => '650px',
      'require_wp_login' => false,
      'open_in_parent_window' => false
    ];

    extract(shortcode_atts($short_code_parameters, $embed_params));

    if (is_user_logged_in()) {
        $logged_in_user_info = wp_get_current_user();

        if (isset($logged_in_user_info->user_email) && !empty($logged_in_user_info->user_email)) {
            $grupo_wp_post_data = [
              'api_secret_key' => GRUPO_PRO_WP_OPTIONS['secret_key'],
              'add' => 'login_session',
              'user' => $logged_in_user_info->user_email
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
                $grupo_wp_response = "UNABLE TO CONNECT YOUR CHATROOM";
                $grupo_wp_curl_response = null;
            } else {
                $grupo_wp_curl_response = json_decode($grupo_wp_curl_response['body']);
            }

            if (!empty($grupo_wp_curl_response) && is_object($grupo_wp_curl_response)) {
                if (isset($grupo_wp_curl_response->success) && $grupo_wp_curl_response->success) {
                    $auto_login_url = $grupo_wp_curl_response->auto_login_url;

                    if (isset($embed_params['load_url']) && !empty($embed_params['load_url'])) {
                        $auto_login_url .= '&redirect='.urlencode($embed_params['load_url']);
                    }

                    if (isset($embed_params['open_in_parent_window']) && $embed_params['open_in_parent_window'] === 'true') {
                        $grupo_wp_response = '<script>window.location.href ="'.$auto_login_url.'";</script>';
                    } else {
                        $attributes = 'width="'.$embed_params['width'].'" height="'.$embed_params['height'].'" src="'.$auto_login_url.'"';
                        $grupo_wp_response ='<iframe '.$attributes.' allow="camera;microphone" frameborder=0 allowfullscreen></iframe>';
                    }
                } elseif (isset($grupo_wp_curl_response->error_key)) {
                    if ($grupo_wp_curl_response->error_key === 'account_not_found') {
                        grupo_pro_wp_create_user($logged_in_user_info->ID);
                        $grupo_wp_response = '<script>location.reload();</script>';
                    } else {
                        $grupo_wp_response = "SOMETHING WENT WRONG - [".$grupo_wp_curl_response->error_key."]";
                    }
                }
            }
        } else {
            $grupo_wp_response = "NOT A VALID EMAIL ADDRESS";
        }
    } else {
        if (isset($embed_params['require_wp_login']) && $embed_params['require_wp_login'] === 'true') {
            $redirect = site_url();
            $grupo_wp_response = '<script>window.location.href ="'.$redirect.'";</script>';
        } else {
            $load_url = GRUPO_PRO_WP_OPTIONS['web_address'];

            if (isset($embed_params['load_url']) && !empty($embed_params['load_url'])) {
                $load_url = $embed_params['load_url'];
            }

            if (isset($embed_params['open_in_parent_window']) && $embed_params['open_in_parent_window'] === 'true') {
                $grupo_wp_response = '<script>window.location.href ="'.$load_url.'";</script>';
            } else {
                $attributes = 'width="'.$embed_params['width'].'" height="'.$embed_params['height'].'" src="'.$load_url.'"';
                $grupo_wp_response ='<iframe '.$attributes.' allow="camera;microphone" frameborder=0 allowfullscreen></iframe>';
            }
        }
    }

    return $grupo_wp_response;
}
