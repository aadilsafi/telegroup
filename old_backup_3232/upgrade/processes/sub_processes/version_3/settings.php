<?php

DB::connect()->update("gr_settings", ['setting' => 'api_secret_key'], ['setting' => 'api_secretkey']);

$columns = $join = $where = null;
$columns = [
'newentry.setting','newentry.options','newentry.value',
'newentry.field_attributes','newentry.settings_order','newentry.updated_on',
'newentry.required','newentry.category','old_entry.setting_id(old_entry)'
];

$join["[>]gr_settings(old_entry)"] = ["newentry.setting" => "setting"];
$where['OR'] = ['old_entry.setting_id(#first)' => null, 'old_entry.setting_id(#second)' => '', 'old_entry.setting_id(#third)' => 0];
$settings = DB::connect()->select("new_grupo_version_settings(newentry)", $join, $columns, $where);

foreach ($settings as $setting) {

    if (empty($setting['old_entry'])) {
        $insert_data = array();
        $insert_data['setting'] = $setting['setting'];
        $insert_data['options'] = $setting['options'];
        $insert_data['value'] = $setting['value'];
        $insert_data['field_attributes'] = $setting['field_attributes'];
        $insert_data['settings_order'] = $setting['settings_order'];
        $insert_data['required'] = $setting['required'];
        $insert_data['category'] = $setting['category'];
        $insert_data['updated_on'] = $setting['updated_on'];
        DB::connect()->insert("gr_settings", $insert_data);
    }

}

$system_message = 'Dropping old tables';
$redirect = 'update_database';
$sub_process = 'drop_tables';
