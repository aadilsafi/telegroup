<?php

include('functions/files/remove.php');
include('functions/files/copy.php');

$skip_overwrite = ['assets'];
$skip_folders = ['assets','upgrade'];
$skip_asset_folders = ['files','cache','headers_footers','fonts'];

$old_files = scandir('../');
$old_files = array_diff($old_files, array('..', '.'));

if (file_exists('../assets/css/common/custom_css.css')) {
    copy('../assets/css/common/custom_css.css', '../assets/old_custom_css.css');
}

foreach ($old_files as $files) {
    $name = basename($files);
    $files='../'.$files;
    if (!empty($name) && !in_array($name, $skip_folders)) {
        if (is_dir($files)) {
            rrmdir($files);
        } else {
            unlink($files);
        }
    }
}

$assets_folder = scandir('../assets/');
$assets_folder = array_diff($assets_folder, array('..', '.'));
foreach ($assets_folder as $assets) {
    $name = basename($assets);
    $assets ='../assets/'.$assets;

    if (!in_array($name, $skip_asset_folders) && $name!='old_custom_css.css') {
        if (is_dir($assets)) {
            rrmdir($assets);
        } else {
            unlink($assets);
        }
    }
}
if (file_exists('upgrade_image/assets/files/slideshows/')) {
    rrmdir('upgrade_image/assets/files/slideshows/');
}

$new_files = scandir('upgrade_image/');
$new_files = array_diff($new_files, array('..', '.'));

foreach ($new_files as $files) {
    $name = basename($files);
    $files = 'upgrade_image/'.$files;


    if (!in_array($name, $skip_overwrite) && $name!='image.zip') {
        if (is_dir($files)) {
            $new_folder ='../'.$name;

            if (!file_exists($new_folder)) {
                mkdir($new_folder);
            }
            recurseCopy($files, $new_folder);
        } else {
            $new_filename='../'.$name;
            copy($files, $new_filename);
        }
    } elseif ($name!='image.zip') {
        if ($name === 'assets') {
            $assets_folder = scandir('upgrade_image/assets/');
            $assets_folder = array_diff($assets_folder, array('..', '.'));

            foreach ($assets_folder as $assets) {
                $directory = basename($assets);
                $assets = 'upgrade_image/assets/'.$assets;

                if (!in_array($directory, $skip_asset_folders)) {
                    if (is_dir($assets)) {
                        $new_folder ='../assets/'.$directory;

                        if (!file_exists($new_folder)) {
                            mkdir($new_folder);
                        }
                        recurseCopy($assets, $new_folder);
                    } else {
                        $new_filename='../assets/'.$directory;
                        copy($assets, $new_filename);
                    }
                } else {
                    if (is_dir($assets)) {
                        $directory = '../assets/'.$directory;
                        recurseCopy_not_Exists($assets, $directory);
                    }
                }
            }
        }
    }
}

if (file_exists('../assets/old_custom_css.css')) {
    rename('../assets/old_custom_css.css', '../assets/css/common/custom_css.css');
}

if (file_exists('../pages/installer.php')) {
    unlink('../pages/installer.php');
}

if (!file_exists('../.htaccess')) {
    copy('upgrade_image/.htaccess', '../.htaccess');
}
