#SET @databaseName="10_0_0_3";

SET FOREIGN_KEY_CHECKS=0;

/*Add New Tables start*/
CREATE TABLE IF NOT EXISTS `vendor_deposit` ( 
  `vd_id` INT NOT NULL AUTO_INCREMENT , 
  `vd_user_id` INT NOT NULL , 
  `vd_amount` DOUBLE NOT NULL , 
  `vd_status` INT NOT NULL , 
  `vd_payment_method` VARCHAR(50) NOT NULL , 
  `vd_txn_id` VARCHAR(50) NULL , 
  `vd_meta` TEXT NULL,
  `vd_created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() ,
  PRIMARY KEY (`vd_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `deposit_requests_history` ( 
  `id` INT NOT NULL AUTO_INCREMENT , 
  `vd_id` INT NOT NULL , 
  `status` INT NOT NULL , 
  `comment` VARCHAR(355) NOT NULL , 
  `transaction_id` VARCHAR(300) NOT NULL , 
  `created_at` TIMESTAMP NOT NULL , 
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `affiliate_session_log` ( 
  `id` INT NOT NULL AUTO_INCREMENT , 
  `user_id` INT NOT NULL , 
  `user_ip` VARCHAR(25) NOT NULL , 
  `user_os` VARCHAR(25) NOT NULL , 
  `user_agent` TEXT NOT NULL , 
  `time` VARCHAR(25) NOT NULL , 
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `unsubscribed_emails` ( 
  `id` INT NOT NULL AUTO_INCREMENT , 
  `email` VARCHAR(255) NOT NULL , 
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic; 

CREATE TABLE IF NOT EXISTS `membership_buy_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `buy_id` int NOT NULL,
  `status_id` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `membership_plans`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `billing_period` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` double NULL DEFAULT 0,
  `special` double NULL DEFAULT 0,
  `custom_period` double NULL DEFAULT 0,
  `have_trail` int NULL DEFAULT NULL,
  `free_trail` double NULL DEFAULT 0,
  `total_day` int NULL DEFAULT NULL,
  `bonus` double NOT NULL,
  `status` int NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `plan_icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `label_text` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `label_background` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#28A745',
  `label_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#FFFFFF',
  `sort_order` int NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `membership_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL,
  `user_id` int NOT NULL,
  `total_day` int NULL DEFAULT NULL,
  `expire_at` datetime NOT NULL,
  `started_at` datetime NOT NULL,
  `status_id` int NOT NULL,
  `is_active` int NOT NULL,
  `is_lifetime` int NOT NULL DEFAULT 0,
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `total` double NULL DEFAULT 0,
  `bonus_commission` double NULL DEFAULT 0,
  `expire_mail_sent` int NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `meta_data`  (
  `meta_id` int NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`meta_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `uncompleted_payment` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_module` tinyint(2) UNSIGNED NOT NULL,
  `completed_id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `additional_info` text NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `vendor_config` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `setting_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_status` int(11) NOT NULL,
  `setting_ipaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_is_default` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `ci_session` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ci_session_timestamp`(`timestamp`) USING BTREE
) ENGINE=InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `award_level` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `level_number` varchar(100) NOT NULL,
  `jump_level` smallint(5) UNSIGNED DEFAULT NULL,
  `minimum_earning` double UNSIGNED NOT NULL,
  `sale_comission_rate` double UNSIGNED NOT NULL,
  `bonus` double UNSIGNED NOT NULL,
  `default_registration_level` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `product_meta` ( 
  `product_meta_id` INT NOT NULL AUTO_INCREMENT ,
  `related_product_id` INT NOT NULL ,
  `meta_key` VARCHAR(100) NOT NULL ,
  `meta_value` TEXT NOT NULL ,
  PRIMARY KEY (`product_meta_id`)
)  ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS `user_lms_product` ( 
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `lms_product` text DEFAULT NULL,
  PRIMARY KEY (`id`)
)  ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_colors` (
  `setting_id` INT NOT NULL AUTO_INCREMENT ,
  `setting_key` VARCHAR(255) NOT NULL ,
  `setting_value` TEXT NOT NULL ,
  `setting_type` VARCHAR(255) NOT NULL ,
  `setting_status` INT NOT NULL ,
  `setting_ipaddress` VARCHAR(255) NOT NULL ,
  `setting_is_default` INT NOT NULL ,
  PRIMARY KEY (`setting_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `slugs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `related_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_faq`  (
  `faq_id` int NOT NULL AUTO_INCREMENT,
  `faq_theme_id` int NOT NULL,
  `faq_question` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faq_answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `Created` datetime NOT NULL,
  PRIMARY KEY (`faq_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_home_sections_setting`  (
  `sec_id` int NOT NULL AUTO_INCREMENT,
  `theme_id` int NOT NULL,
  `sec_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sec_position` tinyint(1) NOT NULL,
  `sec_is_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`sec_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_homecontent`  (
  `homecontent_id` int NOT NULL AUTO_INCREMENT,
  `theme_id` int NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  PRIMARY KEY (`homecontent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_links`  (
  `tlink_id` int NOT NULL AUTO_INCREMENT,
  `tlink_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tlink_url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tlink_position` tinyint NOT NULL,
  `tlink_status` tinyint(1) NOT NULL DEFAULT 1,
  `tlink_target_blank` tinyint(1) NOT NULL DEFAULT 1,
  `tlink_created_on` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tlink_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_pages`  (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `theme_id` int NOT NULL,
  `page_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int NULL DEFAULT NULL,
  `top_banner_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `top_banner_sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `page_content_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `page_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `link_footer_section` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_header_menu` tinyint(1) NOT NULL DEFAULT 0,
  `is_header_dropdown` tinyint(1) NOT NULL DEFAULT 0,
  `position` int NOT NULL COMMENT 'moved var(50) to int(11)',
  `page_type` enum('editable','fixed') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'editable',
  `page_banner_image` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT current_timestamp,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`page_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_header_menu`(`is_header_menu`) USING BTREE,
  INDEX `is_header_dropdown`(`is_header_dropdown`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_recommendation`  (
  `recommendation_id` int NOT NULL AUTO_INCREMENT,
  `theme_id` int NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `occupation` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  PRIMARY KEY (`recommendation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_sections`  (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `theme_id` int NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `button_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  PRIMARY KEY (`section_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_settings`  (
  `settings_id` int NOT NULL AUTO_INCREMENT,
  `theme_id` int NOT NULL,
  `top_banner_slider` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `membership_top_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `membership_sub_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_us_t_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_us_slug_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_sec_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_sec_subtitle` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_us_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_us_full_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_us_phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_us_iframe` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_banner_image` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `youtube_link` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `facebook_link` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `twitter_link` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `instegram_link` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `whatsapp_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `whatsapp_default_msg` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `footer_about_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `footer_about_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `footer_menu_title_a` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `footer_menu_title_b` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `footer_menu_title_c` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `footer_menu_title_d` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `banner_bottom_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `banner_bottom_slug` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `banner_button_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `banner_button_link` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `copyright` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `video_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `video_sub_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `login_img` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `reg_img` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `terms_img` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `login_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `reg_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `terms_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `home_section_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `home_section_subtitle` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `recommendation_section_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `recommendation_section_subtitle` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faq_banner_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faq_section_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faq_section_subtitle` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faq_banner_image` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `homepage_video_section_bg` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_sliders`  (
  `slider_id` int NOT NULL AUTO_INCREMENT,
  `theme_id` int NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `button_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  PRIMARY KEY (`slider_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `theme_videos`  (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `theme_id` int NOT NULL,
  `video_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `video_sub_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `video_link` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  PRIMARY KEY (`video_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_default` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '1=>for set default,0=>not set default',
  `created_at` datetime NOT NULL,
  `updated_at` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `todo_list` ( 
  `id` BIGINT NOT NULL AUTO_INCREMENT, 
  `user_id` BIGINT NOT NULL , 
  `notes` TEXT NOT NULL , 
  `is_done` ENUM('0','1') NOT NULL COMMENT '0 for open, 1 for close' , 
  `todo_date` DATE NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL , 
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `tickets_subject` (
  `id` BIGINT NOT NULL AUTO_INCREMENT , 
  `subject` TEXT NOT NULL , 
  `user_id` BIGINT NOT NULL , 
  `status` ENUM('0','1') NOT NULL COMMENT '0 deactivate, 1 active ' , 
  `created_at` DATETIME NULL DEFAULT NULL , 
  `updated_at` DATETIME NULL DEFAULT NULL , 
  PRIMARY KEY (`id`)
  )  ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `ticket_id` TEXT NOT NULL COMMENT 'like AF10254' ,
  `user_id` BIGINT NOT NULL , 
  `subject_id` INT NOT NULL , 
  `last_replay` TEXT DEFAULT NULL , 
  `status` INT NOT NULL COMMENT '1=open, 2=pending, 3 =close' , 
  `created_at` DATETIME NULL DEFAULT NULL , 
  `updated_at` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`)
  )  ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  CREATE TABLE IF NOT EXISTS `tickets_reply` (
    `id` BIGINT NOT NULL AUTO_INCREMENT , 
    `ticket_id` TEXT NOT NULL , 
    `message` TEXT  NULL , 
    `attachment` TEXT  NULL, 
    `message_type` INT NOT NULL COMMENT '1 for text ,2 files ' ,
    `user_id` BIGINT NOT NULL , 
    `user_type` INT NOT NULL COMMENT '1 for admin ,2 affiliate/vendor' , 
    `created_at` DATETIME NULL DEFAULT NULL , 
    `updated_at` DATETIME NULL DEFAULT NULL , 
    PRIMARY KEY (`id`)
    ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  CREATE TABLE IF NOT EXISTS `theme_setting` (
  `setting_id` INT NOT NULL AUTO_INCREMENT ,
  `setting_key` VARCHAR(255) NOT NULL ,
  `setting_value` TEXT NOT NULL ,
  `setting_type` VARCHAR(255) NOT NULL ,
  `setting_status` INT NOT NULL ,
  `setting_ipaddress` VARCHAR(255) NOT NULL ,
  `setting_is_default` INT NOT NULL ,
  PRIMARY KEY (`setting_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

  CREATE TABLE IF NOT EXISTS `tutorial_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `language_id` int(3) NOT NULL DEFAULT 1,
  `updated_at` datetime DEFAULT NULL,
  `position` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

  CREATE TABLE IF NOT EXISTS `tutorial_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(3) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1,
  `position` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

  CREATE TABLE IF NOT EXISTS `product_view_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `tools_id` int(11) DEFAULT NULL,
  `link` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `browserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browserVersion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `systemString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `osPlatform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `osVersion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `osShortVersion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isMobile` int(11) DEFAULT NULL,
  `mobileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `custom_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `token` varchar(555) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS `google_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_key` varchar(250) DEFAULT NULL,
  `unit_key` varchar(250) DEFAULT NULL,
  `ad_section` int(11) DEFAULT NULL COMMENT '1 for side bar top 2 for side bar bottom 3 for footer 4 for right side',
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Add New Tables end*/


ALTER TABLE `affiliate_action` COLLATE = utf8_unicode_ci;

ALTER TABLE `affiliate_action` MODIFY COLUMN `commission` double(22, 0) NOT NULL DEFAULT 0 AFTER `country_code`;

ALTER TABLE `affiliate_action` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `commission`;

ALTER TABLE `affiliateads` COLLATE = utf8_unicode_ci;

ALTER TABLE `affiliateads` MODIFY COLUMN `affiliateads_created` datetime NOT NULL AFTER `affiliateads_updated_by`;

ALTER TABLE `affiliateads` MODIFY COLUMN `affiliateads_updated` datetime NOT NULL AFTER `affiliateads_created`;

ALTER TABLE `cart` COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "cart") AND (table_schema = @databaseName) AND (column_name = "product_variation")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `cart` ADD COLUMN `product_variation` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `product_id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_category") AND (table_schema = @databaseName) AND (column_name = "parent_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_category` ADD `parent_id` INT NULL DEFAULT NULL AFTER `id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


ALTER TABLE `cart` MODIFY COLUMN `cart_id` int NOT NULL FIRST;

ALTER TABLE `cart` MODIFY COLUMN `date_added` datetime NOT NULL AFTER `coupon_discount`;

ALTER TABLE `cart` MODIFY COLUMN `cart_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `categories` COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "categories") AND (table_schema = @databaseName) AND (column_name = "background_image")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `categories` ADD COLUMN `background_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `image`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "categories") AND (table_schema = @databaseName) AND (column_name = "color")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `categories` ADD COLUMN `color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#000000' AFTER `background_image`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "categories") AND (table_schema = @databaseName) AND (column_name = "tag")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `categories` ADD COLUMN `tag` int NOT NULL DEFAULT 0 AFTER `parent_id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;
 
ALTER TABLE `categories` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `tag`;

ALTER TABLE `cities` COLLATE = utf8_unicode_ci;

ALTER TABLE `clicks_views` COLLATE = utf8_unicode_ci;

ALTER TABLE `clicks_views` MODIFY COLUMN `clicks_views_created` datetime NOT NULL AFTER `clicks_views_updated_by`;

ALTER TABLE `clicks_views` MODIFY COLUMN `clicks_views_updated` datetime NOT NULL AFTER `clicks_views_created`;

ALTER TABLE `countries` COLLATE = utf8_unicode_ci;

ALTER TABLE `coupon` COLLATE = utf8_unicode_ci;

ALTER TABLE `currency` COLLATE = utf8_unicode_ci;

ALTER TABLE `currency` MODIFY COLUMN `value` float NULL DEFAULT 0 AFTER `decimal_place`;

ALTER TABLE `form` COLLATE = utf8_unicode_ci;

ALTER TABLE `form` MODIFY COLUMN `sale_commision_value` float NULL DEFAULT 0 AFTER `sale_commision_type`;

ALTER TABLE `form` MODIFY COLUMN `click_commision_ppc` float NULL DEFAULT 0 AFTER `click_commision_type`;

ALTER TABLE `form` MODIFY COLUMN `click_commision_per` float NULL DEFAULT 0 AFTER `click_commision_ppc`;

ALTER TABLE `form` MODIFY COLUMN `recursion_endtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL AFTER `recursion_custom_time`;

ALTER TABLE `form` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `google_analitics`;

ALTER TABLE `form_action` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `pay_commition`;

ALTER TABLE `form_coupon` COLLATE = utf8_unicode_ci;

ALTER TABLE `integration_admin_clicks_action` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

ALTER TABLE `integration_admin_clicks_action` MODIFY COLUMN `product_id` double(22, 0) NOT NULL AFTER `base_url`;

ALTER TABLE `integration_admin_clicks_action` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `is_action`;

ALTER TABLE `integration_category` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

ALTER TABLE `integration_category` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `name`;

ALTER TABLE `integration_clicks_action` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_clicks_action") AND (table_schema = @databaseName) AND (column_name = "custom_data")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_clicks_action` ADD COLUMN `custom_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL AFTER `is_action`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

ALTER TABLE `integration_clicks_action` MODIFY COLUMN `product_id` double(22, 0) NOT NULL AFTER `base_url`;

ALTER TABLE `integration_clicks_action` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `custom_data`;

ALTER TABLE `integration_clicks_logs` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_clicks_logs") AND (table_schema = @databaseName) AND (column_name = "custom_data")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_clicks_logs` ADD COLUMN `custom_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL AFTER `click_type`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

ALTER TABLE `integration_clicks_logs` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `country_code`;

ALTER TABLE `integration_orders` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_orders") AND (table_schema = @databaseName) AND (column_name = "custom_data")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_orders` ADD COLUMN `custom_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL AFTER `affiliate_tran`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


ALTER TABLE `integration_orders` MODIFY COLUMN `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL AFTER `id`;

ALTER TABLE `integration_orders` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `status`;

ALTER TABLE `integration_programs` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_programs") AND (table_schema = @databaseName) AND (column_name = "click_allow")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_programs` ADD COLUMN `click_allow` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL AFTER `comment`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


ALTER TABLE `integration_programs` MODIFY COLUMN `commission_sale` float NULL DEFAULT 0 AFTER `commission_type`;

ALTER TABLE `integration_programs` MODIFY COLUMN `commission_click_commission` float NULL DEFAULT 0 AFTER `commission_number_of_click`;

ALTER TABLE `integration_programs` MODIFY COLUMN `admin_commission_sale` float NULL DEFAULT 0 AFTER `admin_commission_type`;

ALTER TABLE `integration_programs` MODIFY COLUMN `admin_commission_click_commission` float NULL DEFAULT 0 AFTER `admin_commission_number_of_click`;

ALTER TABLE `integration_programs` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `click_allow`;

ALTER TABLE `integration_refer_product_action` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `pay_commition`;

ALTER TABLE `integration_tools` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_tools") AND (table_schema = @databaseName) AND (column_name = "terms")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_tools` ADD COLUMN `terms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `comment`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

ALTER TABLE `integration_tools` MODIFY COLUMN `action_click` int NOT NULL AFTER `tool_type`;

ALTER TABLE `integration_tools` MODIFY COLUMN `general_click` int NOT NULL AFTER `action_amount`;

ALTER TABLE `integration_tools` MODIFY COLUMN `recursion_endtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL AFTER `recursion_custom_time`;

ALTER TABLE `integration_tools` MODIFY COLUMN `admin_action_amount` float NULL DEFAULT 0 AFTER `admin_action_click`;

ALTER TABLE `integration_tools` MODIFY COLUMN `admin_general_amount` float NULL DEFAULT 0 AFTER `admin_general_click`;

ALTER TABLE `integration_tools` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `terms`;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_tools") AND (table_schema = @databaseName) AND (column_name = "is_allow_group")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_tools` ADD COLUMN `is_allow_group` BOOLEAN NOT NULL DEFAULT FALSE AFTER `action_code`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_tools") AND (table_schema = @databaseName) AND (column_name = "allow_groups")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_tools` ADD COLUMN `allow_groups` VARCHAR(255) DEFAULT NULL AFTER `is_allow_group`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

ALTER TABLE `integration_tools_ads` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

ALTER TABLE `language` COLLATE = utf8_unicode_ci;

ALTER TABLE `last_seen` COLLATE = utf8_unicode_ci;

ALTER TABLE `notification` COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "vendor_deposit") AND (table_schema = @databaseName) AND (column_name = "vd_created_on")) > 0,
  CONCAT("ALTER TABLE `vendor_deposit` CHANGE `vd_created_on` `vd_created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE current_timestamp() AFTER `vd_meta`;"),
  "SELECT 1"
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "notification") AND (table_schema = @databaseName) AND (column_name = "store_contactus_description")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `notification` ADD COLUMN `store_contactus_description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL AFTER `notification_type`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "order") AND (table_schema = @databaseName) AND (column_name = "tax_cost")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `order` ADD `tax_cost` INT NOT NULL DEFAULT '0' AFTER `shipping_cost`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

ALTER TABLE `notification` MODIFY COLUMN `notification_created_date` datetime NOT NULL AFTER `notification_ipaddress`;

ALTER TABLE `order` COLLATE = utf8_unicode_ci;

ALTER TABLE `order` MODIFY COLUMN `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `files`;

ALTER TABLE `order` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `comment`;

ALTER TABLE `order_products` COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "order_products") AND (table_schema = @databaseName) AND (column_name = "variation")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `order_products` ADD COLUMN `variation` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `product_id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "order_products") AND (table_schema = @databaseName) AND (column_name = "msrp")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `order_products` ADD COLUMN `msrp` double NOT NULL AFTER `form_id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

ALTER TABLE `order_products` MODIFY COLUMN `admin_commission` float NULL DEFAULT 0 AFTER `commission_type`;

ALTER TABLE `order_products` MODIFY COLUMN `vendor_commission` float NULL DEFAULT 0 AFTER `admin_commission_type`;

ALTER TABLE `order_proof` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

ALTER TABLE `orders_history` COLLATE = utf8_unicode_ci;

ALTER TABLE `pagebuilder_theme` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

ALTER TABLE `pagebuilder_theme_page` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

ALTER TABLE `pagebuilder_theme_page` MODIFY COLUMN `page_id` int NOT NULL FIRST;

ALTER TABLE `pagebuilder_theme_page` MODIFY COLUMN `page_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `password_resets` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `token`;

ALTER TABLE `payment_detail` COLLATE = utf8_unicode_ci;

ALTER TABLE `product` COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "product") AND (table_schema = @databaseName) AND (column_name = "product_tags")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `product` ADD COLUMN `product_tags` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `product_short_description`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "product") AND (table_schema = @databaseName) AND (column_name = "product_msrp")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `product` ADD COLUMN `product_msrp` double NOT NULL AFTER `product_tags`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "product") AND (table_schema = @databaseName) AND (column_name = "product_avg_rating")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `product` ADD COLUMN `product_avg_rating` int NOT NULL DEFAULT 0 AFTER `state_id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "product") AND (table_schema = @databaseName) AND (column_name = "product_variations")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `product` ADD COLUMN `product_variations` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `product_avg_rating`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

ALTER TABLE `product` MODIFY COLUMN `recursion_endtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL AFTER `recursion_custom_time`;

ALTER TABLE `product_action` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `pay_commition`;

ALTER TABLE `product_action_admin` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `pay_commition`;

ALTER TABLE `product_affiliate` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

ALTER TABLE `product_affiliate` MODIFY COLUMN `admin_commission_value` float NULL DEFAULT 0 AFTER `admin_sale_commission_type`;

ALTER TABLE `product_affiliate` MODIFY COLUMN `admin_click_amount` float NULL DEFAULT 0 AFTER `admin_click_commission_type`;

ALTER TABLE `product_affiliate` MODIFY COLUMN `affiliate_commission_value` float NULL DEFAULT 0 AFTER `affiliate_sale_commission_type`;

ALTER TABLE `product_affiliate` MODIFY COLUMN `affiliate_click_amount` float NULL DEFAULT 0 AFTER `affiliate_click_count`;

ALTER TABLE `product_categories` COLLATE = utf8_unicode_ci;

ALTER TABLE `product_media_upload` COLLATE = utf8_unicode_ci;

ALTER TABLE `product_media_upload` MODIFY COLUMN `product_media_upload_created_date` datetime NOT NULL AFTER `product_media_upload_ipaddress`;

ALTER TABLE `productslog` COLLATE = utf8_unicode_ci;

ALTER TABLE `productslog` MODIFY COLUMN `productslog_created` datetime NOT NULL AFTER `productslog_updated_by`;

ALTER TABLE `productslog` MODIFY COLUMN `productslog_updated` datetime NOT NULL AFTER `productslog_created`;

ALTER TABLE `rating` COLLATE = utf8_unicode_ci;

ALTER TABLE `rating` MODIFY COLUMN `rating_created` datetime NOT NULL AFTER `rating_updated_by`;

ALTER TABLE `rating` MODIFY COLUMN `rating_updated` datetime NOT NULL AFTER `rating_created`;

ALTER TABLE `refer_market_action` COLLATE = utf8_unicode_ci;

ALTER TABLE `refer_market_action` MODIFY COLUMN `commission` double(22, 0) NOT NULL DEFAULT 0 AFTER `user_ip`;

ALTER TABLE `refer_market_action` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `count_for`;

ALTER TABLE `refer_product_action` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `pay_commition`;

ALTER TABLE `setting` COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "setting") AND (table_schema = @databaseName) AND (column_name = "setting_is_default")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `setting` ADD COLUMN `setting_is_default` int NOT NULL DEFAULT 0 AFTER `setting_ipaddress`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


ALTER TABLE `setting` MODIFY COLUMN `setting_value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `setting_key`;

ALTER TABLE `shipping_address` COLLATE = utf8_unicode_ci;

ALTER TABLE `states` COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "level_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD COLUMN `level_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 AFTER `refid`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "device_type")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD COLUMN `device_type` int NOT NULL DEFAULT 1 COMMENT '1 = android, 2 = ios' AFTER `created_at`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "device_token")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD COLUMN `device_token` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL AFTER `device_type`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "groups")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `groups` VARCHAR(255) NULL AFTER `device_token`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "store_name")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `store_name` VARCHAR(255) NULL DEFAULT NULL AFTER `is_vendor`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "store_contact_us_map")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `store_contact_us_map` VARCHAR(500) NULL DEFAULT NULL AFTER `store_name`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "store_address")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `store_address` VARCHAR(255) NULL DEFAULT NULL AFTER `store_contact_us_map`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "store_email")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `store_email` VARCHAR(100) NULL DEFAULT NULL AFTER `store_address`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "store_contact_number")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `store_contact_number` VARCHAR(100) NULL DEFAULT NULL AFTER `store_email`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "store_terms_condition")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `store_terms_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `store_contact_number`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "store_slug")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `store_slug` VARCHAR(255) NULL DEFAULT NULL AFTER `is_vendor`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "store_meta")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `store_meta` VARCHAR(255) NULL DEFAULT NULL AFTER `is_vendor`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


ALTER TABLE `user_payment_request` COLLATE = utf8_unicode_ci;

ALTER TABLE `user_payment_request` MODIFY COLUMN `user_payment_request_created_date` datetime NOT NULL AFTER `user_payment_request_ipaddress`;

ALTER TABLE `user_payment_request` MODIFY COLUMN `user_payment_request_updated_date` datetime NOT NULL AFTER `user_payment_request_created_date`;

ALTER TABLE `users` COLLATE = utf8_unicode_ci;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "plan_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD COLUMN `plan_id` int NOT NULL DEFAULT -1 AFTER `id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "products_wishlist")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD COLUMN `products_wishlist` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `l_link`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "reg_approved")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD COLUMN `reg_approved` tinyint(1) NOT NULL DEFAULT 1 AFTER `status`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "install_location_details")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD COLUMN `install_location_details` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `last_ping`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "token")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD COLUMN `token` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL AFTER `install_location_details`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


ALTER TABLE `users` MODIFY COLUMN `is_vendor` tinyint(1) NOT NULL AFTER `reg_approved`;

ALTER TABLE `users` MODIFY COLUMN `last_ping` datetime NULL AFTER `value`;

ALTER TABLE `users` MODIFY COLUMN `created_at` datetime NULL AFTER `token`;

ALTER TABLE `vendor_setting` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

ALTER TABLE `vendor_setting` MODIFY COLUMN `affiliate_commission_value` float NULL DEFAULT 0 AFTER `affiliate_sale_commission_type`;

ALTER TABLE `vendor_setting` MODIFY COLUMN `affiliate_click_amount` float NULL DEFAULT 0 AFTER `affiliate_click_count`;

ALTER TABLE `vendor_setting` MODIFY COLUMN `form_affiliate_click_amount` float NULL DEFAULT 0 AFTER `form_affiliate_click_count`;

ALTER TABLE `vendor_setting` MODIFY COLUMN `form_affiliate_commission_value` float NULL DEFAULT 0 AFTER `form_affiliate_sale_commission_type`;

ALTER TABLE `version_update` COLLATE = utf8_unicode_ci;

ALTER TABLE `version_update` MODIFY COLUMN `date` datetime NOT NULL AFTER `code`;

ALTER TABLE `wallet` COLLATE = utf8_unicode_ci;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "wallet") AND (table_schema = @databaseName) AND (column_name = "commission_status")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `wallet` ADD COLUMN `commission_status` int NOT NULL DEFAULT 0 COMMENT '1 = Cancel, 2 = Trash' AFTER `status`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

ALTER TABLE `wallet` MODIFY COLUMN `group_id` double(22, 0) NULL DEFAULT 0 AFTER `parent_id`;

ALTER TABLE `wallet` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `wv`;

ALTER TABLE `wallet_recursion` COLLATE = utf8_unicode_ci;

ALTER TABLE `wallet_recursion` MODIFY COLUMN `last_transaction` datetime NOT NULL AFTER `next_transaction`;

ALTER TABLE `wallet_recursion` MODIFY COLUMN `endtime` datetime NOT NULL AFTER `last_transaction`;

ALTER TABLE `wallet_request` COLLATE = utf8_unicode_ci;

ALTER TABLE `wallet_requests` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

ALTER TABLE `wallet_requests` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `settings`;

ALTER TABLE `wallet_requests_history` CHARACTER SET = utf8, COLLATE = utf8_unicode_ci;

ALTER TABLE `wallet_requests_history` MODIFY COLUMN `created_at` datetime NOT NULL AFTER `transaction_id`;

ALTER TABLE `vendor_setting` CHANGE `user_id` `user_id` INT(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `ci_sessions`;

DELETE FROM setting WHERE `setting_ipaddress`= '45.41.132.41';

DELETE FROM setting where setting_type='membership' and setting_ipaddress='85.203.45.180';

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_pages") AND (table_schema = @databaseName) AND (column_name = "top_banner_title")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_pages` ADD COLUMN `top_banner_title` VARCHAR(250) NULL AFTER page_name;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_pages") AND (table_schema = @databaseName) AND (column_name = "page_banner_image")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_pages` ADD COLUMN `page_banner_image` VARCHAR(250) NULL AFTER position;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_pages") AND (table_schema = @databaseName) AND (column_name = "parent_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_pages` ADD COLUMN `parent_id` int(11) NULL DEFAULT NULL AFTER `slug`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_pages") AND (table_schema = @databaseName) AND (column_name = "is_header_menu")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_pages` ADD COLUMN `is_header_menu` tinyint(1) NOT NULL DEFAULT 0 AFTER `link_footer_section`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_pages") AND (table_schema = @databaseName) AND (column_name = "is_header_dropdown")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_pages` ADD COLUMN `is_header_dropdown` tinyint(1) NOT NULL DEFAULT 0 AFTER `is_header_menu`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_pages") AND (table_schema = @databaseName) AND (column_name = "position")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_pages` MODIFY COLUMN `position` int(11) NOT NULL COMMENT 'moved var(50) to int(11)' AFTER `is_header_dropdown`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_pages") AND (table_schema = @databaseName) AND (column_name = "page_type")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_pages` ADD COLUMN `page_type` enum('editable','fixed') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'editable' AFTER `position`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "membership_plans") AND (table_schema = @databaseName) AND (column_name = "commission_sale_status")) > 0,
"SELECT 1",
CONCAT("ALTER TABLE `membership_plans` ADD COLUMN `commission_sale_status` tinyint(1) NOT NULL DEFAULT 0 AFTER `bonus`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "membership_plans") AND (table_schema = @databaseName) AND (column_name = "level_id")) > 0,
"SELECT 1",
CONCAT("ALTER TABLE `membership_plans` ADD COLUMN `level_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 AFTER `commission_sale_status`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "membership_plans") AND (table_schema = @databaseName) AND (column_name = "plan_icon")) > 0,
"SELECT 1",
CONCAT("ALTER TABLE `membership_plans` ADD COLUMN `plan_icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `description`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "membership_plans") AND (table_schema = @databaseName) AND (column_name = "user_type")) > 0,
"SELECT 1",
CONCAT("ALTER TABLE `membership_plans` ADD COLUMN `user_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 AFTER `status`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "membership_plans") AND (table_schema = @databaseName) AND (column_name = "campaign")) > 0,
"SELECT 1",
CONCAT("ALTER TABLE `membership_plans` ADD COLUMN `campaign` int(10) UNSIGNED DEFAULT NULL AFTER `user_type`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "membership_plans") AND (table_schema = @databaseName) AND (column_name = "product")) > 0,
"SELECT 1",
CONCAT("ALTER TABLE `membership_plans` ADD COLUMN `product` int(10) UNSIGNED DEFAULT NULL AFTER `campaign`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_settings") AND (table_schema = @databaseName) AND (column_name = "logo")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_settings` ADD COLUMN `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL AFTER `theme_id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_settings") AND (table_schema = @databaseName) AND (column_name = "custom_logo_size")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_settings` ADD COLUMN `custom_logo_size` tinyint(1) NOT NULL DEFAULT 0 AFTER `logo`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_settings") AND (table_schema = @databaseName) AND (column_name = "log_custom_height")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_settings` ADD COLUMN `log_custom_height` smallint(6) NOT NULL AFTER `custom_logo_size`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_settings") AND (table_schema = @databaseName) AND (column_name = "log_custom_width")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_settings` ADD COLUMN `log_custom_width` smallint(6) NOT NULL AFTER `log_custom_height`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

ALTER TABLE `theme_pages` MODIFY COLUMN `created` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) AFTER `page_banner_image`;
ALTER TABLE `theme_pages` MODIFY COLUMN `status` tinyint(1) NOT NULL DEFAULT 1 AFTER `created`;
DELETE FROM `theme_pages` WHERE `page_id` NOT IN(1,2,3,4) AND `slug` IN ("/","faq","terms-of-use","contact");


-- insert queries should always at bottom

SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM theme_pages WHERE (slug = "/")) > 0,
  "SELECT 1",
  "INSERT INTO `theme_pages` (`theme_id`, `page_name`, `slug`, `parent_id`, `top_banner_title`, `top_banner_sub_title`, `page_content_title`, `page_content`, `link_footer_section`, `is_header_menu`, `is_header_dropdown`, `position`, `page_type`, `page_banner_image`, `created`, `status`) VALUES (0, 'Home', '/', 0, '', '', '', '', '', 1, 0, 1, 'fixed', NULL, '2021-03-15 05:34:48', 1);"
)); 
PREPARE alterIfNotExists FROM @preparedStatement; 
EXECUTE alterIfNotExists; 
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM theme_pages WHERE (slug = "faq")) > 0,
  "SELECT 1",
  "INSERT INTO `theme_pages` (`theme_id`, `page_name`, `slug`, `parent_id`, `top_banner_title`, `top_banner_sub_title`, `page_content_title`, `page_content`, `link_footer_section`, `is_header_menu`, `is_header_dropdown`, `position`, `page_type`, `page_banner_image`, `created`, `status`) VALUES (0, 'Faq', 'faq', 0, '', '', '', '', '', 1, 0, 2, 'fixed', NULL, '2021-03-15 05:40:51', 1);"
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM theme_pages WHERE (slug = "terms-of-use")) > 0,
  "SELECT 1",
  "INSERT INTO `theme_pages` (`theme_id`, `page_name`, `slug`, `parent_id`, `top_banner_title`, `top_banner_sub_title`, `page_content_title`, `page_content`, `link_footer_section`, `is_header_menu`, `is_header_dropdown`, `position`, `page_type`, `page_banner_image`, `created`, `status`) VALUES (0, 'Terms', 'terms-of-use', NULL, '', '', '', '', '', 1, 0, 3, 'fixed', NULL, '2021-03-15 05:46:09', 1);"
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM theme_pages WHERE (slug = "contact")) > 0,
  "SELECT 1",
  "INSERT INTO `theme_pages` (`theme_id`, `page_name`, `slug`, `parent_id`, `top_banner_title`, `top_banner_sub_title`, `page_content_title`, `page_content`, `link_footer_section`, `is_header_menu`, `is_header_dropdown`, `position`, `page_type`, `page_banner_image`, `created`, `status`) VALUES (0, 'Contact', 'contact', NULL, '', '', '', '', '', 1, 0, 4, 'fixed', NULL, '2021-03-15 05:48:16', 1);"
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET FOREIGN_KEY_CHECKS=1;

ALTER TABLE `order` CHANGE `shipping_cost` `shipping_cost` FLOAT NOT NULL DEFAULT '0', CHANGE `tax_cost` `tax_cost` FLOAT NOT NULL DEFAULT '0', CHANGE `total` `total` FLOAT NOT NULL DEFAULT '0';

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_tools") AND (table_schema = @databaseName) AND (column_name = "start_date")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_tools` ADD `start_date` DATETIME NULL AFTER `terms`, ADD `end_date` DATETIME NULL AFTER `start_date`;
")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_tools") AND (table_schema = @databaseName) AND (column_name = "tool_integration_plugin")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_tools` ADD `tool_integration_plugin` VARCHAR(50) NULL AFTER `terms`;
")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_tools") AND (table_schema = @databaseName) AND (column_name = "trigger_count")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_tools` ADD `trigger_count` INT NOT NULL DEFAULT 0 AFTER `end_date`;
")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_tools") AND (table_schema = @databaseName) AND (column_name = "security_check_perform_on")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_tools` ADD `security_check_perform_on` VARCHAR(20) NULL AFTER `trigger_count`;
")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_tools") AND (table_schema = @databaseName) AND (column_name = "security_status")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_tools` ADD COLUMN `security_status` tinyint(1) NOT NULL DEFAULT 0 AFTER `status`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "product") AND (table_schema = @databaseName) AND (column_name = "is_campaign_product")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `product` ADD COLUMN `is_campaign_product` tinyint(1) NOT NULL DEFAULT 0 AFTER `product_id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "product") AND (table_schema = @databaseName) AND (column_name = "product_url")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `product` ADD `product_url` TEXT NULL AFTER `is_campaign_product`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_tools") AND (table_schema = @databaseName) AND (column_name = "custom_cookies")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_tools` ADD `custom_cookies` INT NOT NULL AFTER `security_check_perform_on`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "integration_tools") AND (table_schema = @databaseName) AND (column_name = "cookies_type")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `integration_tools` ADD `cookies_type` BOOLEAN NOT NULL DEFAULT FALSE AFTER `security_check_perform_on`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "countries") AND (table_schema = @databaseName) AND (column_name = "created_by")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `countries` ADD `created_by` INT NULL AFTER `lng`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "states") AND (table_schema = @databaseName) AND (column_name = "created_by")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `states` ADD `created_by` INT NULL AFTER `country_id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "version_update") AND (table_schema = @databaseName) AND (column_name = "script_version")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `version_update` ADD `script_version` VARCHAR(20) NOT NULL AFTER `code`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

ALTER TABLE `version_update` CHANGE `date` `date` TIMESTAMP NOT NULL;

ALTER TABLE `version_update` CHANGE `code` `code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "uncompleted_payment") AND (table_schema = @databaseName) AND (column_name = "user_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `uncompleted_payment` ADD `user_id` INT NOT NULL AFTER `id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "verification_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `verification_id` VARCHAR(50) NULL DEFAULT NULL AFTER `groups`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "currency") AND (table_schema = @databaseName) AND (column_name = "replace_comma_symbol")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `currency` ADD `replace_comma_symbol` VARCHAR(1) NOT NULL DEFAULT ',' AFTER `date_modified`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "currency") AND (table_schema = @databaseName) AND (column_name = "decimal_symbol")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `currency` ADD `decimal_symbol` VARCHAR(1) NOT NULL DEFAULT ',' AFTER `replace_comma_symbol`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "vendor_setting") AND (table_schema = @databaseName) AND (column_name = "vendor_shares_sales_status")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `vendor_setting` ADD `vendor_shares_sales_status` INT(1) NOT NULL DEFAULT '0' AFTER `form_affiliate_commission_value`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "shipping_address") AND (table_schema = @databaseName) AND (column_name = "phone")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `shipping_address` CHANGE `phone` `phone` VARCHAR(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "setting") AND (table_schema = @databaseName) AND (column_name = "language_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `setting` ADD `language_id` INT(3) NOT NULL DEFAULT '1' AFTER `setting_is_default`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_faq") AND (table_schema = @databaseName) AND (column_name = "language_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_faq` ADD `language_id` INT(3) NOT NULL DEFAULT '1' AFTER `Created`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_homecontent") AND (table_schema = @databaseName) AND (column_name = "language_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_homecontent` ADD `language_id` INT(3) NOT NULL DEFAULT '1' AFTER `created`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_links") AND (table_schema = @databaseName) AND (column_name = "language_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_links` ADD `language_id` INT(3) NOT NULL DEFAULT '1' AFTER `tlink_created_on`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_pages") AND (table_schema = @databaseName) AND (column_name = "language_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_pages` ADD `language_id` INT(3) NOT NULL DEFAULT '1' AFTER `status`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_recommendation") AND (table_schema = @databaseName) AND (column_name = "language_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_recommendation` ADD `language_id` INT(3) NOT NULL DEFAULT '1' AFTER `created`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_sections") AND (table_schema = @databaseName) AND (column_name = "language_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_sections` ADD `language_id` INT(3) NOT NULL DEFAULT '1' AFTER `created`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_settings") AND (table_schema = @databaseName) AND (column_name = "language_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_settings` ADD `language_id` INT(3) NOT NULL DEFAULT '1' AFTER `homepage_video_section_bg`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_sliders") AND (table_schema = @databaseName) AND (column_name = "language_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_sliders` ADD `language_id` INT(3) NOT NULL DEFAULT '1' AFTER `created`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "theme_videos") AND (table_schema = @databaseName) AND (column_name = "language_id")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `theme_videos` ADD `language_id` INT(3) NOT NULL DEFAULT '1' AFTER `created`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "product") AND (table_schema = @databaseName) AND (column_name = "view_statistics")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `product` ADD `view_statistics` int(11) NOT NULL DEFAULT '0' AFTER `product_variations`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "form") AND (table_schema = @databaseName) AND (column_name = "view_statistics")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `form` ADD `view_statistics` int(11) NOT NULL DEFAULT '0' AFTER `created_at`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "users") AND (table_schema = @databaseName) AND (column_name = "primary_payment_method")) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE `users` ADD `primary_payment_method` varchar(100) DEFAULT NULL AFTER `verification_id`;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SET @preparedStatement = (
  SELECT IF((SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE (table_name = "password_resets") AND (table_schema = @databaseName) AND (column_name = "id")) > 0,
  "SELECT 1",
    CONCAT(
      "ALTER TABLE `password_resets` ADD `id` INT NOT NULL primary KEY AUTO_INCREMENT FIRST;"
    )
  )
);
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;