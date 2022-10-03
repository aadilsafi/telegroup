<?php

if (is_admin()) {
    function grupo_wp_admin_menu()
    {
        add_options_page('Grupo WP Integration', 'Integrate Grupo Chat', 'manage_options', 'grupo_wp_integration', 'grupo_wp_config_page');
    }

    add_action('admin_menu', 'grupo_wp_admin_menu');

    function grupo_wp_config_page()
    {
        echo '<div class="wrap">';
        echo '<h1>Integrate Grupo Chatroom</h1>';
        echo '<p class="description">';
        echo 'Grupo Pro is a codecanyon exclusive chat room script which includes a wide range of ';
        echo '<a href="https://1.envato.market/N110v">Features</a>';
        echo '</p>';
        echo '<p>Easily Integrate Grupo Pro with your Wordpress website. This plugin requires Grupo Pro Version >= 3.1</p>';
        echo '<p><br><br></p>';

        echo '<form action="options.php" method="post">';

        settings_fields('grupo_pro_wp_fields');
        do_settings_sections('grupo_pro_wp_fields');

        echo '<input name="submit" class="button button-primary" type="submit" value="Update"/>';
        echo '</form>';

        echo '<p><br><br></p>';
        echo '<h3>How to Embed Grupo Chat</h3>';
        echo '<p>Paste the shortcode anywhere inside the pages/posts/widget where you want to embed Grupo Pro.</p>';
        echo '<p class="grupo_short_code">[embed_grupo_pro load_url="" width="411px" height="650px" open_in_parent_window=false require_wp_login=false]</p>';
        echo '<h4>Attributes :';
        echo '</h4>';
        echo '<ul>';
        echo '<li>';
        echo '<b>load_url</b>';
        echo ': Leave empty or specify the Group/Profile (URL) you wish to embed.</li>';
        echo '<li>';
        echo '<b>width</b>';
        echo ': The width attribute specifies the height of the embedded content.</li>';
        echo '<li>';
        echo '<b>height</b>';
        echo ': The height attribute specifies the height of the embedded content.</li>';
        echo '<li>';
        echo '<b>require_wp_login</b>';
        echo ': Whether Wordpress login required to view page [true|false]</li>';
        echo '<li>';
        echo '<b>open_in_parent_window</b>';
        echo ': Whether to force Grupo to be opened in the parent window [true|false]</li>';
        echo '</ul>';
        echo '</div>';

        echo '<style>';
        echo '.grupo_short_code {';
        echo 'background: white;';
        echo 'padding: 15px;';
        echo 'font-size: 15px;';
        echo 'font-weight: 600;';
        echo '}';
        echo '</style>';
    }

    function grupo_pro_wp_register_options()
    {
        register_setting('grupo_pro_wp_fields', 'grupo_pro_wp_options', 'grupo_pro_wp_validate');
        add_settings_section('grupo_pro_wp_api_intro_section', 'Grupo API', 'grupo_pro_wp_api_intro', 'grupo_pro_wp_fields');
        add_settings_field('grupo_pro_wp_status', 'Status', 'grupo_pro_wp_status_field', 'grupo_pro_wp_fields', 'grupo_pro_wp_api_intro_section');
        add_settings_field('grupo_pro_wp_api_secret_key', 'API Secret Key', 'grupo_pro_wp_api_secret_key_field', 'grupo_pro_wp_fields', 'grupo_pro_wp_api_intro_section');
        add_settings_field('grupo_pro_wp_web_address', 'Your Grupo Web Address', 'grupo_pro_wp_web_address_field', 'grupo_pro_wp_fields', 'grupo_pro_wp_api_intro_section');
    }
    add_action('admin_init', 'grupo_pro_wp_register_options');

    function grupo_pro_wp_validate($input)
    {
        $options = get_option('grupo_pro_wp_options');
        if (empty($input['secret_key'])) {
            add_settings_error('grupo_pro_wp_api_secret_key', 'grupo_pro_wp_validate_error', 'Invalid API Secret Key', 'error');
            return $options;
        } else {
            if (!filter_var($input['web_address'], FILTER_VALIDATE_URL)) {
                add_settings_error('grupo_pro_wp_web_address', 'grupo_pro_wp_validate_error', 'Invalid Webaddress (URL)', 'error');
                return $options;
            } else {
                $grupo_wp_post_data = [
                  'api_secret_key' => $input['secret_key'],
                  'add' => 'login_session',
                  'user' => 'api_request_test583602'
                ];
                $grupo_wp_post_args = [
                  'body' => $grupo_wp_post_data,
                  'timeout' => '15',
                  'redirection' => '5',
                  'httpversion' => '1.0',
                  'blocking' => true,
                  'headers' => array(),
                  'cookies' => array()
                ];
                $grupo_api_request_url = rtrim($input['web_address'], '/').'/api_request/';
                $grupo_wp_curl_response = wp_remote_post($grupo_api_request_url, $grupo_wp_post_args);

                if (is_wp_error($grupo_wp_curl_response)) {
                    $grupo_wp_curl_response = null;
                } else {
                    $grupo_wp_curl_response = json_decode($grupo_wp_curl_response['body']);
                }

                if (!empty($grupo_wp_curl_response) && is_object($grupo_wp_curl_response)) {
                    if (isset($grupo_wp_curl_response->error_key) && $grupo_wp_curl_response->error_key === 'invalid_api_secret_key') {
                        add_settings_error('grupo_pro_wp_api_secret_key', 'grupo_pro_wp_validate_error', 'Invalid API Secret Key', 'error');
                        return $options;
                    } else {
                        return $input;
                    }
                } else {
                    add_settings_error('grupo_pro_wp_web_address', 'grupo_pro_wp_validate_error', 'Invalid Grupo Webaddress (URL)', 'error');
                    return $options;
                }
            }
        }
    }

    function grupo_pro_wp_api_intro()
    {
        echo '<p>Check Grupo General Settings for API Secret Key.</p>';
    }

    function grupo_pro_wp_status_field()
    {
        $options = get_option('grupo_pro_wp_options');
        if (!isset($options['status'])) {
            $options['status'] = 'disable';
        }
        echo '<select name="grupo_pro_wp_options[status]">';
        echo '<option value="enable" ' . selected($options["status"], 'enable') . '>Enable</option>';
        echo '<option value="disable" ' . selected($options["status"], 'disable') . '>Disable</option>';
        echo '</select>';
    }

    function grupo_pro_wp_api_secret_key_field()
    {
        $options = get_option('grupo_pro_wp_options');
        if (!isset($options['secret_key'])) {
            $options['secret_key']='';
        }
        echo "<input id='grupo_pro_wp_api_secret_key' name='grupo_pro_wp_options[secret_key]' type='text' value='" . esc_attr($options['secret_key']) . "' />";
    }
    function grupo_pro_wp_web_address_field()
    {
        $options = get_option('grupo_pro_wp_options');
        if (!isset($options['web_address'])) {
            $options['web_address']='';
        }
        echo "<input id='grupo_pro_wp_web_address' name='grupo_pro_wp_options[web_address]' type='text' value='" . esc_attr($options['web_address']) . "' />";
    }
}
