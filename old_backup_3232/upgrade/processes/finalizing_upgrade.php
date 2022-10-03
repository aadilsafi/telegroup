<?php

if (file_exists('../pages/rebuild_cache_system.php')) {
    unlink('../pages/rebuild_cache_system.php');
}

if (file_exists('../htaccess.backup')) {
    unlink('../htaccess.backup');
}

$system_message= 'Grupo Upgraded Successfully.';

$list_items ='';

$new_upgrade_folder = '../upgrade'.rand(32323232, 1212332233221).rand(10320, 22320).'/';

$rename = @rename('../upgrade/',$new_upgrade_folder);

if(!$rename){
  $list_items .= '<li>Rename/Delete Upgrade Folder.</li>';
}

$list_items .= '<li>Clear your browser cache.</li>';
$list_items .= '<li>Clear your CDN cache. (if any, for eg : Cloudflare)</li>';
$list_items .= '<li>Login & Check Site Roles & Group Roles.</li>';
