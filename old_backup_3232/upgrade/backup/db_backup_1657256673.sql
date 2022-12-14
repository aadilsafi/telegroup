

CREATE TABLE `gr_audio_player` (
  `audio_content_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `audio_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio_type` int(11) NOT NULL DEFAULT '1' COMMENT '1 = Radio 2 = Playlist',
  `radio_stream_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` int(11) NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`audio_content_id`),
  KEY `idx__disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_badges` (
  `badge_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `string_constant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `badge_category` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile',
  `disabled` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`badge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_badges_assigned` (
  `badge_assigned_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `badge_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `assigned_on` datetime NOT NULL,
  PRIMARY KEY (`badge_assigned_id`),
  KEY `badge_id_fk` (`badge_id`),
  KEY `user_id_fk_20` (`user_id`),
  KEY `group_id_fk_8` (`group_id`),
  CONSTRAINT `badge_id_fk` FOREIGN KEY (`badge_id`) REFERENCES `gr_badges` (`badge_id`) ON DELETE CASCADE,
  CONSTRAINT `group_id_fk_8` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_20` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_complaints` (
  `complaint_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reason` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `group_message_id` bigint(20) DEFAULT NULL,
  `private_chat_message_id` bigint(20) DEFAULT NULL,
  `comments_by_complainant` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `complainant_user_id` bigint(20) DEFAULT NULL,
  `complaint_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Under Review\r\n1 = Action Taken\r\n2 = Rejected',
  `reviewer_user_id` bigint(20) DEFAULT NULL,
  `comments_by_reviewer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `user_id_fk_7` (`complainant_user_id`),
  KEY `idx__complaint_status_complaint_id` (`complaint_status`,`complaint_id`),
  CONSTRAINT `user_id_fk_7` FOREIGN KEY (`complainant_user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_cron_jobs` (
  `cron_job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_job` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_job_access_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_job_parameters` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `last_run_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cron_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_css_variables` (
  `css_variable_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `css_variable` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_variable_value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_scheme` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light_mode',
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`css_variable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_css_variables VALUES("1","chat-page-primary-bg-color","#F7F9FB","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("2","chat-page-primary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("3","side-navigation-primary-bg-color","#F7F9FB","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("4","side-navigation-secondary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("5","side-navigation-tertiary-bg-color","#EFF1F3","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("6","side-navigation-quaternary-bg-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("7","side-navigation-primary-text-color","#828282","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("8","side-navigation-secondary-text-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("9","side-navigation-tertiary-text-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("10","side-navigation-quaternary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("11","side-navigation-primary-border-color","#DFE7EF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("12","side-navigation-primary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("13","side-navigation-secondary-font-size","13px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("14","side-navigation-tertiary-font-size","20px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("15","left-side-content-primary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("16","left-side-content-secondary-bg-color","#F7F9FB","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("17","left-side-content-tertiary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("18","left-side-content-quaternary-bg-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("19","left-side-content-quinary-bg-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("20","left-side-content-senary-bg-color","#F8D7DA","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("21","left-side-content-septenary-bg-color","#FFC107","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("22","left-side-content-octonary-bg-color","#FF5722","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("23","left-side-content-nonary-bg-color","#F48FB1","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("24","left-side-content-denary-bg-color","#F06292","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("25","left-side-content-primary-text-color","#696767","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("26","left-side-content-secondary-text-color","#828588","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("27","left-side-content-tertiary-text-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("28","left-side-content-quaternary-text-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("29","left-side-content-quinary-text-color","#721C24","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("30","left-side-content-senary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("31","left-side-content-primary-border-color","#DFE7EF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("32","left-side-content-secondary-border-color","#E88A93","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("33","left-side-content-tertiary-border-color","#EC407A","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("34","left-side-content-quaternary-border-color","#D7DDE3","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("35","left-side-content-primary-font-size","13px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("36","left-side-content-secondary-font-size","12px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("37","left-side-content-tertiary-font-size","15px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("38","left-side-content-quaternary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("39","left-side-content-quinary-font-size","11px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("40","left-side-content-senary-font-size","25px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("41","left-side-content-septenary-font-size","20px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("42","audio-player-primary-bg-color","#050517","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("43","audio-player-secondary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("44","audio-player-tertiary-bg-color","#FF4E8A","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("45","audio-player-quaternary-bg-color","#202030","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("46","audio-player-quinary-bg-color","#EFF1F3","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("47","audio-player-senary-bg-color","#E45E8C","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("48","audio-player-primary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("49","audio-player-secondary-text-color","#696969","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("50","audio-player-tertiary-text-color","#97A1A9","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("51","audio-player-quaternary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("52","audio-player-quinary-text-color","#959595","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("53","audio-player-senary-text-color","#FF6D9F","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("54","audio-player-primary-border-color","#DFE7EF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("55","audio-player-primary-font-size","20px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("56","audio-player-secondary-font-size","15px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("57","audio-player-tertiary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("58","audio-player-quaternary-font-size","13px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("59","audio-player-quinary-font-size","27px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("60","audio-player-senary-font-size","11px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("61","form-primary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("62","form-secondary-bg-color","#F7F9FB","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("63","form-tertiary-bg-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("64","form-quaternary-bg-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("65","form-quinary-bg-color","#000000","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("66","form-senary-bg-color","#F8D7DA","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("67","form-septenary-bg-color","#E8EBEF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("68","form-octonary-bg-color","#F06292","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("69","form-primary-text-color","#808080","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("70","form-secondary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("71","form-tertiary-text-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("72","form-quaternary-text-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("73","form-quinary-text-color","#721C24","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("74","form-primary-border-color","#DFE7EF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("75","form-secondary-border-color","#E88A93","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("76","form-tertiary-border-color","#EC407A","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("77","form-primary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("78","form-secondary-font-size","15px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("79","form-tertiary-font-size","18px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("80","info-panel-primary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("81","info-panel-secondary-bg-color","#F7F9FB","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("82","info-panel-tertiary-bg-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("83","info-panel-quaternary-bg-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("84","info-panel-quinary-bg-color","#FDFEFE","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("85","info-panel-senary-bg-color","#BFBDBD","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("86","info-panel-primary-text-color","#565656","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("87","info-panel-secondary-text-color","#878688","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("88","info-panel-tertiary-text-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("89","info-panel-quaternary-text-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("90","info-panel-quinary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("91","info-panel-primary-border-color","#DFE7EF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("92","info-panel-secondary-border-color","#E88A93","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("93","info-panel-tertiary-border-color","#EC407A","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("94","info-panel-primary-font-size","16px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("95","info-panel-secondary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("96","info-panel-tertiary-font-size","15px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("97","info-panel-quaternary-font-size","13px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("98","welcome-screen-primary-bg-color","#F7F9FB","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("99","welcome-screen-primary-text-color","#696767","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("100","welcome-screen-secondary-text-color","#828588","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("101","welcome-screen-primary-border-color","#DFE7EF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("102","welcome-screen-primary-font-size","19px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("103","welcome-screen-secondary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("104","welcome-screen-tertiary-font-size","13px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("105","custom-page-primary-bg-color","#F7F9FB","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("106","custom-page-secondary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("107","custom-page-primary-text-color","#8F8F8F","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("108","custom-page-secondary-text-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("109","custom-page-tertiary-text-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("110","custom-page-primary-border-color","#DFE7EF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("111","custom-page-primary-font-size","15px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("112","custom-page-secondary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("113","statistics-primary-bg-color","#F7F9FB","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("114","statistics-secondary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("115","statistics-tertiary-bg-color","#050517","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("116","statistics-quaternary-bg-color","#262630","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("117","statistics-quinary-bg-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("118","statistics-senary-bg-color","#A5A5A5","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("119","statistics-primary-text-color","#4A4A49","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("120","statistics-secondary-text-color","#808080","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("121","statistics-tertiary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("122","statistics-quaternary-text-color","#C7C7C7","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("123","statistics-quinary-text-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("124","statistics-senary-text-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("125","statistics-primary-border-color","#DFE7EF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("126","statistics-primary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("127","statistics-secondary-font-size","17px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("128","statistics-tertiary-font-size","15px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("129","statistics-quaternary-font-size","19px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("130","chat-window-primary-bg-color","#FAFBFC","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("131","chat-window-secondary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("132","chat-window-tertiary-bg-color","#F7F9FB","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("133","chat-window-quaternary-bg-color","#F06292","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("134","chat-window-quinary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("135","chat-window-senary-bg-color","#FFF3CD","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("136","chat-window-septenary-bg-color","#ECEFF1","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("137","chat-window-octonary-bg-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("138","chat-window-nonary-bg-color","#F06292","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("139","chat-window-denary-bg-color","#9E9E9E","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("140","chat-window-primary-text-color","#808080","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("141","chat-window-secondary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("142","chat-window-tertiary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("143","chat-window-quaternary-text-color","#808080","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("144","chat-window-quinary-text-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("145","chat-window-senary-text-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("146","chat-window-septenary-text-color","#856404","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("147","chat-window-octonary-text-color","#565656","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("148","chat-window-nonary-text-color","#E45E8C","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("149","chat-window-denary-text-color","#B1B1B1","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("150","chat-window-primary-border-color","#DFE7EF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("151","chat-window-secondary-border-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("152","chat-window-tertiary-border-color","#F7E2A0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("153","chat-window-quaternary-border-color","#607D8B","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("154","chat-window-quinary-border-color","#EC407A","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("155","chat-window-senary-border-color","#FFC107","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("156","chat-window-septenary-border-color","#D7DDE3","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("157","chat-window-primary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("158","chat-window-secondary-font-size","15px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("159","chat-window-tertiary-font-size","13px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("160","chat-window-quaternary-font-size","12px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("161","chat-window-quinary-font-size","19px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("162","chat-window-senary-font-size","27px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("163","chat-window-septenary-font-size","30px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("164","chat-window-octonary-font-size","34px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("165","entry-page-primary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("166","entry-page-secondary-bg-color","#F7F9FB","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("167","entry-page-tertiary-bg-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("168","entry-page-quaternary-bg-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("169","entry-page-quinary-bg-color","#9E9E9E","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("170","entry-page-senary-bg-color","#F06292","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("171","entry-page-primary-text-color","#808080","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("172","entry-page-secondary-text-color","#919191","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("173","entry-page-tertiary-text-color","#23576A","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("174","entry-page-quaternary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("175","entry-page-quinary-text-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("176","entry-page-senary-text-color","#333333","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("177","entry-page-primary-border-color","#DFE7EF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("178","entry-page-secondary-border-color","#A9A9A9","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("179","entry-page-tertiary-border-color","#DC1F6F","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("180","entry-page-quaternary-border-color","#D7DDE3","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("181","entry-page-primary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("182","entry-page-secondary-font-size","15px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("183","entry-page-tertiary-font-size","18px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("184","entry-page-quaternary-font-size","20px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("185","entry-page-quinary-font-size","16px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("186","entry-page-senary-font-size","13px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("187","chat-page-primary-bg-color","#0F0F0F","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("188","chat-page-primary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("189","side-navigation-primary-bg-color","#292929","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("190","side-navigation-secondary-bg-color","#1E1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("191","side-navigation-tertiary-bg-color","#1D1C1C","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("192","side-navigation-quaternary-bg-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("193","side-navigation-primary-text-color","#9D9D9D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("194","side-navigation-secondary-text-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("195","side-navigation-tertiary-text-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("196","side-navigation-quaternary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("197","side-navigation-primary-border-color","#060606","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("198","side-navigation-primary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("199","side-navigation-secondary-font-size","13px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("200","side-navigation-tertiary-font-size","20px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("201","left-side-content-primary-bg-color","#1E1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("202","left-side-content-secondary-bg-color","#292929","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("203","left-side-content-tertiary-bg-color","#292929","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("204","left-side-content-quaternary-bg-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("205","left-side-content-quinary-bg-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("206","left-side-content-senary-bg-color","#F8D7DA","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("207","left-side-content-septenary-bg-color","#FFC107","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("208","left-side-content-octonary-bg-color","#FF5722","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("209","left-side-content-nonary-bg-color","#F48FB1","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("210","left-side-content-denary-bg-color","#F06292","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("211","left-side-content-primary-text-color","#B6B6B6","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("212","left-side-content-secondary-text-color","#797979","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("213","left-side-content-tertiary-text-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("214","left-side-content-quaternary-text-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("215","left-side-content-quinary-text-color","#721C24","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("216","left-side-content-senary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("217","left-side-content-primary-border-color","#000000","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("218","left-side-content-secondary-border-color","#E88A93","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("219","left-side-content-tertiary-border-color","#EC407A","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("220","left-side-content-quaternary-border-color","#474747","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("221","left-side-content-primary-font-size","13px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("222","left-side-content-secondary-font-size","12px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("223","left-side-content-tertiary-font-size","15px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("224","left-side-content-quaternary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("225","left-side-content-quinary-font-size","11px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("226","left-side-content-senary-font-size","25px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("227","left-side-content-septenary-font-size","20px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("228","audio-player-primary-bg-color","#000000","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("229","audio-player-secondary-bg-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("230","audio-player-tertiary-bg-color","#FF4E8A","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("231","audio-player-quaternary-bg-color","#1E1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("232","audio-player-quinary-bg-color","#EFF1F3","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("233","audio-player-senary-bg-color","#E45E8C","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("234","audio-player-primary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("235","audio-player-secondary-text-color","#AAA7A7","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("236","audio-player-tertiary-text-color","#818589","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("237","audio-player-quaternary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("238","audio-player-quinary-text-color","#666666","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("239","audio-player-senary-text-color","#FF6D9F","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("240","audio-player-primary-border-color","#383838","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("241","audio-player-primary-font-size","20px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("242","audio-player-secondary-font-size","15px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("243","audio-player-tertiary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("244","audio-player-quaternary-font-size","13px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("245","audio-player-quinary-font-size","27px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("246","audio-player-senary-font-size","11px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("247","form-primary-bg-color","#1E1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("248","form-secondary-bg-color","#040404","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("249","form-tertiary-bg-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("250","form-quaternary-bg-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("251","form-quinary-bg-color","#000000","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("252","form-senary-bg-color","#F8D7DA","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("253","form-septenary-bg-color","#000000","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("254","form-octonary-bg-color","#F06292","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("255","form-primary-text-color","#A1A1A1","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("256","form-secondary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("257","form-tertiary-text-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("258","form-quaternary-text-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("259","form-quinary-text-color","#721C24","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("260","form-primary-border-color","#383838","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("261","form-secondary-border-color","#E88A93","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("262","form-tertiary-border-color","#EC407A","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("263","form-primary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("264","form-secondary-font-size","15px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("265","form-tertiary-font-size","18px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("266","info-panel-primary-bg-color","#1E1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("267","info-panel-secondary-bg-color","#2E2E2E","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("268","info-panel-tertiary-bg-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("269","info-panel-quaternary-bg-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("270","info-panel-quinary-bg-color","#242424","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("271","info-panel-senary-bg-color","#454545","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("272","info-panel-primary-text-color","#B2B1B1","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("273","info-panel-secondary-text-color","#959595","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("274","info-panel-tertiary-text-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("275","info-panel-quaternary-text-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("276","info-panel-quinary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("277","info-panel-primary-border-color","#000000","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("278","info-panel-secondary-border-color","#E88A93","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("279","info-panel-tertiary-border-color","#EC407A","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("280","info-panel-primary-font-size","16px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("281","info-panel-secondary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("282","info-panel-tertiary-font-size","15px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("283","info-panel-quaternary-font-size","13px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("284","welcome-screen-primary-bg-color","#2E2E2E","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("285","welcome-screen-primary-text-color","#A4A4A4","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("286","welcome-screen-secondary-text-color","#7E7F81","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("287","welcome-screen-primary-border-color","#383838","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("288","welcome-screen-primary-font-size","19px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("289","welcome-screen-secondary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("290","welcome-screen-tertiary-font-size","13px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("291","custom-page-primary-bg-color","#2E2E2E","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("292","custom-page-secondary-bg-color","#1E1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("293","custom-page-primary-text-color","#8A8A8A","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("294","custom-page-secondary-text-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("295","custom-page-tertiary-text-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("296","custom-page-primary-border-color","#383838","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("297","custom-page-primary-font-size","15px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("298","custom-page-secondary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("299","statistics-primary-bg-color","#2E2E2E","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("300","statistics-secondary-bg-color","#1E1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("301","statistics-tertiary-bg-color","#232323","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("302","statistics-quaternary-bg-color","#191919","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("303","statistics-quinary-bg-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("304","statistics-senary-bg-color","#1B1B1B","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("305","statistics-primary-text-color","#B4B4B4","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("306","statistics-secondary-text-color","#818181","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("307","statistics-tertiary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("308","statistics-quaternary-text-color","#8B8B8B","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("309","statistics-quinary-text-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("310","statistics-senary-text-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("311","statistics-primary-border-color","#060606","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("312","statistics-primary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("313","statistics-secondary-font-size","17px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("314","statistics-tertiary-font-size","15px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("315","statistics-quaternary-font-size","19px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("316","chat-window-primary-bg-color","#070707","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("317","chat-window-secondary-bg-color","#1E1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("318","chat-window-tertiary-bg-color","#040404","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("319","chat-window-quaternary-bg-color","#F06292","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("320","chat-window-quinary-bg-color","#292929","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("321","chat-window-senary-bg-color","#1F1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("322","chat-window-septenary-bg-color","#292929","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("323","chat-window-octonary-bg-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("324","chat-window-nonary-bg-color","#F06292","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("325","chat-window-denary-bg-color","#312F2F","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("326","chat-window-primary-text-color","#8D8D8D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("327","chat-window-secondary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("328","chat-window-tertiary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("329","chat-window-quaternary-text-color","#989898","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("330","chat-window-quinary-text-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("331","chat-window-senary-text-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("332","chat-window-septenary-text-color","#666664","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("333","chat-window-octonary-text-color","#565656","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("334","chat-window-nonary-text-color","#E45E8C","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("335","chat-window-denary-text-color","#B1B1B1","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("336","chat-window-primary-border-color","#000000","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("337","chat-window-secondary-border-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("338","chat-window-tertiary-border-color","#0A0A0A","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("339","chat-window-quaternary-border-color","#607D8B","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("340","chat-window-quinary-border-color","#EC407A","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("341","chat-window-senary-border-color","#FFC107","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("342","chat-window-septenary-border-color","#474747","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("343","chat-window-primary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("344","chat-window-secondary-font-size","15px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("345","chat-window-tertiary-font-size","13px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("346","chat-window-quaternary-font-size","12px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("347","chat-window-quinary-font-size","19px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("348","chat-window-senary-font-size","27px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("349","chat-window-septenary-font-size","30px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("350","chat-window-octonary-font-size","34px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("351","entry-page-primary-bg-color","#1E1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("352","entry-page-secondary-bg-color","#292929","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("353","entry-page-tertiary-bg-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("354","entry-page-quaternary-bg-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("355","entry-page-quinary-bg-color","#353333","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("356","entry-page-senary-bg-color","#F06292","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("357","entry-page-primary-text-color","#858585","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("358","entry-page-secondary-text-color","#929292","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("359","entry-page-tertiary-text-color","#CDCDCD","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("360","entry-page-quaternary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("361","entry-page-quinary-text-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("362","entry-page-senary-text-color","#808080","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("363","entry-page-primary-border-color","#101010","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("364","entry-page-secondary-border-color","#A9A9A9","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("365","entry-page-tertiary-border-color","#DC1F6F","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("366","entry-page-quaternary-border-color","#474747","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("367","entry-page-primary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("368","entry-page-secondary-font-size","15px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("369","entry-page-tertiary-font-size","18px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("370","entry-page-quaternary-font-size","20px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("371","entry-page-quinary-font-size","16px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("372","entry-page-senary-font-size","13px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("373","chat-page-secondary-bg-color","#F06292","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("374","chat-page-tertiary-bg-color","#DBE1E7","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("375","chat-page-secondary-bg-color","#F06292","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("376","chat-page-tertiary-bg-color","#292929","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("377","landing-page-primary-bg-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("378","landing-page-secondary-bg-color","#F1F5F9","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("379","landing-page-tertiary-bg-color","#CED6DF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("380","landing-page-quaternary-bg-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("381","landing-page-quinary-bg-color","#FFF497","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("382","landing-page-senary-bg-color","#000000","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("383","landing-page-septenary-bg-color","#9C27B0","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("384","landing-page-primary-text-color","#1B1E60","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("385","landing-page-secondary-text-color","#7F8097","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("386","landing-page-tertiary-text-color","#CFCFCF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("387","landing-page-quaternary-text-color","#FFFFFF","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("388","landing-page-quinary-text-color","#FFEB3B","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("389","landing-page-senary-text-color","#E91E63","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("390","landing-page-septenary-text-color","#3F3F3F","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("391","landing-page-octonary-text-color","#797F85","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("392","landing-page-primary-border-color","#B9BFC6","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("393","landing-page-primary-font-size","25px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("394","landing-page-secondary-font-size","17px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("395","landing-page-tertiary-font-size","16px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("396","landing-page-quaternary-font-size","16px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("397","landing-page-quinary-font-size","15px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("398","landing-page-senary-font-size","14px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("399","landing-page-primary-bg-color","#1D1D1D","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("400","landing-page-secondary-bg-color","#131313","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("401","landing-page-tertiary-bg-color","#000000","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("402","landing-page-quaternary-bg-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("403","landing-page-quinary-bg-color","#FFF497","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("404","landing-page-senary-bg-color","#000000","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("405","landing-page-septenary-bg-color","#9C27B0","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("406","landing-page-primary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("407","landing-page-secondary-text-color","#AFAFAF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("408","landing-page-tertiary-text-color","#CFCFCF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("409","landing-page-quaternary-text-color","#FFFFFF","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("410","landing-page-quinary-text-color","#FFEB3B","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("411","landing-page-senary-text-color","#E91E63","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("412","landing-page-septenary-text-color","#3F3F3F","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("413","landing-page-octonary-text-color","#727272","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("414","landing-page-primary-border-color","#222222","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("415","landing-page-primary-font-size","25px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("416","landing-page-secondary-font-size","17px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("417","landing-page-tertiary-font-size","16px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("418","landing-page-quaternary-font-size","16px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("419","landing-page-quinary-font-size","15px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("420","landing-page-senary-font-size","14px","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("421","chat-window-undenary-text-color","#FF9800","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("422","chat-window-duodenary-text-color","#FFEB3B","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("423","chat-window-undenary-text-color","#FF9800","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("424","chat-window-duodenary-text-color","#FFEB3B","dark_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("425","chat-window-nonary-font-size","22px","light_mode","2022-06-25 03:37:25");
INSERT INTO gr_css_variables VALUES("426","chat-window-nonary-font-size","22px","dark_mode","2022-06-25 03:37:25");





CREATE TABLE `gr_custom_fields` (
  `field_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `string_constant` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_category` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile',
  `field_type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_on_signup` int(11) NOT NULL DEFAULT '0',
  `required` int(11) NOT NULL DEFAULT '0',
  `minimum_length` int(11) NOT NULL DEFAULT '0',
  `maximum_length` int(11) NOT NULL DEFAULT '250',
  `show_on_info_page` int(11) NOT NULL DEFAULT '1',
  `editable_only_once` int(11) NOT NULL DEFAULT '0',
  `disabled` int(11) NOT NULL DEFAULT '0',
  `order_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  KEY `idx__type_id` (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_custom_fields VALUES("1","custom_field_1","profile","long_text","1","1","0","250","1","0","0","0","2022-03-06 13:33:50");
INSERT INTO gr_custom_fields VALUES("2","custom_field_2","profile","date","0","0","0","0","1","0","0","0","2022-03-06 13:33:47");
INSERT INTO gr_custom_fields VALUES("3","custom_field_3","profile","dropdown","0","0","0","0","1","0","0","0","2022-03-12 04:28:29");
INSERT INTO gr_custom_fields VALUES("4","custom_field_4","profile","number","0","0","0","0","0","0","0","0","2022-03-06 13:33:42");
INSERT INTO gr_custom_fields VALUES("5","custom_field_5","profile","short_text","0","0","0","0","1","0","0","0","2022-03-06 13:33:36");
INSERT INTO gr_custom_fields VALUES("6","custom_field_6","profile","dropdown","0","0","0","0","1","0","0","0","2022-05-11 07:20:04");





CREATE TABLE `gr_custom_fields_values` (
  `field_value_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `field_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`field_value_id`),
  KEY `field_id_fk` (`field_id`),
  KEY `user_id_fk_6` (`user_id`),
  KEY `group_id_fk_4` (`group_id`),
  KEY `idx__user_id_field_id` (`user_id`,`field_id`),
  CONSTRAINT `field_id_fk` FOREIGN KEY (`field_id`) REFERENCES `gr_custom_fields` (`field_id`) ON DELETE CASCADE,
  CONSTRAINT `group_id_fk_4` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_6` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_custom_fields_values VALUES("1","6","","1","BD","2022-07-08 10:23:48");





CREATE TABLE `gr_custom_menu_items` (
  `menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `string_constant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_icon_class` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_id` bigint(20) DEFAULT NULL,
  `web_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_target` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Open URL in same window\r\n1 = Open URL in New tab',
  `show_on_landing_page_header` int(11) NOT NULL DEFAULT '0',
  `show_on_landing_page_footer` int(11) NOT NULL DEFAULT '0',
  `show_on_entry_page` int(11) NOT NULL DEFAULT '0',
  `show_on_chat_page` int(11) NOT NULL DEFAULT '0',
  `menu_item_order` int(11) NOT NULL DEFAULT '0',
  `menu_item_visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `disabled` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`menu_item_id`),
  KEY `page_id_fk` (`page_id`),
  KEY `idx__menu_item_order` (`menu_item_order`),
  CONSTRAINT `page_id_fk` FOREIGN KEY (`page_id`) REFERENCES `gr_custom_pages` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_custom_menu_items VALUES("1","custom_menu_item_8","bi-card-text","2","#","0","1","1","1","0","3","all","0","2022-01-20 19:10:31","2022-03-19 22:14:13");
INSERT INTO gr_custom_menu_items VALUES("2","custom_menu_item_9","bi-card-text","3","#","0","1","1","1","0","2","all","0","2022-01-20 19:10:48","2022-03-19 22:14:00");
INSERT INTO gr_custom_menu_items VALUES("3","custom_menu_item_16","bi-card-text","1","#","0","1","0","0","0","1","all","0","2022-03-19 22:13:42","2022-03-19 22:13:42");
INSERT INTO gr_custom_menu_items VALUES("4","custom_menu_item_17","bi-card-text","","sitemap/","0","0","1","0","0","4","all","0","2022-03-19 22:14:47","2022-03-19 22:14:47");





CREATE TABLE `gr_custom_pages` (
  `page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `string_constant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` int(11) NOT NULL DEFAULT '0',
  `who_all_can_view_page` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'all',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_custom_pages VALUES("1","custom_page_1","about","","","0","all","2021-09-26 18:44:30","2022-03-20 07:02:07");
INSERT INTO gr_custom_pages VALUES("2","custom_page_2","terms","","","0","[\"1\",\"2\",\"3\",\"5\"]","2021-09-26 18:44:03","2022-06-14 10:06:37");
INSERT INTO gr_custom_pages VALUES("3","custom_page_3","privacy","","","0","[\"1\",\"2\",\"3\",\"5\"]","2021-12-08 22:05:49","2022-06-14 10:24:05");





CREATE TABLE `gr_group_invitations` (
  `group_invitation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `referrer_user_id` bigint(20) DEFAULT NULL,
  `related_email_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invitation_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired` int(11) NOT NULL DEFAULT '0' COMMENT '0 = No\r\n1 = Yes',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`group_invitation_id`),
  KEY `group_id_fk_6` (`group_id`),
  KEY `user_id_fk_9` (`user_id`),
  CONSTRAINT `group_id_fk_6` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_9` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_group_members` (
  `group_member_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_role_id` bigint(20) NOT NULL DEFAULT '4',
  `referrer_user_id` bigint(20) DEFAULT '0',
  `last_read_message_id` bigint(20) DEFAULT '0',
  `load_message_id_from` bigint(20) DEFAULT NULL,
  `currently_browsing` int(11) NOT NULL DEFAULT '0',
  `previous_group_role_id` bigint(20) NOT NULL DEFAULT '4',
  `banned_till` datetime DEFAULT NULL,
  `joined_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`group_member_id`),
  KEY `group_id_fk` (`group_id`),
  KEY `user_id_fk` (`user_id`),
  KEY `group_role_id_fk` (`group_role_id`),
  KEY `idx__user_id_group_id` (`user_id`,`group_id`),
  KEY `idx__group_id_user_id` (`group_id`,`user_id`),
  KEY `idx__user_id_last_read_message_id` (`user_id`,`last_read_message_id`),
  KEY `idx__user_id_group_role_id` (`user_id`,`group_role_id`),
  KEY `idx__last_read_message_id` (`last_read_message_id`),
  KEY `idx__group_id_group_member_id` (`group_id`,`group_member_id`),
  CONSTRAINT `group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `group_role_id_fk` FOREIGN KEY (`group_role_id`) REFERENCES `gr_group_roles` (`group_role_id`),
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_group_messages` (
  `group_message_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `original_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `filtered_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_message` int(11) NOT NULL DEFAULT '0',
  `parent_message_id` bigint(20) DEFAULT NULL,
  `attachment_type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_preview` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_reactions` text COLLATE utf8mb4_unicode_ci,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`group_message_id`),
  KEY `group_id_fk_2` (`group_id`),
  KEY `user_id_fk_2` (`user_id`),
  KEY `group_message_id_fk_3` (`parent_message_id`),
  KEY `idx__group_id_group_message_id` (`group_id`,`group_message_id`),
  KEY `idx__attachment_type_group_id_group_message_id` (`attachment_type`,`group_id`,`group_message_id`),
  CONSTRAINT `group_id_fk_2` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `group_message_id_fk_3` FOREIGN KEY (`parent_message_id`) REFERENCES `gr_group_messages` (`group_message_id`) ON DELETE SET NULL,
  CONSTRAINT `user_id_fk_2` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_group_messages_reactions` (
  `group_message_reaction_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_message_id` bigint(20) NOT NULL,
  `reaction_id` int(11) NOT NULL COMMENT '1 = Like\r\n2 = Love\r\n3 = Haha\r\n4 = Wow\r\n5 = Sad\r\n6 = Angry',
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`group_message_reaction_id`),
  KEY `group_message_id_fk_4` (`group_message_id`),
  KEY `user_id_fk_10` (`user_id`),
  CONSTRAINT `group_message_id_fk_4` FOREIGN KEY (`group_message_id`) REFERENCES `gr_group_messages` (`group_message_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_10` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_group_roles` (
  `group_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `string_constant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_role_attribute` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'group_role',
  `disabled` int(11) NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`group_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_group_roles VALUES("1","group_role_1","{\"update\":\"group_roles\",\"show_label\":\"\",\"label_background_color\":\"#7b0909\",\"label_text_color\":\"#ff0a0a\",\"attribute\":\"banned_users\",\"disabled\":\"no\"}","banned_users","0","2022-02-09 08:15:00");
INSERT INTO gr_group_roles VALUES("2","group_role_2","{\"update\":\"group_roles\",\"language_id\":\"\",\"show_label\":\"no\",\"label_background_color\":\"#FF61BB\",\"label_text_color\":\"#FFFFFF\",\"attribute\":\"administrators\",\"disabled\":\"\",\"group\":[\"edit_group\",\"view_shared_files\",\"view_shared_links\",\"delete_group\"],\"group_members\":[\"view_group_members\",\"view_currently_online\",\"ban_users_from_group\",\"unban_users_from_group\",\"manage_user_roles\",\"remove_group_members\"],\"messages\":[\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"check_read_receipts\",\"share_screenshot\",\"allow_sharing_links\",\"generate_link_preview\",\"download_attachments\",\"delete_own_message\",\"delete_messages\",\"view_reactions\",\"react_messages\",\"reply_messages\",\"mention_users\"]}","administrators","0","2022-03-21 01:09:22");
INSERT INTO gr_group_roles VALUES("3","group_role_3","{\"update\":\"group_roles\",\"language_id\":\"\",\"show_label\":\"no\",\"label_background_color\":\"#9EFF00\",\"label_text_color\":\"#FFFFFF\",\"attribute\":\"moderators\",\"disabled\":\"\",\"group\":[\"view_shared_files\",\"view_shared_links\"],\"group_members\":[\"view_group_members\",\"view_currently_online\",\"ban_users_from_group\",\"unban_users_from_group\"],\"messages\":[\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"check_read_receipts\",\"share_screenshot\",\"allow_sharing_links\",\"generate_link_preview\",\"download_attachments\",\"delete_own_message\",\"delete_messages\",\"view_reactions\",\"react_messages\",\"reply_messages\",\"mention_users\"]}","moderators","0","2022-03-21 01:10:48");
INSERT INTO gr_group_roles VALUES("4","group_role_4","{\"update\":\"group_roles\",\"language_id\":\"\",\"show_label\":\"no\",\"label_background_color\":\"#FF4D55\",\"label_text_color\":\"#FFFFFF\",\"attribute\":\"default_group_role\",\"disabled\":\"\",\"group\":[\"view_shared_files\",\"view_shared_links\"],\"group_members\":[\"view_group_members\",\"view_currently_online\"],\"messages\":[\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"check_read_receipts\",\"share_screenshot\",\"allow_sharing_links\",\"generate_link_preview\",\"download_attachments\",\"delete_own_message\",\"view_reactions\",\"react_messages\",\"reply_messages\",\"mention_users\"]}","default_group_role","0","2022-03-21 01:12:13");





CREATE TABLE `gr_groups` (
  `group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_group` int(11) NOT NULL DEFAULT '0',
  `secret_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unleavable` int(11) NOT NULL DEFAULT '0',
  `who_all_can_send_messages` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin_group` int(11) NOT NULL DEFAULT '0',
  `auto_join_group` int(11) NOT NULL DEFAULT '0',
  `total_members` bigint(20) NOT NULL DEFAULT '0',
  `suspended` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `idx__secret_group_suspended_pin_group` (`secret_group`,`suspended`,`pin_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_language_strings` (
  `string_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `string_constant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string_value` text COLLATE utf8mb4_unicode_ci,
  `string_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one-line',
  `skip_update` int(11) NOT NULL DEFAULT '0',
  `skip_cache` int(11) NOT NULL DEFAULT '0',
  `language_id` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`string_id`),
  KEY `language_id_fk` (`language_id`),
  KEY `idx__string_constant` (`string_constant`(16)),
  KEY `idx__skip_cache_skip_update_language_id` (`skip_cache`,`skip_update`,`language_id`),
  CONSTRAINT `language_id_fk` FOREIGN KEY (`language_id`) REFERENCES `gr_languages` (`language_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1086 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_language_strings VALUES("1","edit_profile","Edit Profile","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("2","other","Other","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("3","import_json","Select JSON File","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("4","rejected","Rejected","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("5","users","Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("6","custom_field_6_options","{\"DZ\":\"Algeria\",\"AO\":\"Angola\",\"BJ\":\"Benin\",\"BW\":\"Botswana\",\"BF\":\"Burkina Faso\",\"BI\":\"Burundi\",\"CM\":\"Cameroon\",\"CV\":\"Cape Verde\",\"CF\":\"Central African Republic\",\"TD\":\"Chad\",\"KM\":\"Comoros\",\"CD\":\"Congo [DRC]\",\"CG\":\"Congo [Republic]\",\"DJ\":\"Djibouti\",\"EG\":\"Egypt\",\"GQ\":\"Equatorial Guinea\",\"ER\":\"Eritrea\",\"ET\":\"Ethiopia\",\"GA\":\"Gabon\",\"GM\":\"Gambia\",\"GH\":\"Ghana\",\"GN\":\"Guinea\",\"GW\":\"Guinea-Bissau\",\"CI\":\"Ivory Coast\",\"KE\":\"Kenya\",\"LS\":\"Lesotho\",\"LR\":\"Liberia\",\"LY\":\"Libya\",\"MG\":\"Madagascar\",\"MW\":\"Malawi\",\"ML\":\"Mali\",\"MR\":\"Mauritania\",\"MU\":\"Mauritius\",\"YT\":\"Mayotte\",\"MA\":\"Morocco\",\"MZ\":\"Mozambique\",\"NA\":\"Namibia\",\"NE\":\"Niger\",\"NG\":\"Nigeria\",\"RW\":\"Rwanda\",\"RE\":\"R\\u00e9union\",\"SH\":\"Saint Helena\",\"SN\":\"Senegal\",\"SC\":\"Seychelles\",\"SL\":\"Sierra Leone\",\"SO\":\"Somalia\",\"ZA\":\"South Africa\",\"SD\":\"Sudan\",\"SZ\":\"Swaziland\",\"ST\":\"S\\u00e3o Tom\\u00e9 and Pr\\u00edncipe\",\"TZ\":\"Tanzania\",\"TG\":\"Togo\",\"TN\":\"Tunisia\",\"UG\":\"Uganda\",\"EH\":\"Western Sahara\",\"ZM\":\"Zambia\",\"ZW\":\"Zimbabwe\",\"AQ\":\"Antarctica\",\"BV\":\"Bouvet Island\",\"TF\":\"French Southern Territories\",\"HM\":\"Heard Island and McDonald Island\",\"GS\":\"South Georgia and the South Sandwich Islands\",\"AF\":\"Afghanistan\",\"AM\":\"Armenia\",\"AZ\":\"Azerbaijan\",\"BH\":\"Bahrain\",\"BD\":\"Bangladesh\",\"BT\":\"Bhutan\",\"IO\":\"British Indian Ocean Territory\",\"BN\":\"Brunei\",\"KH\":\"Cambodia\",\"CN\":\"China\",\"CX\":\"Christmas Island\",\"CC\":\"Cocos [Keeling] Islands\",\"GE\":\"Georgia\",\"HK\":\"Hong Kong\",\"IN\":\"India\",\"ID\":\"Indonesia\",\"IR\":\"Iran\",\"IQ\":\"Iraq\",\"IL\":\"Israel\",\"JP\":\"Japan\",\"JO\":\"Jordan\",\"KZ\":\"Kazakhstan\",\"KW\":\"Kuwait\",\"KG\":\"Kyrgyzstan\",\"LA\":\"Laos\",\"LB\":\"Lebanon\",\"MO\":\"Macau\",\"MY\":\"Malaysia\",\"MV\":\"Maldives\",\"MN\":\"Mongolia\",\"MM\":\"Myanmar [Burma]\",\"NP\":\"Nepal\",\"KP\":\"North Korea\",\"OM\":\"Oman\",\"PK\":\"Pakistan\",\"PS\":\"Palestinian Territories\",\"PH\":\"Philippines\",\"QA\":\"Qatar\",\"SA\":\"Saudi Arabia\",\"SG\":\"Singapore\",\"KR\":\"South Korea\",\"LK\":\"Sri Lanka\",\"SY\":\"Syria\",\"TW\":\"Taiwan\",\"TJ\":\"Tajikistan\",\"TH\":\"Thailand\",\"TR\":\"Turkey\",\"TM\":\"Turkmenistan\",\"AE\":\"United Arab Emirates\",\"UZ\":\"Uzbekistan\",\"VN\":\"Vietnam\",\"YE\":\"Yemen\",\"AL\":\"Albania\",\"AD\":\"Andorra\",\"AT\":\"Austria\",\"BY\":\"Belarus\",\"BE\":\"Belgium\",\"BA\":\"Bosnia and Herzegovina\",\"BG\":\"Bulgaria\",\"HR\":\"Croatia\",\"CY\":\"Cyprus\",\"CZ\":\"Czech Republic\",\"DK\":\"Denmark\",\"EE\":\"Estonia\",\"FO\":\"Faroe Islands\",\"FI\":\"Finland\",\"FR\":\"France\",\"DE\":\"Germany\",\"GI\":\"Gibraltar\",\"GR\":\"Greece\",\"GG\":\"Guernsey\",\"HU\":\"Hungary\",\"IS\":\"Iceland\",\"IE\":\"Ireland\",\"IM\":\"Isle of Man\",\"IT\":\"Italy\",\"JE\":\"Jersey\",\"XK\":\"Kosovo\",\"LV\":\"Latvia\",\"LI\":\"Liechtenstein\",\"LT\":\"Lithuania\",\"LU\":\"Luxembourg\",\"MK\":\"Macedonia\",\"MT\":\"Malta\",\"MD\":\"Moldova\",\"MC\":\"Monaco\",\"ME\":\"Montenegro\",\"NL\":\"Netherlands\",\"NO\":\"Norway\",\"PL\":\"Poland\",\"PT\":\"Portugal\",\"RO\":\"Romania\",\"RU\":\"Russia\",\"SM\":\"San Marino\",\"RS\":\"Serbia\",\"CS\":\"Serbia and Montenegro\",\"SK\":\"Slovakia\",\"SI\":\"Slovenia\",\"ES\":\"Spain\",\"SJ\":\"Svalbard and Jan Mayen\",\"SE\":\"Sweden\",\"CH\":\"Switzerland\",\"UA\":\"Ukraine\",\"GB\":\"United Kingdom\",\"VA\":\"Vatican City\",\"AX\":\"\\u00c5land Islands\",\"AI\":\"Anguilla\",\"AG\":\"Antigua and Barbuda\",\"AW\":\"Aruba\",\"BS\":\"Bahamas\",\"BB\":\"Barbados\",\"BZ\":\"Belize\",\"BM\":\"Bermuda\",\"BQ\":\"Bonaire\",\"VG\":\"British Virgin Islands\",\"CA\":\"Canada\",\"KY\":\"Cayman Islands\",\"CR\":\"Costa Rica\",\"CU\":\"Cuba\",\"CW\":\"Curacao\",\"DM\":\"Dominica\",\"DO\":\"Dominican Republic\",\"SV\":\"El Salvador\",\"GL\":\"Greenland\",\"GD\":\"Grenada\",\"GP\":\"Guadeloupe\",\"GT\":\"Guatemala\",\"HT\":\"Haiti\",\"HN\":\"Honduras\",\"JM\":\"Jamaica\",\"MQ\":\"Martinique\",\"MX\":\"Mexico\",\"MS\":\"Montserrat\",\"AN\":\"Netherlands Antilles\",\"NI\":\"Nicaragua\",\"PA\":\"Panama\",\"PR\":\"Puerto Rico\",\"BL\":\"Saint Barth\\u00e9lemy\",\"KN\":\"Saint Kitts and Nevis\",\"LC\":\"Saint Lucia\",\"MF\":\"Saint Martin\",\"PM\":\"Saint Pierre and Miquelon\",\"VC\":\"Saint Vincent and the Grenadines\",\"SX\":\"Sint Maarten\",\"TT\":\"Trinidad and Tobago\",\"TC\":\"Turks and Caicos Islands\",\"VI\":\"U.S. Virgin Islands\",\"US\":\"United States\",\"AR\":\"Argentina\",\"BO\":\"Bolivia\",\"BR\":\"Brazil\",\"CL\":\"Chile\",\"CO\":\"Colombia\",\"EC\":\"Ecuador\",\"FK\":\"Falkland Islands\",\"GF\":\"French Guiana\",\"GY\":\"Guyana\",\"PY\":\"Paraguay\",\"PE\":\"Peru\",\"SR\":\"Suriname\",\"UY\":\"Uruguay\",\"VE\":\"Venezuela\",\"AS\":\"American Samoa\",\"AU\":\"Australia\",\"CK\":\"Cook Islands\",\"TL\":\"East Timor\",\"FJ\":\"Fiji\",\"PF\":\"French Polynesia\",\"GU\":\"Guam\",\"KI\":\"Kiribati\",\"MH\":\"Marshall Islands\",\"FM\":\"Micronesia\",\"NR\":\"Nauru\",\"NC\":\"New Caledonia\",\"NZ\":\"New Zealand\",\"NU\":\"Niue\",\"NF\":\"Norfolk Island\",\"MP\":\"Northern Mariana Islands\",\"PW\":\"Palau\",\"PG\":\"Papua New Guinea\",\"PN\":\"Pitcairn Islands\",\"WS\":\"Samoa\",\"SB\":\"Solomon Islands\",\"TK\":\"Tokelau\",\"TO\":\"Tonga\",\"TV\":\"Tuvalu\",\"UM\":\"U.S. Minor Outlying Islands\",\"VU\":\"Vanuatu\",\"WF\":\"Wallis and Futuna\"}","multi_line","1","0","1");
INSERT INTO gr_language_strings VALUES("7","action_taken","Action Taken","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("8","minimum_username_length","Minimum Username Length","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("9","roles","Site Roles","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("10","timestamp","Timestamp","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("11","languages","Languages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("12","maximum_username_length","Maximum Username Length","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("13","report_group","Report Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("14","invited","Invited","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("15","requires_minimum_username_length","Requires Minimum Username Length","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("16","appearance","Appearance","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("17","open","Open","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("18","password_protect","Password Protect","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("19","view_message","View Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("20","exceeds_username_length","Exceeds Maximum Username Length","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("21","group_icon","Group Icon","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("22","send_as_user","Send as another User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("23","message","Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("24","pin_group","Pin Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("25","choose_avatar","Choose an Avatar","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("26","stickers","Stickers","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("27","who_all_can_send_messages","Who all can Send Messages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("28","left_group","Left the Group Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("29","headers_footers","Headers &amp; Footers","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("30","all_group_members","All Group Members","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("31","slug","Slug","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("32","joined_group","Joined the Group Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("33","short_text_field","Short Text","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("34","settings","Settings","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("35","datetime","Date &amp; Time","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("36","long_text_field","Long Text","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("37","slug_already_exists","Slug Already Exists","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("38","shortcodes","Shortcodes","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("39","sender","Sender","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("40","date_field","Date","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("41","you","You","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("42","exporting","Exporting","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("43","username_already_exists","Username Already Exists","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("44","dropdown_field","Dropdown","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("45","group_join_limit","Maximum Number of Groups a User can Join","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("46","invalid_captcha","Invalid Captcha","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("47","number_field","Number","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("48","manage_custom_pages","Manage Custom Pages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("49","remember_me","Remember Me","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("50","exceeded_maxgroupjoin","Exceeded Maximum Number of Groups You can Join","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("51","no_results_found","No Results Found","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("52","no_results_found_subtitle","Try changing the filters or search term","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("53","on_load_guest_login_window","Open Guest Login Window on Load (Login Page)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("54","forgot_password","Forgot Password","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("55","open_in_new_window","Open Link in New Window","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("56","slug_condition","Slug must contain at least one letter","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("57","register","Register","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("58","stream_url","Stream URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("59","reset","Reset","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("60","manage_audio_player","Manage Audio Player","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("61","user_does_not_exist","User Does not Exist","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("62","manage_site_roles","Manage Site Roles","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("63","manage_adverts","Manage Adverts","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("64","site_users","Site Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("65","check_inbox","We have sent an email to your email address. Please check your Inbox.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("66","create_advert","Create Advert","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("67","avatars","Avatars","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("68","site_name","Site Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("69","upload_avatar","Upload Avatar","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("70","advert_name","Advert Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("71","site_description","Site Description","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("72","advert_placement","Ad Placement","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("73","sender_name","Sender Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("74","supported_image_formats","Supported Image Formats","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("75","user_registration","User Registration","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("76","manage_avatars","Manage Avatars","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("77","enable","Enable","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("78","disable","Disable","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("79","audio_player","Audio Player","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("80","logo","Logo","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("81","favicon","Favicon","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("82","add_audio","Add Audio","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("83","not_found_page_title","404 - Page not found","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("84","edit_audio","Edit Audio","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("85","not_found_page_expression","Oops!","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("86","not_found_page_description","The resource you are looking for might have been removed, had its name changed, or is temporarily unavailable.","multi-line","0","0","1");
INSERT INTO gr_language_strings VALUES("87","title","Title","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("88","not_found_page_button","Go To Homepage","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("89","radio_station","Radio Station","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("90","reload","Reload","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("91","audio_files","Audio Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("92","playlist","Playlist","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("93","now_playing","Now Playing","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("94","category","Category","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("95","file_name","File Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("96","group","Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("97","other_features","Other Features","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("98","play_music","Play Music","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("99","upload","Upload","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("100","go_back","Go Back","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("101","show_only_on","Show Only On","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("102","attach","Share Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("103","site_records","Site Records","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("104","login_as_user","Login as User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("105","chat_message","Chat Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("106","forms","Forms","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("107","yes","Yes","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("108","info_panel","Info Panel","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("109","welcome_screen","Welcome Screen","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("110","no","No","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("111","rename","Rename","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("112","advert_max_height","Maximum Height (px)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("113","rename_audio_file","Rename Audio File","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("114","remove_password","Remove Password","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("115","group_roles","Group Roles","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("116","edit_language","Edit Language","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("117","edit_advert","Edit Advert","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("118","create_group_role","Create Group Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("119","manage_social_login","Manage Social Login","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("120","site_slogan","Site Slogan","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("121","edit_group_role","Edit Group Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("122","add_provider","Add Provider","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("123","manage_group_roles","Manage Group Roles","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("124","identity_provider","Identity Provider","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("125","group_role_1","Banned","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("126","group_role_2","Group Admin","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("127","boxed","Boxed Layout","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("128","group_role_3","Group Moderator","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("129","select_option","Select Option from Dropdown","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("130","group_role_4","Member","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("131","create_groups","Create Groups","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("132","choose_file","Choose a file","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("133","access_logs","Access Logs","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("134","refresh","Refresh","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("135","info","Info","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("136","ignored","Ignored","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("137","login_text","Sign In to Your Account","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("138","last_login","Last Login","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("139","guest_login_text","Create a Guest User account","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("140","empty_profile","Empty Profile","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("141","signup","Signup","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("142","signup_text","Create a new Account","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("143","forgot_password_text","We will send you password recovery instruction to the email address associated with your account.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("144","send_mail","Send Mail","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("145","back_to_login","Back to Login","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("146","invalid_email_address","Invalid Email Address","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("147","attribute","Attribute","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("148","default_site_role","Default Site Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("149","guest_users","Guest Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("150","unverified_users","Unverified Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("151","banned_users","Banned Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("152","confirm_your_email_address","You are required to verify your email address. We have sent an email with a confirmation link to your email address. In order to complete the sign-up process, please click the confirmation link.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("153","account_banned","Your account has been banned for violating the Terms of Service.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("154","slideshows","Slideshows","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("155","add_images","Add Images","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("156","slideshow","Slideshow","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("157","system_email_address","System Email Address","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("158","mail_footer_text","If you have any questions or concerns, \\n please feel free to email us at","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("159","reset_password_email_subject","Recover your Account","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("160","reset_password_email_heading","Trouble signing in?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("161","reset_password_email_content","Resetting your password is easy. Just press the button below and you will be auto logged in to your account. If you did not make this request then please ignore this email.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("162","reset_password_email_button_label","Reset Password","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("163","account_not_found","Account Does Not Exist","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("164","reset_password_success_message","We have sent you an e-mail containing your password reset link. Click the link in the email to create a new password. ","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("165","access_token_expired","Access Token is not valid or has expired","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("166","verification_email_subject","Confirm your email address","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("167","verification_email_heading","Email Confirmation","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("168","verification_email_content","Before you get started, we need to validate your email address. Please click on the button below to verify your email address. If you did not make this request then please ignore this email.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("169","delete_account","Delete Account","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("170","verification_email_button_label","Verify your email","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("171","upload_file","Upload File","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("172","email_verified","You&#039;ve successfully verified your email","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("173","remove_user","Remove User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("174","verification_code_expired","Verification code is not valid or has expired","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("175","login_as_guest","Login as Guest","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("176","or_login_using","or login using","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("177","create_group","Create Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("178","show_on_chat_page","Show on Chat Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("179","guest_login","Guest Login","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("180","create_user","Create User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("181","menu_order","Menu Order","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("182","fields","Fields","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("183","entry_page_footer_text","? 2021. All Rights Reserved. Group Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("184","giphy","GIPHY","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("185","add_custom_field","Add Field","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("186","ffmpeg","FFmpeg","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("187","show_on_info_page","Show on Info Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("188","banned_page_title","You Are Banned","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("189","editable_only_once","Editable Only Once","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("190","delete_messages","Delete Msgs","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("191","banned_page_expression","Ouch!","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("192","view_group","View Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("193","comments_if_any","Comments (If Any)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("194","banned_page_description","Your have been banned from using this website. If you think your account was banned by mistake, please email us and we&#039;ll look into your case.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("195","posted_by","Posted by","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("196","message_id","Message ID","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("197","whats_wrong","What&#039;s Wrong with this","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("198","banned_page_button","Contact Support","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("199","attachments","Attachment(s)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("200","gif","GIF","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("201","conversation_with","Conversation With","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("202","sticker","Sticker","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("203","account_reactivated","Account Reactivated. Welcome Back","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("204","audio_message","Audio Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("205","removed_from_group","Got removed from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("206","mention","@Mention","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("207","forward","Forward","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("208","deactivate_account","Deactivate Account","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("209","ban_from_group","Ban From Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("210","deactivated","Deactivated","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("211","block_user","Block User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("212","group_role","Group Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("213","view_profile","View Profile","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("214","current_role","Current Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("215","ban_from_group_confirmation","Are you sure you want to ban this user from Group ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("216","chat","Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("217","unban_from_group","Unban from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("218","unban_from_group_confirmation","Are you sure you want to unban this user from Group ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("219","sending","Sending","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("220","remove_from_group","Remove from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("221","remove_from_group_confirmation","Are you sure you want to remove this user from Group ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("222","block_user_confirmation","Are you sure you want to block this user ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("223","ignore_user_confirmation","Are you sure you want to ignore this user ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("224","ignore_user","Ignore User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("225","unignore_user","Unignore User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("226","unignore_user_confirmation","Are you sure you want to remove this user from Ignore list ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("227","uploading","Uploading","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("228","unblock_user_confirmation","Are you sure you want to unblock this user ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("229","create_role","Create Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("230","ban_from_site","Ban from Site","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("231","read_more","Read More","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("232","ban_from_site_confirmation","Are you sure you want to ban this user from accessing site ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("233","administrators","Administrators","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("234","add_language","Add Language","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("235","edit_custom_field","Edit Custom Field","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("236","unban_from_site","Unban from Site","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("237","create","Create","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("238","user_email_verification","User Email Verification","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("239","edit","Edit","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("240","today","Today","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("241","yesterday","Yesterday","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("242","update","Update","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("243","unban_from_site_confirmation","Are you sure you want to allow this user from accessing site ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("244","add","Add","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("245","smtp_authentication","SMTP Authentication","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("246","ban_ip_addresses","Ban IP addresses","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("247","smtp_host","SMTP Host","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("248","delete","Delete","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("249","unban_ip_addresses","Unban IP addresses","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("250","report","Report","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("251","ban_ip_addresses_confirmation","Are you sure you want to block user IP addresses ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("252","unban_ip_addresses_confirmation","Are you sure you want to allow user IP addresses ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("253","reply","Reply","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("254","add_members","Add Members","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("255","non_member","Non Member","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("256","login","Login","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("257","add_to_group","Add to Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("258","smtp_username","SMTP Username","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("259","inbox","Inbox","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("260","download","Download","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("261","smtp_password","SMTP Password","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("262","blacklist","Blacklist","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("263","view","View","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("264","smtp_protocol","SMTP (SSL/TLS)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("265","whitelist","Whitelist","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("266","appid","APP/Client ID","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("267","search_here","Search here","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("268","strict_mode","Strict Mode","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("269","smtp_port","SMTP Port","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("270","ip_address","IP address","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("271","edit_group","Edit Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("272","protected_group","Protected Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("273","providers","Providers","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("274","platform","Platform","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("275","export_chat","Export Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("276","secret_group","Secret Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("277","version","Version","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("278","edit_provider","Edit Provider","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("279","user_agent","User Agent","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("280","cover_pic","Cover Pic","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("281","max_file_upload_size","Max File Upload Size (MB)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("282","browser","Browser","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("283","notification_tone","Notification Tone","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("284","leave_group","Leave Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("285","access_time","Access Time","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("286","exceeded_max_file_upload_size","Exceeded Maximum File Upload Size Limit","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("287","default_notification_tone","Default Notification Tone","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("288","delete_access_log_confirmation","Are you sure you want to remove this Access Log ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("289","firewall","Firewall","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("290","messages_per_call","Messages per Call","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("291","unignore","Unignore","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("292","delete_file_confirmation","Are you sure you want to delete this file ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("293","unblock_user","Unblock User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("294","delete_all_files_confirmation","Are you sure you want to delete all files ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("295","unblock","Unblock","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("296","custom_field_1","About Me","one-line","1","0","1");
INSERT INTO gr_language_strings VALUES("297","uploading_files","Uploading File(s)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("298","refresh_rate","Chat Refresh Rate (Seconds)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("299","click_to_view_info","Click here to view info","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("300","body","Body","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("301","username_condition","Your username must contain at least one letter","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("302","infotip_header_tag","This will be printed in the &lt;head&gt; section","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("303","infotip_body_tag","This will be printed after the &lt;body&gt; opening tag","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("304","maximum_login_attempts","Maximum Login Attempts","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("305","infotip_footer_tag","This will be printed before the &lt;/body&gt; closing tag","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("306","invite","Invite","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("307","select_a_page","Select a Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("308","google_analytics_id","Google Analytics ID","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("309","chat_page","Chat Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("310","invite_link","Invite Link","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("311","delete_group","Delete Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("312","entry_page","Entry Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("313","time_format","Time Format","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("314","landing_page","Landing Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("315","no_group_selected","Empty Inbox","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("316","line_break_delimiter","Use line break as the delimiter","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("317","view_groups_without_login","View Public Groups without Login","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("318","default_font","Default Font","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("319","logout","Logout","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("320","mentioned_group_chat","Mentioned you in group chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("321","name_color","Name Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("322","replied_group_message","Posted a response to your group chat message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("323","minutes","Minutes","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("324","content","Content","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("325","dateformat","Date Format","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("326","search","Search","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("327","reply_to","Reply To","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("328","go_offline","Go Offline","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("329","callback_url","Callback URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("330","download_file","Download File","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("331","none","None","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("332","go_online","Go Online","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("333","conversation","Conversation","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("334","records_per_call","Site Records per Call","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("335","online","Online","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("336","meta_description","Meta Description","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("337","deleting","Deleting","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("338","offline","Offline","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("339","meta_title","Meta Title","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("340","maximum_message_length","Maximum Message Length","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("341","cookie_consent","Cookie Consent","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("342","icon_class","Icon Class","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("343","idle","Idle","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("344","exceeded_max_msg_length","Exceeded Maximum Message Length","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("345","identifier","Identifier","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("346","link_type","Link Type","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("347","minimum_message_length","Minimum Message Length","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("348","search_messages","Search messages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("349","custom_page","Custom Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("350","link_target","Link Target","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("351","cancel","Cancel","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("352","open_in_same_window","Open in Same Window","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("353","files","Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("354","open_in_new_tab","Open in New Tab","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("355","groups","Groups","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("356","web_address","Web Address","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("357","menu_items","Menu Items","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("358","deleted","Deleted","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("359","req_min_msg_length","Required Minimum number of characters","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("360","banned_from_group","Banned from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("361","unbanned_from_group","Unbanned From Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("362","read_more_criteria","Add Read More button if height greater than (px)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("363","badge_title","Badge Title","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("364","invalid_group_password","Invalid Group Password","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("365","set_default_language","Set as Default Language","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("366","already_exists","Already Exists","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("367","badge_image","Badge Image","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("368","default","Default","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("369","invalid_value","Invalid Input or Field Empty","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("370","create_badge","Create Badge","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("371","appkey","APP Key","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("372","edit_badge","Edit Badge","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("373","left","Left","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("374","created","Created","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("375","results_found","Results Found","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("376","right","Right","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("377","filter","Filter","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("378","please_wait","Please Wait","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("379","assign","Assign","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("380","updated","Updated","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("381","loading","Loading","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("382","remove","Remove","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("383","username_exists","Username Already Taken","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("384","not_assigned","Not Assigned","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("385","emojis","Emojis","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("386","email_exists","Email Already Exists","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("387","assigned","Assigned","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("388","gifs","GIFs","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("389","new_badge_awarded","New Badge Awarded","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("390","files_uploaded","Files Uploaded","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("391","group_invitation","Invited you to Join the Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("392","group_invitation_email_subject","You&#039;ve Got an Invitation","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("393","error_uploading","Error Uploading Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("394","voice_message","Voice Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("395","error","Error","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("396","group_invitation_email_heading","You&#039;ve Got an invitation","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("397","hide","Hide","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("398","group_invitation_email_content","Come join our community where you can share, learn, and discover amazing resources, ask questions, engage in conversations.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("399","sort","Sort","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("400","group_invitation_email_button_label","Join Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("401","hide_language","Hide Language","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("402","name","Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("403","view_all","View All","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("404","done","Done","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("405","statistics","Statistics","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("406","images","Images","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("407","file_expired","File Expired or Doesn&#039;t exist","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("408","show","Show","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("409","recently_joined","Recently Joined","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("410","videos","Videos","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("411","select_group","Select a Group or Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("412","show_language","Show Language","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("413","total_users","Total Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("414","public_group","Public Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("415","online_users","Online Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("416","group_members","Group Members","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("417","total_groups","Total Groups","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("418","group_name","Group Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("419","admins_moderators","Admins &amp; Moderators","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("420","storage_usage","Storage Usage","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("421","seen_by","Seen By","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("422","username","Username","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("423","others","Others","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("424","users_banned","Users Banned","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("425","password","Password","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("426","storage","Storage","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("427","signup_agreement","I agree to the Terms of Service and Privacy Policy","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("428","play","Play","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("429","audio","Audio","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("430","requires_consent","Your consent is required.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("431","email_address","Email Address","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("432","new_password","New Password","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("433","create_user_if_not_exists","Create User if not exists","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("434","icon","Icon","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("435","banned_till","Banned Till","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("436","language","Language","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("437","temporarily_banned_from_group","Temporarily Banned from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("438","role_name","Role Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("439","temporarily_banned","Temporarily Banned","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("440","system_variables","System Variables","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("441","general_settings","General Settings","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("442","confirm_delete","Are you sure you want to delete the selected item(s) ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("443","system_default","Default","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("444","custom_menu_item_8","Terms","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("445","full_name","Full Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("446","custom_menu_item_9","Privacy Policy","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("447","confirm_password","Confirm Password","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("448","cookie_consent_modal_content","We may use cookies, web beacons, tracking pixels, and other tracking technologies when you visit our website, including any other media form, media channel, mobile website, or mobile application related or connected thereto (collectively, the &quot;Site&quot;) to help customize the Site and improve your experience. We reserve the right to make changes to this Cookie Policy at any time and for any reason. Any changes or modifications will be effective immediately upon posting the updated Cookie Policy on the Site, and you waive the right to receive specific notice of each such change or modification. You are encouraged to periodically review this Cookie Policy to stay informed of updates. You will be deemed to have been made aware of, will be subject to, and will be deemed to have accepted the changes in any revised Cookie Policy by your continued use of the Site after the date such revised Cookie Policy is posted.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("449","mail_login_info","Mail Login Info","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("450","cookie_consent_modal_title","Cookie Consent","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("451","visit","Visit","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("452","agree","Agree","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("453","confirm_join","Are you sure you would like to be part of this group?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("454","site_role","Site Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("455","group_url","Group URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("456","disagree","Disagree","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("457","badge","Badge","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("458","confirm_leave"," Are you sure you want to leave this group?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("459","ffmpeg_binaries_path","FFmpeg Binaries Path","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("460","unblocked","Unblocked","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("461","invite_users","Invite Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("462","ffprobe_binaries_path","FFProbe Binaries Path","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("463","role","Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("464","add_site_members","Add Site Members","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("465","email_settings","Email Settings","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("466","nickname","Nickname","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("467","confirm_export","Do You Want to Export?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("468","super_privileges","Super Privileges","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("469","login_settings","Login Settings","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("470","upload_files","Upload Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("471","header","Header","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("472","message_settings","Message Settings","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("473","download_files","Download Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("474","notification_settings","Notifications","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("475","footer","Footer","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("476","delete_files","Delete Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("477","realtime_settings","Realtime Settings","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("478","attach_files","Attach Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("479","ltr","Left to Right","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("480","system_messages_groups","System Messages (Groups)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("481","access_storage","Access Storage","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("482","site_notifications","Site Notifications","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("483","rtl","Right to Left","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("484","push_notifications","Push Notifications","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("485","language_text_direction","Text direction","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("486","send_push_notification","Send Push Notification","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("487","embed_code","Embed Code","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("488","on_join_group_chat","Someone joins Group Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("489","is_typing","is typing","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("490","on_removal_from_group","Someone removed from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("491","force_https","Force HTTPS","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("492","email_username","Email/Username","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("493","on_leaving_group_chat","Someone leaves Group Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("494","on_awarding_group_badges","Group awarded with new badge","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("495","separate_commas","Separate with commas","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("496","pinned_group","Pinned","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("497","on_getting_banned_from_group","Someone banned from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("498","timezone","TimeZone","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("499","unleavable","Unleavable","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("500","on_getting_unbanned_from_group","Someone unbanned from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("501","on_getting_temporarily_banned_from_group","Someone temporarily banned from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("502","custom_avatar","Custom Avatar","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("503","unleavable_group","Unleavable Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("504","on_updating_group_info","Updating Group Information","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("505","custom_background","Custom Background","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("506","updated_group_info","Updated Group Info","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("507","screenshot","Screenshot","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("508","options","Options","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("509","onesignal","OneSignal","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("510","switch","Switch","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("511","onesignal_app_id","OneSignal APP ID","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("512","onesignal_rest_api_key","OneSignal REST API Key","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("513","ban","Ban","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("514","onesignal_safari_web_id","OneSignal Safari Web ID","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("515","new","New","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("516","push_notification_icon","Push Notification Icon","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("517","non_latin_usernames","Non Latin Usernames","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("518","members","Members","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("519","onesignal_prompt_message","We would like to send you Push Notifications for the latest Updates.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("520","sending_limit","Sending Limit (Per Minute)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("521","onesignal_prompt_accept_button","Allow","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("522","join_group","Join Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("523","onesignal_prompt_cancel_button","Cancel","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("524","join","Join","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("525","sending_limit_reached","Sending Limit Reached. Please wait : ","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("526","web_push_new_pm_message","Sent you a private message.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("527","web_push_sent_reply_message","Replied to Your Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("528","seconds","Seconds","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("529","member","Member","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("530","someone","Someone","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("531","on_user_mention_group_chat","Someone mentions user in Group Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("532","web_push_mentioned_user_message","Mentioned you in Group Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("533","on_group_invitation","Someone send an invitation to join a group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("534","on_private_message","Someone send a Private Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("535","pwa_settings","PWA Settings","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("536","on_new_site_badges","User awarded with new badge","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("537","progressive_web_application","Progressive Web Application","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("538","on_reply_group_messages","Someone replies to the user messages (Group Chat)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("539","pwa_name","Application Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("540","pwa_short_name","Application Short Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("541","group_info","Group Info","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("542","admin","Admin","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("543","pwa_background_color","Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("544","created_on","Created On","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("545","moderator","Moderator","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("546","pwa_theme_color","Theme Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("547","profile","Profile","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("548","blocked","Blocked","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("549","pwa_description","Description","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("550","description","Description","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("551","pwa_display","Display Mode","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("552","confirm","Confirm","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("553","standalone","Standalone","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("554","login_cookie_validity","Login Cookie Validity (Days)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("555","fullscreen","Fullscreen","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("556","minimal-ui","Minimal UI","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("557","add_menu_item","Add Menu Item","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("558","gif_content_filtering","GIF Content Filtering","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("559","high","High","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("560","link_text","Link Text","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("561","medium","Medium","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("562","url","URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("563","low","Low","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("564","off","Off","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("565","order","Order","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("566","reactions","Reactions","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("567","load_more","Load More","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("568","custom_menu","Custom Menu","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("569","create_public_group","Create Public Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("570","menu_item","Menu Item","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("571","edit_own_group","Edit own Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("572","edit_role","Edit Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("573","delete_own_group","Delete their own Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("574","edit_menu_item","Edit Menu Item","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("575","attach_from_storage","Attach from Storage","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("576","gravatar","Gravatar","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("577","device_blocked","Your Device had been Blocked. Maximum Login Attempts Exceeded. Try again in one hour.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("578","view_group_members","View Group Members","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("579","view_currently_online","View Currently Online","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("580","invalid_login","Invalid Login Credentials","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("581","typing_indicator","Typing Indicator","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("582","denied","Permission Denied","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("583","view_public_groups","View Public Groups","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("584","view_secret_groups","View Secret Groups","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("585","unknown","Unknown","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("586","view_password_protected_groups","View Password Protected Groups","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("587","shared_file","Shared a File","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("588","banned","Banned","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("589","unban","Unban","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("590","created_group","Created Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("591","all","All","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("592","complaints","Complaints","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("593","joined","Joined","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("594","report_message","Report Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("595","reported","Reported","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("596","unjoined","Unjoined","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("597","spam","Spam","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("598","request_timeout","Timeout Seconds (Long Polling)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("599","abuse","Abuse","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("600","view_reactions","View Reactions","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("601","offline_page_expression","Oops!","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("602","react_messages","React to Messages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("603","offline_page_title","You are Offline","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("604","download_attachments","Download Attachments","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("605","monitor_group_chats","Monitor Group Chats","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("606","offline_page_description","It looks like you have lost your internet connection. Perhaps you went into a tunnel or turned on airplane mode on your phone.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("607","image","Image","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("608","offline_page_button","Refresh","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("609","share","Share","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("610","dark_mode","Dark Mode","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("611","edit_site_role","Edit Site Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("612","maximum_storage_space","Maximum Storage Space (MB)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("613","light_mode","Light Mode","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("614","allowed_file_formats","Allowed File Formats","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("615","inappropriate","Inappropriate","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("616","default_skin_mode","Default Color Scheme","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("617","create_unleavable_group","Create Unleavable Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("618","control_storage","Full Control Access to User&#039;s Storage","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("619","create_secret_group","Create Secret Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("620","image_files","Image Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("621","create_protected_group","Create Protected Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("622","preview_attachments","Preview Attachments","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("623","video_files","Video Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("624","pwa_icon","PWA icon","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("625","documents","Documents","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("626","mobile_page_transition","Mobile Page Transition","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("627","all_file_formats","All File Formats","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("628","tertiary_text_color","Tertiary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("629","manage_user_access_logs","Manage User Access Logs","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("630","remove_custom_bg","Remove Custom BG","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("631","change_full_name","Change Full Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("632","quaternary_text_color","Quaternary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("633","delete_all","Delete All","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("634","change_username","Change Username","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("635","change_avatar","Change Avatar","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("636","senary_text_color","Senary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("637","upload_custom_avatar","Upload Custom Avatar","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("638","septenary_text_color","Septenary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("639","set_custom_background","Set Custom background","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("640","set_cover_pic","Set Cover Pic","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("641","octonary_text_color","Octonary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("642","send_on_behalf","Send Messages on Behalf","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("643","custom_site_role","Custom Site Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("644","delete_users","Delete Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("645","nonary_text_color","Nonary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("646","edit_custom_field_value","Edit Custom Field Value","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("647","view_site_users","View Site Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("648","switch_languages","Switch Languages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("649","denary_text_color","Denary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("650","view_online_users","View Online Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("651","listen_music","Listen Music","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("652","edit_users","Edit Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("653","primary_border_color","Primary Border Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("654","site_adverts","Site Adverts","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("655","core_settings","Core Settings","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("656","send_message","Send Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("657","secondary_border_color","Secondary Border Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("658","create_site_role","Create Site Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("659","send_audio_message","Send Audio Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("660","tertiary_border_color","Tertiary Border Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("661","attach_gifs","Attach GIFs","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("662","quaternary_border_color","Quaternary Border Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("663","share_screenshot","Share Screenshot","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("664","quinary_border_color","Quinary Border Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("665","allow_sharing_links","Allow Sharing Links","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("666","senary_border_color","Senary Border Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("667","generate_link_preview","Generate Link Preview","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("668","delete_own_message","Delete their own Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("669","septenary_border_color","Septenary Border Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("670","delete_all_messages","Delete All Messages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("671","private_conversations","Private Conversations","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("672","octonary_border_color","Octonary Border Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("673","confirm_delete_all_messages","Are you sure you want to delete all chat messages?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("674","initiate_private_chat","Initiate Private Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("675","site_role_1","Unverified","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("676","view_private_chats","View Private Chats","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("677","nonary_border_color","Nonary Border Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("678","profile_url","Profile URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("679","site_role_2","Web Admin","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("680","monitor_private_chats","Monitor Private Chats","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("681","view_full_name","View Full Name","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("682","site_role_3","Registered","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("683","private_chats","Private Chats","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("684","site_role_4","Banned","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("685","delete_message_time_limit","Time Limit to Delete their own Messages (Minutes)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("686","unbanned","Unbanned","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("687","site_role_5","Guest","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("688","cron_jobs","Cron Jobs","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("689","site_roles","Site Roles","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("690","newest","Newest","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("691","clear_chat_history","Clear Chat History","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("692","switch_color_scheme","Switch Color Scheme","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("693","view_joined_groups","View Joined Groups","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("694","clear_chat","Clear Chat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("695","sort_by_default","Default","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("696","notifications","Notifications","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("697","export","Export","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("698","no_conversation_found","No Conversation Found","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("699","site_controls","Site Controls","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("700","no_conversation_found_subtitle","Try changing the filters or search term","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("701","dashboard","Dashboard","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("702","import","Import","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("703","permission_denied","Permission Denied","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("704","ip_blacklist","IP Blacklist","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("705","select_an_option","Select an Option","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("706","access_denied_message","403 Forbidden You don&#039;t have permission to access.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("707","customizer","Customizer","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("708","autoplay_audio_player","Autoplay Audio Player","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("709","profanity_filter","Profanity Filter","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("710","group_join_confirmation","Group Join Confirmation","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("711","view_statistics","View Statistics","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("712","something_went_wrong","Something Went Wrong","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("713","default_timezone","Default Timezone","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("714","field_type","Field Type","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("715","captcha","Captcha","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("716","field_options","Field Options","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("717","captcha_secret_key","Captcha Secret Key","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("718","required_field","Required Field","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("719","captcha_site_key","Captcha Site Key","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("720","auto_join_group","Auto Add Users on Signup","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("721","default_language","Default Language","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("722","custom_page_3_content","\"p\"This Privacy Policy governs the manner in which we collects, uses, maintains and discloses information collected from users (each, a \"User\") of our website (\"Site\"). This privacy policy applies to the Site and all products and services offered by us.</p>\"p\"\"b\"1) Personal identification information</b></p>\"p\"We may collect personal identification information from Users in a variety of ways, including, but not limited to, when Users visit our site, subscribe to the newsletter, fill out a form, and in connection with other activities, services, features or resources we make available on our Site.. Users may visit our Site anonymously. We will collect personal identification information from Users only if they voluntarily submit such information to us. Users can always refuse to supply personally identification information, except that it may prevent them from engaging in certain Site related activities.</p>\"p\"\"b\"2) Non-personal identification information</b></p>\"p\"We may collect non-personal identification information about Users whenever they interact with our Site. Non-personal identification information may include the browser name, the type of computer and technical information about Users means of connection to our Site, such as the operating system and the Internet service providers utilized and other similar information.</p>\"p\"\"b\"3) Chat Room Privacy</b></p>\"p\"Administrators and Moderators of the Chat Rooms can see the I.P. of the Users who are chatting. We do not save I.P. addresses of the Users, neither do we share I.P addresses with others. As long as you do not provide (not recommended) your real name, address, Email ID and any other personal information in the chat room, you are completely anonymous to other users.</p>\"p\"\"b\"4) How we use collected information</b></p>\"p\"We may collect and use Users personal information for the following purposes:</p>\"p\"? To improve customer service Information you provide helps us respond to your customer service requests and support needs more efficiently.</p>\"p\"? To improve our Site We may use feedback you provide to improve our products and services.</p>\"p\"? To run a promotion, contest, survey or other Site feature. To send Users information they agreed to receive about topics we think will be of interest to them.</p>\"p\"? To send periodic emails We may use the email address to respond to their inquiries, questions, and/or other requests.</p>\"p\"\"b\"5) How we protect your information</b></p>\"p\"We adopt appropriate data collection, storage and processing practices and security measures to protect against unauthorized access, alteration, disclosure or destruction of your personal information, username, password, transaction information and data stored on our Site.</p>\"p\"\"b\"6) Sharing your personal information</b></p>\"p\"We do not sell, trade, or rent Users personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates and advertisers for the purposes outlined above.</p>\"p\"\"b\"7) Third party websites</b></p>\"p\"Users may find advertising or other content on our Site that link to the sites and services of our partners, suppliers, advertisers, sponsors, licensors and other third parties. We do not control the content or links that appear on these sites and are not responsible for the practices employed by websites linked to or from our Site. In addition, these sites or services, including their content and links, may be constantly changing. These sites and services may have their own privacy policies and customer service policies. Browsing and interaction on any other website, including websites which have a link to our Site, is subject to that website?s own terms and policies.</p>\"p\"\"b\"8) Advertising</b></p>\"p\"Ads appearing on our site may be delivered to Users by advertising partners, who may set cookies. These cookies allow the ad server to recognize your computer each time they send you an online advertisement to compile non personal identification information about you or others who use your computer. This information allows ad networks to, among other things, deliver targeted advertisements that they believe will be of most interest to you. This privacy policy does not cover the use of cookies by any advertisers.</p>\"p\"\"b\"9) Log Files</b></p>\"p\"As with most other websites, we collect and use the data contained in log files. The information in the log files include your IP (internet protocol) address, your ISP (internet service provider, such as AOL or Shaw Cable), the browser you used to visit our site (such as Internet Explorer or Firefox), the time you visited our site and which pages you visited throughout our site.</p>\"p\"\"b\"10) Cookies and Web Beacons</b></p>\"p\"We do use cookies to store information, such as your personal preferences when you visit our site. This could include only showing you a popup once in your visit, or the ability to login to some of our features, such as forums.</p>\"p\"We also use third party advertisements to support our site. Some of these advertisers may use technology such as cookies and web beacons when they advertise on our site, which will also send these advertisers (such as Google through the Google AdSense program) information including your IP address, your ISP , the browser you used to visit our site, and in some cases, whether you have Flash installed. This is generally used for geotargeting purposes (showing New York real estate ads to someone in New York, for example) or showing certain ads based on specific sites visited (such as showing cooking ads to someone who frequents cooking sites).</p>\"p\"\"b\"11) Compliance with children?s online privacy protection act</b></p>\"p\"Protecting the privacy of the very young is especially important. For that reason, we never collect or maintain information at our Site from those we actually know are under 13, and no part of our website is structured to attract anyone under 13.</p>\"p\"\"b\"12) Changes to this privacy policy</b></p>\"p\"We has the discretion to update this privacy policy at any time. When we do, we will revise the updated date at the bottom of this page. We encourage Users to frequently check this page for any changes to stay informed about how we are helping to protect the personal information we collect. You acknowledge and agree that it is your responsibility to review this privacy policy periodically and become aware of modifications.</p>\"p\"\"b\"13) Your acceptance of these terms</b></p>\"p\"By using this Site, you signify your acceptance of this policy and terms of service. If you do not agree to this policy, please do not use our Site. Your continued use of the Site following the posting of changes to this policy will be deemed your acceptance of those changes.</p>","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("723","denary_border_color","Denary Border Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("724","create_sticker_pack","Create Sticker Pack","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("725","gif_search_engine","GIF Search Engine","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("726","edit_sticker_pack","Edit Sticker Pack","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("727","custom_page_23","test","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("728","primary_font_size","Primary Font Size","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("729","string_constant","String Constant","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("730","set_as_default","Set as Default","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("731","secondary_font_size","Secondary Font Size","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("732","custom_page_23_content","test","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("733","social_login_providers","Social Login Providers","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("734","tertiary_font_size","Tertiary Font Size","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("735","change_to_idle_status_after","Change to Idle Status After (Minutes)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("736","add_audio_files","Add Audio Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("737","disable_private_messages","Disable Private Messages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("738","quaternary_font_size","Quaternary Font Size","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("739","change_to_offline_status_after","Change to Offline Status After (Minutes)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("740","ignore_users","Ignore Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("741","gif_search_engine_api","GIF Search Engine API","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("742","quinary_font_size","Quinary Font Size","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("743","exceeded_group_join_limit","Exceeded Maximum Number of Groups You can Join","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("744","block_users","Block Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("745","gifs_per_load","GIFs Per Load","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("746","senary_font_size","Senary Font Size","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("747","ban_users_from_site","Ban Users from Site","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("748","storage_limit_exceeded","Storage Limit Exceeded","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("749","api_secret_key","API Secret Key","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("750","unban_users_from_site","Unban Users from Site","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("751","chat_page_boxed_layout","Boxed Layout","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("752","google_recaptcha_v2","Google reCAPTCHA v2","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("753","assign_badges","Assign Badges","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("754","location","Location","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("755","hcaptcha","hCaptcha","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("756","login_as_another_user","Login as Another User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("757","ssl","SSL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("758","clear_realtime_activity_logs","Clear Activity Logs","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("759","messages","Messages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("760","tls","TLS","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("761","attach_stickers","Attach Stickers","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("762","rebuild_cache","Rebuild Cache","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("763","tenor","Tenor","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("764","blacklist_user_permission_denied","Permission Denied : You are not allowed to block/ignore Site Administrators","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("765","septenary_font_size","Septenary Font Size","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("766","gfycat","Gfycat","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("767","reply_messages","Reply Messages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("768","dmy_format","Day Month Year","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("769","octonary_font_size","Octonary Font Size","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("770","read_status","Read Status","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("771","mdy_format","Month Day Year","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("772","nonary_font_size","Nonary Font Size","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("773","track_status","Track Status","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("774","ymd_format","Year Month Day","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("775","under_review","Under Review","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("776","view_complaint","View Complaint","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("777","24_format","24-hour clock","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("778","review_complaints","Review Complaints","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("779","review","Review","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("780","12_format","12-hour clock","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("781","comments_by_complainant","Comments by Complainant","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("782","email","Email","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("783","comments_by_reviewer","Comments by Reviewer","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("784","rebuild","Rebuild","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("785","last_visit","Last Visit","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("786","complaint_status","Complaint Status","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("787","style_sheets","Style Sheets","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("788","data_unavailable","Data Unavailable","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("789","add_meta_tags","Add Meta Tags","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("790","pin_groups","Pin Groups","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("791","color_scheme","Color Scheme","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("792","javascript_files","Javascript Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("793","set_auto_join_groups","Set Auto Join Groups","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("794","sitemap","Sitemap","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("795","view_invisible_users","View Invisible Users (Offline Mode)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("796","set_participant_settings","Set Participant Settings","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("797","denary_font_size","Denary Font Size","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("798","web_app_manifest","Web App Manifest","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("799","set_group_slug","Set Group Slug","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("800","custom_fields","Custom Fields","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("801","quinary_text_color","Quinary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("802","loading_image","Loading Image","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("803","change_email_address","Change Email Address","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("804","background","Background","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("805","cron_job","Cron Job","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("806","default_group_role","Default Group Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("807","type","Type","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("808","delete_group_messages","Delete Group Messages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("809","entry_page_background","Entry Page Background","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("810","custom_group_role","Custom Group Role","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("811","disabled","Disabled","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("812","delete_private_messages","Delete Private Messages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("813","custom_css","Custom CSS","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("814","moderators","Moderators","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("815","enabled","Enabled","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("816","delete_site_users","Delete Site Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("817","show_group_label","Show Group Role Next to Chat Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("818","delete_user_files","Delete User Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("819","status","Status","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("820","label_text_color","Label Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("821","radio_stations","Radio Stations","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("822","delete_shared_files","Delete Shared Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("823","label_background_color","Label Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("824","custom_pages","Custom Pages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("825","delete_older_than","Delete older than (Minutes)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("826","pages","Pages","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("827","manage_user_roles","Manage User Roles","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("828","social_login","Social Login","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("829","entries_per_call","Entries per call","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("830","adverts","Adverts","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("831","ban_users_from_group","Ban Users from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("832","delete_only_offline_users","Delete only Offline Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("833","sticker_packs","Sticker Packs","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("834","unban_users_from_group","Unban Users from Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("835","add_cron_job","Add Cron Job","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("836","css_code","CSS Code","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("837","advert_content","Advert Content","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("838","temporary_ban_from_group","Temporary Ban","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("839","edit_cron_job","Edit Cron Job","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("840","banned_from_group_message","You are Banned from accessing the Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("841","went_wrong","Something Went Wrong","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("842","cron_job_url","Cron Job URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("843","temporarily_banned_from_group_message","You are Temporarily Banned from accessing the Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("844","command","Command","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("845","on_group_creation","On Group Creation","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("846","app_id","APP ID or Client ID","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("847","remove_group_members","Remove Group Members","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("848","hero_section_heading","Hero Section [Heading]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("849","send_as_another_user","Send Messages as Another Site User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("850","secret_key","Secret Key","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("851","hero_section_image","Hero Section [Image]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("852","hero_section_description","Hero Section [Description]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("853","open_in_popup","Open in Popup","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("854","mention_users","Mention Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("855","static_image","Static Image","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("856","groups_section_description","Groups Section [Description]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("857","add_custom_page","Add Custom Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("858","check_read_receipts","Check Read Receipts","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("859","custom_page_1","About","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("860","groups_section_heading","Groups Section [Heading]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("861","page_title","Page Title","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("862","media","Media","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("863","external_page","External Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("864","custom_page_1_content","\"p\"This is a simple and easy to use chatroom. Join us now and talk to people from all over the world.

Our mission is to share and grow the world?s knowledge. </p>\"p\"A vast amount of the knowledge that would be valuable to many people is currently only available to a few ? either locked in people?s heads, or only accessible to select groups. We want to connect the people who have knowledge to the people who need it, to bring together people with different perspectives so they can understand each other better, and to empower everyone to share their knowledge for the benefit of the rest of the world.</p>\"p\"A chat room is a Web site, part of a Web site, or part of an online service, that provides a venue for communities of users with a common interest to communicate in real time. Forums and discussion groups, in comparison, allow users to post messages but don\'t have the capacity for interactive messaging. Most chat rooms don\'t require users to have any special software; those that do, such as Internet Relay Chat (IRC) allow users to download it from the Internet.</p>\"p\"Chat room users register for the chat room of their choice, choose a user name and password, and log into a particular room (most sites have multiple chat rooms). Inside the chat room, generally there is a list of the people currently online, who also are alerted that another person has entered the chat room. To chat, users type a message into a text box. The message is almost immediately visible in the larger communal message area and other users respond. Users can enter chat rooms and read messages without sending any, a practice known as lurking.</p>\"p\"Because chat room messages are spontaneous and instantly visible, there is a potential for abuse, which may or may not be intentional. Site hosts typically post a frequently asked questions (FAQ) list to guide users to appropriate chat room behavior, such as introducing yourself when you enter a room, making it clear when you are directing a question or response to a specific user, and reporting disruptive users, for example. Disruptive users may verbally abuse other chatters, monopolize the conversation, or even just disable it by repeatedly typing the same word or phrase into the conversation, a practice (much frowned upon) known as scrolling.</p>\"p\"Chat rooms can be found that focus on virtually any aspect of human endeavor or interest: there are current communities based on classic movies, Irish ancestry, baton twirling, and psychic readings, for example. Various sites, such as Yahoo, provide a directory of chat sites. Others, such as MSN Web Communities, guide users through the steps required to create their own chat room.</p>\"p\"
</p>

","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("865","other_files","Other Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("866","external_link","External Link","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("867","links","Links","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("868","page_content","Page Content","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("869","view_shared_files","View Shared Files","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("870","menu_title","Menu Title","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("871","view_shared_links","View Shared Links","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("872","read_receipts","Read Receipts","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("873","total_members","Total Members","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("874","show_only_on_specific_language","Show only on Specific Language","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("875","email_logo","Logo (Email Template)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("876","show_on_front_page","Show on Frontpage","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("877","unverified_email_address","Unverified Email Address","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("878","confirm_email_address","You are required to verify your email address. We have sent an email with a confirmation link to your email address.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("879","show_on_entry_page","Show on Entry Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("880","custom_page_2","Terms of Service","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("881","email_login_link","Email Login Link","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("882","edit_custom_page","Edit Custom Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("883","login_link_email_subject","Your Login Link","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("884","custom_page_2_content","\"div\"1. Terms</div>\"div\"By accessing this website, you are agreeing to be bound by the Terms and Conditions of Use, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing this website. The content contained here are protected by applicable copyright and trade mark laws. Please take the time to review our privacy policy.</div>\"div\"<br /></div>\"div\"2. Use License</div>\"div\"Permission is granted for the temporary use of the group chat, filemanager on web site for personal, non-commercial use only. This is the grant of the services, not a transfer of title, and under this license you may not: modify or copy the materials; use the materials for any commercial purpose, or for any public display (commercial or non-commercial); attempt to decompile or reverse engineer any software contained on the website; remove any copyright or other proprietary notations from the materials; or transfer the materials to another person or \"mirror\" the materials on any other website or server. This license shall automatically terminate if you violate any of these restrictions and may be terminated by the website at any time.</div>\"div\"<br /></div>\"div\"3. Disclaimer</div>\"div\"The content on the website are provided \"as is\". We makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties, including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. Furthermore, We does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the content on its website or otherwise relating to such content or on any sites linked to this site.</div>\"div\"<br /></div>\"div\"4. Limitations</div>\"div\"In no event shall we be liable for any damages (including, without limitation, damages for loss of data or profit, due to business interruption, or criminal charges filed against you) arising out of the use or inability to use the content on the website, even if we or a authorized representative has been notified orally or in writing of the possibility of such damage. This applies to the use of our chat rooms and filemanager. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.</div>\"div\"<br /></div>\"div\"5. Revisions and Errata</div>\"div\"The materials appearing on the website could include technical, typos, or image errors. We does not warrant that any of the content on its website are accurate, complete, or current. We may make changes to the content on its website at any time without any noticeWe does not, however, make any commitment to update the content.</div>\"div\"<br /></div>\"div\"6. Links</div>\"div\"We has not reviewed all of the sites linked from its website and is not responsible for the contents contained within. The inclusion of any link does not imply endorsement by us. Use of any such linked web site is at the user\'s own risk.</div>\"div\"<br /></div>\"div\"7. Age Limitations</div>\"div\"In general, the age minimum for this webs site is 13. This website will not be held responsible for users who do not comply with the given age range as this information is not verifiable.</div>\"div\"<br /></div>\"div\"8. Hateful Content</div>\"div\"We does not tolerate any form of hateful or violent content in our chat rooms or on our forums. This includes threats, promotion of violence or direct attacks towards other users based upon ethnicity, race, religion, sexual orientation, religion affiliation, age, disability, serious diseases and gender. Users also are prohibited from using hateful images for their profile pictures/avatars. This includes usernames. All such comment will be removed when noticed or reported to our staff.</div>\"div\"<br /></div>\"div\"9. Illegal Content</div>\"div\"We does not tolerate any form of illegal content in our chat rooms or on our forums. Users also are prohibited from using or uploading illegal images including child pornography or other illegal content. This includes, but not limited to, profile pictures/avatars and any image transfers or uploads. This includes usernames. If you do so, you will be subject to being kicked, banned and, in some cases, reported to law enforcement. We will, to its highest ability, remove all illegal content when it is discovered or reported to us. We will not be held responsible for such content unless it is noticed and reported to our staff.</div>\"div\"<br /></div>\"div\"10. Terms of Use Changes</div>\"div\"We may revise these terms of use for its web site at any time without notice. By using this web site you are agreeing to be bound by the then current version of these Terms and Conditions of Use. If you cannot agree to this, please do not use this website.</div>","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("885","login_link_email_heading","Welcome To The Community","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("886","icon_img","Icon","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("887","login_link_email_content","A warm welcome to our website. You&#039;re now part of our website. We&#039;re excited to have you on board. Meet new friends. Share your experiences.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("888","default_txt","Default","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("889","login_link_email_button_label","Login Now","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("890","custom_page_3","Privacy Policy","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("891","faq_section_heading","FAQ Section [Heading]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("892","suspended","Suspended","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("893","infotip_select_multiple_files","To select multiple files, hold the Ctrl (PC) or Command (Mac) key and using your trackpad or external mouse, click on all the other files you wish to select one by one.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("894","answer","Answer","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("895","unsuspend","Unsuspend","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("896","iso_language_code","ISO Language Code","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("897","suspend","Suspend","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("898","question","Question","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("899","group_suspended","Sorry, this group has been Suspended.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("900","password_doesnt_match","Password doesn&#039;t match the Confirm password","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("901","copyright_notice","Copyright Notice","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("902","left_panel_content_on_page_load","Content to Show on Page Load [Left Panel]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("903","remove_cover_pic","Remove Cover Pic","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("904","main_panel_content_on_page_load","Content to Show on Page Load [Main Panel]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("905","footer_block_heading","Footer Block [Heading]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("906","custom_field_2","Birth Date","one-line","1","0","1");
INSERT INTO gr_language_strings VALUES("907","error_message","Something went wrong, try refreshing.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("908","footer_block_description","Footer Block [Description]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("909","flood_control_error_message","You are submitting too quickly. Please wait","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("910","custom_field_3","Gender","one-line","1","0","1");
INSERT INTO gr_language_strings VALUES("911","flood_control_time_difference","Required time difference between each message (seconds)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("912","facebook_url","Facebook URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("913","message_alignment","Message Alignment","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("914","custom_field_4","Phone","one-line","1","0","1");
INSERT INTO gr_language_strings VALUES("915","own_message_alignment","Message Alignment [Own]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("916","instagram_url","Instagram URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("917","custom_field_5","Location","one-line","1","0","1");
INSERT INTO gr_language_strings VALUES("918","welcome_screen_heading","Hello, and a warm welcome to you","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("919","twitter_url","Twitter URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("920","custom_field_3_options","{\"male\":\"Male\",\"female\":\"Female\",\"non_binary\":\"Non-binary\"}","multi_line","1","0","1");
INSERT INTO gr_language_strings VALUES("921","welcome_screen_message","Share what&#039;s on your mind with other people from all around the world to find new friends","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("922","custom_page_24","test","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("923","welcome_screen_footer_text","By accessing this website, you are agreeing to be bound by the Terms and Conditions of Use","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("924","linkedin_url","LinkedIn URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("925","values","Values","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("926","custom_page_24_content","<p><br /></p>","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("927","welcome_message","Welcome Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("928","twitch_url","Twitch URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("929","confirm_action","Are you sure you want to continue ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("930","custom_page_25","sdsd","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("931","heading","Heading","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("932","landing_page_hero_section_heading","Much more than just another chat site","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("933","badges","Badges","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("934","custom_page_25_content","<p><br /></p>","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("935","footer_text","Footer Text","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("936","landing_page_hero_section_description","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("937","default_group_visibility","Default Group Visibility","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("938","not_found","Not Found","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("939","landing_page_groups_section","Groups Section (Landing Page)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("940","landing_page_groups_section_heading","Trending Groups","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("941","visible","Visible","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("942","manage_custom_fields","Manage Custom Fields","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("943","landing_page_faq_section","FAQ Section (Landing Page)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("944","hidden","Hidden","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("945","landing_page_groups_section_description","Where Good conversation become great experiences","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("946","footer_logo","Footer Logo","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("947","social_share_image","Default Social Share Image","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("948","landing_page_footer_text","All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("949","load_profile_on_page_load","Load Profile on Page Load","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("950","enter_is_send","Send message with Enter key","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("951","webpushr_authentication_token","Webpushr Authentication Token","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("952","landing_page_footer_block_one_heading","Address","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("953","recording","Recording","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("954","show_on_signup","Show on Signup Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("955","webpushr","Webpushr","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("956","landing_page_footer_block_one_description","3 Burthong Road, Eremerang, New South Wales, 2877 Australia","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("957","webpushr_public_key","Webpushr Public Key","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("958","custom_field_6","Country","one-line","1","0","1");
INSERT INTO gr_language_strings VALUES("959","not_a_group_member_message","You are not a member of this Group. Click here to Join.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("960","landing_page_footer_block_two_heading","Contact","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("961","webpushr_rest_api_key","Webpushr REST API Key","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("962","new_message_notification","You have a new message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("963","switch_user","Switch User","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("964","landing_page_footer_block_two_description","+44 1632 960811hello@yourdomain.com","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("965","play_notification_sound","Play a Notification Sound","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("966","disallowed_slugs","Disallowed Slugs","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("967","landing_page_copyright_notice","? 2021 Company, Inc. All rights reserved.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("968","on_new_message","On New Message","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("969","mini_audio_player","Mini Audio Player","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("970","on_new_site_notification","On New Site Notification","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("971","landing_page_faq_section_heading","Frequently Asked Questions","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("972","on_group_unread_count_change","On Group Unread Count Change","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("973","load_group_info_on_group_load","Load Group Info on Group Load","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("974","landing_page_faq_question_1","How to create an account ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("975","on_private_conversation_unread_count_change","On Private Conversation Unread Count Change","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("976","system_info","System Info","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("977","landing_page_faq_question_1_answer","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("978","modules","Modules","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("979","new_user_approval","New User Approval","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("980","group_chats","Group Chats","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("981","landing_page_faq_question_2","How to Delete an account ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("982","wait_for_profile_approval","Your Account is currently pending approval. Once your profile has been approved you can login.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("983","monitor","Monitor","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("984","landing_page_faq_question_2_answer","02 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("985","pending_approval","Pending Approval","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("986","not_logged_in","Not Logged In","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("987","unverified","Unverified","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("988","not_logged_in_message","You are not logged in. Click here to log in.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("989","landing_page_faq_question_3","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("990","embed","Embed","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("991","approve_users","Approve Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("992","embed_group","Embed Group","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("993","landing_page_faq_question_3_answer","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("994","entry_page_form_header","Form Header (Entry Page)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("995","landing_page_faq_question_4","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("996","entry_page_form_footer","Form Footer (Entry Page)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("997","landing_page_faq_question_4_answer","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("998","landing_page_faq_question_5","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("999","landing_page_faq_question_5_answer","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1000","landing_page_faq_question_6","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1001","landing_page_faq_question_6_answer","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1002","landing_page_faq_question_7","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1003","landing_page_faq_question_7_answer","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1004","landing_page_faq_question_8","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1005","landing_page_faq_question_8_answer","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1006","landing_page_faq_question_9","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1007","landing_page_faq_question_9_answer","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1008","landing_page_faq_question_10","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1009","landing_page_faq_question_10_answer","","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1010","home","Home","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1011","faq","FAQ","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1012","show_on_landing_page_footer","Show on Landing Page [Footer]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1013","show_on_landing_page_header","Show on Landing Page [Header]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1014","custom_menu_item_16","About","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1015","custom_menu_item_17","Sitemap","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1016","featured_image","Featured Image","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1017","approve","Approve","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1018","disapprove","Disapprove","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1019","disapprove_user_confirmation","Are you sure you want to disapprove this user ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1020","approve_user_confirmation","Are you sure you want to approve this user ?","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1021","custom_login_url","Custom Login URL","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1022","custom_url_on_logout","Custom URL on Logout","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1023","hero_section_animation","Hero Section [Animation]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1024","hide_group_member_list_from_non_members","Hide Group Member list from Non members","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1025","display_full_file_name_of_attachments","Display full file name of Attachment(s)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1026","link_field","Link","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1027","daily_send_limit_group_messages","Daily Send Limit [Group Messages]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1028","zero_equals_unlimited","(0 = Unlimited)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1029","daily_send_limit_private_messages","Daily Send Limit [Private Messages]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1030","maximum_sending_rate_exceeded","Maximum Sending Rate Exceeded","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1031","groups_section_status","Groups Section [Status]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1032","faq_section_status","FAQ Section [Status]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1033","view_public_group_messages_non_member","View Public Group Messages without being Group Member [Logged in Users]","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1034","access_denied_non_member_message","You are not part of this Group. Join Group to View Messages.","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1035","ad_free_account","Ad-Free Account","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1036","who_all_can_view_page","Who all can View Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1037","custom_page_4","test","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("1038","custom_page_4_content","<p><br /></p>","multi_line","1","1","1");
INSERT INTO gr_language_strings VALUES("1039","menu_item_visibility","Menu Item Visibility","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1040","hide_name_field_in_registration_page","Hide Name Field in Registration Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1041","hide_email_address_field_in_registration_page","Hide Email Address Field in Registration Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1042","hide_username_field_in_registration_page","Hide Username Field In Registration Page","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1043","advert_min_height","Minimum Height (px)","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1044","id","ID","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1045","image_moderation","Image Moderation","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1046","sightengine_api_user","Sightengine API user","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1047","sightengine_api_secret","Sightengine API Secret","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1048","image_removal_criteria","Delete Images that contain","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1049","partial_nudity","Partial Nudity","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1050","explicit_nudity","Explicit Nudity","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1051","wad_content","Weapons, Alcohol &amp; Drugs","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1052","offensive_signs_gestures","Offensive Signs &amp; Gestures","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1053","graphic_violence_gore","Graphic Violence &amp; Gore","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1054","minimum_score_required_partial_nudity","Minimum Score Required [Partial Nudity] %","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1055","minimum_score_required_explicit_nudity","Minimum Score Required [Explicit Nudity] %","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1056","minimum_score_required_wad_content","Minimum Score Required [Weapons, Alcohol &amp; Drugs] %","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1057","minimum_score_required_offensive","Minimum Score Required [Offensive Signs &amp; Gestures] %","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1058","minimum_score_required_graphic_violence_gore","Minimum Score Required [Graphic Violence &amp; Gore] %","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1059","moderation","Moderation","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1060","moderation_settings","Moderation","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1061","undenary_text_color","Undenary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1062","duodenary_text_color","Duodenary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1063","import_users","Import Users","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1064","supported_file_formats","Supported File Formats","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1065","csv_file","CSV File","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1066","sample_reference_file","Sample Reference File","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1067","time_am","AM","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1068","time_pm","PM","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1069","left_content_block","Left Content Block","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1070","side_navigation","Side Navigation","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1071","left_side_content","Left Side Content","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1072","form","Form","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1073","chat_window","Chat Window","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1074","primary_bg_color","Primary Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1075","secondary_bg_color","Secondary Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1076","tertiary_bg_color","Tertiary Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1077","quaternary_bg_color","Quaternary Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1078","quinary_bg_color","Quinary Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1079","senary_bg_color","Senary Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1080","septenary_bg_color","Septenary Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1081","octonary_bg_color","Octonary Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1082","nonary_bg_color","Nonary Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1083","denary_bg_color","Denary Background Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1084","primary_text_color","Primary Text Color","one-line","0","0","1");
INSERT INTO gr_language_strings VALUES("1085","secondary_text_color","Secondary Text Color","one-line","0","0","1");





CREATE TABLE `gr_languages` (
  `language_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `text_direction` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `disabled` int(11) NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_languages VALUES("1","English","en","ltr","0","2022-04-09 11:14:43");





CREATE TABLE `gr_login_sessions` (
  `login_session_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `initiated_ip_address` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_device` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Inactive\r\n1 = Active\r\n2 = Expired',
  `failed_attempts` int(11) NOT NULL,
  `time_stamp` int(11) NOT NULL,
  `last_access` datetime NOT NULL,
  PRIMARY KEY (`login_session_id`),
  KEY `user_id_fk_3` (`user_id`),
  CONSTRAINT `user_id_fk_3` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_login_sessions VALUES("1","1","103.23.204.2","3XsPexL14ywvka0RUzht","1","1","0","1657256028","2022-07-08 10:33:42");





CREATE TABLE `gr_mailbox` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_addresses` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `email_parameters` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Pending\r\n1 = Send\r\n2 = Failed',
  `mail_error_log` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `user_id_fk_11` (`user_id`),
  CONSTRAINT `user_id_fk_11` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_private_chat_messages` (
  `private_chat_message_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `private_conversation_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `original_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `filtered_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_message` int(11) NOT NULL DEFAULT '0',
  `parent_message_id` bigint(20) DEFAULT NULL,
  `attachment_type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_preview` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Unread\r\n1 = Read',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`private_chat_message_id`),
  KEY `private_conversation_id_fk` (`private_conversation_id`),
  KEY `user_id_fk_12` (`user_id`),
  KEY `private_message_id_fk_2` (`parent_message_id`),
  KEY `idx__read_status_private_conversation_id_user_id` (`read_status`,`private_conversation_id`,`user_id`),
  KEY `idx__user_id_read_status_private_conversation_id` (`user_id`,`read_status`,`private_conversation_id`),
  CONSTRAINT `private_conversation_id_fk` FOREIGN KEY (`private_conversation_id`) REFERENCES `gr_private_conversations` (`private_conversation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `private_message_id_fk_2` FOREIGN KEY (`parent_message_id`) REFERENCES `gr_private_chat_messages` (`private_chat_message_id`) ON DELETE SET NULL,
  CONSTRAINT `user_id_fk_12` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_private_conversations` (
  `private_conversation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator_user_id` bigint(20) NOT NULL,
  `recipient_user_id` bigint(20) NOT NULL,
  `initiator_load_message_id_from` bigint(20) DEFAULT NULL,
  `recipient_load_message_id_from` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`private_conversation_id`),
  KEY `idx__initiator_user_id_recipient_user_id` (`initiator_user_id`,`recipient_user_id`),
  KEY `idx__recipient_user_id_initiator_user_id` (`recipient_user_id`,`initiator_user_id`),
  CONSTRAINT `user_id_fk_13` FOREIGN KEY (`recipient_user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_14` FOREIGN KEY (`initiator_user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_push_subscriptions` (
  `push_subscriber_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `push_notification_service` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`push_subscriber_id`),
  KEY `user_id_fk_21` (`user_id`),
  CONSTRAINT `user_id_fk_21` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_realtime_logs` (
  `realtime_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_parameters` text COLLATE utf8mb4_unicode_ci,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`realtime_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` int(11) NOT NULL DEFAULT '0',
  `category` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other_settings',
  `field_attributes` text COLLATE utf8mb4_unicode_ci,
  `settings_order` int(11) NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_settings VALUES("1","site_name","0","Site Name","1","general_settings","","0","2022-01-20 14:28:51");
INSERT INTO gr_settings VALUES("2","site_description","textarea","Share what is on your mind with other people from all around the world to find new friends.","1","general_settings","","0","2022-01-27 14:02:45");
INSERT INTO gr_settings VALUES("3","site_slogan","0","Your Slogan Goes Here","1","general_settings","","0","2022-01-20 14:29:04");
INSERT INTO gr_settings VALUES("4","meta_title","0","Meet New Friends on Site Name","1","general_settings","","0","2022-01-20 23:41:46");
INSERT INTO gr_settings VALUES("5","default_timezone","select","Asia/Kolkata","1","general_settings","","0","2022-02-03 12:27:49");
INSERT INTO gr_settings VALUES("6","captcha","[\"disable\",\"google_recaptcha_v2\",\"hcaptcha\"]","disable","0","login_settings","","7","2022-01-21 01:37:18");
INSERT INTO gr_settings VALUES("7","captcha_site_key","0","","0","login_settings","","7","2022-03-21 01:15:23");
INSERT INTO gr_settings VALUES("8","captcha_secret_key","0","","0","login_settings","","7","2022-03-21 01:15:23");
INSERT INTO gr_settings VALUES("9","default_language","select","1","1","general_settings","","0","2022-02-15 09:51:46");
INSERT INTO gr_settings VALUES("10","guest_login","[\"enable\",\"disable\"]","enable","0","login_settings","","2","2022-01-21 01:37:18");
INSERT INTO gr_settings VALUES("11","sender_name","0","Site Name","0","email_settings","","0","2022-01-20 23:44:27");
INSERT INTO gr_settings VALUES("12","user_email_verification","[\"enable\",\"disable\"]","disable","0","login_settings","","2","2022-02-16 15:55:04");
INSERT INTO gr_settings VALUES("13","smtp_authentication","[\"enable\",\"disable\"]","disable","0","email_settings","","0","2022-06-15 03:27:31");
INSERT INTO gr_settings VALUES("14","smtp_host","0","","0","email_settings","","0","2022-03-21 01:14:51");
INSERT INTO gr_settings VALUES("15","system_email_address","0","email@yourdomainaddress.com","0","email_settings","","0","2022-03-21 01:14:51");
INSERT INTO gr_settings VALUES("16","smtp_username","0","","0","email_settings","","0","2022-03-21 01:14:51");
INSERT INTO gr_settings VALUES("17","smtp_password","0","","0","email_settings","","0","2022-03-21 01:14:51");
INSERT INTO gr_settings VALUES("18","smtp_protocol","[\"ssl\",\"tls\"]","tls","0","email_settings","","0","2022-01-20 23:44:34");
INSERT INTO gr_settings VALUES("19","smtp_port","[25,587,465,2525]","587","0","email_settings","","0","2021-09-23 00:50:10");
INSERT INTO gr_settings VALUES("20","gif_search_engine","[\"disable\",\"tenor\",\"gfycat\",\"giphy\"]","disable","0","message_settings","","1","2022-06-29 12:01:35");
INSERT INTO gr_settings VALUES("21","gif_search_engine_api","0","","0","message_settings","","1","2022-06-29 12:01:35");
INSERT INTO gr_settings VALUES("22","gifs_per_load","number","25","0","message_settings","","1","2021-07-22 15:56:00");
INSERT INTO gr_settings VALUES("23","records_per_call","number","18","1","general_settings","","0","2022-06-29 11:59:59");
INSERT INTO gr_settings VALUES("24","messages_per_call","number","25","1","message_settings","","5","2021-06-23 15:52:17");
INSERT INTO gr_settings VALUES("25","refresh_rate","number","3000","1","realtime_settings","","3","2022-05-31 12:29:31");
INSERT INTO gr_settings VALUES("26","request_timeout","number","3","1","realtime_settings","","4","2022-06-20 12:50:47");
INSERT INTO gr_settings VALUES("27","minimum_message_length","number","1","1","message_settings","","6","2022-01-21 23:45:15");
INSERT INTO gr_settings VALUES("28","maximum_message_length","number","2000","1","message_settings","","7","2022-01-23 14:59:36");
INSERT INTO gr_settings VALUES("29","read_more_criteria","number","250","1","message_settings","","8","2022-01-23 23:34:17");
INSERT INTO gr_settings VALUES("30","force_https","[\"yes\",\"no\"]","no","0","general_settings","","0","2022-01-20 15:33:03");
INSERT INTO gr_settings VALUES("31","non_latin_usernames","[\"enable\",\"disable\"]","enable","0","login_settings","","4","2021-06-23 15:52:17");
INSERT INTO gr_settings VALUES("32","system_messages_groups","[multi_select][\"on_group_creation\",\"on_join_group_chat\",\"on_removal_from_group\",\"on_leaving_group_chat\",\"on_awarding_group_badges\",\"on_getting_banned_from_group\",\"on_getting_unbanned_from_group\",\"on_getting_temporarily_banned_from_group\",\"on_updating_group_info\"]","a:9:{i:0;s:17:\"on_group_creation\";i:1;s:18:\"on_join_group_chat\";i:2;s:21:\"on_removal_from_group\";i:3;s:21:\"on_leaving_group_chat\";i:4;s:24:\"on_awarding_group_badges\";i:5;s:28:\"on_getting_banned_from_group\";i:6;s:30:\"on_getting_unbanned_from_group\";i:7;s:40:\"on_getting_temporarily_banned_from_group\";i:8;s:22:\"on_updating_group_info\";}","0","notification_settings","","7","2022-04-10 20:26:45");
INSERT INTO gr_settings VALUES("33","site_notifications","[multi_select][\"on_user_mention_group_chat\",\"on_group_invitation\",\"on_new_site_badges\",\"on_reply_group_messages\"]","a:4:{i:0;s:26:\"on_user_mention_group_chat\";i:1;s:19:\"on_group_invitation\";i:2;s:18:\"on_new_site_badges\";i:3;s:23:\"on_reply_group_messages\";}","0","notification_settings","","8","2022-04-10 20:26:45");
INSERT INTO gr_settings VALUES("34","login_cookie_validity","number","30","0","login_settings","","5","2021-06-23 15:52:17");
INSERT INTO gr_settings VALUES("35","gravatar","[\"enable\",\"disable\"]","disable","0","login_settings","","8","2021-06-23 15:52:17");
INSERT INTO gr_settings VALUES("36","minimum_username_length","number","4","0","login_settings","","6","2021-06-23 15:52:17");
INSERT INTO gr_settings VALUES("37","maximum_username_length","number","30","0","login_settings","","6","2021-06-23 15:52:17");
INSERT INTO gr_settings VALUES("38","group_join_confirmation","[\"enable\",\"disable\"]","enable","0","general_settings","","0","2022-01-20 15:38:52");
INSERT INTO gr_settings VALUES("39","view_groups_without_login","[\"enable\",\"disable\"]","enable","0","general_settings","","0","2022-06-13 11:30:39");
INSERT INTO gr_settings VALUES("40","api_secret_key","0","whPWf7R13uZ","0","general_settings","","0","2022-06-29 11:59:59");
INSERT INTO gr_settings VALUES("41","dateformat","[\"dmy_format\",\"mdy_format\",\"ymd_format\"]","dmy_format","1","general_settings","","0","2022-01-20 15:40:12");
INSERT INTO gr_settings VALUES("42","autoplay_audio_player","[\"yes\",\"no\"]","no","0","general_settings","","0","2022-04-02 20:10:21");
INSERT INTO gr_settings VALUES("43","cookie_consent","[\"enable\",\"disable\"]","enable","0","general_settings","","0","2022-01-20 21:58:26");
INSERT INTO gr_settings VALUES("44","notification_tone","select","assets/files/sound_notifications/open-up.mp3","1","realtime_settings","","5","2022-06-07 04:31:56");
INSERT INTO gr_settings VALUES("45","google_analytics_id","0","","0","general_settings","","0","2022-01-20 22:29:56");
INSERT INTO gr_settings VALUES("46","time_format","[\"24_format\",\"12_format\"]","12_format","1","general_settings","","0","2022-06-27 01:23:34");
INSERT INTO gr_settings VALUES("47","on_load_guest_login_window","[\"enable\",\"disable\"]","disable","0","login_settings","","2","2022-01-21 02:48:09");
INSERT INTO gr_settings VALUES("48","color_scheme","[\"light_mode\",\"dark_mode\"]","dark_mode","1","general_settings","","0","2022-04-08 07:43:49");
INSERT INTO gr_settings VALUES("49","default_font","select","montserrat","1","general_settings","","0","2022-03-08 03:36:09");
INSERT INTO gr_settings VALUES("50","ffmpeg","[\"enable\",\"disable\"]","disable","0","general_settings","","0","2022-06-29 11:59:59");
INSERT INTO gr_settings VALUES("51","ffmpeg_binaries_path","0","/usr/local/bin/ffmpeg","0","general_settings","","0","2022-06-29 11:59:59");
INSERT INTO gr_settings VALUES("52","profanity_filter","[\"enable\",\"disable\",\"strict_mode\"]","enable","0","other_settings","","0","2022-06-14 13:24:38");
INSERT INTO gr_settings VALUES("53","firewall","[\"enable\",\"disable\"]","enable","0","other_settings","","0","2022-04-19 22:38:00");
INSERT INTO gr_settings VALUES("54","maximum_login_attempts","number","10","0","login_settings","","3","2021-06-23 15:52:17");
INSERT INTO gr_settings VALUES("55","ffprobe_binaries_path","0","/usr/local/bin/ffprobe","0","general_settings","","0","2022-06-29 11:59:59");
INSERT INTO gr_settings VALUES("56","user_registration","[\"enable\",\"disable\"]","enable","0","login_settings","","1","2022-01-31 17:48:26");
INSERT INTO gr_settings VALUES("57","push_notifications","[\"disable\",\"webpushr\",\"onesignal\"]","disable","1","notification_settings","{\"class\":\"field toggle_form_fields\",\"hide_field\":\"web_push_fields\",\"show_fields\":\"onesignal|onesignal,webpushr|webpushr\"}","1","2022-04-10 20:26:45");
INSERT INTO gr_settings VALUES("58","send_push_notification","[multi_select][\"on_private_message\",\"on_user_mention_group_chat\",\"on_reply_group_messages\"]","a:1:{i:0;s:18:\"on_private_message\";}","0","notification_settings","","6","2022-04-10 20:26:45");
INSERT INTO gr_settings VALUES("59","onesignal_app_id","","","0","notification_settings","{\"class\":\"field web_push_fields onesignal d-none\"}","2","2022-04-05 08:00:24");
INSERT INTO gr_settings VALUES("60","onesignal_rest_api_key","","","0","notification_settings","{\"class\":\"field web_push_fields onesignal d-none\"}","3","2022-04-05 08:00:24");
INSERT INTO gr_settings VALUES("61","onesignal_safari_web_id","","","0","notification_settings","{\"class\":\"field web_push_fields onesignal d-none\"}","4","2022-03-21 01:16:35");
INSERT INTO gr_settings VALUES("62","webpushr_public_key","","","0","notification_settings","{\"class\":\"field web_push_fields webpushr d-none\"}","5","2022-04-10 20:26:45");
INSERT INTO gr_settings VALUES("63","webpushr_rest_api_key","","","0","notification_settings","{\"class\":\"field web_push_fields webpushr d-none\"}","5","2022-04-10 20:26:45");
INSERT INTO gr_settings VALUES("64","webpushr_authentication_token","","","0","notification_settings","{\"class\":\"field web_push_fields webpushr d-none\"}","5","2022-04-10 20:26:45");
INSERT INTO gr_settings VALUES("65","progressive_web_application","[\"enable\",\"disable\"]","enable","0","pwa_settings","","0","2022-06-04 13:21:25");
INSERT INTO gr_settings VALUES("66","pwa_name","","Site Name","0","pwa_settings","","0","2022-01-27 14:05:26");
INSERT INTO gr_settings VALUES("67","pwa_short_name","","Site Name","0","pwa_settings","","0","2022-01-27 14:05:26");
INSERT INTO gr_settings VALUES("68","pwa_background_color","color","#000000","0","pwa_settings","","0","2022-04-05 08:31:23");
INSERT INTO gr_settings VALUES("69","pwa_theme_color","color","#020202","0","pwa_settings","","0","2022-04-05 08:31:23");
INSERT INTO gr_settings VALUES("70","pwa_description","textarea","Share what is on your mind with other people from all around the world to find new friends.","0","pwa_settings","","0","2022-01-27 14:05:26");
INSERT INTO gr_settings VALUES("71","pwa_display","[\"standalone\",\"minimal-ui\",\"fullscreen\",\"browser\"]","standalone","0","pwa_settings","","0","2022-01-27 14:05:26");
INSERT INTO gr_settings VALUES("72","gif_content_filtering","[\"high\",\"medium\",\"low\",\"off\"]","off","0","message_settings","","1","2022-04-11 13:32:19");
INSERT INTO gr_settings VALUES("73","message_alignment","[\"left\",\"right\"]","left","1","message_settings","","0","2022-02-18 13:31:02");
INSERT INTO gr_settings VALUES("74","own_message_alignment","[\"left\",\"right\"]","left","1","message_settings","","0","2022-04-08 07:51:51");
INSERT INTO gr_settings VALUES("75","play_notification_sound","[multi_select][\"on_new_message\",\"on_new_site_notification\",\"on_group_unread_count_change\",\"on_private_conversation_unread_count_change\"]","a:1:{i:0;s:14:\"on_new_message\";}","0","realtime_settings","","6","2022-06-29 12:02:20");
INSERT INTO gr_settings VALUES("76","entry_page_background","[\"slideshow\",\"static_image\"]","slideshow","0","login_settings","","0","2022-03-20 04:20:40");
INSERT INTO gr_settings VALUES("77","change_to_idle_status_after","number","3","0","realtime_settings","","1","2022-04-06 05:57:12");
INSERT INTO gr_settings VALUES("78","change_to_offline_status_after","number","5","0","realtime_settings","","2","2022-04-06 05:57:12");
INSERT INTO gr_settings VALUES("79","chat_page_boxed_layout","[\"enable\",\"disable\"]","enable","0","other_settings","","0","2022-03-12 03:30:45");
INSERT INTO gr_settings VALUES("80","facebook_url","","#facebook","0","other_settings","","0","2022-03-19 10:05:13");
INSERT INTO gr_settings VALUES("81","instagram_url","","#Instagram","0","other_settings","","0","2022-03-19 10:06:57");
INSERT INTO gr_settings VALUES("82","twitter_url","","#Twitter","0","other_settings","","0","2022-03-20 04:38:57");
INSERT INTO gr_settings VALUES("83","linkedin_url","","#LinkedIn","0","other_settings","","0","2022-03-19 10:06:57");
INSERT INTO gr_settings VALUES("84","twitch_url","","#Twitch","0","other_settings","","0","2022-03-19 10:37:58");
INSERT INTO gr_settings VALUES("85","landing_page","[\"enable\",\"disable\"]","enable","0","other_settings","","0","2022-03-20 06:50:08");
INSERT INTO gr_settings VALUES("86","enter_is_send","[\"enable\",\"disable\"]","enable","0","message_settings","","0","2022-04-05 14:25:29");
INSERT INTO gr_settings VALUES("87","disallowed_slugs","textarea","a:0:{}","0","general_settings","","0","2022-06-29 11:59:59");
INSERT INTO gr_settings VALUES("88","mini_audio_player","[\"enable\",\"disable\"]","enable","0","general_settings","","0","2022-04-05 15:51:38");
INSERT INTO gr_settings VALUES("89","load_group_info_on_group_load","[\"enable\",\"disable\"]","enable","0","general_settings","","0","2022-04-05 16:07:47");
INSERT INTO gr_settings VALUES("90","new_user_approval","[\"enable\",\"disable\"]","disable","0","login_settings","","1","2022-06-29 12:00:57");
INSERT INTO gr_settings VALUES("91","custom_login_url","","","0","login_settings","","4","2022-04-08 07:34:54");
INSERT INTO gr_settings VALUES("92","custom_url_on_logout","","","0","login_settings","","4","2022-04-08 07:24:11");
INSERT INTO gr_settings VALUES("93","hero_section_animation","[\"enable\",\"disable\"]","enable","0","other_settings","","0","2022-04-10 12:27:34");
INSERT INTO gr_settings VALUES("94","hide_group_member_list_from_non_members","[\"yes\",\"no\"]","no","0","general_settings","","5","2022-06-07 23:39:13");
INSERT INTO gr_settings VALUES("95","display_full_file_name_of_attachments","[\"yes\",\"no\"]","no","0","general_settings","","5","2022-06-07 23:54:41");
INSERT INTO gr_settings VALUES("96","groups_section_status","[\"enable\",\"disable\"]","enable","0","other_settings","","0","2022-06-10 10:15:37");
INSERT INTO gr_settings VALUES("97","faq_section_status","[\"enable\",\"disable\"]","enable","0","other_settings","","0","2022-06-10 10:15:37");
INSERT INTO gr_settings VALUES("98","view_public_group_messages_non_member","[\"enable\",\"disable\"]","enable","0","general_settings","","0","2022-06-13 10:38:30");
INSERT INTO gr_settings VALUES("99","hide_name_field_in_registration_page","[\"yes\",\"no\"]","no","0","login_settings","","1","2022-06-20 07:01:09");
INSERT INTO gr_settings VALUES("100","hide_email_address_field_in_registration_page","[\"yes\",\"no\"]","no","0","login_settings","","1","2022-06-20 06:49:58");
INSERT INTO gr_settings VALUES("101","hide_username_field_in_registration_page","[\"yes\",\"no\"]","no","0","login_settings","","1","2022-06-20 07:08:11");
INSERT INTO gr_settings VALUES("102","image_moderation","[\"enable\",\"disable\"]","disable","0","moderation_settings","","1","2022-06-23 00:09:24");
INSERT INTO gr_settings VALUES("103","sightengine_api_user","","","0","moderation_settings","","2","2022-06-23 00:09:24");
INSERT INTO gr_settings VALUES("104","sightengine_api_secret","","","0","moderation_settings","","2","2022-06-23 00:09:24");
INSERT INTO gr_settings VALUES("105","image_removal_criteria","[multi_select][\"partial_nudity\",\"explicit_nudity\",\"wad_content\",\"offensive_signs_gestures\",\"graphic_violence_gore\"]","a:5:{i:0;s:14:\"partial_nudity\";i:1;s:15:\"explicit_nudity\";i:2;s:11:\"wad_content\";i:3;s:24:\"offensive_signs_gestures\";i:4;s:21:\"graphic_violence_gore\";}","0","moderation_settings","","3","2022-06-23 10:26:36");
INSERT INTO gr_settings VALUES("106","minimum_score_required_partial_nudity","number","40","0","moderation_settings","","3","2022-06-23 00:06:20");
INSERT INTO gr_settings VALUES("107","minimum_score_required_explicit_nudity","number","60","0","moderation_settings","","3","2022-06-23 00:06:20");
INSERT INTO gr_settings VALUES("108","minimum_score_required_wad_content","number","60","0","moderation_settings","","3","2022-06-23 00:05:50");
INSERT INTO gr_settings VALUES("109","minimum_score_required_offensive","number","60","0","moderation_settings","","3","2022-06-23 00:05:50");
INSERT INTO gr_settings VALUES("110","minimum_score_required_graphic_violence_gore","number","70","0","moderation_settings","","3","2022-06-23 00:09:09");





CREATE TABLE `gr_site_advertisements` (
  `site_advert_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_advert_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_advert_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_advert_placement` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_advert_min_height` int(11) DEFAULT NULL,
  `site_advert_max_height` int(11) NOT NULL DEFAULT '150',
  `disabled` int(11) NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`site_advert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_site_notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `notification_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_group_id` bigint(20) DEFAULT NULL,
  `related_user_id` bigint(20) DEFAULT NULL,
  `related_message_id` bigint(20) DEFAULT NULL,
  `related_parameters` text COLLATE utf8mb4_unicode_ci,
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Unread\r\n1 = Read',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `idx__user_id_read_status` (`user_id`,`read_status`),
  CONSTRAINT `user_id_fk_15` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_site_roles` (
  `site_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `string_constant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_role_attribute` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` int(11) NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`site_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_site_roles VALUES("1","site_role_1","{\"update\":\"site_roles\",\"language_id\":\"\",\"name_color\":\"#DD8400\",\"attribute\":\"unverified_users\",\"disabled\":\"no\",\"load_profile_on_page_load\":\"\",\"left_panel_content_on_page_load\":\"\",\"main_panel_content_on_page_load\":\"\",\"default_group_visibility\":\"\",\"group_join_limit\":\"100\",\"flood_control_time_difference\":\"20\",\"delete_message_time_limit\":\"10\",\"max_file_upload_size\":\"500\",\"maximum_storage_space\":\"500\"}","unverified_users","0","2022-06-07 03:34:26");
INSERT INTO gr_site_roles VALUES("2","site_role_2","{\"update\":\"site_roles\",\"language_id\":\"\",\"name_color\":\"#F06292\",\"attribute\":\"administrators\",\"disabled\":\"no\",\"load_profile_on_page_load\":\"yes\",\"left_panel_content_on_page_load\":\"groups\",\"main_panel_content_on_page_load\":\"statistics\",\"site_notifications\":[\"view\",\"delete\"],\"groups\":[\"view_public_groups\",\"view_secret_groups\",\"view_password_protected_groups\",\"view_joined_groups\",\"create_groups\",\"create_unleavable_group\",\"create_secret_group\",\"create_protected_group\",\"set_group_slug\",\"pin_groups\",\"set_auto_join_groups\",\"set_participant_settings\",\"add_meta_tags\",\"set_cover_pic\",\"set_custom_background\",\"download_attachments\",\"typing_indicator\",\"mention_users\",\"reply_messages\",\"check_read_receipts\",\"join_group\",\"leave_group\",\"invite_users\",\"add_site_members\",\"view_reactions\",\"react_messages\",\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"allow_sharing_links\",\"generate_link_preview\",\"clear_chat_history\",\"export_chat\",\"embed_group\",\"send_as_another_user\",\"super_privileges\"],\"default_group_visibility\":\"visible\",\"private_conversations\":[\"super_privileges\",\"initiate_private_chat\",\"view_private_chats\",\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"allow_sharing_links\",\"generate_link_preview\",\"typing_indicator\",\"reply_messages\",\"check_read_receipts\",\"delete_own_message\",\"download_attachments\",\"export_chat\",\"clear_chat_history\"],\"group_join_limit\":\"99999999\",\"flood_control_time_difference\":\"1\",\"daily_send_limit_group_messages\":\"0\",\"daily_send_limit_private_messages\":\"0\",\"delete_message_time_limit\":\"99999999999999\",\"storage\":[\"access_storage\",\"upload_files\",\"download_files\",\"delete_files\",\"super_privileges\"],\"max_file_upload_size\":\"5000\",\"maximum_storage_space\":\"5000\",\"allowed_file_formats\":[\"image_files\",\"video_files\",\"audio_files\",\"documents\",\"all_file_formats\"],\"site_users\":[\"block_users\",\"ignore_users\",\"create_user\",\"import_users\",\"edit_users\",\"delete_users\",\"approve_users\",\"ban_users_from_site\",\"unban_users_from_site\",\"view_site_users\",\"view_online_users\",\"view_invisible_users\",\"ban_ip_addresses\",\"unban_ip_addresses\",\"manage_user_access_logs\",\"login_as_another_user\"],\"profile\":[\"edit_profile\",\"change_full_name\",\"change_username\",\"change_email_address\",\"change_avatar\",\"upload_custom_avatar\",\"set_cover_pic\",\"set_custom_background\",\"go_offline\",\"switch_languages\",\"switch_color_scheme\",\"disable_private_messages\",\"deactivate_account\"],\"site_roles\":[\"create\",\"view\",\"edit\",\"delete\"],\"group_roles\":[\"create\",\"view\",\"edit\",\"delete\"],\"custom_fields\":[\"create\",\"view\",\"edit\",\"delete\"],\"stickers\":[\"create\",\"view\",\"edit\",\"delete\"],\"custom_pages\":[\"create\",\"view\",\"edit\",\"delete\"],\"custom_menu\":[\"create\",\"view\",\"edit\",\"delete\"],\"avatars\":[\"upload\",\"view\",\"delete\"],\"languages\":[\"create\",\"view\",\"edit\",\"delete\",\"export\"],\"social_login_providers\":[\"add\",\"view\",\"edit\",\"delete\"],\"audio_player\":[\"listen_music\",\"add\",\"view\",\"edit\",\"delete\"],\"site_adverts\":[\"create\",\"view\",\"edit\",\"delete\"],\"badges\":[\"assign\",\"create\",\"view\",\"edit\",\"delete\"],\"complaints\":[\"report\",\"track_status\",\"review_complaints\"],\"super_privileges\":[\"monitor_group_chats\",\"monitor_private_chats\",\"view_statistics\",\"core_settings\",\"customizer\",\"slideshows\",\"header_footer\",\"firewall\",\"profanity_filter\",\"cron_jobs\"]}","administrators","0","2022-06-29 11:53:36");
INSERT INTO gr_site_roles VALUES("3","site_role_3","{\"update\":\"site_roles\",\"language_id\":\"\",\"name_color\":\"#00B107\",\"attribute\":\"default_site_role\",\"disabled\":\"no\",\"load_profile_on_page_load\":\"yes\",\"left_panel_content_on_page_load\":\"groups\",\"main_panel_content_on_page_load\":\"welcome_screen\",\"site_notifications\":[\"view\",\"delete\"],\"groups\":[\"view_public_groups\",\"view_password_protected_groups\",\"view_joined_groups\",\"download_attachments\",\"typing_indicator\",\"mention_users\",\"reply_messages\",\"check_read_receipts\",\"join_group\",\"leave_group\",\"invite_users\",\"view_reactions\",\"react_messages\",\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"allow_sharing_links\",\"generate_link_preview\",\"clear_chat_history\",\"export_chat\"],\"default_group_visibility\":\"hidden\",\"private_conversations\":[\"initiate_private_chat\",\"view_private_chats\",\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"allow_sharing_links\",\"generate_link_preview\",\"typing_indicator\",\"reply_messages\",\"check_read_receipts\",\"delete_own_message\",\"download_attachments\",\"export_chat\",\"clear_chat_history\"],\"group_join_limit\":\"100\",\"flood_control_time_difference\":\"2\",\"daily_send_limit_group_messages\":\"0\",\"daily_send_limit_private_messages\":\"0\",\"delete_message_time_limit\":\"10\",\"storage\":[\"access_storage\",\"upload_files\",\"download_files\",\"delete_files\"],\"max_file_upload_size\":\"500\",\"maximum_storage_space\":\"1000\",\"allowed_file_formats\":[\"image_files\",\"video_files\",\"audio_files\",\"documents\"],\"site_users\":[\"block_users\",\"ignore_users\",\"view_online_users\"],\"profile\":[\"edit_profile\",\"change_full_name\",\"change_username\",\"change_email_address\",\"change_avatar\",\"upload_custom_avatar\",\"set_cover_pic\",\"set_custom_background\",\"go_offline\",\"switch_languages\",\"switch_color_scheme\",\"disable_private_messages\",\"deactivate_account\"],\"audio_player\":[\"listen_music\"],\"complaints\":[\"report\",\"track_status\"]}","default_site_role","0","2022-06-29 11:55:15");
INSERT INTO gr_site_roles VALUES("4","site_role_4","{\"update\":\"site_roles\",\"language_id\":\"\",\"name_color\":\"#FF1100\",\"attribute\":\"banned_users\",\"disabled\":\"no\",\"load_profile_on_page_load\":\"\",\"left_panel_content_on_page_load\":\"\",\"main_panel_content_on_page_load\":\"\",\"default_group_visibility\":\"\",\"group_join_limit\":\"100\",\"flood_control_time_difference\":\"20\",\"delete_message_time_limit\":\"10\",\"max_file_upload_size\":\"500\",\"maximum_storage_space\":\"500\"}","banned_users","0","2022-06-07 03:36:58");
INSERT INTO gr_site_roles VALUES("5","site_role_5","{\"update\":\"site_roles\",\"language_id\":\"\",\"name_color\":\"#5D01FF\",\"attribute\":\"guest_users\",\"disabled\":\"no\",\"load_profile_on_page_load\":\"yes\",\"left_panel_content_on_page_load\":\"groups\",\"main_panel_content_on_page_load\":\"welcome_screen\",\"site_notifications\":[\"view\"],\"groups\":[\"view_public_groups\",\"view_joined_groups\",\"download_attachments\",\"typing_indicator\",\"mention_users\",\"reply_messages\",\"check_read_receipts\",\"join_group\",\"leave_group\",\"invite_users\",\"view_reactions\",\"react_messages\",\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"clear_chat_history\",\"export_chat\"],\"default_group_visibility\":\"hidden\",\"private_conversations\":[\"initiate_private_chat\",\"view_private_chats\",\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"typing_indicator\",\"reply_messages\",\"check_read_receipts\",\"delete_own_message\",\"download_attachments\",\"export_chat\",\"clear_chat_history\"],\"group_join_limit\":\"10\",\"flood_control_time_difference\":\"3\",\"daily_send_limit_group_messages\":\"0\",\"daily_send_limit_private_messages\":\"0\",\"delete_message_time_limit\":\"10\",\"storage\":[\"access_storage\",\"upload_files\",\"download_files\"],\"max_file_upload_size\":\"100\",\"maximum_storage_space\":\"500\",\"allowed_file_formats\":[\"image_files\",\"video_files\",\"audio_files\"],\"site_users\":[\"block_users\",\"ignore_users\",\"view_online_users\"],\"profile\":[\"edit_profile\",\"change_full_name\",\"change_avatar\",\"upload_custom_avatar\",\"set_cover_pic\",\"switch_languages\",\"switch_color_scheme\"],\"audio_player\":[\"listen_music\"],\"complaints\":[\"report\",\"track_status\"]}","guest_users","0","2022-06-29 11:56:05");





CREATE TABLE `gr_site_users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unknown',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unverified_email_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encrypt_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'php_password_hash' COMMENT 'md5,php_password_hash OR encrypt_method_id',
  `salt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_role_id` bigint(20) NOT NULL DEFAULT '1',
  `previous_site_role_id` bigint(20) NOT NULL DEFAULT '3',
  `online_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Offline\r\n1 = Online\r\n2 = Idle',
  `approved` int(11) NOT NULL DEFAULT '1',
  `social_login_provider_id` bigint(20) DEFAULT NULL,
  `access_token` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_generated_on` datetime DEFAULT '1970-01-02 00:00:00',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `last_seen_on` datetime DEFAULT NULL,
  `last_login_session` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `name` (`username`),
  UNIQUE KEY `email` (`email_address`),
  KEY `site_role_id_fk` (`site_role_id`),
  KEY `idx__online_status` (`online_status`),
  KEY `idx__last_login_session` (`last_login_session`),
  KEY `idx__updated_on` (`updated_on`),
  CONSTRAINT `site_role_id_fk` FOREIGN KEY (`site_role_id`) REFERENCES `gr_site_roles` (`site_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_site_users VALUES("1","Site Admin","admin","myweed1@protonmail.com","","","$2y$10$.QT7KcdOvxXMKi7xFLhKsedtUiXY.vdh4hMePFposn9dmcQbaPEOm","php_password_hash","","2","2","1","1","","","1970-01-02 00:00:00","2022-04-11 08:23:17","2022-07-08 10:29:16","2022-07-08 10:33:42","2022-07-08 10:23:48");





CREATE TABLE `gr_site_users_blacklist` (
  `user_blacklist_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `blacklisted_user_id` bigint(20) NOT NULL,
  `ignore` int(11) DEFAULT '0' COMMENT '0 = False\r\n1 = True',
  `block` int(11) NOT NULL DEFAULT '0' COMMENT '0 = False\r\n1 = True',
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`user_blacklist_id`),
  KEY `idx__blacklisted_user_id_user_id` (`blacklisted_user_id`,`user_id`),
  KEY `idx__user_id_blacklisted_user_id` (`user_id`,`blacklisted_user_id`),
  KEY `idx__user_id_ignore` (`user_id`,`ignore`),
  KEY `idx__user_id_block` (`user_id`,`block`),
  CONSTRAINT `user_id_fk_16` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_17` FOREIGN KEY (`blacklisted_user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_site_users_device_logs` (
  `access_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_session_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`access_log_id`),
  KEY `user_id_fk_18` (`user_id`),
  CONSTRAINT `user_id_fk_18` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_site_users_device_logs VALUES("1","1","1","103.23.204.2","a:4:{s:8:\"platform\";s:10:\"Windows 10\";s:7:\"version\";s:9:\"103.0.0.0\";s:7:\"browser\";s:6:\"Chrome\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";}","2022-07-08 10:23:48");





CREATE TABLE `gr_site_users_settings` (
  `user_setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `offline_mode` int(11) NOT NULL DEFAULT '0',
  `time_zone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Australia/Sydney',
  `language_id` bigint(20) DEFAULT NULL,
  `notification_tone` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `disable_private_messages` int(11) NOT NULL DEFAULT '0',
  `deactivated` int(11) DEFAULT '0',
  `color_scheme` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_setting_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_id_fk_4` (`user_id`),
  KEY `language_id_fk_2` (`language_id`),
  CONSTRAINT `language_id_fk_2` FOREIGN KEY (`language_id`) REFERENCES `gr_languages` (`language_id`) ON DELETE SET NULL,
  CONSTRAINT `user_id_fk_4` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gr_site_users_settings VALUES("1","1","0","Asia/Dhaka","","0","0","0","default","2022-07-08 10:23:48");





CREATE TABLE `gr_social_login_providers` (
  `social_login_provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_id` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_in_popup` int(11) NOT NULL DEFAULT '1',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Don''t Create\r\n1 = Create',
  `disabled` int(11) NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`social_login_provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `gr_typing_status` (
  `user_input_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) DEFAULT NULL,
  `private_conversation_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`user_input_log_id`),
  KEY `user_id_fk_19` (`user_id`),
  KEY `private_conversation_id_fk_2` (`private_conversation_id`),
  KEY `group_id_fk_7` (`group_id`),
  KEY `idx__group_id_user_id` (`group_id`,`user_id`),
  KEY `idx__group_id_updated_on` (`group_id`,`updated_on`),
  KEY `idx__private_conversation_id_user_id` (`private_conversation_id`,`user_id`),
  KEY `idx__private_conversation_id_updated_on` (`private_conversation_id`,`updated_on`),
  CONSTRAINT `group_id_fk_7` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `private_conversation_id_fk_2` FOREIGN KEY (`private_conversation_id`) REFERENCES `gr_private_conversations` (`private_conversation_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_19` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




