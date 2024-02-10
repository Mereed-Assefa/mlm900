SET 
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET 
  time_zone = "+00:00";
CREATE TABLE `affiliateads` (
  `affiliateads_id` int(11) NOT NULL, 
  `affiliateads_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `affiliateads_metadata` longtext CHARACTER SET utf8, 
  `affiliateads_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `affiliateads_ipaddress` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `affiliateads_created_by` int(11) DEFAULT NULL, 
  `affiliateads_updated_by` int(11) DEFAULT NULL, 
  `affiliateads_created` datetime NOT NULL, 
  `affiliateads_updated` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `affiliate_action` (
  `id` int(11) NOT NULL, 
  `affiliate_id` int(11) DEFAULT NULL, 
  `user_id` int(11) DEFAULT NULL, 
  `user_ip` text CHARACTER SET utf8, 
  `country_code` varchar(10) CHARACTER SET utf8 NOT NULL, 
  `commission` double(22, 0) NOT NULL DEFAULT '0', 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `affiliate_session_log` (
  `id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `user_ip` varchar(25) COLLATE utf8_unicode_ci NOT NULL, 
  `user_os` varchar(25) COLLATE utf8_unicode_ci NOT NULL, 
  `user_agent` text COLLATE utf8_unicode_ci NOT NULL, 
  `time` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
CREATE TABLE `award_level` (
  `id` smallint(5) UNSIGNED NOT NULL, 
  `level_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL, 
  `jump_level` smallint(5) UNSIGNED DEFAULT NULL, 
  `minimum_earning` double UNSIGNED NOT NULL, 
  `sale_comission_rate` double UNSIGNED NOT NULL, 
  `bonus` double UNSIGNED NOT NULL, 
  `default_registration_level` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
INSERT INTO `award_level` (
  `id`, `level_number`, `jump_level`, 
  `minimum_earning`, `sale_comission_rate`, 
  `bonus`, `default_registration_level`
) 
VALUES 
  (1, 'Level 1', 2, 50, 5, 15, 1), 
  (2, 'Level 2', 3, 100, 10, 25, 0), 
  (3, 'Level 3', 0, 150, 25, 50, 0);
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `session_id` varchar(200) CHARACTER SET utf8 NOT NULL, 
  `product_id` int(11) NOT NULL, 
  `product_variation` text CHARACTER SET utf8 NOT NULL, 
  `refer_id` int(11) DEFAULT NULL, 
  `quantity` int(11) NOT NULL, 
  `total` double NOT NULL, 
  `coupon_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `coupon_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `coupon_discount` double DEFAULT '0', 
  `date_added` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL, 
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `background_image` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `color` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '#000000', 
  `parent_id` int(11) NOT NULL, 
  `tag` int(11) NOT NULL DEFAULT '0', 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `categories` (
  `id`, `name`, `slug`, `description`, 
  `image`, `background_image`, `color`, 
  `parent_id`, `tag`, `created_at`
) 
VALUES 
  (
    1, 'Cars', 'cars-1', '<p>The best car In the world The best car In the world The best car In the world The best car In the world</p>', 
    '10hO849CnJQPKXBjzGDiU2uMbLAaY3Nr.png', 
    'I3kzMgEhvyTcsQ6CfH7AwD5G4Foqx018.png', 
    '#FFFFFF', 0, 1, '2020-12-20 11:15:16'
  ), 
  (
    2, 'PHP', 'php-2', '<p>The best PHP online course from beginner to advance in 21 days!</p>', 
    'PZMQzTF2I49ivR0YqLVwAC1HnKWjS6rc.png', 
    'u9qjohcWZkHU6QRPdxvznO27BXfIFrSg.jpg', 
    '#FFFFFF', 0, 1, '2020-12-20 11:55:14'
  ), 
  (
    3, 'Food', 'food-3', '<p>The best Take Away Food in the city<br></p>', 
    'aL7NJC2tgY8SiVPd4OunmhHRADyMb0Iz.jpg', 
    'Qja14Wnl7YNHdCDiMbfUvpts6OkoFSwx.jpg', 
    '#FFFFFF', 0, 0, '2020-12-20 11:57:06'
  ), 
  (
    4, 'Trending Products', 'trending-products-4', 
    '<p>Trending Products category</p>', 
    'TazWnYqV64mdjQKZA2cusERfvrkIOMJg.png', 
    'KO28Znqaz3ivhdPSjG07L9CwrbuMIcBX.png', 
    '#FFFFFF', 0, 1, '2022-07-26 22:03:46'
  ), 
  (
    5, 'PC', 'pc-5', '<p>PC Category</p>', 
    '302e9AUyTkqvNxKtILbj564ZSgrDfO7h.png', 
    'azGRvuQbTSwELFt14CNlDMjr5eoXJVqg.png', 
    '#FFFFFF', 0, 1, '2022-07-27 06:34:01'
  );
CREATE TABLE `cities` (
  `id` int(11) NOT NULL, 
  `name` varchar(30) CHARACTER SET utf8 NOT NULL, 
  `state_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `ci_session` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL, 
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL, 
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0', 
  `data` blob NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
CREATE TABLE `clicks_views` (
  `clicks_views_id` int(11) NOT NULL, 
  `clicks_views_refuser_id` int(11) DEFAULT NULL, 
  `clicks_views_action_id` int(11) DEFAULT NULL, 
  `clicks_views_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `clicks_views_status` int(11) DEFAULT NULL, 
  `clicks_views_click` int(11) DEFAULT NULL, 
  `clicks_views_view` int(11) NOT NULL, 
  `clicks_views_sale` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `clicks_views_referrer` text CHARACTER SET utf8, 
  `clicks_views_user_agent` text CHARACTER SET utf8, 
  `clicks_views_os` text CHARACTER SET utf8, 
  `clicks_views_browser` text CHARACTER SET utf8, 
  `clicks_views_isp` text CHARACTER SET utf8, 
  `clicks_views_ipaddress` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `clicks_views_created_by` int(11) DEFAULT NULL, 
  `clicks_views_updated_by` int(11) DEFAULT NULL, 
  `clicks_views_created` datetime NOT NULL, 
  `clicks_views_updated` datetime NOT NULL, 
  `clicks_views_click_commission` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `clicks_views_sale_commission` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `clicks_views_data_commission` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `clicks_views_view_commission` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `clicks_views` (
  `clicks_views_id`, `clicks_views_refuser_id`, 
  `clicks_views_action_id`, `clicks_views_type`, 
  `clicks_views_status`, `clicks_views_click`, 
  `clicks_views_view`, `clicks_views_sale`, 
  `clicks_views_referrer`, `clicks_views_user_agent`, 
  `clicks_views_os`, `clicks_views_browser`, 
  `clicks_views_isp`, `clicks_views_ipaddress`, 
  `clicks_views_created_by`, `clicks_views_updated_by`, 
  `clicks_views_created`, `clicks_views_updated`, 
  `clicks_views_click_commission`, 
  `clicks_views_sale_commission`, 
  `clicks_views_data_commission`, 
  `clicks_views_view_commission`
) 
VALUES 
  (
    1, 9, 2, 'formclick', 1, 1, 0, NULL, '', 
    'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 
    'Unknown Windows OS', 'Chrome', 
    '223.177.72.67', '223.177.72.67', 
    9, NULL, '2022-08-09 11:38:49', '0000-00-00 00:00:00', 
    NULL, NULL, '[]', 0
  ), 
  (
    2, 10, 2, 'formclick', 1, 1, 0, NULL, '', 
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.81 Safari/537.36 Edg/104.0.1293.54', 
    'Unknown Windows OS', 'Chrome', 
    '181.66.176.251', '181.66.176.251', 
    10, NULL, '2022-08-21 00:01:16', 
    '0000-00-00 00:00:00', NULL, NULL, 
    '[]', 0
  ), 
  (
    3, 9, 1, 'formclick', 1, 1, 0, NULL, '', 
    'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', 
    'Unknown Platform', '', 'vps-a30b5900.vps.ovh.ca', 
    '15.235.162.55', 9, NULL, '2022-08-24 11:14:34', 
    '0000-00-00 00:00:00', NULL, NULL, 
    '[]', 0
  ), 
  (
    4, 9, 1, 'formclick', 1, 1, 0, NULL, '', 
    'Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 
    'Unknown Platform', '', '49.213.78.31', 
    '49.213.78.31', 9, NULL, '2022-08-24 11:49:33', 
    '0000-00-00 00:00:00', NULL, NULL, 
    '[]', 0
  ), 
  (
    5, 9, 1, 'formclick', 1, 1, 0, NULL, '', 
    'Mozilla/5.0 (iPod; U; CPU iPhone OS 4_3 like Mac OS X; as-IN) AppleWebKit/531.26.2 (KHTML, like Gecko) Version/4.0.5 Mobile/8B119 Safari/6531.26.2', 
    'Mac OS X', 'Safari', 'adsl.viettel.vn', 
    '115.74.105.145', 9, NULL, '2022-08-25 16:43:20', 
    '0000-00-00 00:00:00', NULL, NULL, 
    '[]', 0
  );
CREATE TABLE `countries` (
  `id` int(11) NOT NULL, 
  `sortname` varchar(3) CHARACTER SET utf8 NOT NULL, 
  `name` varchar(150) CHARACTER SET utf8 NOT NULL, 
  `phonecode` int(11) NOT NULL, 
  `lat` varchar(20) CHARACTER SET utf8 DEFAULT NULL, 
  `lng` varchar(20) CHARACTER SET utf8 DEFAULT NULL, 
  `created_by` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `countries` (
  `id`, `sortname`, `name`, `phonecode`, 
  `lat`, `lng`, `created_by`
) 
VALUES 
  (
    1, 'AF', 'Afghanistan', 93, '33.93911', 
    '67.709953', NULL
  ), 
  (
    2, 'AL', 'Albania', 355, '41.153332', 
    '20.168331', NULL
  ), 
  (
    3, 'DZ', 'Algeria', 213, '28.033886', 
    '1.659626', NULL
  ), 
  (
    4, 'AS', 'American Samoa', 1684, '-14.270972', 
    '-170.132217', NULL
  ), 
  (
    5, 'AD', 'Andorra', 376, '42.546245', 
    '1.601554', NULL
  ), 
  (
    6, 'AO', 'Angola', 244, '-11.202692', 
    '17.873887', NULL
  ), 
  (
    7, 'AI', 'Anguilla', 1264, '18.220554', 
    '-63.068615', NULL
  ), 
  (
    8, 'AQ', 'Antarctica', 0, '-75.250973', 
    '-0.071389', NULL
  ), 
  (
    9, 'AG', 'Antigua And Barbuda', 1268, 
    '17.060816', '-61.796428', NULL
  ), 
  (
    10, 'AR', 'Argentina', 54, '-38.416097', 
    '-63.616672', NULL
  ), 
  (
    11, 'AM', 'Armenia', 374, '40.069099', 
    '45.038189', NULL
  ), 
  (
    12, 'AW', 'Aruba', 297, '12.52111', 
    '-69.968338', NULL
  ), 
  (
    13, 'AU', 'Australia', 61, '-25.274398', 
    '133.775136', NULL
  ), 
  (
    14, 'AT', 'Austria', 43, '47.516231', 
    '14.550072', NULL
  ), 
  (
    15, 'AZ', 'Azerbaijan', 994, '40.143105', 
    '47.576927', NULL
  ), 
  (
    16, 'BS', 'Bahamas The', 1242, '25.03428', 
    '-77.39628', NULL
  ), 
  (
    17, 'BH', 'Bahrain', 973, '25.930414', 
    '50.637772', NULL
  ), 
  (
    18, 'BD', 'Bangladesh', 880, '23.684994', 
    '90.356331', NULL
  ), 
  (
    19, 'BB', 'Barbados', 1246, '13.193887', 
    '-59.543198', NULL
  ), 
  (
    20, 'BY', 'Belarus', 375, '53.709807', 
    '27.953389', NULL
  ), 
  (
    21, 'BE', 'Belgium', 32, '50.503887', 
    '4.469936', NULL
  ), 
  (
    22, 'BZ', 'Belize', 501, '17.189877', 
    '-88.49765', NULL
  ), 
  (
    23, 'BJ', 'Benin', 229, '9.30769', '2.315834', 
    NULL
  ), 
  (
    24, 'BM', 'Bermuda', 1441, '32.321384', 
    '-64.75737', NULL
  ), 
  (
    25, 'BT', 'Bhutan', 975, '27.514162', 
    '90.433601', NULL
  ), 
  (
    26, 'BO', 'Bolivia', 591, '-16.290154', 
    '-63.588653', NULL
  ), 
  (
    27, 'BA', 'Bosnia and Herzegovina', 
    387, '43.915886', '17.679076', NULL
  ), 
  (
    28, 'BW', 'Botswana', 267, '-22.328474', 
    '24.684866', NULL
  ), 
  (
    29, 'BV', 'Bouvet Island', 0, '-54.423199', 
    '3.413194', NULL
  ), 
  (
    30, 'BR', 'Brazil', 55, '-14.235004', 
    '-51.92528', NULL
  ), 
  (
    31, 'IO', 'British Indian Ocean Territory', 
    246, '-6.343194', '71.876519', NULL
  ), 
  (
    32, 'BN', 'Brunei', 673, '4.535277', 
    '114.727669', NULL
  ), 
  (
    33, 'BG', 'Bulgaria', 359, '42.733883', 
    '25.48583', NULL
  ), 
  (
    34, 'BF', 'Burkina Faso', 226, '12.238333', 
    '-1.561593', NULL
  ), 
  (
    35, 'BI', 'Burundi', 257, '-3.373056', 
    '29.918886', NULL
  ), 
  (
    36, 'KH', 'Cambodia', 855, '12.565679', 
    '104.990963', NULL
  ), 
  (
    37, 'CM', 'Cameroon', 237, '7.369722', 
    '12.354722', NULL
  ), 
  (
    38, 'CA', 'Canada', 1, '56.130366', 
    '-106.346771', NULL
  ), 
  (
    39, 'CV', 'Cape Verde', 238, '16.002082', 
    '-24.013197', NULL
  ), 
  (
    40, 'KY', 'Cayman Islands', 1345, '19.513469', 
    '-80.566956', NULL
  ), 
  (
    41, 'CF', 'Central African Republic', 
    236, '6.611111', '20.939444', NULL
  ), 
  (
    42, 'TD', 'Chad', 235, '15.454166', 
    '18.732207', NULL
  ), 
  (
    43, 'CL', 'Chile', 56, '-35.675147', 
    '-71.542969', NULL
  ), 
  (
    44, 'CN', 'China', 86, '35.86166', '104.195397', 
    NULL
  ), 
  (
    45, 'CX', 'Christmas Island', 61, '-10.447525', 
    '105.690449', NULL
  ), 
  (
    46, 'CC', 'Cocos (Keeling) Islands', 
    672, '-12.164165', '96.870956', NULL
  ), 
  (
    47, 'CO', 'Colombia', 57, '4.570868', 
    '-74.297333', NULL
  ), 
  (
    48, 'KM', 'Comoros', 269, '-11.875001', 
    '43.872219', NULL
  ), 
  (
    49, 'CG', 'Republic Of The Congo', 
    242, '-0.228021', '15.827659', NULL
  ), 
  (
    50, 'CD', 'Democratic Republic Of The Congo', 
    242, '-4.038333', '21.758664', NULL
  ), 
  (
    51, 'CK', 'Cook Islands', 682, '-21.236736', 
    '-159.777671', NULL
  ), 
  (
    52, 'CR', 'Costa Rica', 506, '9.748917', 
    '-83.753428', NULL
  ), 
  (
    53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', 
    225, '7.539989', '-5.54708', NULL
  ), 
  (
    54, 'HR', 'Croatia (Hrvatska)', 385, 
    '45.1', '15.2', NULL
  ), 
  (
    55, 'CU', 'Cuba', 53, '21.521757', '-77.781167', 
    NULL
  ), 
  (
    56, 'CY', 'Cyprus', 357, '35.126413', 
    '33.429859', NULL
  ), 
  (
    57, 'CZ', 'Czech Republic', 420, '49.817492', 
    '15.472962', NULL
  ), 
  (
    58, 'DK', 'Denmark', 45, '56.26392', 
    '9.501785', NULL
  ), 
  (
    59, 'DJ', 'Djibouti', 253, '11.825138', 
    '42.590275', NULL
  ), 
  (
    60, 'DM', 'Dominica', 1767, '15.414999', 
    '-61.370976', NULL
  ), 
  (
    61, 'DO', 'Dominican Republic', 1809, 
    '18.735693', '-70.162651', NULL
  ), 
  (
    62, 'TP', 'East Timor', 670, '', '', 
    NULL
  ), 
  (
    63, 'EC', 'Ecuador', 593, '-1.831239', 
    '-78.183406', NULL
  ), 
  (
    64, 'EG', 'Egypt', 20, '26.820553', 
    '30.802498', NULL
  ), 
  (
    65, 'SV', 'El Salvador', 503, '13.794185', 
    '-88.89653', NULL
  ), 
  (
    66, 'GQ', 'Equatorial Guinea', 240, 
    '1.650801', '10.267895', NULL
  ), 
  (
    67, 'ER', 'Eritrea', 291, '15.179384', 
    '39.782334', NULL
  ), 
  (
    68, 'EE', 'Estonia', 372, '58.595272', 
    '25.013607', NULL
  ), 
  (
    69, 'ET', 'Ethiopia', 251, '9.145', 
    '40.489673', NULL
  ), 
  (
    70, 'XA', 'External Territories of Australia', 
    61, '', '', NULL
  ), 
  (
    71, 'FK', 'Falkland Islands', 500, 
    '-51.796253', '-59.523613', NULL
  ), 
  (
    72, 'FO', 'Faroe Islands', 298, '61.892635', 
    '-6.911806', NULL
  ), 
  (
    73, 'FJ', 'Fiji Islands', 679, '-16.578193', 
    '179.414413', NULL
  ), 
  (
    74, 'FI', 'Finland', 358, '61.92411', 
    '25.748151', NULL
  ), 
  (
    75, 'FR', 'France', 33, '46.227638', 
    '2.213749', NULL
  ), 
  (
    76, 'GF', 'French Guiana', 594, '3.933889', 
    '-53.125782', NULL
  ), 
  (
    77, 'PF', 'French Polynesia', 689, 
    '-17.679742', '-149.406843', NULL
  ), 
  (
    78, 'TF', 'French Southern Territories', 
    0, '-49.280366', '69.348557', NULL
  ), 
  (
    79, 'GA', 'Gabon', 241, '-0.803689', 
    '11.609444', NULL
  ), 
  (
    80, 'GM', 'Gambia The', 220, '13.443182', 
    '-15.310139', NULL
  ), 
  (
    81, 'GE', 'Georgia', 995, '42.315407', 
    '43.356892', NULL
  ), 
  (
    82, 'DE', 'Germany', 49, '51.165691', 
    '10.451526', NULL
  ), 
  (
    83, 'GH', 'Ghana', 233, '7.946527', 
    '-1.023194', NULL
  ), 
  (
    84, 'GI', 'Gibraltar', 350, '36.137741', 
    '-5.345374', NULL
  ), 
  (
    85, 'GR', 'Greece', 30, '39.074208', 
    '21.824312', NULL
  ), 
  (
    86, 'GL', 'Greenland', 299, '71.706936', 
    '-42.604303', NULL
  ), 
  (
    87, 'GD', 'Grenada', 1473, '12.262776', 
    '-61.604171', NULL
  ), 
  (
    88, 'GP', 'Guadeloupe', 590, '16.995971', 
    '-62.067641', NULL
  ), 
  (
    89, 'GU', 'Guam', 1671, '13.444304', 
    '144.793731', NULL
  ), 
  (
    90, 'GT', 'Guatemala', 502, '15.783471', 
    '-90.230759', NULL
  ), 
  (
    91, 'XU', 'Guernsey and Alderney', 
    44, '', '', NULL
  ), 
  (
    92, 'GN', 'Guinea', 224, '9.945587', 
    '-9.696645', NULL
  ), 
  (
    93, 'GW', 'Guinea-Bissau', 245, '11.803749', 
    '-15.180413', NULL
  ), 
  (
    94, 'GY', 'Guyana', 592, '4.860416', 
    '-58.93018', NULL
  ), 
  (
    95, 'HT', 'Haiti', 509, '18.971187', 
    '-72.285215', NULL
  ), 
  (
    96, 'HM', 'Heard and McDonald Islands', 
    0, '-53.08181', '73.504158', NULL
  ), 
  (
    97, 'HN', 'Honduras', 504, '15.199999', 
    '-86.241905', NULL
  ), 
  (
    98, 'HK', 'Hong Kong S.A.R.', 852, 
    '22.396428', '114.109497', NULL
  ), 
  (
    99, 'HU', 'Hungary', 36, '47.162494', 
    '19.503304', NULL
  ), 
  (
    100, 'IS', 'Iceland', 354, '64.963051', 
    '-19.020835', NULL
  ), 
  (
    101, 'IN', 'India', 91, '20.593684', 
    '78.96288', NULL
  ), 
  (
    102, 'ID', 'Indonesia', 62, '-0.789275', 
    '113.921327', NULL
  ), 
  (
    103, 'IR', 'Iran', 98, '32.427908', 
    '53.688046', NULL
  ), 
  (
    104, 'IQ', 'Iraq', 964, '33.223191', 
    '43.679291', NULL
  ), 
  (
    105, 'IE', 'Ireland', 353, '53.41291', 
    '-8.24389', NULL
  ), 
  (
    106, 'IL', 'Israel', 972, '31.046051', 
    '34.851612', NULL
  ), 
  (
    107, 'IT', 'Italy', 39, '41.87194', 
    '12.56738', NULL
  ), 
  (
    108, 'JM', 'Jamaica', 1876, '18.109581', 
    '-77.297508', NULL
  ), 
  (
    109, 'JP', 'Japan', 81, '36.204824', 
    '138.252924', NULL
  ), 
  (
    110, 'XJ', 'Jersey', 44, '', '', NULL
  ), 
  (
    111, 'JO', 'Jordan', 962, '30.585164', 
    '36.238414', NULL
  ), 
  (
    112, 'KZ', 'Kazakhstan', 7, '48.019573', 
    '66.923684', NULL
  ), 
  (
    113, 'KE', 'Kenya', 254, '-0.023559', 
    '37.906193', NULL
  ), 
  (
    114, 'KI', 'Kiribati', 686, '-3.370417', 
    '-168.734039', NULL
  ), 
  (
    115, 'KP', 'Korea North', 850, '40.339852', 
    '127.510093', NULL
  ), 
  (
    116, 'KR', 'Korea South', 82, '35.907757', 
    '127.766922', NULL
  ), 
  (
    117, 'KW', 'Kuwait', 965, '29.31166', 
    '47.481766', NULL
  ), 
  (
    118, 'KG', 'Kyrgyzstan', 996, '41.20438', 
    '74.766098', NULL
  ), 
  (
    119, 'LA', 'Laos', 856, '19.85627', 
    '102.495496', NULL
  ), 
  (
    120, 'LV', 'Latvia', 371, '56.879635', 
    '24.603189', NULL
  ), 
  (
    121, 'LB', 'Lebanon', 961, '33.854721', 
    '35.862285', NULL
  ), 
  (
    122, 'LS', 'Lesotho', 266, '-29.609988', 
    '28.233608', NULL
  ), 
  (
    123, 'LR', 'Liberia', 231, '6.428055', 
    '-9.429499', NULL
  ), 
  (
    124, 'LY', 'Libya', 218, '26.3351', 
    '17.228331', NULL
  ), 
  (
    125, 'LI', 'Liechtenstein', 423, '47.166', 
    '9.555373', NULL
  ), 
  (
    126, 'LT', 'Lithuania', 370, '55.169438', 
    '23.881275', NULL
  ), 
  (
    127, 'LU', 'Luxembourg', 352, '49.815273', 
    '6.129583', NULL
  ), 
  (
    128, 'MO', 'Macau S.A.R.', 853, '22.198745', 
    '113.543873', NULL
  ), 
  (
    129, 'MK', 'Macedonia', 389, '41.608635', 
    '21.745275', NULL
  ), 
  (
    130, 'MG', 'Madagascar', 261, '-18.766947', 
    '46.869107', NULL
  ), 
  (
    131, 'MW', 'Malawi', 265, '-13.254308', 
    '34.301525', NULL
  ), 
  (
    132, 'MY', 'Malaysia', 60, '4.210484', 
    '101.975766', NULL
  ), 
  (
    133, 'MV', 'Maldives', 960, '3.202778', 
    '73.22068', NULL
  ), 
  (
    134, 'ML', 'Mali', 223, '17.570692', 
    '-3.996166', NULL
  ), 
  (
    135, 'MT', 'Malta', 356, '35.937496', 
    '14.375416', NULL
  ), 
  (
    136, 'XM', 'Man (Isle of)', 44, '', 
    '', NULL
  ), 
  (
    137, 'MH', 'Marshall Islands', 692, 
    '7.131474', '171.184478', NULL
  ), 
  (
    138, 'MQ', 'Martinique', 596, '14.641528', 
    '-61.024174', NULL
  ), 
  (
    139, 'MR', 'Mauritania', 222, '21.00789', 
    '-10.940835', NULL
  ), 
  (
    140, 'MU', 'Mauritius', 230, '-20.348404', 
    '57.552152', NULL
  ), 
  (
    141, 'YT', 'Mayotte', 269, '-12.8275', 
    '45.166244', NULL
  ), 
  (
    142, 'MX', 'Mexico', 52, '23.634501', 
    '-102.552784', NULL
  ), 
  (
    143, 'FM', 'Micronesia', 691, '7.425554', 
    '150.550812', NULL
  ), 
  (
    144, 'MD', 'Moldova', 373, '47.411631', 
    '28.369885', NULL
  ), 
  (
    145, 'MC', 'Monaco', 377, '43.750298', 
    '7.412841', NULL
  ), 
  (
    146, 'MN', 'Mongolia', 976, '46.862496', 
    '103.846656', NULL
  ), 
  (
    147, 'MS', 'Montserrat', 1664, '16.742498', 
    '-62.187366', NULL
  ), 
  (
    148, 'MA', 'Morocco', 212, '31.791702', 
    '-7.09262', NULL
  ), 
  (
    149, 'MZ', 'Mozambique', 258, '-18.665695', 
    '35.529562', NULL
  ), 
  (
    150, 'MM', 'Myanmar', 95, '21.913965', 
    '95.956223', NULL
  ), 
  (
    151, 'NA', 'Namibia', 264, '-22.95764', 
    '18.49041', NULL
  ), 
  (
    152, 'NR', 'Nauru', 674, '-0.522778', 
    '166.931503', NULL
  ), 
  (
    153, 'NP', 'Nepal', 977, '28.394857', 
    '84.124008', NULL
  ), 
  (
    154, 'AN', 'Netherlands Antilles', 
    599, '12.226079', '-69.060087', NULL
  ), 
  (
    155, 'NL', 'Netherlands', 31, '52.132633', 
    '5.291266', NULL
  ), 
  (
    156, 'NC', 'New Caledonia', 687, '-20.904305', 
    '165.618042', NULL
  ), 
  (
    157, 'NZ', 'New Zealand', 64, '-40.900557', 
    '174.885971', NULL
  ), 
  (
    158, 'NI', 'Nicaragua', 505, '12.865416', 
    '-85.207229', NULL
  ), 
  (
    159, 'NE', 'Niger', 227, '17.607789', 
    '8.081666', NULL
  ), 
  (
    160, 'NG', 'Nigeria', 234, '9.081999', 
    '8.675277', NULL
  ), 
  (
    161, 'NU', 'Niue', 683, '-19.054445', 
    '-169.867233', NULL
  ), 
  (
    162, 'NF', 'Norfolk Island', 672, '-29.040835', 
    '167.954712', NULL
  ), 
  (
    163, 'MP', 'Northern Mariana Islands', 
    1670, '17.33083', '145.38469', NULL
  ), 
  (
    164, 'NO', 'Norway', 47, '60.472024', 
    '8.468946', NULL
  ), 
  (
    165, 'OM', 'Oman', 968, '21.512583', 
    '55.923255', NULL
  ), 
  (
    166, 'PK', 'Pakistan', 92, '30.375321', 
    '69.345116', NULL
  ), 
  (
    167, 'PW', 'Palau', 680, '7.51498', 
    '134.58252', NULL
  ), 
  (
    168, 'PS', 'Palestinian Territory Occupied', 
    970, '31.952162', '35.233154', NULL
  ), 
  (
    169, 'PA', 'Panama', 507, '8.537981', 
    '-80.782127', NULL
  ), 
  (
    170, 'PG', 'Papua new Guinea', 675, 
    '-6.314993', '143.95555', NULL
  ), 
  (
    171, 'PY', 'Paraguay', 595, '-23.442503', 
    '-58.443832', NULL
  ), 
  (
    172, 'PE', 'Peru', 51, '-9.189967', 
    '-75.015152', NULL
  ), 
  (
    173, 'PH', 'Philippines', 63, '12.879721', 
    '121.774017', NULL
  ), 
  (
    174, 'PN', 'Pitcairn Island', 0, '-24.703615', 
    '-127.439308', NULL
  ), 
  (
    175, 'PL', 'Poland', 48, '51.919438', 
    '19.145136', NULL
  ), 
  (
    176, 'PT', 'Portugal', 351, '39.399872', 
    '-8.224454', NULL
  ), 
  (
    177, 'PR', 'Puerto Rico', 1787, '18.220833', 
    '-66.590149', NULL
  ), 
  (
    178, 'QA', 'Qatar', 974, '25.354826', 
    '51.183884', NULL
  ), 
  (
    179, 'RE', 'Reunion', 262, '-21.115141', 
    '55.536384', NULL
  ), 
  (
    180, 'RO', 'Romania', 40, '45.943161', 
    '24.96676', NULL
  ), 
  (
    181, 'RU', 'Russia', 70, '61.52401', 
    '105.318756', NULL
  ), 
  (
    182, 'RW', 'Rwanda', 250, '-1.940278', 
    '29.873888', NULL
  ), 
  (
    183, 'SH', 'Saint Helena', 290, '-24.143474', 
    '-10.030696', NULL
  ), 
  (
    184, 'KN', 'Saint Kitts And Nevis', 
    1869, '17.357822', '-62.782998', 
    NULL
  ), 
  (
    185, 'LC', 'Saint Lucia', 1758, '13.909444', 
    '-60.978893', NULL
  ), 
  (
    186, 'PM', 'Saint Pierre and Miquelon', 
    508, '46.941936', '-56.27111', NULL
  ), 
  (
    187, 'VC', 'Saint Vincent And The Grenadines', 
    1784, '12.984305', '-61.287228', 
    NULL
  ), 
  (
    188, 'WS', 'Samoa', 684, '-13.759029', 
    '-172.104629', NULL
  ), 
  (
    189, 'SM', 'San Marino', 378, '43.94236', 
    '12.457777', NULL
  ), 
  (
    190, 'ST', 'Sao Tome and Principe', 
    239, '0.18636', '6.613081', NULL
  ), 
  (
    191, 'SA', 'Saudi Arabia', 966, '23.885942', 
    '45.079162', NULL
  ), 
  (
    192, 'SN', 'Senegal', 221, '14.497401', 
    '-14.452362', NULL
  ), 
  (
    193, 'RS', 'Serbia', 381, '44.016521', 
    '21.005859', NULL
  ), 
  (
    194, 'SC', 'Seychelles', 248, '-4.679574', 
    '55.491977', NULL
  ), 
  (
    195, 'SL', 'Sierra Leone', 232, '8.460555', 
    '-11.779889', NULL
  ), 
  (
    196, 'SG', 'Singapore', 65, '1.352083', 
    '103.819836', NULL
  ), 
  (
    197, 'SK', 'Slovakia', 421, '48.669026', 
    '19.699024', NULL
  ), 
  (
    198, 'SI', 'Slovenia', 386, '46.151241', 
    '14.995463', NULL
  ), 
  (
    199, 'XG', 'Smaller Territories of the UK', 
    44, '', '', NULL
  ), 
  (
    200, 'SB', 'Solomon Islands', 677, 
    '-9.64571', '160.156194', NULL
  ), 
  (
    201, 'SO', 'Somalia', 252, '5.152149', 
    '46.199616', NULL
  ), 
  (
    202, 'ZA', 'South Africa', 27, '-30.559482', 
    '22.937506', NULL
  ), 
  (
    203, 'GS', 'South Georgia', 0, '-54.429579', 
    '-36.587909', NULL
  ), 
  (
    204, 'SS', 'South Sudan', 211, '', '', 
    NULL
  ), 
  (
    205, 'ES', 'Spain', 34, '40.463667', 
    '-3.74922', NULL
  ), 
  (
    206, 'LK', 'Sri Lanka', 94, '7.873054', 
    '80.771797', NULL
  ), 
  (
    207, 'SD', 'Sudan', 249, '12.862807', 
    '30.217636', NULL
  ), 
  (
    208, 'SR', 'Suriname', 597, '3.919305', 
    '-56.027783', NULL
  ), 
  (
    209, 'SJ', 'Svalbard And Jan Mayen Islands', 
    47, '77.553604', '23.670272', NULL
  ), 
  (
    210, 'SZ', 'Swaziland', 268, '-26.522503', 
    '31.465866', NULL
  ), 
  (
    211, 'SE', 'Sweden', 46, '60.128161', 
    '18.643501', NULL
  ), 
  (
    212, 'CH', 'Switzerland', 41, '46.818188', 
    '8.227512', NULL
  ), 
  (
    213, 'SY', 'Syria', 963, '34.802075', 
    '38.996815', NULL
  ), 
  (
    214, 'TW', 'Taiwan', 886, '23.69781', 
    '120.960515', NULL
  ), 
  (
    215, 'TJ', 'Tajikistan', 992, '38.861034', 
    '71.276093', NULL
  ), 
  (
    216, 'TZ', 'Tanzania', 255, '-6.369028', 
    '34.888822', NULL
  ), 
  (
    217, 'TH', 'Thailand', 66, '15.870032', 
    '100.992541', NULL
  ), 
  (
    218, 'TG', 'Togo', 228, '8.619543', 
    '0.824782', NULL
  ), 
  (
    219, 'TK', 'Tokelau', 690, '-8.967363', 
    '-171.855881', NULL
  ), 
  (
    220, 'TO', 'Tonga', 676, '-21.178986', 
    '-175.198242', NULL
  ), 
  (
    221, 'TT', 'Trinidad And Tobago', 
    1868, '10.691803', '-61.222503', 
    NULL
  ), 
  (
    222, 'TN', 'Tunisia', 216, '33.886917', 
    '9.537499', NULL
  ), 
  (
    223, 'TR', 'Turkey', 90, '38.963745', 
    '35.243322', NULL
  ), 
  (
    224, 'TM', 'Turkmenistan', 7370, '38.969719', 
    '59.556278', NULL
  ), 
  (
    225, 'TC', 'Turks And Caicos Islands', 
    1649, '21.694025', '-71.797928', 
    NULL
  ), 
  (
    226, 'TV', 'Tuvalu', 688, '-7.109535', 
    '177.64933', NULL
  ), 
  (
    227, 'UG', 'Uganda', 256, '1.373333', 
    '32.290275', NULL
  ), 
  (
    228, 'UA', 'Ukraine', 380, '48.379433', 
    '31.16558', NULL
  ), 
  (
    229, 'AE', 'United Arab Emirates', 
    971, '23.424076', '53.847818', NULL
  ), 
  (
    230, 'GB', 'United Kingdom', 44, '55.378051', 
    '-3.435973', NULL
  ), 
  (
    231, 'US', 'United States', 1, '37.09024', 
    '-95.712891', NULL
  ), 
  (
    232, 'UM', 'United States Minor Outlying Islands', 
    1, '', '', NULL
  ), 
  (
    233, 'UY', 'Uruguay', 598, '-32.522779', 
    '-55.765835', NULL
  ), 
  (
    234, 'UZ', 'Uzbekistan', 998, '41.377491', 
    '64.585262', NULL
  ), 
  (
    235, 'VU', 'Vanuatu', 678, '-15.376706', 
    '166.959158', NULL
  ), 
  (
    236, 'VA', 'Vatican City State (Holy See)', 
    39, '41.902916', '12.453389', NULL
  ), 
  (
    237, 'VE', 'Venezuela', 58, '6.42375', 
    '-66.58973', NULL
  ), 
  (
    238, 'VN', 'Vietnam', 84, '14.058324', 
    '108.277199', NULL
  ), 
  (
    239, 'VG', 'Virgin Islands (British)', 
    1284, '18.420695', '-64.639968', 
    NULL
  ), 
  (
    240, 'VI', 'Virgin Islands (US)', 
    1340, '18.335765', '-64.896335', 
    NULL
  ), 
  (
    241, 'WF', 'Wallis And Futuna Islands', 
    681, '-13.768752', '-177.156097', 
    NULL
  ), 
  (
    242, 'EH', 'Western Sahara', 212, '24.215527', 
    '-12.885834', NULL
  ), 
  (
    243, 'YE', 'Yemen', 967, '15.552727', 
    '48.516388', NULL
  ), 
  (
    244, 'YU', 'Yugoslavia', 38, '', '', 
    NULL
  ), 
  (
    245, 'ZM', 'Zambia', 260, '-13.133897', 
    '27.849332', NULL
  ), 
  (
    246, 'ZW', 'Zimbabwe', 263, '-19.015438', 
    '29.154857', NULL
  );
CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL, 
  `name` varchar(128) CHARACTER SET utf8 NOT NULL, 
  `code` varchar(20) CHARACTER SET utf8 NOT NULL, 
  `type` char(1) CHARACTER SET utf8 NOT NULL, 
  `discount` decimal(15, 4) NOT NULL, 
  `date_start` date DEFAULT NULL, 
  `date_end` date DEFAULT NULL, 
  `uses_total` int(11) NOT NULL, 
  `status` tinyint(1) NOT NULL, 
  `products` text CHARACTER SET utf8, 
  `vendor_id` int(11) DEFAULT '0', 
  `allow_for` varchar(1) CHARACTER SET utf8 NOT NULL, 
  `date_added` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL, 
  `title` varchar(32) CHARACTER SET utf8 NOT NULL, 
  `code` varchar(3) CHARACTER SET utf8 NOT NULL, 
  `symbol_left` varchar(12) CHARACTER SET utf8 NOT NULL, 
  `symbol_right` varchar(12) CHARACTER SET utf8 NOT NULL, 
  `decimal_place` char(1) CHARACTER SET utf8 NOT NULL, 
  `value` float DEFAULT '0', 
  `status` tinyint(1) NOT NULL, 
  `is_default` int(11) NOT NULL, 
  `date_modified` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `currency` (
  `currency_id`, `title`, `code`, `symbol_left`, 
  `symbol_right`, `decimal_place`, 
  `value`, `status`, `is_default`, 
  `date_modified`
) 
VALUES 
  (
    1, 'US Dollar', 'USD', '$', '', '2', 
    1, 1, 1, '2020-12-20 14:48:49'
  ), 
  (
    2, 'Euro', 'EUR', 'Ã¢â€šÂ¬', 
    '', '2', 0.82, 1, 0, '2020-12-20 14:49:28'
  ), 
  (
    51, 'CFA Franc BCEAO', 'XOF', 'CFA', 
    'F', '0', 1, 1, 0, '2022-04-28 11:19:19'
  ), 
  (
    52, 'Tunisian Dinar', 'TND', 'DT', 
    '', '3', 1, 0, 0, '2021-04-20 00:12:57'
  ), 
  (
    53, 'Indian Rupee', 'INR', 'â‚¹', 
    'â‚¹', '2', 1, 1, 0, '2022-07-25 15:07:37'
  ), 
  (
    55, 'Polish Zloty', 'PLN', 'zÅ‚', 
    '', '2', 1, 1, 0, '2021-04-26 16:08:37'
  ), 
  (
    56, 'Bitcoin', 'BTC', 'â‚¿', '', 
    '2', 0.0005, 1, 0, '2022-05-01 01:23:18'
  ), 
  (
    57, 'Indian Rupee', 'INR', 'Rs', '', 
    '2', 1, 1, 0, '2022-07-20 18:56:38'
  ), 
  (
    58, 'Ukrainian Hryvnia', 'UAH', 'â‚´', 
    '', '2', 1, 1, 0, '2021-04-29 02:35:49'
  ), 
  (
    59, 'Moroccan Dirham', 'MAD', 'MAD', 
    '', '2', 1, 0, 0, '2021-04-29 03:44:48'
  ), 
  (
    61, 'Russian Ruble', 'RUB', 'RUB', 
    'Ñ€ÑƒÐ±.', '2', 1, 1, 0, '2022-01-21 11:46:30'
  ), 
  (
    62, 'Egyptian Pound', 'EGP', 'EGP', 
    '$', '2', 1, 1, 0, '2022-04-12 02:44:56'
  ), 
  (
    63, 'Peruvian Nuevo Sol', 'PEN', 'S/.', 
    '', '2', 1, 1, 0, '2022-08-21 00:22:59'
  ), 
  (
    64, 'Ghanaian Cedi', 'GHS', 'GHâ‚µ', 
    'Â¢', '2', 1, 1, 0, '2021-11-24 13:06:25'
  ), 
  (
    65, 'Vietnamese Dong', 'VND', '', 'â‚«', 
    '0', 1, 1, 0, '2021-10-11 05:41:11'
  ), 
  (
    66, 'Croatian Kuna', 'HRK', '', 'KN', 
    '2', 1, 1, 0, '2021-10-21 16:12:30'
  ), 
  (
    67, 'Chinese Yuan', 'CNY', 'CNÂ¥', 
    '', '2', 1, 1, 0, '2022-07-17 06:48:57'
  ), 
  (
    68, 'Pakistani Rupee', 'PKR', 'PKRs', 
    'â‚¨', '0', 1, 1, 0, '2022-05-10 12:16:10'
  ), 
  (
    69, 'Australian Dollar', 'AUD', 'AU$', 
    '', '2', 1, 1, 0, '2021-11-12 06:00:44'
  ), 
  (
    70, 'Nepalese Rupee', 'NPR', 'NPRs', 
    'NPR', '1', 1, 1, 0, '2021-12-26 07:47:09'
  ), 
  (
    71, 'Paraguayan Guarani', 'PYG', 'â‚²', 
    'Gs', '3', 1, 1, 0, '2022-01-03 13:08:21'
  ), 
  (
    72, 'Thai Baht', 'THB', 'à¸¿', '', 
    '2', 37.54, 1, 0, '2022-01-05 10:05:38'
  ), 
  (
    73, 'Iranian Rial', 'IRR', 'IRR', '', 
    '0', 1, 0, 0, '2022-01-19 09:10:11'
  ), 
  (
    75, 'Turkish Lira', 'TRY', 'â‚º', 
    'TL', '2', 1, 1, 0, '2022-06-29 21:14:05'
  ), 
  (
    76, 'Saudi Riyal', 'SAR', 'SR', '', 
    '2', 1, 1, 0, '2022-02-07 05:18:09'
  ), 
  (
    77, 'Nigerian Naira', 'NGN', 'â‚¦', 
    '', '2', 1, 1, 0, '2022-08-16 07:57:50'
  ), 
  (
    79, 'South Korean Won', 'KRW', 'â‚©', 
    '', '0', 1, 1, 0, '2022-02-19 11:24:44'
  ), 
  (
    80, 'Canadian Dollar', 'CAD', 'CA$', 
    '', '2', 1, 0, 0, '2022-02-25 10:26:57'
  ), 
  (
    81, 'Indonesian Rupiah', 'IDR', 'Rp', 
    '', '0', 1, 1, 0, '2022-06-11 23:01:52'
  ), 
  (
    82, 'Kenyan Shilling', 'KES', 'Ksh', 
    '', '2', 1, 1, 0, '2022-06-27 13:08:39'
  ), 
  (
    84, 'Uruguayan Peso', 'UYU', '$U', 
    '', '2', 1, 1, 0, '2022-03-22 21:34:38'
  ), 
  (
    85, 'POINTS', 'GOG', '', '$GOGA', '4', 
    1, 1, 0, '2022-06-18 13:53:16'
  ), 
  (
    86, 'Sri Lankan Rupee', 'LKR', 'SLRs', 
    '', '2', 1, 1, 0, '2022-04-15 12:46:32'
  ), 
  (
    87, 'Bahraini Dinar', 'BHD', 'BD', 
    '', '3', 1, 1, 0, '2022-04-23 03:02:33'
  ), 
  (
    88, 'Ethiopian Birr', 'ETB', 'Br', 
    '', '2', 0.00234, 1, 0, '2022-04-25 19:01:18'
  ), 
  (
    89, 'United Arab Emirates Dirham', 
    'AED', 'AED', 'AED', '2', 1, 1, 0, '2022-05-10 11:22:36'
  ), 
  (
    90, 'Colombian Peso', 'COP', 'CO$', 
    '', '0', 1, 1, 0, '2022-05-30 21:00:40'
  ), 
  (
    91, 'Algerian Dinar', 'DZD', 'DA', 
    '', '2', 1, 1, 0, '2022-08-09 14:39:44'
  ), 
  (
    92, 'Mozambican Metical', 'MZN', 'MTn', 
    ',', '2', 1, 1, 0, '2022-06-09 20:39:25'
  ), 
  (
    93, 'Brazilian Real', 'BRL', 'R$', 
    '', '2', 1, 1, 0, '2022-08-15 17:36:33'
  ), 
  (
    94, 'Bangladeshi Taka', 'BDT', 'Tk', 
    'à§³', '2', 1, 1, 0, '2022-07-14 17:50:53'
  ), 
  (
    95, 'Philippine Peso', 'PHP', 'â‚±', 
    '', '2', 1, 1, 0, '2022-07-16 09:43:10'
  ), 
  (
    96, 'BDT', 'BDT', 'Tk', '', '2', 1, 1, 
    0, '2022-07-25 01:37:24'
  ), 
  (
    100, 'Serbian Dinar', 'RSD', '', 'din.', 
    '2', 1, 1, 0, '2022-08-12 17:05:52'
  ), 
  (
    101, 'pkr', 'PKR', 'pkr', '', '0', 1, 
    1, 0, '2022-08-16 12:23:42'
  ), 
  (
    102, 'South African Rand', 'ZAR', 
    'R', '2', '2', 1, 1, 0, '2022-08-16 13:50:30'
  ), 
  (
    103, 'British Pound Sterling', 'GBP', 
    'Â£', '', '2', 1, 1, 1, '2022-08-28 00:23:01'
  );
CREATE TABLE `deposit_requests_history` (
  `id` int(11) NOT NULL, 
  `vd_id` int(11) NOT NULL, 
  `status` int(11) NOT NULL, 
  `comment` varchar(355) COLLATE utf8_unicode_ci NOT NULL, 
  `transaction_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
CREATE TABLE `form` (
  `form_id` int(11) NOT NULL, 
  `title` text CHARACTER SET utf8 NOT NULL, 
  `description` longtext CHARACTER SET utf8 NOT NULL, 
  `seo` varchar(50) CHARACTER SET utf8 NOT NULL, 
  `fevi_icon` varchar(50) CHARACTER SET utf8 NOT NULL, 
  `sale_commision_type` varchar(50) CHARACTER SET utf8 DEFAULT NULL, 
  `sale_commision_value` float DEFAULT '0', 
  `click_commision_type` varchar(50) CHARACTER SET utf8 DEFAULT NULL, 
  `click_commision_ppc` float DEFAULT '0', 
  `click_commision_per` float DEFAULT '0', 
  `comment` text CHARACTER SET utf8, 
  `form_recursion_type` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `form_recursion` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `recursion_custom_time` bigint(20) NOT NULL, 
  `recursion_endtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `product` text CHARACTER SET utf8, 
  `coupon` text CHARACTER SET utf8 NOT NULL, 
  `status` int(11) NOT NULL DEFAULT '1', 
  `allow_for` text CHARACTER SET utf8 NOT NULL, 
  `footer_title` text CHARACTER SET utf8 NOT NULL, 
  `google_analitics` text CHARACTER SET utf8 NOT NULL, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `form_action` (
  `action_id` int(11) NOT NULL, 
  `action_type` text COLLATE utf8_unicode_ci, 
  `form_id` int(11) DEFAULT NULL, 
  `user_id` int(11) DEFAULT NULL, 
  `user_ip` text COLLATE utf8_unicode_ci, 
  `viewer_id` int(11) NOT NULL, 
  `counter` int(11) NOT NULL, 
  `pay_commition` int(11) NOT NULL, 
  `created_at` datetime NOT NULL, 
  `country_code` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `form_coupon` (
  `form_coupon_id` int(11) NOT NULL, 
  `name` varchar(128) CHARACTER SET utf8 NOT NULL, 
  `code` varchar(20) CHARACTER SET utf8 NOT NULL, 
  `type` char(1) CHARACTER SET utf8 NOT NULL, 
  `vendor_id` int(11) NOT NULL, 
  `discount` decimal(15, 4) NOT NULL, 
  `date_start` date DEFAULT NULL, 
  `date_end` date DEFAULT NULL, 
  `uses_total` int(11) NOT NULL, 
  `status` tinyint(1) NOT NULL, 
  `date_added` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `integration_admin_clicks_action` (
  `id` int(11) NOT NULL, 
  `base_url` varchar(200) CHARACTER SET utf8 NOT NULL, 
  `product_id` double(22, 0) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `commission` float DEFAULT '0', 
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `ads_id` int(11) NOT NULL, 
  `tools_id` int(11) NOT NULL, 
  `country_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `script_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `action_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `page_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `is_action` int(11) NOT NULL, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `integration_category` (
  `id` int(11) NOT NULL, 
  `parent_id` int(11) DEFAULT NULL, 
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `integration_category` (
  `id`, `parent_id`, `name`, `created_at`
) 
VALUES 
  (
    1, NULL, 'Clicks', '2020-12-20 12:32:51'
  ), 
  (
    2, NULL, 'Salse', '2020-12-20 12:33:00'
  ), 
  (
    3, NULL, 'Actions', '2020-12-20 12:33:08'
  ), 
  (
    4, NULL, 'Leads', '2020-12-20 12:33:17'
  ), 
  (
    5, NULL, 'Registration', '2020-12-20 12:33:31'
  );
CREATE TABLE `integration_clicks_action` (
  `id` int(11) NOT NULL, 
  `base_url` varchar(200) CHARACTER SET utf8 NOT NULL, 
  `product_id` double(22, 0) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `commission` float DEFAULT '0', 
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `ads_id` int(11) NOT NULL, 
  `tools_id` int(11) NOT NULL, 
  `country_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `script_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `action_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `page_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `is_action` int(11) NOT NULL, 
  `custom_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `integration_clicks_logs` (
  `id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `vendor_id` int(11) DEFAULT NULL, 
  `base_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `link` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `browserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `browserVersion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `systemString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `osPlatform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `osVersion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `osShortVersion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `isMobile` int(11) NOT NULL, 
  `mobileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `osArch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `isIntel` int(11) NOT NULL, 
  `isAMD` int(11) NOT NULL, 
  `isPPC` int(11) NOT NULL, 
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `country_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `created_at` datetime NOT NULL, 
  `click_id` int(11) NOT NULL, 
  `click_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `custom_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `integration_orders` (
  `id` int(11) NOT NULL, 
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `product_ids` varchar(888) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `total` double NOT NULL, 
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `commission_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `commission` double NOT NULL, 
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `country_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `base_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `ads_id` int(11) NOT NULL, 
  `script_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `status` int(11) NOT NULL DEFAULT '0', 
  `created_at` datetime NOT NULL, 
  `vendor_id` int(11) DEFAULT NULL, 
  `admin_tran` int(11) DEFAULT NULL, 
  `affiliate_tran` int(11) DEFAULT NULL, 
  `custom_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `integration_programs` (
  `id` int(11) NOT NULL, 
  `vendor_id` int(11) DEFAULT NULL, 
  `status` int(11) DEFAULT '1', 
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `commission_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `commission_sale` float DEFAULT '0', 
  `sale_status` int(11) DEFAULT NULL, 
  `commission_number_of_click` int(11) DEFAULT NULL, 
  `commission_click_commission` float DEFAULT '0', 
  `click_status` int(11) DEFAULT NULL, 
  `admin_commission_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `admin_commission_sale` float DEFAULT '0', 
  `admin_commission_number_of_click` int(11) DEFAULT NULL, 
  `admin_commission_click_commission` float DEFAULT '0', 
  `admin_click_status` int(11) DEFAULT NULL, 
  `admin_sale_status` int(11) DEFAULT NULL, 
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, 
  `click_allow` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `integration_refer_product_action` (
  `id` int(11) NOT NULL, 
  `country_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL, 
  `script_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL, 
  `product_id` int(11) DEFAULT NULL, 
  `base_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `user_id` int(11) DEFAULT NULL, 
  `user_ip` text COLLATE utf8_unicode_ci, 
  `viewer_id` int(11) NOT NULL, 
  `counter` int(11) NOT NULL, 
  `pay_commition` int(11) NOT NULL, 
  `created_at` datetime NOT NULL, 
  `count_for` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `action_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `page_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `ads_id` int(11) NOT NULL, 
  `is_action` int(11) NOT NULL, 
  `tools_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `integration_tools` (
  `id` int(11) NOT NULL, 
  `vendor_id` int(11) DEFAULT NULL, 
  `program_id` int(11) NOT NULL, 
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `target_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `status` int(11) NOT NULL, 
  `security_status` tinyint(1) NOT NULL DEFAULT '0', 
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `tool_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'program', 
  `action_click` int(11) NOT NULL, 
  `action_amount` double NOT NULL, 
  `general_click` int(11) NOT NULL, 
  `general_amount` double NOT NULL, 
  `general_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `action_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `is_allow_group` tinyint(1) NOT NULL DEFAULT '0', 
  `allow_groups` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `allow_for` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, 
  `commission_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `commission` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, 
  `featured_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `recursion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `recursion_custom_time` bigint(20) NOT NULL, 
  `recursion_endtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `marketpostback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, 
  `admin_action_click` int(11) DEFAULT NULL, 
  `admin_action_amount` float DEFAULT '0', 
  `admin_general_click` int(11) DEFAULT NULL, 
  `admin_general_amount` float DEFAULT '0', 
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, 
  `terms` longtext CHARACTER SET utf8mb4, 
  `created_at` datetime NOT NULL, 
  `tool_integration_plugin` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `start_date` datetime DEFAULT NULL, 
  `end_date` datetime DEFAULT NULL, 
  `trigger_count` int(11) NOT NULL DEFAULT '0', 
  `security_check_perform_on` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `cookies_type` tinyint(1) NOT NULL DEFAULT '0', 
  `custom_cookies` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `integration_tools_ads` (
  `id` int(11) NOT NULL, 
  `tools_id` int(11) NOT NULL, 
  `ads_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, 
  `size` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `language` (
  `id` int(11) NOT NULL, 
  `name` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `is_default` tinyint(1) NOT NULL DEFAULT '0', 
  `is_rtl` int(11) NOT NULL DEFAULT '0', 
  `flag` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `status` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `language` (
  `id`, `name`, `is_default`, `is_rtl`, 
  `flag`, `status`
) 
VALUES 
  (
    1, 'English', 1, 0, './assets/vertical/assets/images/flags/lr.png', 
    1
  ), 
  (
    36, 'Spanish, Castilian', 0, 0, './assets/vertical/assets/images/flags/pe.png', 
    0
  ), 
  (
    47, 'Turkish', 0, 0, './assets/vertical/assets/images/flags/tr.png', 
    0
  ), 
  (
    48, 'French', 0, 0, './assets/vertical/assets/images/flags/fr.png', 
    0
  ), 
  (
    49, 'Indonesian', 0, 0, './assets/vertical/assets/images/flags/id.png', 
    0
  ), 
  (
    52, 'Malay', 0, 0, './assets/vertical/assets/images/flags/bn.png', 
    0
  ), 
  (
    56, 'German', 0, 0, './assets/vertical/assets/images/flags/de.png', 
    0
  ), 
  (
    58, 'Italian', 0, 0, './assets/vertical/assets/images/flags/it.png', 
    0
  ), 
  (
    63, 'Japanese', 0, 0, './assets/vertical/assets/images/flags/jp.png', 
    0
  ), 
  (
    65, 'Portuguese', 0, 0, './assets/vertical/assets/images/flags/pt.png', 
    0
  ), 
  (
    66, 'Arabic', 0, 1, './assets/vertical/assets/images/flags/ae.png', 
    0
  ), 
  (
    68, 'Hindi', 0, 0, './assets/vertical/assets/images/flags/in.png', 
    0
  ), 
  (
    69, 'Polish', 0, 0, './assets/vertical/assets/images/flags/pl.png', 
    0
  ), 
  (
    72, 'Vietnamese', 0, 0, './assets/vertical/assets/images/flags/vn.png', 
    0
  ), 
  (
    74, 'Russian', 0, 0, './assets/vertical/assets/images/flags/ru.png', 
    0
  ), 
  (
    76, 'Arabic', 0, 1, './assets/vertical/assets/images/flags/ye.png', 
    0
  ), 
  (
    81, 'Chinese', 0, 1, './assets/vertical/assets/images/flags/cn.png', 
    0
  ), 
  (
    84, 'Polish', 0, 0, './assets/vertical/assets/images/flags/lt.png', 
    0
  ), 
  (
    89, 'Chinese', 0, 0, './assets/vertical/assets/images/flags/tw.png', 
    0
  ), 
  (
    90, 'Spanish, Castilian', 0, 0, './assets/vertical/assets/images/flags/ve.png', 
    0
  ), 
  (
    106, 'Vietnamese', 0, 0, './assets/vertical/assets/images/flags/vn.png', 
    0
  ), 
  (
    108, 'Malay', 0, 0, './assets/vertical/assets/images/flags/my.png', 
    0
  ), 
  (
    110, 'Albanian', 0, 0, './assets/vertical/assets/images/flags/al.png', 
    0
  ), 
  (
    111, 'Portuguese', 0, 0, './assets/vertical/assets/images/flags/br.png', 
    0
  ), 
  (
    112, 'Tajik', 0, 0, './assets/vertical/assets/images/flags/tj.png', 
    0
  ), 
  (
    113, 'Thai', 0, 0, './assets/vertical/assets/images/flags/th.png', 
    0
  ), 
  (
    114, 'Dutch, Flemish', 0, 0, './assets/vertical/assets/images/flags/nl.png', 
    0
  ), 
  (
    117, 'Arabic', 0, 1, './assets/vertical/assets/images/flags/sa.png', 
    0
  ), 
  (
    121, 'Hebrew', 0, 0, './assets/vertical/assets/images/flags/il.png', 
    0
  ), 
  (
    122, 'Greek (Modern)', 0, 0, './assets/vertical/assets/images/flags/gr.png', 
    0
  ), 
  (
    123, 'Turkish', 1, 0, './assets/vertical/assets/images/flags/tr.png', 
    1
  ), 
  (
    124, 'Russian', 0, 0, './assets/vertical/assets/images/flags/az.png', 
    0
  ), 
  (
    125, 'Russian', 0, 0, './assets/vertical/assets/images/flags/ru.png', 
    0
  ), 
  (
    126, 'Chinese', 0, 0, './assets/vertical/assets/images/flags/cn.png', 
    0
  ), 
  (
    127, 'Portuguese', 0, 0, './assets/vertical/assets/images/flags/br.png', 
    0
  ), 
  (128, 'Tagalog', 0, 0, NULL, 0), 
  (
    129, 'Chinese', 0, 0, './assets/vertical/assets/images/flags/cn.png', 
    0
  ), 
  (
    130, 'Avestan', 0, 0, './assets/vertical/assets/images/flags/ee.png', 
    0
  ), 
  (
    131, 'Croatian', 0, 0, './assets/vertical/assets/images/flags/hr.png', 
    0
  ), 
  (
    132, 'Serbian', 0, 0, './assets/vertical/assets/images/flags/rs.png', 
    0
  ), 
  (
    133, 'Urdu', 0, 1, './assets/vertical/assets/images/flags/pk.png', 
    0
  ), 
  (
    134, 'Arabic', 0, 1, './assets/vertical/assets/images/flags/tn.png', 
    0
  );
CREATE TABLE `last_seen` (
  `id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `message_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `mail_templates` (
  `id` int(11) NOT NULL, 
  `unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `subject` varchar(355) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `text` text COLLATE utf8_unicode_ci, 
  `admin_subject` varchar(355) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `client_subject` varchar(355) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `client_text` text COLLATE utf8_unicode_ci, 
  `admin_text` text COLLATE utf8_unicode_ci, 
  `shortcode` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `mail_templates` (
  `id`, `unique_id`, `name`, `subject`, 
  `text`, `admin_subject`, `client_subject`, 
  `client_text`, `admin_text`, `shortcode`
) 
VALUES 
  (
    1, '', 'User Registration', 'User Registration Successfully', 
    '<p>Dear [[firstname]],</p>\r\n\r\n<p>Your new affiliate user account has been created welcome to the [[website_name]]</p>\r\n\r\n<p>your account details:</p>\r\n\r\n<p>================</p>\r\n\r\n<p>[[firstname]]</p>\r\n\r\n<p>[[username]]</p>\r\n\r\n<p>[[email]]</p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'Admin : New affiliate user Register', 
    NULL, NULL, '<p>Dear Admin,</p>\r\n\r\n<p>&nbsp;New affiliate user Register on your site&nbsp;[[website_name]]</p>\r\n\r\n<p>Affiliate details:</p>\r\n\r\n<p>============</p>\r\n\r\n<p>[[firstname]]</p>\r\n\r\n<p>[[username]]</p>\r\n\r\n<p>[[email]]</p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    2, '', 'Client Registration', 'New Client Register Under you', 
    '<p>Dear [[firstname]],</p>\r\n\r\n<p>New client account has been created under you</p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'Admin : New Client Register', 
    'Dear [[firstname]], Welcome To Our Store', 
    '<p>Dear [[firstname]],</p>\r\n\r\n<p>welcome to the [[website_name]]</p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    '<p>Dear Admin,</p>\r\n\r\n<p>New client has been registered on your store</p>\r\n\r\n<p>[[firstname]] ,&nbsp;[[lastname]]&nbsp;</p>\r\n\r\n<p>[[email]] | [[username]]</p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    3, '', 'Forget Password', 'User Forget Password', 
    '<p>Dear [[firstname]],</p>\r\n\r\n<p>You recently request to reset your password from your [[website_name]] account click the below link to reset password</p>\r\n\r\n<p>[[reset_link]]</p>\r\n\r\n<p>If you did not request a password rest, please ignore this email or reply us know.</p>\r\n\r\n<p>[[website_name]]</p>\r\n\r\n<p>If you did not request a password rest, please ignore this email or reply us know.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thanks<br />\r\n[[website_name]]</p>\r\n', 
    'Admin : Forget Password', 'Client : Forget Password', 
    '<p>Dear [[firstname]],</p>\r\n\r\n<p>You recently request to reset your password from your [[website_name]] account click the below link to reset password</p>\r\n\r\n<p>[[reset_link]]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If you did not request a password rest, please ignore this email or reply us know.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thanks<br />\r\n[[website_name]]</p>\r\n', 
    '<p>Dear [[firstname]],</p>\r\n\r\n<p>You recently request to reset your password from your [[website_name]] account click the below link to reset password</p>\r\n\r\n<p>[[reset_link]]</p>\r\n\r\n<p>If you did not request a password rest, please ignore this email or reply us know.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thanks<br />\r\n[[website_name]]</p>\r\n', 
    'reset_link,firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    4, '', 'Send Wallet withdrawal Request', 
    'Send Wallet Withdrawal Request', 
    '<p>Dear [[name]],</p>\r\n\r\n<p>Your withdrawal request is accept successfully and procced shortly</p>\r\n\r\n<p>Amount : [[amount]]</p>\r\n\r\n<p>Thanks<br />\r\n[[website_name]]</p>\r\n', 
    'Admin : Send Wallet Withdrawal Request', 
    '', '', '<p>Dear [[name]],</p>\r\n\r\n<p>Your withdrawal request is accept successfully and procced shortly</p>\r\n\r\n<p>Amount : [[amount]]</p>\r\n\r\n<p>Thanks<br />\r\n[[website_name]]</p>\r\n', 
    'amount,comment,name,user_email,commission_type,website_name,website_logo'
  ), 
  (
    5, '', 'withdrawal request status change', 
    'Your withdrawal request status change', 
    '<p>Dear [[name]],</p>\r\n\r\n<p>Your withdrawal request status has been change to : <strong>[[new_status]]</strong></p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'Admin side', '', '', '<p>Dear [[name]],</p>\r\n\r\n<p>Withdrawal request status has been change to : <strong>[[new_status]]</strong></p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'amount,comment,name,user_email,commission_type,website_name,website_logo,new_status'
  ), 
  (
    6, '', 'Store Contact Us', '', '', 'Admin : Store Contact Us', 
    'We will contact to you shortly ..!', 
    '<p>&nbsp;</p>\r\n\r\n<p><strong>Name </strong>: [[name]]</p>\r\n\r\n<p><strong>Email </strong>: [[email]]</p>\r\n\r\n<p><strong>Phone </strong>: [[phone]]</p>\r\n\r\n<p><strong>Message</strong> :</p>\r\n\r\n<p>[[message]]</p>\r\n\r\n<p>&nbsp;</p>\r\n', 
    '<p>Hey Admin <strong>[[name]] </strong>trying to contact you.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Name </strong>: [[name]]</p>\r\n\r\n<p><strong>Email </strong>: [[email]]</p>\r\n\r\n<p><strong>Phone </strong>: [[phone]]</p>\r\n\r\n<p><strong>Message</strong> :</p>\r\n\r\n<p>[[message]]</p>\r\n\r\n<p>&nbsp;</p>\r\n', 
    'name,email,phone,message,website_name,website_logo'
  ), 
  (
    7, '', 'Order Status Has Been Change', 
    'Your Order Status Has Been Change', 
    '<p>Hello<strong>&nbsp;[[firstname]] [[lastname]]</strong></p>\r\n\r\n<p>Your Order Status Has Been Change to <strong>[[status]]</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>[[comment]]</p>\r\n\r\n<p><br />\r\norder Id :<strong> [[order_id]]</strong></p>\r\n', 
    'Admin : Your Order Status Has Been Change', 
    'Client: Your Order Status Has Been Change', 
    '<p>Hello<strong>&nbsp;[[firstname]] [[lastname]]</strong></p>\r\n\r\n<p>Your Order Status Has Been Change to <strong>[[status]]</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>[[comment]]</p>\r\n\r\n<p><br />\r\norder Id :<strong> [[order_id]]</strong></p>\r\n', 
    '<p>Hello<strong>&nbsp;[[firstname]] [[lastname]]</strong></p>\r\n\r\n<p>Your Order Status Has Been Change to <strong>[[status]]</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>[[comment]]</p>\r\n\r\n<p><br />\r\norder Id :<strong> [[order_id]]</strong></p>\r\n', 
    'order_id,status,order_link,product_name,product_description,commission_type,PhoneNumber,firstname,lastname,commission,total,currency_code,txn_id,website_name,website_logo,comment'
  ), 
  (
    8, '', 'New Order', 'Affiliate: New Order Commission From [[firstname]] [[lastname]]', 
    '<p>Hello Affiliate,</p>\r\n\r\n<p>you got new order Commission from sale thats done under [[firstname]] [[lastname]]</p>\r\n\r\n<p>Commission: [[commission]] -&nbsp;[[commission_type]]</p>\r\n\r\n<p><strong>Commission for product_name :&nbsp;</strong>[[product_name]]&nbsp;[[variation_details]]</p>\r\n\r\n<p><strong>product_description</strong> : [[product_description]]</p>\r\n', 
    'Admin : New OrderÃƒâ€šÃ‚Â [[order_id]]Ãƒâ€šÃ‚Â has been successfully placed.', 
    'Client : New OrderÃƒâ€šÃ‚Â [[order_id]]Ãƒâ€šÃ‚Â has been successfully placed.', 
    '<p>Dear Client,</p>\r\n\r\n<p>New Order <strong>[[order_id]] </strong>has been successfully placed on your site [[website_name]] .</p>\r\n\r\n<p><strong>Order Status</strong> : [[status]]<br />\r\n<strong>Total Amount</strong> : [[total]]<br />\r\n<strong>Transaction ID</strong> : [[txn_id]]</p>\r\n\r\n<p>[[order_link]]</p>\r\n', 
    '<p>Dear Admin,</p>\r\n\r\n<p>New Order <strong>[[order_id]] </strong>has been successfully placed on your site [[website_name]] .</p>\r\n\r\n<p><strong>Order Status</strong> : [[status]]<br />\r\n<strong>Total Amount</strong> : [[total]]<br />\r\n<strong>Transaction ID</strong> : [[txn_id]]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>[[order_link]]</p>\r\n', 
    'order_id,status,order_link,product_name,variation_details,product_description,commission_type,PhoneNumber,firstname,lastname,commission,total,currency_code,txn_id,website_name,website_logo,order_id'
  ), 
  (
    10, '', 'get market click notification', 
    'Get market click notification', 
    '<p>Dear [[name]],</p>\r\n\r\n<p>[[firstname]] [[lastname]] got commition from market [[affiliateads_type]] click</p>\r\n\r\n<p>Commition : [[affiliate_commission]]</p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'Admin : Get market click notification', 
    '', '', '<p>Dear [[name]],</p>\r\n\r\n<p>[[firstname]] [[lastname]] got commition from market [[affiliateads_type]] click</p>\r\n\r\n<p>Commition : [[affiliate_commission]]</p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'affiliateads_type,affiliate_commission,firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    11, '', 'External Website New Order', 
    'External Website New Order [[external_website_name]]', 
    '<p>Hey&nbsp;[[username]]</p>\r\n\r\n<p>You have got&nbsp;[[commission]] from [[external_website_name]]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Thanks&nbsp;</strong></p>\r\n\r\n<p>[[website_name]]</p>\r\n', 
    'External Website New Order [[external_website_name]]', 
    '', '', '<p>Hey New Order Placed at&nbsp;[[external_website_name]]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>User </strong>:&nbsp;[[username]]</p>\r\n\r\n<p><strong>Website </strong>:&nbsp;[[external_website_name]]</p>\r\n\r\n<p><strong>commission </strong>: [[commission]]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Thanks&nbsp;</strong></p>\r\n\r\n<p>[[website_name]]</p>\r\n', 
    'external_website_name,commission,username,website_name,website_logo,product_ids,total,currency,commission_type,script_name'
  ), 
  (
    12, '', 'wallet status change to in wallet', 
    '[[amount]] credited in your wallet', 
    '<p>Dear [[name]],</p>\r\n\r\n<p>[[comment]]</p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    '', '', '', '', 'amount,comment,name,user_email,website_name,website_logo,new_status'
  ), 
  (
    13, '', 'User Registration From Integration', 
    'User Registration Successfully', 
    '<p>Dear [[firstname]],</p>\r\n\r\n<p>Your new affiliate user account has been created welcome to the [[website_name]]</p>\r\n\r\n<p>your account details:</p>\r\n\r\n<p>================</p>\r\n\r\n<p>[[firstname]]</p>\r\n\r\n<p>[[username]]</p>\r\n\r\n<p>[[email]]</p>\r\n\r\n<h2>password is :&nbsp;<strong>[[password]]</strong></h2>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'Admin : New affiliate user Register From Integration', 
    '', '', '<p>Dear Admin,</p>\r\n\r\n<p>&nbsp;New affiliate user Register on your site&nbsp;[[website_name]]</p>\r\n\r\n<p>Affiliate details:</p>\r\n\r\n<p>============</p>\r\n\r\n<p>[[firstname]]</p>\r\n\r\n<p>[[username]]</p>\r\n\r\n<p>[[email]]</p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'firstname,lastname,email,username,password,website_name,website_logo'
  ), 
  (
    36, 'new_order_for_vendor', 'Vendor Got New Order', 
    'Vendor: You have new order from [[firstname]] [[lastname]]', 
    '<p>Hello Vendor,</p>\r\n                    <p>you got new order from [[firstname]] [[lastname]]</p>\r\n                    <p>Commission: [[vendor_commission]] </p>\r\n                    <p>Order Status: [[status]] </p>\r\n                    <p><strong>Commission for product_name :&nbsp;</strong>[[product_name]]</p>\r\n                    [[website_name]]<br />\r\n                            Support Team</p>\r\n                ', 
    '', '', '', '', 'vendor_firstname,vendor_lastname,vendor_commission,order_id,status,order_link,product_name,PhoneNumber,firstname,lastname,commission,total,currency_code,txn_id,website_name,website_logo,order_id'
  ), 
  (
    37, 'vendor_form_status_1', 'Vendor Form Status Change To Approved', 
    'Form Status Change To Approved', 
    '<p>Dear, [[username]]</p>\r\n                                <p>Form Status Change to Approved</p>\r\n                                <p>Name [[title]]</p>\r\n                                <p><br />\r\n                            [[website_name]]<br />\r\n                            Support Team</p>\r\n                        ', 
    '', '', '', '', 'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,title'
  ), 
  (
    38, 'vendor_create_product', 'Vendor Create new product', 
    '', '', 'New Product Created By Vendor', 
    '', '', '<p>Dear Admin,</p>\r\n                                <p>New Product has been created</p>\r\n                                <p>Name [[product_name]]</p>\r\n                                <p>Username [[username]]</p>\r\n                                <p><br />\r\n                            [[website_name]]<br />\r\n                            Support Team</p>\r\n                        ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,product_name,product_short_description,product_price,product_sku,product_id'
  ), 
  (
    39, 'vendor_product_status_1', 'Vendor Product Status Change To Approved', 
    'Product Status Change To Approved', 
    '<p>Dear, [[username]]</p>\r\n                                <p>Product Status Change to Approved</p>\r\n                                <p>Name [[product_name]]</p>\r\n                                <p><br />\r\n                            [[website_name]]<br />\r\n                            Support Team</p>\r\n                        ', 
    '', '', '', '', 'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,product_name,product_short_description,product_price,product_sku,product_id'
  ), 
  (
    40, 'vendor_create_form', 'Vendor Create new product', 
    '', '', 'New Form Created By Vendor', 
    '', '', '<p>Dear Admin,</p>\r\n                                <p>New Form has been created</p>\r\n                                <p>Name [[title]]</p>\r\n                                <p>Username [[username]]</p>\r\n                                <p><br />\r\n                            [[website_name]]<br />\r\n                            Support Team</p>\r\n                        ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,title'
  ), 
  (
    41, 'vendor_form_status_0', 'Vendor Form Status Change To In Review', 
    'Form Status Change To In Review', 
    '<p>Dear,</p>\r\n                                <p>Form Status Change to In Review</p>\r\n                                <p>Name [[title]]</p>\r\n                                <p><br />\r\n                            [[website_name]]<br />\r\n                            Support Team</p>\r\n                        ', 
    'Form Status Change To In Review', 
    '', '', '<p>Dear,</p>\r\n                                <p>Form Status Change to In Review</p>\r\n                                <p>Name [[title]]</p>\r\n                                <p><br />\r\n                            [[website_name]]<br />\r\n                            Support Team</p>\r\n                        ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,title'
  ), 
  (
    42, 'vendor_form_status_2', 'Vendor Form Status Change To Denied', 
    'Form Status Change To Denied', 
    '<p>Dear, [[username]]</p>\r\n                                <p>Form Status Change to Denied</p>\r\n                                <p>Name [[title]]</p>\r\n                                <p><br />\r\n                            [[website_name]]<br />\r\n                            Support Team</p>\r\n                        ', 
    '', '', '', '', 'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,title'
  ), 
  (
    43, 'vendor_order_status_complete', 
    'Vendor Order Status Has Been Change', 
    'Vendor: New Order Commission From [[firstname]] [[lastname]]', 
    '<p>Hello Vendor,</p>\r\n                    <p>you got new order Sale Commission from sale thats done under [[firstname]] [[lastname]]</p>\r\n                    <p>Commission: [[vendor_commission]] </p>\r\n                    <p><strong>Commission for product_name :&nbsp;</strong>[[product_name]]</p>\r\n                    [[website_name]]<br />\r\n                            Support Team</p>\r\n                ', 
    '', '', '', '', 'vendor_firstname,vendor_lastname,vendor_commission,order_id,status,order_link,product_name,commission_type,PhoneNumber,firstname,lastname,commission,total,currency_code,txn_id,website_name,website_logo,order_id'
  ), 
  (
    45, 'vendor_create_program', 'Vendor Create new product', 
    '', '', 'New Program Created By Vendor : [[name]]', 
    '', '', '<p>Dear Admin,</p>\r\n                    <p>New Program has been created</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p>Username [[username]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,name'
  ), 
  (
    46, 'vendor_program_status_2', 'Vendor Program Status Change To Denied', 
    'Program Status Change To Denied', 
    '<p>Dear,</p>\r\n                    <p>Program Status Change to Denied</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'Program Status Change To Denied', 
    '', '', '<p>Dear,</p>\r\n                    <p>Program Status Change to Denied</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,name'
  ), 
  (
    47, 'vendor_program_status_3', 'Vendor Program Status Change To Ask To Edit', 
    'Program Status Change To Ask To Edit', 
    '<p>Dear,</p>\r\n                    <p>Program Status Change to Ask To Edit</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'Program Status Change To Ask To Edit', 
    '', '', '<p>Dear,</p>\r\n                    <p>Program Status Change to Ask To Edit</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,name'
  ), 
  (
    48, 'vendor_program_status_0', 'Vendor Program Status Change To In Review', 
    'Program Status Change To In Review', 
    '<p>Dear,</p>\r\n                    <p>Program Status Change to In Review</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'Program Status Change To In Review', 
    '', '', '<p>Dear,</p>\r\n                    <p>Program Status Change to In Review</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,name'
  ), 
  (
    49, 'vendor_program_status_1', 'Vendor Program Status Change To Approved', 
    'Program Status Change To Approved', 
    '<p>Dear,</p>\r\n                    <p>Program Status Change to Approved</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'Program Status Change To Approved', 
    '', '', '<p>Dear,</p>\r\n                    <p>Program Status Change to Approved</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,name'
  ), 
  (
    51, 'vendor_create_ads', 'Vendor Create Ads (Banner, Text, Link, Video)', 
    '', '', 'New Ads ([[type]]) Created By Vendor', 
    '', '', '<p>Dear Admin,</p>\r\n                    <p>New Ads - [[type]] has been created</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p>Username [[username]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,name,type,tool_type'
  ), 
  (
    52, 'vendor_ads_status_1', 'Vendor Ads (Banner, Text, Link, Video) Status Change To Approved', 
    'Ads ([[type]]) Status Change To Approved', 
    '<p>Dear</p>\r\n                    <p>Ads - [[type]] Status Change to Approved </p>\r\n                    <p>Name [[name]]</p>\r\n                    <p>Username [[username]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'Ads ([[type]]) Status Change To Approved', 
    '', '', '<p>Dear</p>\r\n                    <p>Ads - [[type]] Status Change to Approved </p>\r\n                    <p>Name [[name]]</p>\r\n                    <p>Username [[username]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,name,type,tool_type'
  ), 
  (
    53, 'vendor_ads_status_0', 'Vendor Ads (Banner, Text, Link, Video) Status Change To In Review', 
    'Ads ([[type]]) Status Change To In Review', 
    '<p>Dear</p>\r\n                    <p>Ads - [[type]] Status Change to In Review </p>\r\n                    <p>Name [[name]]</p>\r\n                    <p>Username [[username]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'Ads ([[type]]) Status Change To In Review', 
    '', '', '<p>Dear</p>\r\n                    <p>Ads - [[type]] Status Change to In Review </p>\r\n                    <p>Name [[name]]</p>\r\n                    <p>Username [[username]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,name,type,tool_type'
  ), 
  (
    54, 'vendor_ads_status_3', 'Vendor Ads (Banner, Text, Link, Video) Status Change To Ask To Edit', 
    'Ads ([[type]]) Status Change To Ask To Edit', 
    '<p>Dear</p>\r\n                    <p>Ads - [[type]] Status Change to Ask To Edit</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p>Username [[username]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'Ads ([[type]]) Status Change To Ask To Edit', 
    '', '', '<p>Dear</p>\r\n                    <p>Ads - [[type]] Status Change to Ask To Edit</p>\r\n                    <p>Name [[name]]</p>\r\n                    <p>Username [[username]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,name,type,tool_type'
  ), 
  (
    55, 'order_on_vendor_program', 'New Order in Vendor Program', 
    'New Order Create In Your Program', 
    '<p>Dear Vendor,</p>\r\n                    <p>New Order Created under your Program</p>\r\n                    <p><b>Website</b> : [[external_website_name]]</p>\r\n                    <p><b>Total</b> : [[total]]</p>\r\n                    <p><br />\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    '', '', '', '', 'external_website_name,commission,username,website_name,website_logo,product_ids,total,currency,commission_type,script_name'
  ), 
  (
    57, 'withdrwal_status_change', 'Withdrawal Request Status Changed', 
    'Withdrawal Request Status Changed', 
    '<p>Dear,</p>\r\n                <p>Your Withdrawal Request #([[request_id]]) Status has been change to <b><i>[[status]]</i></b></p>\r\n\r\n                    <p>Comment: [[comment]] </p>\r\n                [[website_name]]<br />\r\n                Support Team</p>\r\n            ', 
    '', NULL, NULL, '', 'comment,status,request_id,firstname,lastname,email,username,website_name,website_logo,name'
  ), 
  (
    59, 'send_register_mail_api', 'User Registration (API)', 
    'Your Account Created Successfully On [[website_name]]', 
    '<p>Welcome to [[website_name]]</p>\r\n\r\n<p>Dear [[firstname]],</p>\r\n\r\n<p>Thanks for signing up [[website_name]].</p>\r\n\r\n<p>Your&nbsp;Login&nbsp;credentials:</p>\r\n\r\n<p>Username:&nbsp;<strong>[[username]]</strong><br />\r\nPassword:&nbsp;<strong>*******</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"[[website_url]]\">Login To [[website_name]]</a></p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'User Registration Successfully', 
    NULL, NULL, '<p>Dear Admin,</p>\r\n\r\n<p>New affiliate user Register on your site&nbsp;[[website_name]]</p>\r\n\r\n<p>Affiliate details:</p>\r\n\r\n<p>============</p>\r\n\r\n<p>[[firstname]]</p>\r\n\r\n<p>[[username]]</p>\r\n\r\n<p>[[email]]</p>\r\n\r\n<p><br />\r\n[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'firstname,lastname,email,username,website_url,website_name,website_logo,name'
  ), 
  (
    63, 'subscription_status_change', 
    'Subscription Status Changed', 
    'Subscription Status Changed', 
    '<p>Dear [[firstname]],</p>\r\n                <p>Your subscription status has been changed to [[status_text]]</p>\r\n                <p>Comment: [[comment]] </p>\r\n                [[website_name]]<br />\r\n                Support Team</p>', 
    '', NULL, NULL, '', 'comment,planname,price,expire_at,started_at,status_text,firstname,lastname,email,username,website_url,website_name,website_logo,name'
  ), 
  (
    64, 'subscription_buy', 'Subscription Buy', 
    'Subscription Buy', '<h2>Thanks for your order</h2>\r\n\r\n<p>Welcome to Prime. As a Prime member, enjoy these great benefits. If you have any questions, call us any time at or simply reply to this email.</p>\r\n', 
    'New Subscription Buy From [[firstname]] [[lastname]]', 
    NULL, NULL, '<h2>Thanks for your order</h2>\r\n\r\n<p>Welcome to Prime. As a Prime member, enjoy these great benefits. If you have any questions, call us any time at or simply reply to this email.</p>\r\n', 
    'planname,price,expire_at,started_at,firstname,lastname,email,username,website_url,website_name,website_logo,name'
  ), 
  (
    65, 'subscription_expire_notification', 
    'Subscription Expire Notification', 
    'Your Subscription Will Be Expired Soon.', 
    '<p>customText</p>\r\n', NULL, NULL, 
    NULL, NULL, 'planname,price,expire_at,started_at,firstname,lastname,email,username,website_url,website_name,website_logo,name'
  ), 
  (
    66, 'wallet_noti_on_hold_wallet', 
    'Wallet Status Change To On Hold', 
    '[[amount]] is put on hold in your wallet', 
    '<p>Dear [[name]],</p>\n        <p>Transactions #[[id]] status changed to [[new_status]]. amount is [[amount]]</p>\n        <p><br />\n        [[website_name]]<br />\n        Support Team</p>\n', 
    '', NULL, NULL, NULL, 'amount,id,name,new_status,user_email,website_name,website_logo,name'
  ), 
  (
    67, 'new_user_request', 'New User Request', 
    'User Registration Successfull', 
    '<p>Dear [[firstname]] [[lastname]],</p>\r\n\r\n<p>User account has been registered successfully on [[website_name]], please wait while system admin apporve&nbsp;your request.<br />\r\nWe will inform you once account has been approved, Thank You.</p>\r\n\r\n<p>Support Team<br />\r\n[[website_name]]</p>\r\n', 
    'New User Registration - Approval Pending', 
    NULL, NULL, '<p>Dear Admin,</p>\r\n\r\n<p>New user has been registered on [[website_name]], apporval is pending yet!</p>\r\n\r\n<p>User Details</p>\r\n\r\n<p>Name : [[firstname]][[lastname]]<br />\r\nEmail :&nbsp;[[email]]<br />\r\nUsername : [[username]]<br />\r\nSupport Team<br />\r\n[[website_name]]</p>', 
    'firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    68, 'new_user_approved', 'New User Request Approved', 
    'User Account Approved', '<p>Dear [[firstname]] [[lastname]],</p>\r\n\r\n<p>Your new user account registration request is accepted by admin, you can login and use services.</p>\r\n\r\n<p>[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'User Account Approved', NULL, NULL, 
    '<p>Dear Admin,</p>\r\n\r\n<p>You have approced registration request of user having</p>\r\n\r\n<p>Name : [[firstname]]&nbsp;[[lastname]]</p>\r\n\r\n<p>Email : [[email]]</p>\r\n\r\n<p>Username : [[username]]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Support Team</p>\r\n\r\n<p>[[website_name]]</p>\r\n', 
    'firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    69, 'new_user_declined', 'New User Request Declined', 
    'User Account Declined', '<p>Dear [[firstname]] [[lastname]],</p>\r\n\r\n<p>Your new user account registration request is declined by admin, for more information please contact supprt team</p>\r\n\r\n<p>[[website_name]]<br />\r\nSupport Team</p>\r\n', 
    'User Account Declined', NULL, NULL, 
    '<p>Dear Admin,</p>\r\n\r\n<p>You have declined registration request of user having</p>\r\n\r\n<p>Name : [[firstname]]&nbsp;[[lastname]]</p>\r\n\r\n<p>Email : [[email]]</p>\r\n\r\n<p>Username : [[username]]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Support Team</p>\r\n\r\n<p>[[website_name]]</p>\r\n', 
    'firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    70, 'vendor_product_status_0', 'Vendor Product Status Change To In Review', 
    'Product Status Change To In Review', 
    '<p>Dear,</p>\n                    <p>Product Status Change to In Review</p>\n                    <p>Name [[product_name]]</p>\n                    <p><br />\n                [[website_name]]<br />\n                Support Team</p>\n            ', 
    'Product Status Change To In Review', 
    '', '', '<p>Dear,</p>\n                    <p>Product Status Change to In Review</p>\n                    <p>Name [[product_name]]</p>\n                    <p><br />\n                [[website_name]]<br />\n                Support Team</p>\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,product_name,product_short_description,product_price,product_sku,product_id'
  ), 
  (
    71, 'new_vendor_deposit_request', 
    'New Vendor Deposit Request', 'New Deposit Request Added', 
    '<p>Dear [[firstname]] [[lastname]],</p>\r\n\r\n<p>Your deposit request of amount [[amount]] is added, if your balance not updated please contact support team</p>\r\n\r\n<p>[[website_name]]<br /> \r\n Support Team</p>', 
    'New Deposit Request Added', '', 
    '', '<p>Dear Admin,</p>\r\n\r\n<p>You have new deposit request of amount [[amount]] from vendor having</p>\r\n\r\n<p>Name : [[firstname]]&nbsp;[[lastname]]</p>\r\n\r\n<p>Email : [[email]]</p>\r\n\r\n<p>Username : [[username]]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Support Team</p>\r\n\r\n<p>[[website_name]]</p>', 
    'status,amount,firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    72, 'vendor_deposit_request_updated', 
    'Deposit Request Updated', 'Deposit Request Updated', 
    '<p>Dear [[firstname]] [[lastname]],</p>\r\n\r\n<p>Your deposit request of amount [[amount]] is updated to [[status]], if have any queries please contact support team</p>\r\n\r\n<p>[[website_name]]<br /> \r\n Support Team</p>', 
    'Deposit Request Updated', '', '', 
    '<p>Dear Admin,</p>\r\n\r\n<p>You have changed status of deposit request to [[status]] from vendor having</p>\r\n\r\n<p>Name : [[firstname]]&nbsp;[[lastname]]</p>\r\n\r\n<p>Email : [[email]]</p>\r\n\r\n<p>Username : [[username]]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Support Team</p>\r\n\r\n<p>[[website_name]]</p>', 
    'status,amount,firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    73, 'vendor_ads_status_2', 'Vendor Ads (Banner, Text, Link, Video) Status Change To Denied', 
    'Ads ([[type]]) Status Change To Denied', 
    '<p>Dear</p>\n                    <p>Ads - [[type]] Status Change to Denied </p>\n                    <p>Name [[name]]</p>\n                    <p>Username [[username]]</p>\n                    <p><br />\n                [[website_name]]<br />\n                Support Team</p>\n            ', 
    'Ads ([[type]]) Status Change To Denied', 
    NULL, NULL, '<p>Dear</p>\n                    <p>Ads - [[type]] Status Change to Denied </p>\n                    <p>Name [[name]]</p>\n                    <p>Username [[username]]</p>\n                    <p><br />\n                [[website_name]]<br />\n                Support Team</p>\n            ', 
    'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,name,type,tool_type'
  ), 
  (
    74, 'vendor_product_status_3', 'Vendor Product Status Change To Ask To Edit', 
    'Product Status Change To Ask To Edit', 
    '<p>Dear, [[username]]</p>\n                    <p>Product Status Change to Ask To Edit</p>\n                    <p>Name [[product_name]]</p>\n                    <p><br />\n                [[website_name]]<br />\n                Support Team</p>\n            ', 
    NULL, NULL, NULL, NULL, 'admin_last_message,vendor_last_message,firstname,lastname,email,username,website_name,website_logo,product_name,product_short_description,product_price,product_sku,product_id'
  ), 
  (
    75, 'user_level_changed', 'Change user level', 
    'Your user level changed', '<p>Dear,</p><p>Your level changed from [[from_level]] to [[to_level]]</p>                     <p><br>                 [[website_name]]<br>                 Support Team</p>             ', 
    '', '', '', '', 'from_level,to_level,website_name'
  ), 
  (
    76, 'ticket_created_email', 'Ticket Created Email', 
    'New ticket #[[ticket_id]] has been created', 
    '<p>Dear [[firstname]],&nbsp;</p><p><br></p><p>Your ticket has been created successfully on the system. Please note down below the ticket number for future reference.</p><p><br></p><p>Ticket ID:</p><p><span style=\"font-size: 1rem;\">[[ticket_id]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Ticket Status:</span><br></p><p><span style=\"font-size: 1rem;\">[[ticket_status]]</span><br></p><p><br></p><p><br></p><p>Subject :</p><p><span style=\"font-size: 1rem;\">[[ticket_subject]]</span><br></p><p><br></p><p><br></p><p>Message:</p><p><span style=\"font-size: 1rem;\">[[ticket_body]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">We will contact you very soon.</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Thank You</span><br></p><p><span style=\"font-size: 1rem;\">Support Team</span><br></p>', 
    'New user ticket #[[ticket_id]] has been created', 
    '', '', '<p>Dear Admin,Ã‚Â </p><p><br></p><p>The user has created a new ticket on your site [[website_name]].Ã‚Â <br></p><p><br></p><p>Username:</p><p><span style=\"font-size: 1rem;\">[[username]]</span><br></p><p><br></p><p>Email:</p><p><span style=\"font-size: 1rem;\">[[email]]</span><br></p><p><br></p><p>Name:</p><p><span style=\"font-size: 1rem;\">[[firstname]] [[lastname]]</span><br></p><p><br></p><p>Ticket ID:</p><p><span style=\"font-size: 1rem;\">[[ticket_id]]</span><br></p><p><br></p><p>Ticket Status:</p><p><span style=\"font-size: 1rem;\">[[ticket_status]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Subject :</span><br></p><p><span style=\"font-size: 1rem;\">[[ticket_subject]]</span><br></p><p><br></p><p><br></p><p>Message:</p><p><span style=\"font-size: 1rem;\">[[ticket_body]]</span><br></p><p><br></p><p><br></p><p>Thank You</p><p><span style=\"font-size: 1rem;\">[[website_name]]</span><br></p><p><br></p>', 
    'ticket_id,ticket_status,ticket_subject,ticket_body,ticket_datetime,firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    77, 'ticket_reply_email', 'Ticket Replied Email', 
    'You have a new reply on ticket #[[ticket_id]]', 
    '<p>Dear [[firstname]],Ã‚Â </p><p><br></p><p>You have a reply from the support team on your ticket #[[ticket_id]]</p><p><br></p><p>Ticket ID:</p><p><span style=\"font-size: 1rem;\">[[ticket_id]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Ticket Status:</span><br></p><p><span style=\"font-size: 1rem;\">[[ticket_status]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Subject :</span><br></p><p><span style=\"font-size: 1rem;\">[[ticket_subject]]</span><br></p><p><br></p><p>Message from the support team<br></p><p><span style=\"font-size: 1rem;\">[[ticket_reply_message]]</span></p><p><span style=\"font-size: 1rem;\"><br></span></p><p><span style=\"font-size: 1rem;\">Time</span></p><p><span style=\"font-size: 1rem;\">[[reply_datetime]]</span></p><p><span style=\"font-size: 1rem;\"><br></span></p><p><span style=\"font-size: 1rem;\">Thank You</span><br></p>', 
    'User added a new reply on ticket #[[ticket_id]]', 
    '', '', '<p>Dear Admin,Ã‚Â </p><p><br></p><p>User added a new reply on ticket #[[ticket_id]]</p><p><br></p><p>Username:</p><p><span style=\"font-size: 1rem;\">[[username]]</span><br></p><p><br></p><p>Email:</p><p><span style=\"font-size: 1rem;\">[[email]]</span><br></p><p><br></p><p>Name:</p><p><span style=\"font-size: 1rem;\">[[firstname]] [[lastname]]</span></p><p><br></p><p>Ticket ID:</p><p><span style=\"font-size: 1rem;\">[[ticket_id]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Ticket Status:</span><br></p><p><span style=\"font-size: 1rem;\">[[ticket_status]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Subject :</span><br></p><p><span style=\"font-size: 1rem;\">[[ticket_subject]]</span><br></p><p><br></p><p>Message from user<br></p><p><span style=\"font-size: 1rem;\">[[ticket_reply_message]]</span></p><p><span style=\"font-size: 1rem;\"><br></span></p><p><span style=\"font-size: 1rem;\">Time</span></p><p><span style=\"font-size: 1rem;\">[[reply_datetime]]</span></p><p><span style=\"font-size: 1rem;\"><br></span></p><p><span style=\"font-size: 1rem;\">Thank You</span></p>', 
    'ticket_id,ticket_status,ticket_subject,ticket_body,ticket_reply_message,reply_datetime,firstname,lastname,email,username,website_name,website_logo'
  ), 
  (
    78, 'ticket_status_email', 'Ticket Status Change Email', 
    'Ticket #[[ticket_id]] status has been updated', 
    '<p>Dear [[firstname]],&nbsp;</p><p><br></p><p>The status of a ticket having id [[ticket_id]] has been updated, please log in to [[website_name]] to see full details of the ticket.</p><p><br></p><p>Ticket ID:</p><p><span style=\"font-size: 1rem;\">[[ticket_id]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Ticket Status:</span><br></p><p><span style=\"font-size: 1rem;\">[[ticket_status]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Subject :</span><br></p><p><span style=\"font-size: 1rem;\">[[ticket_subject]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Thank You</span></p><p><span style=\"font-size: 1rem;\">Support Team<br></span><br></p>', 
    'Ticket #[[ticket_id]] status has been updated', 
    '', '', '<p>Dear Admin,&nbsp;</p><p><br></p><p>The status of the ticket having id [[ticket_id]] has been updated.</p><p><br></p><p>Username:</p><p><span style=\"font-size: 1rem;\">[[username]]</span><br></p><p><br></p><p>Email:</p><p><span style=\"font-size: 1rem;\">[[email]]</span><br></p><p><br></p><p>Name:</p><p><span style=\"font-size: 1rem;\">[[firstname]] [[lastname]]</span></p><p><span style=\"font-size: 1rem;\"><br></span></p><p>Ticket ID:</p><p><span style=\"font-size: 1rem;\">[[ticket_id]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Ticket Status:</span><br></p><p><span style=\"font-size: 1rem;\">[[ticket_status]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Subject :</span><br></p><p><span style=\"font-size: 1rem;\">[[ticket_subject]]</span><br></p><p><br></p><p><span style=\"font-size: 1rem;\">Thank You</span></p><p><span style=\"font-size: 1rem;\">Support Team<br></span></p>', 
    'ticket_id,ticket_status,ticket_subject,ticket_body,firstname,lastname,email,username,website_name,website_logo'
  );
CREATE TABLE `membership_buy_history` (
  `id` int(11) NOT NULL, 
  `buy_id` int(11) NOT NULL, 
  `status_id` int(11) NOT NULL, 
  `comment` varchar(255) CHARACTER SET utf8mb4 NOT NULL, 
  `created_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `membership_buy_history` (
  `id`, `buy_id`, `status_id`, `comment`, 
  `created_at`
) 
VALUES 
  (
    4, 7, 1, 'test', '2022-08-20 08:03:29'
  ), 
  (
    5, 8, 1, 'test', '2022-08-20 08:03:40'
  ), 
  (
    6, 9, 1, 'test', '2022-08-20 08:04:01'
  );
CREATE TABLE `membership_plans` (
  `id` int(11) NOT NULL, 
  `name` varchar(200) CHARACTER SET utf8mb4 NOT NULL, 
  `type` varchar(10) CHARACTER SET utf8mb4 NOT NULL, 
  `billing_period` varchar(15) CHARACTER SET utf8mb4 NOT NULL, 
  `price` double DEFAULT '0', 
  `special` double DEFAULT '0', 
  `custom_period` double DEFAULT '0', 
  `have_trail` int(11) DEFAULT NULL, 
  `free_trail` double DEFAULT '0', 
  `total_day` int(11) DEFAULT NULL, 
  `bonus` double NOT NULL, 
  `commission_sale_status` tinyint(1) NOT NULL DEFAULT '0', 
  `level_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0', 
  `status` int(11) NOT NULL DEFAULT '0', 
  `user_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1', 
  `campaign` int(10) UNSIGNED DEFAULT NULL, 
  `product` int(10) UNSIGNED DEFAULT NULL, 
  `description` text CHARACTER SET utf8mb4, 
  `plan_icon` varchar(100) CHARACTER SET utf8 DEFAULT NULL, 
  `label_text` varchar(80) CHARACTER SET utf8mb4 DEFAULT NULL, 
  `label_background` varchar(50) CHARACTER SET utf8mb4 DEFAULT '#28A745', 
  `label_color` varchar(50) CHARACTER SET utf8mb4 DEFAULT '#FFFFFF', 
  `sort_order` int(11) NOT NULL, 
  `updated_at` datetime DEFAULT NULL, 
  `created_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `membership_plans` (
  `id`, `name`, `type`, `billing_period`, 
  `price`, `special`, `custom_period`, 
  `have_trail`, `free_trail`, `total_day`, 
  `bonus`, `commission_sale_status`, 
  `level_id`, `status`, `user_type`, 
  `campaign`, `product`, `description`, 
  `plan_icon`, `label_text`, `label_background`, 
  `label_color`, `sort_order`, `updated_at`, 
  `created_at`
) 
VALUES 
  (
    1, 'Affiliate Trail', 'free', 'yearly', 
    0, 0, 7, 0, 0, 365, 0, 0, 0, 0, 1, NULL, NULL, 
    '<p>Affiliate Trail Package</p><p>Affiliate Trail Package</p><p>Affiliate Trail Package</p><p>Affiliate Trail Package</p><p>Affiliate Trail Package<br></p>', 
    NULL, 'Affiliate Trail Package', 
    '#0800FF', '#FF0000', 0, '2022-08-20 07:41:59', 
    '2020-12-18 16:22:55'
  ), 
  (
    2, '30 Days', 'paid', 'monthly', 10, 
    7, 0, 1, 3, 30, 2, 0, 0, 1, 1, NULL, NULL, 
    '<ul><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text<br></li></ul>', 
    NULL, '30 Days', '#AA00FF', '#FFFFFF', 
    0, '2020-12-20 10:56:46', '2020-12-20 10:56:46'
  ), 
  (
    3, '180 Days', 'paid', 'custom', 60, 
    49, 180, 1, 5, 180, 12, 0, 0, 1, 2, 100, 
    100, '<ul><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text<br></li></ul>', 
    NULL, '180 Days', '#FF0808', '#FFFFFF', 
    2, '2022-07-26 09:50:01', '2020-12-20 10:58:18'
  ), 
  (
    4, '365 Days', 'paid', 'yearly', 120, 
    99, 0, 1, 7, 365, 25, 0, 0, 1, 1, NULL, NULL, 
    '<ul><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text</li><li>Lorem Ipsum is simply dummied text</li></ul>', 
    NULL, '365 Days', '#0033FF', '#FFFFFF', 
    3, '2020-12-20 10:59:24', '2020-12-20 10:59:24'
  ), 
  (
    5, 'Vendor Trail', 'free', 'yearly', 
    0, 0, 7, 0, 0, 365, 0, 0, 0, 0, 2, 100, 100, 
    '<p>Vendor Trail Package</p><p>Vendor Trail Package</p><p>Vendor Trail Package</p><p>Vendor Trail Package</p><p>Vendor Trail Package<br></p>', 
    NULL, 'Vendor Trail Package', '#0000FF', 
    '#FFFFFF', 0, '2022-08-20 07:42:12', 
    '2022-07-26 18:57:06'
  );
CREATE TABLE `membership_user` (
  `id` int(11) NOT NULL, 
  `plan_id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `total_day` int(11) DEFAULT NULL, 
  `expire_at` datetime DEFAULT NULL, 
  `started_at` datetime NOT NULL, 
  `status_id` int(11) NOT NULL, 
  `is_active` int(11) NOT NULL, 
  `is_lifetime` int(11) NOT NULL DEFAULT '0', 
  `payment_method` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL, 
  `payment_details` text CHARACTER SET utf8mb4, 
  `total` double DEFAULT '0', 
  `bonus_commission` double DEFAULT '0', 
  `expire_mail_sent` int(11) NOT NULL DEFAULT '0', 
  `created_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `membership_user` (
  `id`, `plan_id`, `user_id`, `total_day`, 
  `expire_at`, `started_at`, `status_id`, 
  `is_active`, `is_lifetime`, `payment_method`, 
  `payment_details`, `total`, `bonus_commission`, 
  `expire_mail_sent`, `created_at`
) 
VALUES 
  (
    7, 5, 8, 365, '2023-08-20 08:03:29', 
    '2022-08-20 08:03:29', 1, 1, 0, 'Free by Admin', 
    '[]', 0, 0, 0, '2022-08-20 08:03:29'
  ), 
  (
    8, 1, 9, 365, '2023-08-20 08:03:40', 
    '2022-08-20 08:03:40', 1, 1, 0, 'Free by Admin', 
    '[]', 0, 0, 0, '2022-08-20 08:03:40'
  ), 
  (
    9, 1, 10, 365, '2023-08-20 08:04:01', 
    '2022-08-20 08:04:01', 1, 1, 0, 'Free by Admin', 
    '[]', 0, 0, 0, '2022-08-20 08:04:01'
  );
CREATE TABLE `meta_data` (
  `meta_id` int(11) NOT NULL, 
  `meta_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `meta_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL, 
  `notification_viewfor` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `notification_view_user_id` varchar(11) CHARACTER SET utf8 DEFAULT NULL, 
  `notification_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `notification_url` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `notification_description` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `notification_actionID` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `notification_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `store_contactus_description` longtext COLLATE utf8_unicode_ci, 
  `notification_is_read` int(11) NOT NULL, 
  `notification_ipaddress` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `notification_created_date` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `order` (
  `id` int(11) NOT NULL, 
  `status` int(11) NOT NULL, 
  `txn_id` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `address` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `country_id` int(11) NOT NULL, 
  `state_id` int(11) NOT NULL, 
  `city` varchar(50) CHARACTER SET utf8 NOT NULL, 
  `zip_code` varchar(20) CHARACTER SET utf8 NOT NULL, 
  `phone` varchar(15) CHARACTER SET utf8 NOT NULL, 
  `payment_method` varchar(50) CHARACTER SET utf8 NOT NULL, 
  `shipping_cost` float NOT NULL DEFAULT '0', 
  `tax_cost` float NOT NULL DEFAULT '0', 
  `total` float NOT NULL DEFAULT '0', 
  `coupon_discount` double NOT NULL, 
  `total_commition` double NOT NULL, 
  `shipping_charge` double NOT NULL, 
  `currency_code` varchar(10) CHARACTER SET utf8 NOT NULL, 
  `allow_shipping` int(11) NOT NULL DEFAULT '1', 
  `ip` varchar(30) CHARACTER SET utf8 DEFAULT NULL, 
  `country_code` varchar(20) CHARACTER SET utf8 NOT NULL, 
  `files` text CHARACTER SET utf8 NOT NULL, 
  `comment` text CHARACTER SET utf8 NOT NULL, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `orders_history` (
  `id` int(11) NOT NULL, 
  `order_id` int(11) NOT NULL, 
  `payment_mode` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'paypal', 
  `history_type` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'payment', 
  `paypal_status` varchar(20) CHARACTER SET utf8 NOT NULL, 
  `comment` text CHARACTER SET utf8 NOT NULL, 
  `created_at` datetime NOT NULL, 
  `order_status_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `order_products` (
  `id` int(11) NOT NULL, 
  `order_id` int(11) NOT NULL, 
  `product_id` int(11) NOT NULL, 
  `variation` text CHARACTER SET utf8 NOT NULL, 
  `refer_id` int(11) NOT NULL, 
  `vendor_id` int(11) DEFAULT NULL, 
  `form_id` int(11) NOT NULL, 
  `msrp` double NOT NULL, 
  `price` double NOT NULL, 
  `total` double NOT NULL, 
  `quantity` int(11) NOT NULL, 
  `commission` double NOT NULL, 
  `commission_type` varchar(20) CHARACTER SET utf8 NOT NULL, 
  `admin_commission` float DEFAULT '0', 
  `admin_commission_type` varchar(200) CHARACTER SET utf8 DEFAULT NULL, 
  `vendor_commission` float DEFAULT '0', 
  `vendor_commission_type` varchar(200) CHARACTER SET utf8 DEFAULT NULL, 
  `coupon_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `coupon_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `coupon_discount` double NOT NULL DEFAULT '0', 
  `allow_shipping` int(11) NOT NULL DEFAULT '1'
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `order_proof` (
  `id` int(11) NOT NULL, 
  `order_id` int(11) NOT NULL, 
  `proof` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `pagebuilder_theme` (
  `theme_id` int(11) NOT NULL, 
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `pagebuilder_theme_page` (
  `page_id` int(11) NOT NULL, 
  `theme_id` int(11) NOT NULL, 
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `new_tab` int(11) NOT NULL DEFAULT '0', 
  `meta_tag_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `meta_tag_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `meta_tag_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `sort_order` int(11) NOT NULL, 
  `status` int(11) NOT NULL, 
  `design` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `home_page` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `token` varchar(555) COLLATE utf8_unicode_ci NOT NULL, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `payment_detail` (
  `payment_id` int(11) NOT NULL, 
  `payment_bank_name` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `payment_account_number` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `payment_account_name` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `payment_ifsc_code` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `payment_status` int(11) NOT NULL, 
  `payment_ipaddress` varchar(20) CHARACTER SET utf8 NOT NULL, 
  `payment_created_date` datetime NOT NULL, 
  `payment_updated_date` datetime NOT NULL, 
  `payment_created_by` int(11) NOT NULL, 
  `payment_updated_by` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `paypal_accounts` (
  `id` int(11) NOT NULL, 
  `paypal_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL, 
  `user_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL, 
  `is_campaign_product` tinyint(1) NOT NULL DEFAULT '0', 
  `product_url` text COLLATE utf8_unicode_ci, 
  `product_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `product_description` text CHARACTER SET utf8 NOT NULL, 
  `product_short_description` varchar(500) CHARACTER SET utf8 NOT NULL, 
  `product_tags` text CHARACTER SET utf8 NOT NULL, 
  `product_msrp` double NOT NULL, 
  `product_price` double NOT NULL, 
  `product_sku` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `product_slug` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `product_share_count` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `product_click_count` int(11) DEFAULT '0', 
  `product_view_count` int(11) DEFAULT '0', 
  `product_sales_count` int(11) DEFAULT '0', 
  `product_featured_image` text CHARACTER SET utf8 NOT NULL, 
  `product_banner` text CHARACTER SET utf8 NOT NULL, 
  `product_video` text CHARACTER SET utf8 NOT NULL, 
  `product_type` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `product_commision_type` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `product_commision_value` double NOT NULL, 
  `product_status` int(11) NOT NULL, 
  `product_ipaddress` varchar(20) CHARACTER SET utf8 NOT NULL, 
  `product_created_date` datetime NOT NULL, 
  `product_updated_date` datetime NOT NULL, 
  `product_created_by` int(11) NOT NULL, 
  `product_updated_by` int(11) NOT NULL, 
  `product_click_commision_type` varchar(10) CHARACTER SET utf8 NOT NULL, 
  `product_click_commision_ppc` double NOT NULL, 
  `product_click_commision_per` double NOT NULL, 
  `product_total_commission` varchar(255) CHARACTER SET utf8 DEFAULT '0', 
  `product_recursion_type` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `product_recursion` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `recursion_custom_time` bigint(20) NOT NULL, 
  `recursion_endtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `view` int(11) NOT NULL, 
  `on_store` int(11) NOT NULL DEFAULT '0', 
  `downloadable_files` text CHARACTER SET utf8 NOT NULL, 
  `allow_shipping` int(11) NOT NULL DEFAULT '1', 
  `allow_upload_file` int(11) NOT NULL, 
  `allow_comment` int(11) NOT NULL, 
  `state_id` int(11) DEFAULT NULL, 
  `product_avg_rating` int(11) NOT NULL DEFAULT '0', 
  `product_variations` text CHARACTER SET utf8 NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `productslog` (
  `productslog_id` int(11) NOT NULL, 
  `productslog_user_id` int(11) DEFAULT NULL, 
  `products_id` int(11) DEFAULT NULL, 
  `productslog_status` int(11) DEFAULT NULL, 
  `productslog_click` int(11) DEFAULT NULL, 
  `productslog_view` int(11) DEFAULT NULL, 
  `productslog_referrer` text CHARACTER SET utf8, 
  `productslog_user_agent` text CHARACTER SET utf8, 
  `productslog_os` text CHARACTER SET utf8, 
  `productslog_browser` text CHARACTER SET utf8, 
  `productslog_isp` text CHARACTER SET utf8, 
  `productslog_ipaddress` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `productslog_created_by` int(11) DEFAULT NULL, 
  `productslog_updated_by` int(11) DEFAULT NULL, 
  `productslog_created` datetime NOT NULL, 
  `productslog_updated` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `product_action` (
  `action_id` int(11) NOT NULL, 
  `action_type` text COLLATE utf8_unicode_ci, 
  `product_id` int(11) DEFAULT NULL, 
  `user_id` int(11) DEFAULT NULL, 
  `user_ip` text COLLATE utf8_unicode_ci, 
  `viewer_id` int(11) NOT NULL, 
  `counter` int(11) NOT NULL, 
  `pay_commition` int(11) NOT NULL, 
  `created_at` datetime NOT NULL, 
  `country_code` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `product_action_admin` (
  `action_id` int(11) NOT NULL, 
  `action_type` text COLLATE utf8_unicode_ci, 
  `product_id` int(11) DEFAULT NULL, 
  `user_id` int(11) DEFAULT NULL, 
  `user_ip` text COLLATE utf8_unicode_ci, 
  `viewer_id` int(11) NOT NULL, 
  `counter` int(11) NOT NULL, 
  `pay_commition` int(11) NOT NULL, 
  `created_at` datetime NOT NULL, 
  `country_code` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `product_affiliate` (
  `id` int(11) NOT NULL, 
  `product_id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `admin_sale_commission_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL, 
  `admin_commission_value` float DEFAULT '0', 
  `admin_click_commission_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL, 
  `admin_click_amount` float DEFAULT '0', 
  `admin_click_count` int(11) DEFAULT NULL, 
  `affiliate_sale_commission_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL, 
  `affiliate_commission_value` float DEFAULT '0', 
  `affiliate_click_commission_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL, 
  `affiliate_click_count` int(11) DEFAULT NULL, 
  `affiliate_click_amount` float DEFAULT '0', 
  `comment` text CHARACTER SET latin1
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL, 
  `product_id` int(11) NOT NULL, 
  `category_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `product_media_upload` (
  `product_media_upload_id` int(11) NOT NULL, 
  `product_id` int(11) NOT NULL, 
  `product_media_upload_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `product_media_upload_path` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `product_media_upload_video_image` varchar(255) CHARACTER SET utf8 DEFAULT 'no-image.jpg', 
  `product_media_upload_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `product_media_upload_ipaddress` varchar(20) CHARACTER SET utf8 DEFAULT NULL, 
  `product_media_upload_created_date` datetime NOT NULL, 
  `product_media_upload_created_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `product_media_upload_os` text CHARACTER SET utf8, 
  `product_media_upload_browser` text CHARACTER SET utf8, 
  `product_media_upload_isp` mediumtext CHARACTER SET utf8
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `product_meta` (
  `product_meta_id` int(11) NOT NULL, 
  `related_product_id` int(11) NOT NULL, 
  `meta_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL, 
  `meta_value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL, 
  `rating_user_id` int(11) DEFAULT NULL, 
  `rating_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `rating_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `products_id` int(11) DEFAULT NULL, 
  `rating_status` int(11) DEFAULT NULL, 
  `rating_number` int(11) NOT NULL, 
  `rating_comments` text CHARACTER SET utf8, 
  `rating_referrer` text CHARACTER SET utf8, 
  `rating_user_agent` text CHARACTER SET utf8, 
  `rating_os` text CHARACTER SET utf8, 
  `rating_browser` text CHARACTER SET utf8, 
  `rating_isp` text CHARACTER SET utf8, 
  `rating_ipaddress` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `rating_created_by` int(11) DEFAULT NULL, 
  `rating_updated_by` int(11) DEFAULT NULL, 
  `rating_created` datetime NOT NULL, 
  `rating_updated` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `refer_market_action` (
  `id` int(11) NOT NULL, 
  `affiliate_id` int(11) DEFAULT NULL, 
  `user_id` int(11) DEFAULT NULL, 
  `user_ip` text CHARACTER SET utf8, 
  `commission` double(22, 0) NOT NULL DEFAULT '0', 
  `count_for` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `refer_product_action` (
  `action_id` int(11) NOT NULL, 
  `action_type` text COLLATE utf8_unicode_ci, 
  `product_id` int(11) DEFAULT NULL, 
  `user_id` int(11) DEFAULT NULL, 
  `user_ip` text COLLATE utf8_unicode_ci, 
  `viewer_id` int(11) NOT NULL, 
  `counter` int(11) NOT NULL, 
  `pay_commition` int(11) NOT NULL, 
  `created_at` datetime NOT NULL, 
  `count_for` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL, 
  `setting_key` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `setting_value` mediumtext CHARACTER SET utf8, 
  `setting_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `setting_status` int(11) NOT NULL, 
  `setting_ipaddress` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `setting_is_default` int(11) NOT NULL DEFAULT '0'
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `setting` (
  `setting_id`, `setting_key`, `setting_value`, 
  `setting_type`, `setting_status`, 
  `setting_ipaddress`, `setting_is_default`
) 
VALUES 
  (
    1, 'admin_side_bar_color', '#FFFFFF', 
    'theme', 1, '194.5.53.204', 0
  ), 
  (
    2, 'admin_side_bar_scroll_color', 
    '#ff846e', 'theme', 1, '194.5.53.204', 
    0
  ), 
  (
    3, 'admin_side_bar_text_color', '#686868', 
    'theme', 1, '194.5.53.204', 0
  ), 
  (
    4, 'admin_side_bar_text_hover_color', 
    '#ff846e', 'theme', 1, '194.5.53.204', 
    0
  ), 
  (
    5, 'admin_top_bar_color', '#ffffff', 
    'theme', 1, '194.5.53.204', 0
  ), 
  (
    6, 'admin_footer_color', '#f2f3f5', 
    'theme', 1, '194.5.53.204', 0
  ), 
  (
    7, 'admin_logo_color', '#ff846e', 
    'theme', 1, '194.5.53.204', 0
  ), 
  (
    8, 'user_side_bar_color', '#ffffff', 
    'theme', 1, '194.5.53.204', 0
  ), 
  (
    9, 'user_side_bar_text_color', '#3f567a', 
    'theme', 1, '194.5.53.204', 0
  ), 
  (
    10, 'user_side_bar_clock_text_color', 
    '#5ec394', 'theme', 1, '194.5.53.204', 
    0
  ), 
  (
    11, 'user_side_bar_text_hover_color', 
    '#5ec394', 'theme', 1, '194.5.53.204', 
    0
  ), 
  (
    12, 'user_top_bar_color', '#ffffff', 
    'theme', 1, '194.5.53.204', 0
  ), 
  (
    13, 'user_footer_color', '#5ec394', 
    'theme', 1, '194.5.53.204', 0
  ), 
  (
    14, 'admin_side_font', 'PT Sans', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    15, 'user_side_font', 'Poppins', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    16, 'front_side_font', 'sans-serif', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    17, 'cart_store_side_font', 'Jost', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    18, 'sales_store_side_font', 'Roboto', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    19, 'status', '1', 'referlevel', 1, 
    '194.5.53.47', 0
  ), 
  (
    20, 'marketvendorstatus', '1', 'market_vendor', 
    1, '141.11.28.249', 0
  ), 
  (
    21, 'storestatus', '1', 'vendor', 1, 
    '141.11.28.249', 0
  ), 
  (
    22, 'status', '1', 'store', 1, '141.11.28.249', 
    0
  ), 
  (
    23, 'status', '1', 'membership', 1, 
    '141.11.28.206', 0
  ), 
  (
    24, 'depositstatus', '0', 'vendor', 
    1, '141.11.28.249', 0
  ), 
  (
    25, 'status', '1', 'award_level', 1, 
    '141.11.28.249', 0
  ), 
  (
    26, 'commission_type', '', 'market_vendor', 
    1, '141.11.28.249', 0
  ), 
  (
    27, 'commission_sale', '', 'market_vendor', 
    1, '141.11.28.249', 0
  ), 
  (
    28, 'click_allow', 'single', 'market_vendor', 
    1, '141.11.28.249', 0
  ), 
  (
    29, 'commission_number_of_click', 
    '', 'market_vendor', 1, '141.11.28.249', 
    0
  ), 
  (
    30, 'commission_click_commission', 
    '', 'market_vendor', 1, '141.11.28.249', 
    0
  ), 
  (
    31, 'admin_click_count', '', 'vendor', 
    1, '141.11.28.249', 0
  ), 
  (
    32, 'admin_click_amount', '', 'vendor', 
    1, '141.11.28.249', 0
  ), 
  (
    33, 'admin_sale_commission_type', 
    'percentage', 'vendor', 1, '141.11.28.249', 
    0
  ), 
  (
    34, 'admin_commission_value', '', 
    'vendor', 1, '141.11.28.249', 0
  ), 
  (
    35, 'vendor_min_deposit', '100', 'site', 
    1, '141.11.28.249', 0
  ), 
  (
    36, 'admin_sound_status', '1', 'live_dashboard', 
    1, '141.11.28.249', 0
  ), 
  (
    37, 'admin_action_status', '1', 'live_dashboard', 
    1, '141.11.28.249', 0
  ), 
  (
    38, 'admin_integration_order_status', 
    '1', 'live_dashboard', 1, '141.11.28.249', 
    0
  ), 
  (
    39, 'admin_affiliate_register_status', 
    '1', 'live_dashboard', 1, '141.11.28.249', 
    0
  ), 
  (
    40, 'admin_local_store_order_status', 
    '1', 'live_dashboard', 1, '141.11.28.249', 
    0
  ), 
  (
    41, 'admin_data_load_interval', '10', 
    'live_dashboard', 1, '141.11.28.249', 
    0
  ), 
  (
    42, 'notificationbefore', '10', 'membership', 
    1, '141.11.28.206', 0
  ), 
  (
    43, 'default_affiliate_plan_id', 
    '1', 'membership', 1, '141.11.28.206', 
    0
  ), 
  (
    44, 'default_vendor_plan_id', '5', 
    'membership', 1, '141.11.28.206', 
    0
  ), 
  (
    45, 'language_status', '1', 'store', 
    1, '', 0
  ), 
  (
    46, 'name', 'AffiliatePro SaaS', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    47, 'notify_email', '', 'site', 1, '194.5.53.204', 
    0
  ), 
  (
    48, 'session_timeout', '', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    49, 'user_session_timeout', '', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    50, 'footer', 'AffiliatePro SaaS Platform', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    51, 'time_zone', 'Africa/Abidjan', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    52, 'admin-side-logo', '', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    53, 'custom_logo_size', '0', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    54, 'log_custom_width', '', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    55, 'log_custom_height', '', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    56, 'front-side-themes-logo', '', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    57, 'front_custom_logo_size', '0', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    58, 'front_log_custom_width', '', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    59, 'front_log_custom_height', '', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    60, 'favicon', '', 'site', 1, '194.5.53.204', 
    0
  ), 
  (
    61, 'meta_description', '', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    62, 'meta_keywords', '', 'site', 1, 
    '194.5.53.204', 0
  ), 
  (
    63, 'meta_author', '', 'site', 1, '194.5.53.204', 
    0
  ), 
  (
    64, 'google_analytics', '', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    65, 'faceboook_pixel', '', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    66, 'fbmessager_script', '', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    67, 'global_script', '', 'site', 1, 
    '194.5.53.204', 0
  ), 
  (
    68, 'notification_sound', 'notify4.mp4', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    69, 'affiliate_tracking_place', '0', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    70, 'hide_currency_from', '', 'site', 
    1, '194.5.53.204', 0
  ), 
  (
    71, 'global_script_status', '[]', 
    'site', 1, '194.5.53.204', 0
  ), 
  (
    72, 'admin_url', '', 'security', 1, 
    '194.5.53.204', 0
  ), 
  (
    73, 'front_url', '', 'security', 1, 
    '194.5.53.204', 0
  ), 
  (
    74, 'registration_status', '1', 'store', 
    1, '194.5.53.204', 0
  ), 
  (
    75, 'affiliate_cookie', '30', 'store', 
    1, '194.5.53.204', 0
  ), 
  (
    76, 'mail_type', 'smtp', 'email', 1, 
    '194.5.53.204', 0
  ), 
  (
    77, 'from_email', '', 'email', 1, '194.5.53.204', 
    0
  ), 
  (
    78, 'from_name', '', 'email', 1, '194.5.53.204', 
    0
  ), 
  (
    79, 'smtp_hostname', '', 'email', 1, 
    '194.5.53.204', 0
  ), 
  (
    80, 'smtp_username', '', 'email', 1, 
    '194.5.53.204', 0
  ), 
  (
    81, 'smtp_password', '', 'email', 1, 
    '194.5.53.204', 0
  ), 
  (
    82, 'smtp_port', '', 'email', 1, '194.5.53.204', 
    0
  ), 
  (
    83, 'smtp_crypto', '', 'email', 1, '194.5.53.204', 
    0
  ), 
  (
    84, 'unsubscribed_page_title', '', 
    'email', 1, '194.5.53.204', 0
  ), 
  (
    85, 'unsubscribed_page_message', 
    '', 'email', 1, '194.5.53.204', 0
  ), 
  (
    86, 'heading', 'Terms Content', 'tnc', 
    1, '194.5.53.204', 0
  ), 
  (
    87, 'content', '<p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span></p><p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span></p><p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span></p><p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span></p><p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span></p><p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span></p><p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span></p><p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span></p><p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span></p><p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span></p><p>Terms Terms TermsÃ‚Â <span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms TermsÃ‚Â </span><span>Terms Terms Terms</span><span><br></span><span><br></span><span><br></span><span><br></span><span><br></span><span><br></span><span><br></span><span><br></span><span><br></span><span><br></span></p><p><span xss=\"removed\"><br></span><span xss=\"removed\"><br></span><span xss=\"removed\"><br></span><span xss=\"removed\"><br></span><span xss=\"removed\"><br></span><span xss=\"removed\"><br></span></p>', 
    'tnc', 1, '194.5.53.204', 0
  ), 
  (
    88, 'sitekey', '', 'googlerecaptcha', 
    1, '194.5.53.204', 0
  ), 
  (
    89, 'secretkey', '', 'googlerecaptcha', 
    1, '194.5.53.204', 0
  ), 
  (
    90, 'force_ssl', '1', 'security', 1, 
    '', 0
  ), 
  (
    91, 'front_template', 'custom_9', 
    'login', 1, '141.11.28.249', 0
  ), 
  (
    92, 'shipping_in_limited', '0', 'shipping_setting', 
    1, '141.11.28.249', 0
  ), 
  (
    93, 'shipping_error_message', 'YOUR COUNTRY DOES NOT SUPPORT OUR SHIPPING METHODS', 
    'shipping_setting', 1, '141.11.28.249', 
    0
  ), 
  (
    94, 'cost', '[]', 'shipping_setting', 
    1, '141.11.28.249', 0
  ), 
  (
    95, 'tax_status', '0', 'tax_setting', 
    1, '141.11.28.249', 0
  ), 
  (
    96, 'common_tax_percentage', '', 'tax_setting', 
    1, '141.11.28.249', 0
  ), 
  (
    97, 'cost', '[]', 'tax_setting', 1, 
    '141.11.28.249', 0
  ), 
  (
    98, 'name', 'Marketplace', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    99, 'theme', '0', 'store', 1, '141.11.28.249', 
    0
  ), 
  (
    100, 'google_analytics', '', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    101, 'footer', 'Welcome To Our Marketplace', 
    'store', 1, '141.11.28.249', 0
  ), 
  (
    102, 'contact_us_map', '', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    103, 'address', '', 'store', 1, '141.11.28.249', 
    0
  ), 
  (
    104, 'email', '', 'store', 1, '141.11.28.249', 
    0
  ), 
  (
    105, 'contact_number', '', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    106, 'is_variation_filter', '1', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    107, 'top_tags_limit', '10', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    108, 'homepage_banner', '{\"title\":\"\",\"content\":\"\",\"button_text\":\"\",\"button_link\":\"\"}', 
    'store', 1, '141.11.28.249', 0
  ), 
  (
    109, 'homepage_bottom_section', '{\"content\":\"\"}', 
    'store', 1, '141.11.28.249', 0
  ), 
  (
    110, 'classified_banner_title', '', 
    'store', 1, '141.11.28.249', 0
  ), 
  (
    111, 'classified_banner_subtitle', 
    '', 'store', 1, '141.11.28.249', 0
  ), 
  (
    112, 'about_content', '', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    113, 'contact_content', '', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    114, 'policy_content', '', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    115, 'homepage_slider', '[]', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    116, 'homepage_features', '[]', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    117, 'bs_cards', '[]', 'store', 1, '141.11.28.249', 
    0
  ), 
  (
    118, 'social_links', '[]', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    119, 'custom_page', '[]', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    120, 'per_task', 'null', 'store', 1, 
    '141.11.28.249', 0
  ), 
  (
    121, 'footer_menu', '[]', 'store', 
    1, '141.11.28.249', 0
  ), 
  (
    122, 'click_allow', 'single', 'productsetting', 
    1, '141.11.28.249', 0
  ), 
  (
    123, 'product_commission_type', 'percentage', 
    'productsetting', 1, '141.11.28.249', 
    0
  ), 
  (
    124, 'product_commission', '10', 'productsetting', 
    1, '141.11.28.249', 0
  ), 
  (
    125, 'product_ppc', '1', 'productsetting', 
    1, '141.11.28.249', 0
  ), 
  (
    126, 'product_noofpercommission', 
    '1', 'productsetting', 1, '141.11.28.249', 
    0
  ), 
  (
    127, 'product_recursion', '', 'productsetting', 
    1, '141.11.28.249', 0
  ), 
  (
    128, 'recursion_custom_time', '0', 
    'productsetting', 1, '141.11.28.249', 
    0
  ), 
  (
    129, 'recursion_endtime', NULL, 'productsetting', 
    1, '141.11.28.249', 0
  ), 
  (
    130, 'product_commission_type', 'percentage', 
    'formsetting', 1, '141.11.28.249', 
    0
  ), 
  (
    131, 'product_commission', '5', 'formsetting', 
    1, '141.11.28.249', 0
  ), 
  (
    132, 'product_ppc', '1', 'formsetting', 
    1, '141.11.28.249', 0
  ), 
  (
    133, 'product_noofpercommission', 
    '1', 'formsetting', 1, '141.11.28.249', 
    0
  ), 
  (
    134, 'form_recursion', '', 'formsetting', 
    1, '141.11.28.249', 0
  ), 
  (
    135, 'recursion_custom_time', '0', 
    'formsetting', 1, '141.11.28.249', 
    0
  ), 
  (
    136, 'recursion_endtime', NULL, 'formsetting', 
    1, '141.11.28.249', 0
  ), 
  (
    137, 'status', '0', 'order_comment', 
    1, '141.11.28.249', 0
  ), 
  (
    138, 'title', '[]', 'order_comment', 
    1, '141.11.28.249', 0
  ), 
  (
    139, 'store_mode', 'cart', 'store', 
    1, '', 0
  ), 
  (
    140, 'tickets_filter_status', '', 
    'site', 1, '112.134.185.157', 0
  ), 
  (
    141, 'heading', 'This is front side theme heading', 
    'loginclient', 1, '141.11.28.208', 
    0
  ), 
  (
    142, 'content', 'This is our home page content This is our home page content This is our home page content This is our home page content This is our home page content This is our home page content This is our home page content This is our home page content This is our home page content This is our home page content This is our home page content This is our home page content', 
    'loginclient', 1, '141.11.28.208', 
    0
  ), 
  (
    143, 'about_content', 'This is our about us page content This is our about us page content This is our about us page content This is our about us page content This is our about us page content This is our about us page content This is our about us page content This is our about us page content This is our about us page content This is our about us page content This is our about us page content This is our about us page content This is our about us page content This is our about us page content ', 
    'loginclient', 1, '141.11.28.208', 
    0
  ), 
  (
    144, 'is_install', '1', 'withdrawalpayment_bank_transfer', 
    1, '141.11.28.208', 0
  ), 
  (
    145, 'is_install', '1', 'withdrawalpayment_paypal', 
    1, '141.11.28.208', 0
  ), 
  (
    146, 'status', '1', 'withdrawalpayment_bank_transfer', 
    1, '141.11.28.216', 0
  ), 
  (
    147, 'withdrawal_proof', '0', 'withdrawalpayment_bank_transfer', 
    1, '141.11.28.216', 0
  ), 
  (
    148, 'bt_custom_field', '[\"Bank Name\",\"Account number\"]', 
    'withdrawalpayment_bank_transfer', 
    1, '141.11.28.216', 0
  ), 
  (
    149, 'response_validate', '[\"Yes\",\"Yes\"]', 
    'withdrawalpayment_bank_transfer', 
    1, '141.11.28.216', 0
  ), 
  (
    150, 'status', '1', 'withdrawalpayment_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    151, 'ClientID', '', 'withdrawalpayment_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    152, 'ClientSecret', '', 'withdrawalpayment_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    153, 'denied_status_id', '0', 'withdrawalpayment_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    154, 'pending_status_id', '0', 'withdrawalpayment_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    155, 'processing_status_id', '0', 
    'withdrawalpayment_paypal', 1, '141.11.28.216', 
    0
  ), 
  (
    156, 'success_status_id', '0', 'withdrawalpayment_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    157, 'canceled_status_id', '0', 'withdrawalpayment_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    158, 'default_action_status', '0', 
    'referlevel', 1, '141.11.28.216', 
    0
  ), 
  (
    159, 'default_external_order_status', 
    '0', 'referlevel', 1, '141.11.28.216', 
    0
  ), 
  (
    160, 'wallet_min_amount', '5', 'site', 
    1, '141.11.28.216', 0
  ), 
  (
    161, 'wallet_min_message', '<p>MinimumÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â <span>Withdraw</span><span>ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â is 5</span></p>', 
    'site', 1, '141.11.28.216', 0
  ), 
  (
    162, 'is_install', '1', 'payment_gateway_bank_transfer', 
    1, '141.11.28.216', 0
  ), 
  (
    163, 'is_install', '1', 'payment_gateway_cod', 
    1, '141.11.28.216', 0
  ), 
  (
    164, 'is_install', '1', 'payment_gateway_flutterwave', 
    1, '141.11.28.216', 0
  ), 
  (
    165, 'is_install', '1', 'payment_gateway_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    166, 'is_install', '1', 'payment_gateway_paypalstandard', 
    1, '141.11.28.216', 0
  ), 
  (
    167, 'is_install', '1', 'payment_gateway_paystack', 
    1, '141.11.28.216', 0
  ), 
  (
    168, 'is_install', '1', 'payment_gateway_razorpay', 
    1, '141.11.28.216', 0
  ), 
  (
    169, 'is_install', '1', 'payment_gateway_skrill', 
    1, '141.11.28.216', 0
  ), 
  (
    170, 'is_install', '1', 'payment_gateway_stripe', 
    1, '141.11.28.216', 0
  ), 
  (
    171, 'is_install', '1', 'payment_gateway_toyyibpay', 
    1, '141.11.28.216', 0
  ), 
  (
    172, 'is_install', '1', 'payment_gateway_xendit', 
    1, '141.11.28.216', 0
  ), 
  (
    173, 'is_install', '1', 'payment_gateway_yappy', 
    1, '141.11.28.216', 0
  ), 
  (
    174, 'is_install', '1', 'payment_gateway_yookassa', 
    1, '141.11.28.216', 0
  ), 
  (
    175, 'status', '1', 'payment_gateway_store_bank_transfer', 
    1, '136.144.17.201', 1
  ), 
  (
    176, 'status', '1', 'payment_gateway_deposit_bank_transfer', 
    1, '136.144.17.201', 1
  ), 
  (
    177, 'status', '1', 'payment_gateway_membership_bank_transfer', 
    1, '136.144.17.201', 1
  ), 
  (
    178, 'status', '1', 'payment_gateway_membership_cod', 
    1, '141.11.28.216', 0
  ), 
  (
    179, 'status', '1', 'payment_gateway_deposit_cod', 
    1, '141.11.28.216', 0
  ), 
  (
    180, 'status', '1', 'payment_gateway_store_cod', 
    1, '141.11.28.216', 0
  ), 
  (
    181, 'status', '1', 'payment_gateway_store_flutterwave', 
    1, '141.11.28.216', 0
  ), 
  (
    182, 'status', '1', 'payment_gateway_deposit_flutterwave', 
    1, '141.11.28.216', 0
  ), 
  (
    183, 'status', '1', 'payment_gateway_membership_flutterwave', 
    1, '141.11.28.216', 0
  ), 
  (
    184, 'status', '1', 'payment_gateway_store_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    185, 'status', '1', 'payment_gateway_store_paypalstandard', 
    1, '141.11.28.216', 0
  ), 
  (
    186, 'status', '1', 'payment_gateway_store_paystack', 
    1, '141.11.28.216', 0
  ), 
  (
    187, 'status', '1', 'payment_gateway_deposit_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    188, 'status', '1', 'payment_gateway_deposit_paypalstandard', 
    1, '141.11.28.216', 0
  ), 
  (
    189, 'status', '1', 'payment_gateway_deposit_paystack', 
    1, '141.11.28.216', 0
  ), 
  (
    190, 'status', '1', 'payment_gateway_membership_paypal', 
    1, '141.11.28.216', 0
  ), 
  (
    191, 'status', '1', 'payment_gateway_membership_paypalstandard', 
    1, '141.11.28.216', 0
  ), 
  (
    192, 'status', '1', 'payment_gateway_membership_paystack', 
    1, '141.11.28.216', 0
  ), 
  (
    193, 'status', '1', 'payment_gateway_store_razorpay', 
    1, '141.11.28.216', 0
  ), 
  (
    194, 'status', '1', 'payment_gateway_store_skrill', 
    1, '141.11.28.216', 0
  ), 
  (
    195, 'status', '1', 'payment_gateway_store_stripe', 
    1, '141.11.28.216', 0
  ), 
  (
    196, 'status', '1', 'payment_gateway_store_toyyibpay', 
    1, '141.11.28.216', 0
  ), 
  (
    197, 'status', '1', 'payment_gateway_store_xendit', 
    1, '141.11.28.216', 0
  ), 
  (
    198, 'status', '1', 'payment_gateway_store_yappy', 
    1, '141.11.28.216', 0
  ), 
  (
    199, 'status', '1', 'payment_gateway_deposit_razorpay', 
    1, '141.11.28.216', 0
  ), 
  (
    200, 'status', '1', 'payment_gateway_deposit_skrill', 
    1, '141.11.28.216', 0
  ), 
  (
    201, 'status', '1', 'payment_gateway_deposit_stripe', 
    1, '141.11.28.216', 0
  ), 
  (
    202, 'status', '1', 'payment_gateway_deposit_toyyibpay', 
    1, '141.11.28.216', 0
  ), 
  (
    203, 'status', '1', 'payment_gateway_deposit_xendit', 
    1, '141.11.28.216', 0
  ), 
  (
    204, 'status', '1', 'payment_gateway_deposit_yappy', 
    1, '141.11.28.216', 0
  ), 
  (
    205, 'status', '1', 'payment_gateway_store_yookassa', 
    1, '141.11.28.216', 0
  ), 
  (
    206, 'status', '1', 'payment_gateway_deposit_yookassa', 
    1, '141.11.28.216', 0
  ), 
  (
    207, 'status', '1', 'payment_gateway_membership_yookassa', 
    1, '141.11.28.216', 0
  ), 
  (
    208, 'status', '1', 'payment_gateway_membership_yappy', 
    1, '141.11.28.216', 0
  ), 
  (
    209, 'status', '1', 'payment_gateway_membership_xendit', 
    1, '141.11.28.216', 0
  ), 
  (
    210, 'status', '1', 'payment_gateway_membership_toyyibpay', 
    1, '141.11.28.216', 0
  ), 
  (
    211, 'status', '1', 'payment_gateway_membership_stripe', 
    1, '141.11.28.216', 0
  ), 
  (
    212, 'status', '1', 'payment_gateway_membership_skrill', 
    1, '141.11.28.216', 0
  ), 
  (
    213, 'status', '1', 'payment_gateway_membership_razorpay', 
    1, '141.11.28.216', 0
  ), 
  (
    214, 'menu_on_front', '1', 'store', 
    1, '::1', 0
  ), 
  (
    215, 'menu_on_front_blank', '1', 'store', 
    1, '::1', 0
  ), 
  (
    216, 'registration_builder', '[{\"type\":\"header\",\"label\":\"Firstname\"},{\"type\":\"header\",\"label\":\"Lastname\"},{\"type\":\"text\",\"required\":\"true\",\"label\":\"Mobile Phone\",\"className\":\"form-control\",\"name\":\"text-1658449628707\",\"mobile_validation\":\"true\"},{\"type\":\"header\",\"label\":\"Email\"},{\"type\":\"header\",\"label\":\"Username\"},{\"type\":\"header\",\"label\":\"Password\"},{\"type\":\"header\",\"label\":\"Confirm_password\"}]', 
    'registration_builder', 1, '141.11.28.249', 
    0
  ), 
  (
    217, 'proof', '0', 'payment_gateway_bank_transfer', 
    1, '136.144.17.201', 0
  ), 
  (
    218, 'bank_names', '[\"Bank Details\"]', 
    'payment_gateway_bank_transfer', 
    1, '136.144.17.201', 0
  ), 
  (
    219, 'bank_details', 'Transfer the total order to the bank details:\r\nBank name: xxxxxx\r\nAccount Name: xxxxxx\r\nAccount number: xxxxxxx\r\n', 
    'payment_gateway_bank_transfer', 
    1, '136.144.17.201', 0
  ), 
  (
    220, 'additional_bank_details', '[]', 
    'payment_gateway_bank_transfer', 
    1, '136.144.17.201', 0
  ), 
  (
    221, 'levels', '3', 'referlevel', 1, 
    '194.5.53.47', 0
  ), 
  (
    222, 'reg_comission_type', 'disabled', 
    'referlevel', 1, '194.5.53.47', 0
  ), 
  (
    223, 'reg_comission_custom_amt', 
    '0', 'referlevel', 1, '194.5.53.47', 
    0
  ), 
  (
    224, 'sale_type', 'percentage', 'referlevel', 
    1, '194.5.53.47', 0
  ), 
  (
    225, 'disabled_for', '[]', 'referlevel', 
    1, '194.5.53.47', 0
  ), 
  (
    226, 'reg_commission', '1', 'referlevel_1', 
    1, '194.5.53.47', 0
  ), 
  (
    227, 'sale_commition', '1', 'referlevel_1', 
    1, '194.5.53.47', 0
  ), 
  (
    228, 'commition', '1', 'referlevel_1', 
    1, '194.5.53.47', 0
  ), 
  (
    229, 'ex_commition', '1', 'referlevel_1', 
    1, '194.5.53.47', 0
  ), 
  (
    230, 'ex_action_commition', '1', 'referlevel_1', 
    1, '194.5.53.47', 0
  ), 
  (
    231, 'reg_commission', '2', 'referlevel_2', 
    1, '194.5.53.47', 0
  ), 
  (
    232, 'sale_commition', '2', 'referlevel_2', 
    1, '194.5.53.47', 0
  ), 
  (
    233, 'commition', '1', 'referlevel_2', 
    1, '194.5.53.47', 0
  ), 
  (
    234, 'ex_commition', '2', 'referlevel_2', 
    1, '194.5.53.47', 0
  ), 
  (
    235, 'ex_action_commition', '2', 'referlevel_2', 
    1, '194.5.53.47', 0
  ), 
  (
    236, 'reg_commission', '3', 'referlevel_3', 
    1, '194.5.53.47', 0
  ), 
  (
    237, 'sale_commition', '3', 'referlevel_3', 
    1, '194.5.53.47', 0
  ), 
  (
    238, 'commition', '1', 'referlevel_3', 
    1, '194.5.53.47', 0
  ), 
  (
    239, 'ex_commition', '3', 'referlevel_3', 
    1, '194.5.53.47', 0
  ), 
  (
    240, 'ex_action_commition', '3', 'referlevel_3', 
    1, '194.5.53.47', 0
  ), 
  (
    241, 'autoacceptlocalstore', '0', 
    'referlevel', 1, '194.5.53.47', 0
  ), 
  (
    242, 'autoacceptexternalstore', '0', 
    'referlevel', 1, '194.5.53.47', 0
  ), 
  (
    243, 'autoacceptaction', '0', 'referlevel', 
    1, '194.5.53.47', 0
  ), 
  (
    244, 'show_sponser', '', 'referlevel', 
    1, '194.5.53.47', 0
  ), 
  (
    245, 'sponser_name', 'Administrator', 
    'referlevel', 1, '194.5.53.47', 0
  );
CREATE TABLE `shipping_address` (
  `id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `address` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `country_id` int(11) NOT NULL, 
  `state_id` int(11) NOT NULL, 
  `city` varchar(50) CHARACTER SET utf8 NOT NULL, 
  `zip_code` varchar(20) CHARACTER SET utf8 NOT NULL, 
  `phone` varchar(15) CHARACTER SET utf8 NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `slugs` (
  `id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `related_id` int(11) NOT NULL, 
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `created_at` datetime DEFAULT NULL, 
  `updated_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `states` (
  `id` int(11) NOT NULL, 
  `name` varchar(30) CHARACTER SET utf8 NOT NULL, 
  `country_id` int(11) NOT NULL DEFAULT '1', 
  `created_by` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `states` (
  `id`, `name`, `country_id`, `created_by`
) 
VALUES 
  (
    1, 'Andaman and Nicobar Islands', 
    101, NULL
  ), 
  (2, 'Andhra Pradesh', 101, NULL), 
  (3, 'Arunachal Pradesh', 101, NULL), 
  (4, 'Assam', 101, NULL), 
  (5, 'Bihar', 101, NULL), 
  (6, 'Chandigarh', 101, NULL), 
  (7, 'Chhattisgarh', 101, NULL), 
  (
    8, 'Dadra and Nagar Haveli', 101, 
    NULL
  ), 
  (9, 'Daman and Diu', 101, NULL), 
  (10, 'Delhi', 101, NULL), 
  (11, 'Goa', 101, NULL), 
  (12, 'Gujarat', 101, NULL), 
  (13, 'Haryana', 101, NULL), 
  (14, 'Himachal Pradesh', 101, NULL), 
  (
    15, 'Jammu and Kashmir', 101, NULL
  ), 
  (16, 'Jharkhand', 101, NULL), 
  (17, 'Karnataka', 101, NULL), 
  (18, 'Kenmore', 101, NULL), 
  (19, 'Kerala', 101, NULL), 
  (20, 'Lakshadweep', 101, NULL), 
  (21, 'Madhya Pradesh', 101, NULL), 
  (22, 'Maharashtra', 101, NULL), 
  (23, 'Manipur', 101, NULL), 
  (24, 'Meghalaya', 101, NULL), 
  (25, 'Mizoram', 101, NULL), 
  (26, 'Nagaland', 101, NULL), 
  (27, 'Narora', 101, NULL), 
  (28, 'Natwar', 101, NULL), 
  (29, 'Odisha', 101, NULL), 
  (
    30, 'Paschim Medinipur', 101, NULL
  ), 
  (31, 'Pondicherry', 101, NULL), 
  (32, 'Punjab', 101, NULL), 
  (33, 'Rajasthan', 101, NULL), 
  (34, 'Sikkim', 101, NULL), 
  (35, 'Tamil Nadu', 101, NULL), 
  (36, 'Telangana', 101, NULL), 
  (37, 'Tripura', 101, NULL), 
  (38, 'Uttar Pradesh', 101, NULL), 
  (39, 'Uttarakhand', 101, NULL), 
  (40, 'Vaishali', 101, NULL), 
  (41, 'West Bengal', 101, NULL), 
  (42, 'Badakhshan', 1, NULL), 
  (43, 'Badgis', 1, NULL), 
  (44, 'Baglan', 1, NULL), 
  (45, 'Balkh', 1, NULL), 
  (46, 'Bamiyan', 1, NULL), 
  (47, 'Farah', 1, NULL), 
  (48, 'Faryab', 1, NULL), 
  (49, 'Gawr', 1, NULL), 
  (50, 'Gazni', 1, NULL), 
  (51, 'Herat', 1, NULL), 
  (52, 'Hilmand', 1, NULL), 
  (53, 'Jawzjan', 1, NULL), 
  (54, 'Kabul', 1, NULL), 
  (55, 'Kapisa', 1, NULL), 
  (56, 'Khawst', 1, NULL), 
  (57, 'Kunar', 1, NULL), 
  (58, 'Lagman', 1, NULL), 
  (59, 'Lawghar', 1, NULL), 
  (60, 'Nangarhar', 1, NULL), 
  (61, 'Nimruz', 1, NULL), 
  (62, 'Nuristan', 1, NULL), 
  (63, 'Paktika', 1, NULL), 
  (64, 'Paktiya', 1, NULL), 
  (65, 'Parwan', 1, NULL), 
  (66, 'Qandahar', 1, NULL), 
  (67, 'Qunduz', 1, NULL), 
  (68, 'Samangan', 1, NULL), 
  (69, 'Sar-e Pul', 1, NULL), 
  (70, 'Takhar', 1, NULL), 
  (71, 'Uruzgan', 1, NULL), 
  (72, 'Wardag', 1, NULL), 
  (73, 'Zabul', 1, NULL), 
  (74, 'Berat', 2, NULL), 
  (75, 'Bulqize', 2, NULL), 
  (76, 'Delvine', 2, NULL), 
  (77, 'Devoll', 2, NULL), 
  (78, 'Dibre', 2, NULL), 
  (79, 'Durres', 2, NULL), 
  (80, 'Elbasan', 2, NULL), 
  (81, 'Fier', 2, NULL), 
  (82, 'Gjirokaster', 2, NULL), 
  (83, 'Gramsh', 2, NULL), 
  (84, 'Has', 2, NULL), 
  (85, 'Kavaje', 2, NULL), 
  (86, 'Kolonje', 2, NULL), 
  (87, 'Korce', 2, NULL), 
  (88, 'Kruje', 2, NULL), 
  (89, 'Kucove', 2, NULL), 
  (90, 'Kukes', 2, NULL), 
  (91, 'Kurbin', 2, NULL), 
  (92, 'Lezhe', 2, NULL), 
  (93, 'Librazhd', 2, NULL), 
  (94, 'Lushnje', 2, NULL), 
  (95, 'Mallakaster', 2, NULL), 
  (96, 'Malsi e Madhe', 2, NULL), 
  (97, 'Mat', 2, NULL), 
  (98, 'Mirdite', 2, NULL), 
  (99, 'Peqin', 2, NULL), 
  (100, 'Permet', 2, NULL), 
  (101, 'Pogradec', 2, NULL), 
  (102, 'Puke', 2, NULL), 
  (103, 'Sarande', 2, NULL), 
  (104, 'Shkoder', 2, NULL), 
  (105, 'Skrapar', 2, NULL), 
  (106, 'Tepelene', 2, NULL), 
  (107, 'Tirane', 2, NULL), 
  (108, 'Tropoje', 2, NULL), 
  (109, 'Vlore', 2, NULL), 
  (110, '\'Ayn Daflah', 3, NULL), 
  (111, '\'Ayn Tamushanat', 3, NULL), 
  (112, 'Adrar', 3, NULL), 
  (113, 'Algiers', 3, NULL), 
  (114, 'Annabah', 3, NULL), 
  (115, 'Bashshar', 3, NULL), 
  (116, 'Batnah', 3, NULL), 
  (117, 'Bijayah', 3, NULL), 
  (118, 'Biskrah', 3, NULL), 
  (119, 'Blidah', 3, NULL), 
  (120, 'Buirah', 3, NULL), 
  (121, 'Bumardas', 3, NULL), 
  (122, 'Burj Bu Arririj', 3, NULL), 
  (123, 'Ghalizan', 3, NULL), 
  (124, 'Ghardayah', 3, NULL), 
  (125, 'Ilizi', 3, NULL), 
  (126, 'Jijili', 3, NULL), 
  (127, 'Jilfah', 3, NULL), 
  (128, 'Khanshalah', 3, NULL), 
  (129, 'Masilah', 3, NULL), 
  (130, 'Midyah', 3, NULL), 
  (131, 'Milah', 3, NULL), 
  (132, 'Muaskar', 3, NULL), 
  (133, 'Mustaghanam', 3, NULL), 
  (134, 'Naama', 3, NULL), 
  (135, 'Oran', 3, NULL), 
  (136, 'Ouargla', 3, NULL), 
  (137, 'Qalmah', 3, NULL), 
  (138, 'Qustantinah', 3, NULL), 
  (139, 'Sakikdah', 3, NULL), 
  (140, 'Satif', 3, NULL), 
  (141, 'Sayda\'', 3, NULL), 
  (
    142, 'Sidi ban-al-\'Abbas', 3, NULL
  ), 
  (143, 'Suq Ahras', 3, NULL), 
  (144, 'Tamanghasat', 3, NULL), 
  (145, 'Tibazah', 3, NULL), 
  (146, 'Tibissah', 3, NULL), 
  (147, 'Tilimsan', 3, NULL), 
  (148, 'Tinduf', 3, NULL), 
  (149, 'Tisamsilt', 3, NULL), 
  (150, 'Tiyarat', 3, NULL), 
  (151, 'Tizi Wazu', 3, NULL), 
  (152, 'Umm-al-Bawaghi', 3, NULL), 
  (153, 'Wahran', 3, NULL), 
  (154, 'Warqla', 3, NULL), 
  (155, 'Wilaya d Alger', 3, NULL), 
  (156, 'Wilaya de Bejaia', 3, NULL), 
  (
    157, 'Wilaya de Constantine', 3, NULL
  ), 
  (158, 'al-Aghwat', 3, NULL), 
  (159, 'al-Bayadh', 3, NULL), 
  (160, 'al-Jaza\'ir', 3, NULL), 
  (161, 'al-Wad', 3, NULL), 
  (162, 'ash-Shalif', 3, NULL), 
  (163, 'at-Tarif', 3, NULL), 
  (164, 'Eastern', 4, NULL), 
  (165, 'Manu\'a', 4, NULL), 
  (166, 'Swains Island', 4, NULL), 
  (167, 'Western', 4, NULL), 
  (168, 'Andorra la Vella', 5, NULL), 
  (169, 'Canillo', 5, NULL), 
  (170, 'Encamp', 5, NULL), 
  (171, 'La Massana', 5, NULL), 
  (172, 'Les Escaldes', 5, NULL), 
  (173, 'Ordino', 5, NULL), 
  (
    174, 'Sant Julia de Loria', 5, NULL
  ), 
  (175, 'Bengo', 6, NULL), 
  (176, 'Benguela', 6, NULL), 
  (177, 'Bie', 6, NULL), 
  (178, 'Cabinda', 6, NULL), 
  (179, 'Cunene', 6, NULL), 
  (180, 'Huambo', 6, NULL), 
  (181, 'Huila', 6, NULL), 
  (182, 'Kuando-Kubango', 6, NULL), 
  (183, 'Kwanza Norte', 6, NULL), 
  (184, 'Kwanza Sul', 6, NULL), 
  (185, 'Luanda', 6, NULL), 
  (186, 'Lunda Norte', 6, NULL), 
  (187, 'Lunda Sul', 6, NULL), 
  (188, 'Malanje', 6, NULL), 
  (189, 'Moxico', 6, NULL), 
  (190, 'Namibe', 6, NULL), 
  (191, 'Uige', 6, NULL), 
  (192, 'Zaire', 6, NULL), 
  (193, 'Other Provinces', 7, NULL), 
  (
    194, 'Sector claimed by Argentina/Ch', 
    8, NULL
  ), 
  (
    195, 'Sector claimed by Argentina/UK', 
    8, NULL
  ), 
  (
    196, 'Sector claimed by Australia', 
    8, NULL
  ), 
  (
    197, 'Sector claimed by France', 
    8, NULL
  ), 
  (
    198, 'Sector claimed by New Zealand', 
    8, NULL
  ), 
  (
    199, 'Sector claimed by Norway', 
    8, NULL
  ), 
  (200, 'Unclaimed Sector', 8, NULL), 
  (201, 'Barbuda', 9, NULL), 
  (202, 'Saint George', 9, NULL), 
  (203, 'Saint John', 9, NULL), 
  (204, 'Saint Mary', 9, NULL), 
  (205, 'Saint Paul', 9, NULL), 
  (206, 'Saint Peter', 9, NULL), 
  (207, 'Saint Philip', 9, NULL), 
  (208, 'Buenos Aires', 10, NULL), 
  (209, 'Catamarca', 10, NULL), 
  (210, 'Chaco', 10, NULL), 
  (211, 'Chubut', 10, NULL), 
  (212, 'Cordoba', 10, NULL), 
  (213, 'Corrientes', 10, NULL), 
  (214, 'Distrito Federal', 10, NULL), 
  (215, 'Entre Rios', 10, NULL), 
  (216, 'Formosa', 10, NULL), 
  (217, 'Jujuy', 10, NULL), 
  (218, 'La Pampa', 10, NULL), 
  (219, 'La Rioja', 10, NULL), 
  (220, 'Mendoza', 10, NULL), 
  (221, 'Misiones', 10, NULL), 
  (222, 'Neuquen', 10, NULL), 
  (223, 'Rio Negro', 10, NULL), 
  (224, 'Salta', 10, NULL), 
  (225, 'San Juan', 10, NULL), 
  (226, 'San Luis', 10, NULL), 
  (227, 'Santa Cruz', 10, NULL), 
  (228, 'Santa Fe', 10, NULL), 
  (
    229, 'Santiago del Estero', 10, NULL
  ), 
  (230, 'Tierra del Fuego', 10, NULL), 
  (231, 'Tucuman', 10, NULL), 
  (232, 'Aragatsotn', 11, NULL), 
  (233, 'Ararat', 11, NULL), 
  (234, 'Armavir', 11, NULL), 
  (235, 'Gegharkunik', 11, NULL), 
  (236, 'Kotaik', 11, NULL), 
  (237, 'Lori', 11, NULL), 
  (238, 'Shirak', 11, NULL), 
  (239, 'Stepanakert', 11, NULL), 
  (240, 'Syunik', 11, NULL), 
  (241, 'Tavush', 11, NULL), 
  (242, 'Vayots Dzor', 11, NULL), 
  (243, 'Yerevan', 11, NULL), 
  (244, 'Aruba', 12, NULL), 
  (245, 'Auckland', 13, NULL), 
  (
    246, 'Australian Capital Territory', 
    13, NULL
  ), 
  (247, 'Balgowlah', 13, NULL), 
  (248, 'Balmain', 13, NULL), 
  (249, 'Bankstown', 13, NULL), 
  (250, 'Baulkham Hills', 13, NULL), 
  (251, 'Bonnet Bay', 13, NULL), 
  (252, 'Camberwell', 13, NULL), 
  (253, 'Carole Park', 13, NULL), 
  (254, 'Castle Hill', 13, NULL), 
  (255, 'Caulfield', 13, NULL), 
  (256, 'Chatswood', 13, NULL), 
  (257, 'Cheltenham', 13, NULL), 
  (258, 'Cherrybrook', 13, NULL), 
  (259, 'Clayton', 13, NULL), 
  (260, 'Collingwood', 13, NULL), 
  (261, 'Frenchs Forest', 13, NULL), 
  (262, 'Hawthorn', 13, NULL), 
  (263, 'Jannnali', 13, NULL), 
  (264, 'Knoxfield', 13, NULL), 
  (265, 'Melbourne', 13, NULL), 
  (266, 'New South Wales', 13, NULL), 
  (
    267, 'Northern Territory', 13, NULL
  ), 
  (268, 'Perth', 13, NULL), 
  (269, 'Queensland', 13, NULL), 
  (270, 'South Australia', 13, NULL), 
  (271, 'Tasmania', 13, NULL), 
  (272, 'Templestowe', 13, NULL), 
  (273, 'Victoria', 13, NULL), 
  (274, 'Werribee south', 13, NULL), 
  (
    275, 'Western Australia', 13, NULL
  ), 
  (276, 'Wheeler', 13, NULL), 
  (
    277, 'Bundesland Salzburg', 14, NULL
  ), 
  (
    278, 'Bundesland Steiermark', 14, 
    NULL
  ), 
  (279, 'Bundesland Tirol', 14, NULL), 
  (280, 'Burgenland', 14, NULL), 
  (281, 'Carinthia', 14, NULL), 
  (282, 'Karnten', 14, NULL), 
  (283, 'Liezen', 14, NULL), 
  (284, 'Lower Austria', 14, NULL), 
  (285, 'Niederosterreich', 14, NULL), 
  (286, 'Oberosterreich', 14, NULL), 
  (287, 'Salzburg', 14, NULL), 
  (
    288, 'Schleswig-Holstein', 14, NULL
  ), 
  (289, 'Steiermark', 14, NULL), 
  (290, 'Styria', 14, NULL), 
  (291, 'Tirol', 14, NULL), 
  (292, 'Upper Austria', 14, NULL), 
  (293, 'Vorarlberg', 14, NULL), 
  (294, 'Wien', 14, NULL), 
  (295, 'Abseron', 15, NULL), 
  (296, 'Baki Sahari', 15, NULL), 
  (297, 'Ganca', 15, NULL), 
  (298, 'Ganja', 15, NULL), 
  (299, 'Kalbacar', 15, NULL), 
  (300, 'Lankaran', 15, NULL), 
  (301, 'Mil-Qarabax', 15, NULL), 
  (302, 'Mugan-Salyan', 15, NULL), 
  (303, 'Nagorni-Qarabax', 15, NULL), 
  (304, 'Naxcivan', 15, NULL), 
  (305, 'Priaraks', 15, NULL), 
  (306, 'Qazax', 15, NULL), 
  (307, 'Saki', 15, NULL), 
  (308, 'Sirvan', 15, NULL), 
  (309, 'Xacmaz', 15, NULL), 
  (310, 'Abaco', 16, NULL), 
  (311, 'Acklins Island', 16, NULL), 
  (312, 'Andros', 16, NULL), 
  (313, 'Berry Islands', 16, NULL), 
  (314, 'Biminis', 16, NULL), 
  (315, 'Cat Island', 16, NULL), 
  (316, 'Crooked Island', 16, NULL), 
  (317, 'Eleuthera', 16, NULL), 
  (318, 'Exuma and Cays', 16, NULL), 
  (319, 'Grand Bahama', 16, NULL), 
  (320, 'Inagua Islands', 16, NULL), 
  (321, 'Long Island', 16, NULL), 
  (322, 'Mayaguana', 16, NULL), 
  (323, 'New Providence', 16, NULL), 
  (324, 'Ragged Island', 16, NULL), 
  (325, 'Rum Cay', 16, NULL), 
  (326, 'San Salvador', 16, NULL), 
  (327, '\'Isa', 17, NULL), 
  (328, 'Badiyah', 17, NULL), 
  (329, 'Hidd', 17, NULL), 
  (330, 'Jidd Hafs', 17, NULL), 
  (331, 'Mahama', 17, NULL), 
  (332, 'Manama', 17, NULL), 
  (333, 'Sitrah', 17, NULL), 
  (334, 'al-Manamah', 17, NULL), 
  (335, 'al-Muharraq', 17, NULL), 
  (336, 'ar-Rifa\'a', 17, NULL), 
  (337, 'Bagar Hat', 18, NULL), 
  (338, 'Bandarban', 18, NULL), 
  (339, 'Barguna', 18, NULL), 
  (340, 'Barisal', 18, NULL), 
  (341, 'Bhola', 18, NULL), 
  (342, 'Bogora', 18, NULL), 
  (343, 'Brahman Bariya', 18, NULL), 
  (344, 'Chandpur', 18, NULL), 
  (345, 'Chattagam', 18, NULL), 
  (
    346, 'Chittagong Division', 18, NULL
  ), 
  (347, 'Chuadanga', 18, NULL), 
  (348, 'Dhaka', 18, NULL), 
  (349, 'Dinajpur', 18, NULL), 
  (350, 'Faridpur', 18, NULL), 
  (351, 'Feni', 18, NULL), 
  (352, 'Gaybanda', 18, NULL), 
  (353, 'Gazipur', 18, NULL), 
  (354, 'Gopalganj', 18, NULL), 
  (355, 'Habiganj', 18, NULL), 
  (356, 'Jaipur Hat', 18, NULL), 
  (357, 'Jamalpur', 18, NULL), 
  (358, 'Jessor', 18, NULL), 
  (359, 'Jhalakati', 18, NULL), 
  (360, 'Jhanaydah', 18, NULL), 
  (361, 'Khagrachhari', 18, NULL), 
  (362, 'Khulna', 18, NULL), 
  (363, 'Kishorganj', 18, NULL), 
  (364, 'Koks Bazar', 18, NULL), 
  (365, 'Komilla', 18, NULL), 
  (366, 'Kurigram', 18, NULL), 
  (367, 'Kushtiya', 18, NULL), 
  (368, 'Lakshmipur', 18, NULL), 
  (369, 'Lalmanir Hat', 18, NULL), 
  (370, 'Madaripur', 18, NULL), 
  (371, 'Magura', 18, NULL), 
  (372, 'Maimansingh', 18, NULL), 
  (373, 'Manikganj', 18, NULL), 
  (374, 'Maulvi Bazar', 18, NULL), 
  (375, 'Meherpur', 18, NULL), 
  (376, 'Munshiganj', 18, NULL), 
  (377, 'Naral', 18, NULL), 
  (378, 'Narayanganj', 18, NULL), 
  (379, 'Narsingdi', 18, NULL), 
  (380, 'Nator', 18, NULL), 
  (381, 'Naugaon', 18, NULL), 
  (382, 'Nawabganj', 18, NULL), 
  (383, 'Netrakona', 18, NULL), 
  (384, 'Nilphamari', 18, NULL), 
  (385, 'Noakhali', 18, NULL), 
  (386, 'Pabna', 18, NULL), 
  (387, 'Panchagarh', 18, NULL), 
  (388, 'Patuakhali', 18, NULL), 
  (389, 'Pirojpur', 18, NULL), 
  (390, 'Rajbari', 18, NULL), 
  (391, 'Rajshahi', 18, NULL), 
  (392, 'Rangamati', 18, NULL), 
  (393, 'Rangpur', 18, NULL), 
  (394, 'Satkhira', 18, NULL), 
  (395, 'Shariatpur', 18, NULL), 
  (396, 'Sherpur', 18, NULL), 
  (397, 'Silhat', 18, NULL), 
  (398, 'Sirajganj', 18, NULL), 
  (399, 'Sunamganj', 18, NULL), 
  (400, 'Tangayal', 18, NULL), 
  (401, 'Thakurgaon', 18, NULL), 
  (402, 'Christ Church', 19, NULL), 
  (403, 'Saint Andrew', 19, NULL), 
  (404, 'Saint George', 19, NULL), 
  (405, 'Saint James', 19, NULL), 
  (406, 'Saint John', 19, NULL), 
  (407, 'Saint Joseph', 19, NULL), 
  (408, 'Saint Lucy', 19, NULL), 
  (409, 'Saint Michael', 19, NULL), 
  (410, 'Saint Peter', 19, NULL), 
  (411, 'Saint Philip', 19, NULL), 
  (412, 'Saint Thomas', 19, NULL), 
  (413, 'Brest', 20, NULL), 
  (414, 'Homjel\'', 20, NULL), 
  (415, 'Hrodna', 20, NULL), 
  (416, 'Mahiljow', 20, NULL), 
  (
    417, 'Mahilyowskaya Voblasts', 20, 
    NULL
  ), 
  (418, 'Minsk', 20, NULL), 
  (
    419, 'Minskaja Voblasts\'', 20, NULL
  ), 
  (420, 'Petrik', 20, NULL), 
  (421, 'Vicebsk', 20, NULL), 
  (422, 'Antwerpen', 21, NULL), 
  (423, 'Berchem', 21, NULL), 
  (424, 'Brabant', 21, NULL), 
  (425, 'Brabant Wallon', 21, NULL), 
  (426, 'Brussel', 21, NULL), 
  (427, 'East Flanders', 21, NULL), 
  (428, 'Hainaut', 21, NULL), 
  (429, 'Liege', 21, NULL), 
  (430, 'Limburg', 21, NULL), 
  (431, 'Luxembourg', 21, NULL), 
  (432, 'Namur', 21, NULL), 
  (433, 'Ontario', 21, NULL), 
  (434, 'Oost-Vlaanderen', 21, NULL), 
  (
    435, 'Provincie Brabant', 21, NULL
  ), 
  (436, 'Vlaams-Brabant', 21, NULL), 
  (437, 'Wallonne', 21, NULL), 
  (438, 'West-Vlaanderen', 21, NULL), 
  (439, 'Belize', 22, NULL), 
  (440, 'Cayo', 22, NULL), 
  (441, 'Corozal', 22, NULL), 
  (442, 'Orange Walk', 22, NULL), 
  (443, 'Stann Creek', 22, NULL), 
  (444, 'Toledo', 22, NULL), 
  (445, 'Alibori', 23, NULL), 
  (446, 'Atacora', 23, NULL), 
  (447, 'Atlantique', 23, NULL), 
  (448, 'Borgou', 23, NULL), 
  (449, 'Collines', 23, NULL), 
  (450, 'Couffo', 23, NULL), 
  (451, 'Donga', 23, NULL), 
  (452, 'Littoral', 23, NULL), 
  (453, 'Mono', 23, NULL), 
  (454, 'Oueme', 23, NULL), 
  (455, 'Plateau', 23, NULL), 
  (456, 'Zou', 23, NULL), 
  (457, 'Hamilton', 24, NULL), 
  (458, 'Saint George', 24, NULL), 
  (459, 'Bumthang', 25, NULL), 
  (460, 'Chhukha', 25, NULL), 
  (461, 'Chirang', 25, NULL), 
  (462, 'Daga', 25, NULL), 
  (463, 'Geylegphug', 25, NULL), 
  (464, 'Ha', 25, NULL), 
  (465, 'Lhuntshi', 25, NULL), 
  (466, 'Mongar', 25, NULL), 
  (467, 'Pemagatsel', 25, NULL), 
  (468, 'Punakha', 25, NULL), 
  (469, 'Rinpung', 25, NULL), 
  (470, 'Samchi', 25, NULL), 
  (471, 'Samdrup Jongkhar', 25, NULL), 
  (472, 'Shemgang', 25, NULL), 
  (473, 'Tashigang', 25, NULL), 
  (474, 'Timphu', 25, NULL), 
  (475, 'Tongsa', 25, NULL), 
  (476, 'Wangdiphodrang', 25, NULL), 
  (477, 'Beni', 26, NULL), 
  (478, 'Chuquisaca', 26, NULL), 
  (479, 'Cochabamba', 26, NULL), 
  (480, 'La Paz', 26, NULL), 
  (481, 'Oruro', 26, NULL), 
  (482, 'Pando', 26, NULL), 
  (483, 'Potosi', 26, NULL), 
  (484, 'Santa Cruz', 26, NULL), 
  (485, 'Tarija', 26, NULL), 
  (
    486, 'Federacija Bosna i Hercegovina', 
    27, NULL
  ), 
  (487, 'Republika Srpska', 27, NULL), 
  (488, 'Central Bobonong', 28, NULL), 
  (489, 'Central Boteti', 28, NULL), 
  (
    490, 'Central Mahalapye', 28, NULL
  ), 
  (
    491, 'Central Serowe-Palapye', 28, 
    NULL
  ), 
  (492, 'Central Tutume', 28, NULL), 
  (493, 'Chobe', 28, NULL), 
  (494, 'Francistown', 28, NULL), 
  (495, 'Gaborone', 28, NULL), 
  (496, 'Ghanzi', 28, NULL), 
  (497, 'Jwaneng', 28, NULL), 
  (498, 'Kgalagadi North', 28, NULL), 
  (499, 'Kgalagadi South', 28, NULL), 
  (500, 'Kgatleng', 28, NULL), 
  (501, 'Kweneng', 28, NULL), 
  (502, 'Lobatse', 28, NULL), 
  (503, 'Ngamiland', 28, NULL), 
  (504, 'Ngwaketse', 28, NULL), 
  (505, 'North East', 28, NULL), 
  (506, 'Okavango', 28, NULL), 
  (507, 'Orapa', 28, NULL), 
  (508, 'Selibe Phikwe', 28, NULL), 
  (509, 'South East', 28, NULL), 
  (510, 'Sowa', 28, NULL), 
  (511, 'Bouvet Island', 29, NULL), 
  (512, 'Acre', 30, NULL), 
  (513, 'Alagoas', 30, NULL), 
  (514, 'Amapa', 30, NULL), 
  (515, 'Amazonas', 30, NULL), 
  (516, 'Bahia', 30, NULL), 
  (517, 'Ceara', 30, NULL), 
  (518, 'Distrito Federal', 30, NULL), 
  (519, 'Espirito Santo', 30, NULL), 
  (
    520, 'Estado de Sao Paulo', 30, NULL
  ), 
  (521, 'Goias', 30, NULL), 
  (522, 'Maranhao', 30, NULL), 
  (523, 'Mato Grosso', 30, NULL), 
  (
    524, 'Mato Grosso do Sul', 30, NULL
  ), 
  (525, 'Minas Gerais', 30, NULL), 
  (526, 'Para', 30, NULL), 
  (527, 'Paraiba', 30, NULL), 
  (528, 'Parana', 30, NULL), 
  (529, 'Pernambuco', 30, NULL), 
  (530, 'Piaui', 30, NULL), 
  (
    531, 'Rio Grande do Norte', 30, NULL
  ), 
  (
    532, 'Rio Grande do Sul', 30, NULL
  ), 
  (533, 'Rio de Janeiro', 30, NULL), 
  (534, 'Rondonia', 30, NULL), 
  (535, 'Roraima', 30, NULL), 
  (536, 'Santa Catarina', 30, NULL), 
  (537, 'Sao Paulo', 30, NULL), 
  (538, 'Sergipe', 30, NULL), 
  (539, 'Tocantins', 30, NULL), 
  (
    540, 'British Indian Ocean Territory', 
    31, NULL
  ), 
  (541, 'Belait', 32, NULL), 
  (542, 'Brunei-Muara', 32, NULL), 
  (543, 'Temburong', 32, NULL), 
  (544, 'Tutong', 32, NULL), 
  (545, 'Blagoevgrad', 33, NULL), 
  (546, 'Burgas', 33, NULL), 
  (547, 'Dobrich', 33, NULL), 
  (548, 'Gabrovo', 33, NULL), 
  (549, 'Haskovo', 33, NULL), 
  (550, 'Jambol', 33, NULL), 
  (551, 'Kardzhali', 33, NULL), 
  (552, 'Kjustendil', 33, NULL), 
  (553, 'Lovech', 33, NULL), 
  (554, 'Montana', 33, NULL), 
  (
    555, 'Oblast Sofiya-Grad', 33, NULL
  ), 
  (556, 'Pazardzhik', 33, NULL), 
  (557, 'Pernik', 33, NULL), 
  (558, 'Pleven', 33, NULL), 
  (559, 'Plovdiv', 33, NULL), 
  (560, 'Razgrad', 33, NULL), 
  (561, 'Ruse', 33, NULL), 
  (562, 'Shumen', 33, NULL), 
  (563, 'Silistra', 33, NULL), 
  (564, 'Sliven', 33, NULL), 
  (565, 'Smoljan', 33, NULL), 
  (566, 'Sofija grad', 33, NULL), 
  (567, 'Sofijska oblast', 33, NULL), 
  (568, 'Stara Zagora', 33, NULL), 
  (569, 'Targovishte', 33, NULL), 
  (570, 'Varna', 33, NULL), 
  (571, 'Veliko Tarnovo', 33, NULL), 
  (572, 'Vidin', 33, NULL), 
  (573, 'Vraca', 33, NULL), 
  (574, 'Yablaniza', 33, NULL), 
  (575, 'Bale', 34, NULL), 
  (576, 'Bam', 34, NULL), 
  (577, 'Bazega', 34, NULL), 
  (578, 'Bougouriba', 34, NULL), 
  (579, 'Boulgou', 34, NULL), 
  (580, 'Boulkiemde', 34, NULL), 
  (581, 'Comoe', 34, NULL), 
  (582, 'Ganzourgou', 34, NULL), 
  (583, 'Gnagna', 34, NULL), 
  (584, 'Gourma', 34, NULL), 
  (585, 'Houet', 34, NULL), 
  (586, 'Ioba', 34, NULL), 
  (587, 'Kadiogo', 34, NULL), 
  (588, 'Kenedougou', 34, NULL), 
  (589, 'Komandjari', 34, NULL), 
  (590, 'Kompienga', 34, NULL), 
  (591, 'Kossi', 34, NULL), 
  (592, 'Kouritenga', 34, NULL), 
  (593, 'Kourweogo', 34, NULL), 
  (594, 'Leraba', 34, NULL), 
  (595, 'Mouhoun', 34, NULL), 
  (596, 'Nahouri', 34, NULL), 
  (597, 'Namentenga', 34, NULL), 
  (598, 'Noumbiel', 34, NULL), 
  (599, 'Oubritenga', 34, NULL), 
  (600, 'Oudalan', 34, NULL), 
  (601, 'Passore', 34, NULL), 
  (602, 'Poni', 34, NULL), 
  (603, 'Sanguie', 34, NULL), 
  (604, 'Sanmatenga', 34, NULL), 
  (605, 'Seno', 34, NULL), 
  (606, 'Sissili', 34, NULL), 
  (607, 'Soum', 34, NULL), 
  (608, 'Sourou', 34, NULL), 
  (609, 'Tapoa', 34, NULL), 
  (610, 'Tuy', 34, NULL), 
  (611, 'Yatenga', 34, NULL), 
  (612, 'Zondoma', 34, NULL), 
  (613, 'Zoundweogo', 34, NULL), 
  (614, 'Bubanza', 35, NULL), 
  (615, 'Bujumbura', 35, NULL), 
  (616, 'Bururi', 35, NULL), 
  (617, 'Cankuzo', 35, NULL), 
  (618, 'Cibitoke', 35, NULL), 
  (619, 'Gitega', 35, NULL), 
  (620, 'Karuzi', 35, NULL), 
  (621, 'Kayanza', 35, NULL), 
  (622, 'Kirundo', 35, NULL), 
  (623, 'Makamba', 35, NULL), 
  (624, 'Muramvya', 35, NULL), 
  (625, 'Muyinga', 35, NULL), 
  (626, 'Ngozi', 35, NULL), 
  (627, 'Rutana', 35, NULL), 
  (628, 'Ruyigi', 35, NULL), 
  (
    629, 'Banteay Mean Chey', 36, NULL
  ), 
  (630, 'Bat Dambang', 36, NULL), 
  (631, 'Kampong Cham', 36, NULL), 
  (632, 'Kampong Chhnang', 36, NULL), 
  (633, 'Kampong Spoeu', 36, NULL), 
  (634, 'Kampong Thum', 36, NULL), 
  (635, 'Kampot', 36, NULL), 
  (636, 'Kandal', 36, NULL), 
  (637, 'Kaoh Kong', 36, NULL), 
  (638, 'Kracheh', 36, NULL), 
  (639, 'Krong Kaeb', 36, NULL), 
  (640, 'Krong Pailin', 36, NULL), 
  (
    641, 'Krong Preah Sihanouk', 36, NULL
  ), 
  (642, 'Mondol Kiri', 36, NULL), 
  (643, 'Otdar Mean Chey', 36, NULL), 
  (644, 'Phnum Penh', 36, NULL), 
  (645, 'Pousat', 36, NULL), 
  (646, 'Preah Vihear', 36, NULL), 
  (647, 'Prey Veaeng', 36, NULL), 
  (648, 'Rotanak Kiri', 36, NULL), 
  (649, 'Siem Reab', 36, NULL), 
  (650, 'Stueng Traeng', 36, NULL), 
  (651, 'Svay Rieng', 36, NULL), 
  (652, 'Takaev', 36, NULL), 
  (653, 'Adamaoua', 37, NULL), 
  (654, 'Centre', 37, NULL), 
  (655, 'Est', 37, NULL), 
  (656, 'Littoral', 37, NULL), 
  (657, 'Nord', 37, NULL), 
  (658, 'Nord Extreme', 37, NULL), 
  (659, 'Nordouest', 37, NULL), 
  (660, 'Ouest', 37, NULL), 
  (661, 'Sud', 37, NULL), 
  (662, 'Sudouest', 37, NULL), 
  (663, 'Alberta', 38, NULL), 
  (664, 'British Columbia', 38, NULL), 
  (665, 'Manitoba', 38, NULL), 
  (666, 'New Brunswick', 38, NULL), 
  (
    667, 'Newfoundland and Labrador', 
    38, NULL
  ), 
  (
    668, 'Northwest Territories', 38, 
    NULL
  ), 
  (669, 'Nova Scotia', 38, NULL), 
  (670, 'Nunavut', 38, NULL), 
  (671, 'Ontario', 38, NULL), 
  (
    672, 'Prince Edward Island', 38, NULL
  ), 
  (673, 'Quebec', 38, NULL), 
  (674, 'Saskatchewan', 38, NULL), 
  (675, 'Yukon', 38, NULL), 
  (676, 'Boavista', 39, NULL), 
  (677, 'Brava', 39, NULL), 
  (678, 'Fogo', 39, NULL), 
  (679, 'Maio', 39, NULL), 
  (680, 'Sal', 39, NULL), 
  (681, 'Santo Antao', 39, NULL), 
  (682, 'Sao Nicolau', 39, NULL), 
  (683, 'Sao Tiago', 39, NULL), 
  (684, 'Sao Vicente', 39, NULL), 
  (685, 'Grand Cayman', 40, NULL), 
  (
    686, 'Bamingui-Bangoran', 41, NULL
  ), 
  (687, 'Bangui', 41, NULL), 
  (688, 'Basse-Kotto', 41, NULL), 
  (689, 'Haut-Mbomou', 41, NULL), 
  (690, 'Haute-Kotto', 41, NULL), 
  (691, 'Kemo', 41, NULL), 
  (692, 'Lobaye', 41, NULL), 
  (693, 'Mambere-Kadei', 41, NULL), 
  (694, 'Mbomou', 41, NULL), 
  (695, 'Nana-Gribizi', 41, NULL), 
  (696, 'Nana-Mambere', 41, NULL), 
  (697, 'Ombella Mpoko', 41, NULL), 
  (698, 'Ouaka', 41, NULL), 
  (699, 'Ouham', 41, NULL), 
  (700, 'Ouham-Pende', 41, NULL), 
  (701, 'Sangha-Mbaere', 41, NULL), 
  (702, 'Vakaga', 41, NULL), 
  (703, 'Batha', 42, NULL), 
  (704, 'Biltine', 42, NULL), 
  (
    705, 'Bourkou-Ennedi-Tibesti', 42, 
    NULL
  ), 
  (706, 'Chari-Baguirmi', 42, NULL), 
  (707, 'Guera', 42, NULL), 
  (708, 'Kanem', 42, NULL), 
  (709, 'Lac', 42, NULL), 
  (
    710, 'Logone Occidental', 42, NULL
  ), 
  (711, 'Logone Oriental', 42, NULL), 
  (712, 'Mayo-Kebbi', 42, NULL), 
  (713, 'Moyen-Chari', 42, NULL), 
  (714, 'Ouaddai', 42, NULL), 
  (715, 'Salamat', 42, NULL), 
  (716, 'Tandjile', 42, NULL), 
  (717, 'Aisen', 43, NULL), 
  (718, 'Antofagasta', 43, NULL), 
  (719, 'Araucania', 43, NULL), 
  (720, 'Atacama', 43, NULL), 
  (721, 'Bio Bio', 43, NULL), 
  (722, 'Coquimbo', 43, NULL), 
  (
    723, 'Libertador General Bernardo O\'', 
    43, NULL
  ), 
  (724, 'Los Lagos', 43, NULL), 
  (725, 'Magellanes', 43, NULL), 
  (726, 'Maule', 43, NULL), 
  (727, 'Metropolitana', 43, NULL), 
  (
    728, 'Metropolitana de Santiago', 
    43, NULL
  ), 
  (729, 'Tarapaca', 43, NULL), 
  (730, 'Valparaiso', 43, NULL), 
  (731, 'Anhui', 44, NULL), 
  (732, 'Anhui Province', 44, NULL), 
  (733, 'Anhui Sheng', 44, NULL), 
  (734, 'Aomen', 44, NULL), 
  (735, 'Beijing', 44, NULL), 
  (736, 'Beijing Shi', 44, NULL), 
  (737, 'Chongqing', 44, NULL), 
  (738, 'Fujian', 44, NULL), 
  (739, 'Fujian Sheng', 44, NULL), 
  (740, 'Gansu', 44, NULL), 
  (741, 'Guangdong', 44, NULL), 
  (742, 'Guangdong Sheng', 44, NULL), 
  (743, 'Guangxi', 44, NULL), 
  (744, 'Guizhou', 44, NULL), 
  (745, 'Hainan', 44, NULL), 
  (746, 'Hebei', 44, NULL), 
  (747, 'Heilongjiang', 44, NULL), 
  (748, 'Henan', 44, NULL), 
  (749, 'Hubei', 44, NULL), 
  (750, 'Hunan', 44, NULL), 
  (751, 'Jiangsu', 44, NULL), 
  (752, 'Jiangsu Sheng', 44, NULL), 
  (753, 'Jiangxi', 44, NULL), 
  (754, 'Jilin', 44, NULL), 
  (755, 'Liaoning', 44, NULL), 
  (756, 'Liaoning Sheng', 44, NULL), 
  (757, 'Nei Monggol', 44, NULL), 
  (758, 'Ningxia Hui', 44, NULL), 
  (759, 'Qinghai', 44, NULL), 
  (760, 'Shaanxi', 44, NULL), 
  (761, 'Shandong', 44, NULL), 
  (762, 'Shandong Sheng', 44, NULL), 
  (763, 'Shanghai', 44, NULL), 
  (764, 'Shanxi', 44, NULL), 
  (765, 'Sichuan', 44, NULL), 
  (766, 'Tianjin', 44, NULL), 
  (767, 'Xianggang', 44, NULL), 
  (768, 'Xinjiang', 44, NULL), 
  (769, 'Xizang', 44, NULL), 
  (770, 'Yunnan', 44, NULL), 
  (771, 'Zhejiang', 44, NULL), 
  (772, 'Zhejiang Sheng', 44, NULL), 
  (773, 'Christmas Island', 45, NULL), 
  (
    774, 'Cocos (Keeling) Islands', 46, 
    NULL
  ), 
  (775, 'Amazonas', 47, NULL), 
  (776, 'Antioquia', 47, NULL), 
  (777, 'Arauca', 47, NULL), 
  (778, 'Atlantico', 47, NULL), 
  (779, 'Bogota', 47, NULL), 
  (780, 'Bolivar', 47, NULL), 
  (781, 'Boyaca', 47, NULL), 
  (782, 'Caldas', 47, NULL), 
  (783, 'Caqueta', 47, NULL), 
  (784, 'Casanare', 47, NULL), 
  (785, 'Cauca', 47, NULL), 
  (786, 'Cesar', 47, NULL), 
  (787, 'Choco', 47, NULL), 
  (788, 'Cordoba', 47, NULL), 
  (789, 'Cundinamarca', 47, NULL), 
  (790, 'Guainia', 47, NULL), 
  (791, 'Guaviare', 47, NULL), 
  (792, 'Huila', 47, NULL), 
  (793, 'La Guajira', 47, NULL), 
  (794, 'Magdalena', 47, NULL), 
  (795, 'Meta', 47, NULL), 
  (796, 'Narino', 47, NULL), 
  (
    797, 'Norte de Santander', 47, NULL
  ), 
  (798, 'Putumayo', 47, NULL), 
  (799, 'Quindio', 47, NULL), 
  (800, 'Risaralda', 47, NULL), 
  (
    801, 'San Andres y Providencia', 
    47, NULL
  ), 
  (802, 'Santander', 47, NULL), 
  (803, 'Sucre', 47, NULL), 
  (804, 'Tolima', 47, NULL), 
  (805, 'Valle del Cauca', 47, NULL), 
  (806, 'Vaupes', 47, NULL), 
  (807, 'Vichada', 47, NULL), 
  (808, 'Mwali', 48, NULL), 
  (809, 'Njazidja', 48, NULL), 
  (810, 'Nzwani', 48, NULL), 
  (811, 'Bouenza', 49, NULL), 
  (812, 'Brazzaville', 49, NULL), 
  (813, 'Cuvette', 49, NULL), 
  (814, 'Kouilou', 49, NULL), 
  (815, 'Lekoumou', 49, NULL), 
  (816, 'Likouala', 49, NULL), 
  (817, 'Niari', 49, NULL), 
  (818, 'Plateaux', 49, NULL), 
  (819, 'Pool', 49, NULL), 
  (820, 'Sangha', 49, NULL), 
  (821, 'Bandundu', 50, NULL), 
  (822, 'Bas-Congo', 50, NULL), 
  (823, 'Equateur', 50, NULL), 
  (824, 'Haut-Congo', 50, NULL), 
  (825, 'Kasai-Occidental', 50, NULL), 
  (826, 'Kasai-Oriental', 50, NULL), 
  (827, 'Katanga', 50, NULL), 
  (828, 'Kinshasa', 50, NULL), 
  (829, 'Maniema', 50, NULL), 
  (830, 'Nord-Kivu', 50, NULL), 
  (831, 'Sud-Kivu', 50, NULL), 
  (832, 'Aitutaki', 51, NULL), 
  (833, 'Atiu', 51, NULL), 
  (834, 'Mangaia', 51, NULL), 
  (835, 'Manihiki', 51, NULL), 
  (836, 'Mauke', 51, NULL), 
  (837, 'Mitiaro', 51, NULL), 
  (838, 'Nassau', 51, NULL), 
  (839, 'Pukapuka', 51, NULL), 
  (840, 'Rakahanga', 51, NULL), 
  (841, 'Rarotonga', 51, NULL), 
  (842, 'Tongareva', 51, NULL), 
  (843, 'Alajuela', 52, NULL), 
  (844, 'Cartago', 52, NULL), 
  (845, 'Guanacaste', 52, NULL), 
  (846, 'Heredia', 52, NULL), 
  (847, 'Limon', 52, NULL), 
  (848, 'Puntarenas', 52, NULL), 
  (849, 'San Jose', 52, NULL), 
  (850, 'Abidjan', 53, NULL), 
  (851, 'Agneby', 53, NULL), 
  (852, 'Bafing', 53, NULL), 
  (853, 'Denguele', 53, NULL), 
  (
    854, 'Dix-huit Montagnes', 53, NULL
  ), 
  (855, 'Fromager', 53, NULL), 
  (856, 'Haut-Sassandra', 53, NULL), 
  (857, 'Lacs', 53, NULL), 
  (858, 'Lagunes', 53, NULL), 
  (859, 'Marahoue', 53, NULL), 
  (860, 'Moyen-Cavally', 53, NULL), 
  (861, 'Moyen-Comoe', 53, NULL), 
  (862, 'N\'zi-Comoe', 53, NULL), 
  (863, 'Sassandra', 53, NULL), 
  (864, 'Savanes', 53, NULL), 
  (865, 'Sud-Bandama', 53, NULL), 
  (866, 'Sud-Comoe', 53, NULL), 
  (
    867, 'Vallee du Bandama', 53, NULL
  ), 
  (868, 'Worodougou', 53, NULL), 
  (869, 'Zanzan', 53, NULL), 
  (
    870, 'Bjelovar-Bilogora', 54, NULL
  ), 
  (
    871, 'Dubrovnik-Neretva', 54, NULL
  ), 
  (872, 'Grad Zagreb', 54, NULL), 
  (873, 'Istra', 54, NULL), 
  (874, 'Karlovac', 54, NULL), 
  (
    875, 'Koprivnica-Krizhevci', 54, NULL
  ), 
  (876, 'Krapina-Zagorje', 54, NULL), 
  (877, 'Lika-Senj', 54, NULL), 
  (878, 'Medhimurje', 54, NULL), 
  (
    879, 'Medimurska Zupanija', 54, NULL
  ), 
  (880, 'Osijek-Baranja', 54, NULL), 
  (
    881, 'Osjecko-Baranjska Zupanija', 
    54, NULL
  ), 
  (
    882, 'Pozhega-Slavonija', 54, NULL
  ), 
  (
    883, 'Primorje-Gorski Kotar', 54, 
    NULL
  ), 
  (884, 'Shibenik-Knin', 54, NULL), 
  (885, 'Sisak-Moslavina', 54, NULL), 
  (
    886, 'Slavonski Brod-Posavina', 54, 
    NULL
  ), 
  (887, 'Split-Dalmacija', 54, NULL), 
  (888, 'Varazhdin', 54, NULL), 
  (
    889, 'Virovitica-Podravina', 54, NULL
  ), 
  (890, 'Vukovar-Srijem', 54, NULL), 
  (891, 'Zadar', 54, NULL), 
  (892, 'Zagreb', 54, NULL), 
  (893, 'Camaguey', 55, NULL), 
  (894, 'Ciego de Avila', 55, NULL), 
  (895, 'Cienfuegos', 55, NULL), 
  (
    896, 'Ciudad de la Habana', 55, NULL
  ), 
  (897, 'Granma', 55, NULL), 
  (898, 'Guantanamo', 55, NULL), 
  (899, 'Habana', 55, NULL), 
  (900, 'Holguin', 55, NULL), 
  (
    901, 'Isla de la Juventud', 55, NULL
  ), 
  (902, 'La Habana', 55, NULL), 
  (903, 'Las Tunas', 55, NULL), 
  (904, 'Matanzas', 55, NULL), 
  (905, 'Pinar del Rio', 55, NULL), 
  (906, 'Sancti Spiritus', 55, NULL), 
  (907, 'Santiago de Cuba', 55, NULL), 
  (908, 'Villa Clara', 55, NULL), 
  (
    909, 'Government controlled area', 
    56, NULL
  ), 
  (910, 'Limassol', 56, NULL), 
  (911, 'Nicosia District', 56, NULL), 
  (912, 'Paphos', 56, NULL), 
  (
    913, 'Turkish controlled area', 56, 
    NULL
  ), 
  (914, 'Central Bohemian', 57, NULL), 
  (915, 'Frycovice', 57, NULL), 
  (916, 'Jihocesky Kraj', 57, NULL), 
  (917, 'Jihochesky', 57, NULL), 
  (918, 'Jihomoravsky', 57, NULL), 
  (919, 'Karlovarsky', 57, NULL), 
  (920, 'Klecany', 57, NULL), 
  (921, 'Kralovehradecky', 57, NULL), 
  (922, 'Liberecky', 57, NULL), 
  (923, 'Lipov', 57, NULL), 
  (924, 'Moravskoslezsky', 57, NULL), 
  (925, 'Olomoucky', 57, NULL), 
  (926, 'Olomoucky Kraj', 57, NULL), 
  (927, 'Pardubicky', 57, NULL), 
  (928, 'Plzensky', 57, NULL), 
  (929, 'Praha', 57, NULL), 
  (930, 'Rajhrad', 57, NULL), 
  (931, 'Smirice', 57, NULL), 
  (932, 'South Moravian', 57, NULL), 
  (933, 'Straz nad Nisou', 57, NULL), 
  (934, 'Stredochesky', 57, NULL), 
  (935, 'Unicov', 57, NULL), 
  (936, 'Ustecky', 57, NULL), 
  (937, 'Valletta', 57, NULL), 
  (938, 'Velesin', 57, NULL), 
  (939, 'Vysochina', 57, NULL), 
  (940, 'Zlinsky', 57, NULL), 
  (941, 'Arhus', 58, NULL), 
  (942, 'Bornholm', 58, NULL), 
  (943, 'Frederiksborg', 58, NULL), 
  (944, 'Fyn', 58, NULL), 
  (945, 'Hovedstaden', 58, NULL), 
  (946, 'Kobenhavn', 58, NULL), 
  (947, 'Kobenhavns Amt', 58, NULL), 
  (
    948, 'Kobenhavns Kommune', 58, NULL
  ), 
  (949, 'Nordjylland', 58, NULL), 
  (950, 'Ribe', 58, NULL), 
  (951, 'Ringkobing', 58, NULL), 
  (952, 'Roervig', 58, NULL), 
  (953, 'Roskilde', 58, NULL), 
  (954, 'Roslev', 58, NULL), 
  (955, 'Sjaelland', 58, NULL), 
  (956, 'Soeborg', 58, NULL), 
  (957, 'Sonderjylland', 58, NULL), 
  (958, 'Storstrom', 58, NULL), 
  (959, 'Syddanmark', 58, NULL), 
  (960, 'Toelloese', 58, NULL), 
  (961, 'Vejle', 58, NULL), 
  (962, 'Vestsjalland', 58, NULL), 
  (963, 'Viborg', 58, NULL), 
  (964, '\'Ali Sabih', 59, NULL), 
  (965, 'Dikhil', 59, NULL), 
  (966, 'Jibuti', 59, NULL), 
  (967, 'Tajurah', 59, NULL), 
  (968, 'Ubuk', 59, NULL), 
  (969, 'Saint Andrew', 60, NULL), 
  (970, 'Saint David', 60, NULL), 
  (971, 'Saint George', 60, NULL), 
  (972, 'Saint John', 60, NULL), 
  (973, 'Saint Joseph', 60, NULL), 
  (974, 'Saint Luke', 60, NULL), 
  (975, 'Saint Mark', 60, NULL), 
  (976, 'Saint Patrick', 60, NULL), 
  (977, 'Saint Paul', 60, NULL), 
  (978, 'Saint Peter', 60, NULL), 
  (979, 'Azua', 61, NULL), 
  (980, 'Bahoruco', 61, NULL), 
  (981, 'Barahona', 61, NULL), 
  (982, 'Dajabon', 61, NULL), 
  (
    983, 'Distrito Nacional', 61, NULL
  ), 
  (984, 'Duarte', 61, NULL), 
  (985, 'El Seybo', 61, NULL), 
  (986, 'Elias Pina', 61, NULL), 
  (987, 'Espaillat', 61, NULL), 
  (988, 'Hato Mayor', 61, NULL), 
  (989, 'Independencia', 61, NULL), 
  (990, 'La Altagracia', 61, NULL), 
  (991, 'La Romana', 61, NULL), 
  (992, 'La Vega', 61, NULL), 
  (
    993, 'Maria Trinidad Sanchez', 61, 
    NULL
  ), 
  (994, 'Monsenor Nouel', 61, NULL), 
  (995, 'Monte Cristi', 61, NULL), 
  (996, 'Monte Plata', 61, NULL), 
  (997, 'Pedernales', 61, NULL), 
  (998, 'Peravia', 61, NULL), 
  (999, 'Puerto Plata', 61, NULL), 
  (1000, 'Salcedo', 61, NULL), 
  (1001, 'Samana', 61, NULL), 
  (1002, 'San Cristobal', 61, NULL), 
  (1003, 'San Juan', 61, NULL), 
  (
    1004, 'San Pedro de Macoris', 61, 
    NULL
  ), 
  (1005, 'Sanchez Ramirez', 61, NULL), 
  (1006, 'Santiago', 61, NULL), 
  (
    1007, 'Santiago Rodriguez', 61, NULL
  ), 
  (1008, 'Valverde', 61, NULL), 
  (1009, 'Aileu', 62, NULL), 
  (1010, 'Ainaro', 62, NULL), 
  (1011, 'Ambeno', 62, NULL), 
  (1012, 'Baucau', 62, NULL), 
  (1013, 'Bobonaro', 62, NULL), 
  (1014, 'Cova Lima', 62, NULL), 
  (1015, 'Dili', 62, NULL), 
  (1016, 'Ermera', 62, NULL), 
  (1017, 'Lautem', 62, NULL), 
  (1018, 'Liquica', 62, NULL), 
  (1019, 'Manatuto', 62, NULL), 
  (1020, 'Manufahi', 62, NULL), 
  (1021, 'Viqueque', 62, NULL), 
  (1022, 'Azuay', 63, NULL), 
  (1023, 'Bolivar', 63, NULL), 
  (1024, 'Canar', 63, NULL), 
  (1025, 'Carchi', 63, NULL), 
  (1026, 'Chimborazo', 63, NULL), 
  (1027, 'Cotopaxi', 63, NULL), 
  (1028, 'El Oro', 63, NULL), 
  (1029, 'Esmeraldas', 63, NULL), 
  (1030, 'Galapagos', 63, NULL), 
  (1031, 'Guayas', 63, NULL), 
  (1032, 'Imbabura', 63, NULL), 
  (1033, 'Loja', 63, NULL), 
  (1034, 'Los Rios', 63, NULL), 
  (1035, 'Manabi', 63, NULL), 
  (1036, 'Morona Santiago', 63, NULL), 
  (1037, 'Napo', 63, NULL), 
  (1038, 'Orellana', 63, NULL), 
  (1039, 'Pastaza', 63, NULL), 
  (1040, 'Pichincha', 63, NULL), 
  (1041, 'Sucumbios', 63, NULL), 
  (1042, 'Tungurahua', 63, NULL), 
  (
    1043, 'Zamora Chinchipe', 63, NULL
  ), 
  (1044, 'Aswan', 64, NULL), 
  (1045, 'Asyut', 64, NULL), 
  (1046, 'Bani Suwayf', 64, NULL), 
  (1047, 'Bur Sa\'id', 64, NULL), 
  (1048, 'Cairo', 64, NULL), 
  (1049, 'Dumyat', 64, NULL), 
  (1050, 'Kafr-ash-Shaykh', 64, NULL), 
  (1051, 'Matruh', 64, NULL), 
  (
    1052, 'Muhafazat ad Daqahliyah', 
    64, NULL
  ), 
  (
    1053, 'Muhafazat al Fayyum', 64, NULL
  ), 
  (
    1054, 'Muhafazat al Gharbiyah', 64, 
    NULL
  ), 
  (
    1055, 'Muhafazat al Iskandariyah', 
    64, NULL
  ), 
  (
    1056, 'Muhafazat al Qahirah', 64, 
    NULL
  ), 
  (1057, 'Qina', 64, NULL), 
  (1058, 'Sawhaj', 64, NULL), 
  (
    1059, 'Sina al-Janubiyah', 64, NULL
  ), 
  (
    1060, 'Sina ash-Shamaliyah', 64, NULL
  ), 
  (1061, 'ad-Daqahliyah', 64, NULL), 
  (
    1062, 'al-Bahr-al-Ahmar', 64, NULL
  ), 
  (1063, 'al-Buhayrah', 64, NULL), 
  (1064, 'al-Fayyum', 64, NULL), 
  (1065, 'al-Gharbiyah', 64, NULL), 
  (1066, 'al-Iskandariyah', 64, NULL), 
  (1067, 'al-Ismailiyah', 64, NULL), 
  (1068, 'al-Jizah', 64, NULL), 
  (1069, 'al-Minufiyah', 64, NULL), 
  (1070, 'al-Minya', 64, NULL), 
  (1071, 'al-Qahira', 64, NULL), 
  (1072, 'al-Qalyubiyah', 64, NULL), 
  (1073, 'al-Uqsur', 64, NULL), 
  (
    1074, 'al-Wadi al-Jadid', 64, NULL
  ), 
  (1075, 'as-Suways', 64, NULL), 
  (1076, 'ash-Sharqiyah', 64, NULL), 
  (1077, 'Ahuachapan', 65, NULL), 
  (1078, 'Cabanas', 65, NULL), 
  (1079, 'Chalatenango', 65, NULL), 
  (1080, 'Cuscatlan', 65, NULL), 
  (1081, 'La Libertad', 65, NULL), 
  (1082, 'La Paz', 65, NULL), 
  (1083, 'La Union', 65, NULL), 
  (1084, 'Morazan', 65, NULL), 
  (1085, 'San Miguel', 65, NULL), 
  (1086, 'San Salvador', 65, NULL), 
  (1087, 'San Vicente', 65, NULL), 
  (1088, 'Santa Ana', 65, NULL), 
  (1089, 'Sonsonate', 65, NULL), 
  (1090, 'Usulutan', 65, NULL), 
  (1091, 'Annobon', 66, NULL), 
  (1092, 'Bioko Norte', 66, NULL), 
  (1093, 'Bioko Sur', 66, NULL), 
  (1094, 'Centro Sur', 66, NULL), 
  (1095, 'Kie-Ntem', 66, NULL), 
  (1096, 'Litoral', 66, NULL), 
  (1097, 'Wele-Nzas', 66, NULL), 
  (1098, 'Anseba', 67, NULL), 
  (1099, 'Debub', 67, NULL), 
  (
    1100, 'Debub-Keih-Bahri', 67, NULL
  ), 
  (1101, 'Gash-Barka', 67, NULL), 
  (1102, 'Maekel', 67, NULL), 
  (
    1103, 'Semien-Keih-Bahri', 67, NULL
  ), 
  (1104, 'Harju', 68, NULL), 
  (1105, 'Hiiu', 68, NULL), 
  (1106, 'Ida-Viru', 68, NULL), 
  (1107, 'Jarva', 68, NULL), 
  (1108, 'Jogeva', 68, NULL), 
  (1109, 'Laane', 68, NULL), 
  (1110, 'Laane-Viru', 68, NULL), 
  (1111, 'Parnu', 68, NULL), 
  (1112, 'Polva', 68, NULL), 
  (1113, 'Rapla', 68, NULL), 
  (1114, 'Saare', 68, NULL), 
  (1115, 'Tartu', 68, NULL), 
  (1116, 'Valga', 68, NULL), 
  (1117, 'Viljandi', 68, NULL), 
  (1118, 'Voru', 68, NULL), 
  (1119, 'Addis Abeba', 69, NULL), 
  (1120, 'Afar', 69, NULL), 
  (1121, 'Amhara', 69, NULL), 
  (1122, 'Benishangul', 69, NULL), 
  (1123, 'Diredawa', 69, NULL), 
  (1124, 'Gambella', 69, NULL), 
  (1125, 'Harar', 69, NULL), 
  (1126, 'Jigjiga', 69, NULL), 
  (1127, 'Mekele', 69, NULL), 
  (1128, 'Oromia', 69, NULL), 
  (1129, 'Somali', 69, NULL), 
  (1130, 'Southern', 69, NULL), 
  (1131, 'Tigray', 69, NULL), 
  (
    1132, 'Christmas Island', 70, NULL
  ), 
  (1133, 'Cocos Islands', 70, NULL), 
  (
    1134, 'Coral Sea Islands', 70, NULL
  ), 
  (
    1135, 'Falkland Islands', 71, NULL
  ), 
  (1136, 'South Georgia', 71, NULL), 
  (1137, 'Klaksvik', 72, NULL), 
  (
    1138, 'Nor ara Eysturoy', 72, NULL
  ), 
  (1139, 'Nor oy', 72, NULL), 
  (1140, 'Sandoy', 72, NULL), 
  (1141, 'Streymoy', 72, NULL), 
  (1142, 'Su uroy', 72, NULL), 
  (1143, 'Sy ra Eysturoy', 72, NULL), 
  (1144, 'Torshavn', 72, NULL), 
  (1145, 'Vaga', 72, NULL), 
  (1146, 'Central', 73, NULL), 
  (1147, 'Eastern', 73, NULL), 
  (1148, 'Northern', 73, NULL), 
  (1149, 'South Pacific', 73, NULL), 
  (1150, 'Western', 73, NULL), 
  (1151, 'Ahvenanmaa', 74, NULL), 
  (1152, 'Etela-Karjala', 74, NULL), 
  (1153, 'Etela-Pohjanmaa', 74, NULL), 
  (1154, 'Etela-Savo', 74, NULL), 
  (
    1155, 'Etela-Suomen Laani', 74, NULL
  ), 
  (
    1156, 'Ita-Suomen Laani', 74, NULL
  ), 
  (1157, 'Ita-Uusimaa', 74, NULL), 
  (1158, 'Kainuu', 74, NULL), 
  (1159, 'Kanta-Hame', 74, NULL), 
  (1160, 'Keski-Pohjanmaa', 74, NULL), 
  (1161, 'Keski-Suomi', 74, NULL), 
  (1162, 'Kymenlaakso', 74, NULL), 
  (
    1163, 'Lansi-Suomen Laani', 74, NULL
  ), 
  (1164, 'Lappi', 74, NULL), 
  (
    1165, 'Northern Savonia', 74, NULL
  ), 
  (1166, 'Ostrobothnia', 74, NULL), 
  (1167, 'Oulun Laani', 74, NULL), 
  (1168, 'Paijat-Hame', 74, NULL), 
  (1169, 'Pirkanmaa', 74, NULL), 
  (1170, 'Pohjanmaa', 74, NULL), 
  (1171, 'Pohjois-Karjala', 74, NULL), 
  (
    1172, 'Pohjois-Pohjanmaa', 74, NULL
  ), 
  (1173, 'Pohjois-Savo', 74, NULL), 
  (1174, 'Saarijarvi', 74, NULL), 
  (1175, 'Satakunta', 74, NULL), 
  (
    1176, 'Southern Savonia', 74, NULL
  ), 
  (1177, 'Tavastia Proper', 74, NULL), 
  (1178, 'Uleaborgs Lan', 74, NULL), 
  (1179, 'Uusimaa', 74, NULL), 
  (1180, 'Varsinais-Suomi', 74, NULL), 
  (1181, 'Ain', 75, NULL), 
  (1182, 'Aisne', 75, NULL), 
  (
    1183, 'Albi Le Sequestre', 75, NULL
  ), 
  (1184, 'Allier', 75, NULL), 
  (
    1185, 'Alpes-Cote dAzur', 75, NULL
  ), 
  (1186, 'Alpes-Maritimes', 75, NULL), 
  (
    1187, 'Alpes-de-Haute-Provence', 
    75, NULL
  ), 
  (1188, 'Alsace', 75, NULL), 
  (1189, 'Aquitaine', 75, NULL), 
  (1190, 'Ardeche', 75, NULL), 
  (1191, 'Ardennes', 75, NULL), 
  (1192, 'Ariege', 75, NULL), 
  (1193, 'Aube', 75, NULL), 
  (1194, 'Aude', 75, NULL), 
  (1195, 'Auvergne', 75, NULL), 
  (1196, 'Aveyron', 75, NULL), 
  (1197, 'Bas-Rhin', 75, NULL), 
  (1198, 'Basse-Normandie', 75, NULL), 
  (
    1199, 'Bouches-du-Rhone', 75, NULL
  ), 
  (1200, 'Bourgogne', 75, NULL), 
  (1201, 'Bretagne', 75, NULL), 
  (1202, 'Brittany', 75, NULL), 
  (1203, 'Burgundy', 75, NULL), 
  (1204, 'Calvados', 75, NULL), 
  (1205, 'Cantal', 75, NULL), 
  (1206, 'Cedex', 75, NULL), 
  (1207, 'Centre', 75, NULL), 
  (1208, 'Charente', 75, NULL), 
  (
    1209, 'Charente-Maritime', 75, NULL
  ), 
  (1210, 'Cher', 75, NULL), 
  (1211, 'Correze', 75, NULL), 
  (1212, 'Corse-du-Sud', 75, NULL), 
  (1213, 'Cote-d\'Or', 75, NULL), 
  (1214, 'Cotes-d\'Armor', 75, NULL), 
  (1215, 'Creuse', 75, NULL), 
  (1216, 'Crolles', 75, NULL), 
  (1217, 'Deux-Sevres', 75, NULL), 
  (1218, 'Dordogne', 75, NULL), 
  (1219, 'Doubs', 75, NULL), 
  (1220, 'Drome', 75, NULL), 
  (1221, 'Essonne', 75, NULL), 
  (1222, 'Eure', 75, NULL), 
  (1223, 'Eure-et-Loir', 75, NULL), 
  (1224, 'Feucherolles', 75, NULL), 
  (1225, 'Finistere', 75, NULL), 
  (1226, 'Franche-Comte', 75, NULL), 
  (1227, 'Gard', 75, NULL), 
  (1228, 'Gers', 75, NULL), 
  (1229, 'Gironde', 75, NULL), 
  (1230, 'Haut-Rhin', 75, NULL), 
  (1231, 'Haute-Corse', 75, NULL), 
  (1232, 'Haute-Garonne', 75, NULL), 
  (1233, 'Haute-Loire', 75, NULL), 
  (1234, 'Haute-Marne', 75, NULL), 
  (1235, 'Haute-Saone', 75, NULL), 
  (1236, 'Haute-Savoie', 75, NULL), 
  (1237, 'Haute-Vienne', 75, NULL), 
  (1238, 'Hautes-Alpes', 75, NULL), 
  (1239, 'Hautes-Pyrenees', 75, NULL), 
  (1240, 'Hauts-de-Seine', 75, NULL), 
  (1241, 'Herault', 75, NULL), 
  (1242, 'Ile-de-France', 75, NULL), 
  (1243, 'Ille-et-Vilaine', 75, NULL), 
  (1244, 'Indre', 75, NULL), 
  (1245, 'Indre-et-Loire', 75, NULL), 
  (1246, 'Isere', 75, NULL), 
  (1247, 'Jura', 75, NULL), 
  (1248, 'Klagenfurt', 75, NULL), 
  (1249, 'Landes', 75, NULL), 
  (
    1250, 'Languedoc-Roussillon', 75, 
    NULL
  ), 
  (1251, 'Larcay', 75, NULL), 
  (1252, 'Le Castellet', 75, NULL), 
  (1253, 'Le Creusot', 75, NULL), 
  (1254, 'Limousin', 75, NULL), 
  (1255, 'Loir-et-Cher', 75, NULL), 
  (1256, 'Loire', 75, NULL), 
  (
    1257, 'Loire-Atlantique', 75, NULL
  ), 
  (1258, 'Loiret', 75, NULL), 
  (1259, 'Lorraine', 75, NULL), 
  (1260, 'Lot', 75, NULL), 
  (1261, 'Lot-et-Garonne', 75, NULL), 
  (1262, 'Lower Normandy', 75, NULL), 
  (1263, 'Lozere', 75, NULL), 
  (1264, 'Maine-et-Loire', 75, NULL), 
  (1265, 'Manche', 75, NULL), 
  (1266, 'Marne', 75, NULL), 
  (1267, 'Mayenne', 75, NULL), 
  (
    1268, 'Meurthe-et-Moselle', 75, NULL
  ), 
  (1269, 'Meuse', 75, NULL), 
  (1270, 'Midi-Pyrenees', 75, NULL), 
  (1271, 'Morbihan', 75, NULL), 
  (1272, 'Moselle', 75, NULL), 
  (1273, 'Nievre', 75, NULL), 
  (1274, 'Nord', 75, NULL), 
  (
    1275, 'Nord-Pas-de-Calais', 75, NULL
  ), 
  (1276, 'Oise', 75, NULL), 
  (1277, 'Orne', 75, NULL), 
  (1278, 'Paris', 75, NULL), 
  (1279, 'Pas-de-Calais', 75, NULL), 
  (
    1280, 'Pays de la Loire', 75, NULL
  ), 
  (
    1281, 'Pays-de-la-Loire', 75, NULL
  ), 
  (1282, 'Picardy', 75, NULL), 
  (1283, 'Puy-de-Dome', 75, NULL), 
  (
    1284, 'Pyrenees-Atlantiques', 75, 
    NULL
  ), 
  (
    1285, 'Pyrenees-Orientales', 75, NULL
  ), 
  (1286, 'Quelmes', 75, NULL), 
  (1287, 'Rhone', 75, NULL), 
  (1288, 'Rhone-Alpes', 75, NULL), 
  (1289, 'Saint Ouen', 75, NULL), 
  (1290, 'Saint Viatre', 75, NULL), 
  (1291, 'Saone-et-Loire', 75, NULL), 
  (1292, 'Sarthe', 75, NULL), 
  (1293, 'Savoie', 75, NULL), 
  (1294, 'Seine-Maritime', 75, NULL), 
  (
    1295, 'Seine-Saint-Denis', 75, NULL
  ), 
  (1296, 'Seine-et-Marne', 75, NULL), 
  (1297, 'Somme', 75, NULL), 
  (
    1298, 'Sophia Antipolis', 75, NULL
  ), 
  (1299, 'Souvans', 75, NULL), 
  (1300, 'Tarn', 75, NULL), 
  (1301, 'Tarn-et-Garonne', 75, NULL), 
  (
    1302, 'Territoire de Belfort', 75, 
    NULL
  ), 
  (1303, 'Treignac', 75, NULL), 
  (1304, 'Upper Normandy', 75, NULL), 
  (1305, 'Val-d\'Oise', 75, NULL), 
  (1306, 'Val-de-Marne', 75, NULL), 
  (1307, 'Var', 75, NULL), 
  (1308, 'Vaucluse', 75, NULL), 
  (1309, 'Vellise', 75, NULL), 
  (1310, 'Vendee', 75, NULL), 
  (1311, 'Vienne', 75, NULL), 
  (1312, 'Vosges', 75, NULL), 
  (1313, 'Yonne', 75, NULL), 
  (1314, 'Yvelines', 75, NULL), 
  (1315, 'Cayenne', 76, NULL), 
  (
    1316, 'Saint-Laurent-du-Maroni', 
    76, NULL
  ), 
  (1317, 'Iles du Vent', 77, NULL), 
  (
    1318, 'Iles sous le Vent', 77, NULL
  ), 
  (1319, 'Marquesas', 77, NULL), 
  (1320, 'Tuamotu', 77, NULL), 
  (1321, 'Tubuai', 77, NULL), 
  (1322, 'Amsterdam', 78, NULL), 
  (1323, 'Crozet Islands', 78, NULL), 
  (1324, 'Kerguelen', 78, NULL), 
  (1325, 'Estuaire', 79, NULL), 
  (1326, 'Haut-Ogooue', 79, NULL), 
  (1327, 'Moyen-Ogooue', 79, NULL), 
  (1328, 'Ngounie', 79, NULL), 
  (1329, 'Nyanga', 79, NULL), 
  (1330, 'Ogooue-Ivindo', 79, NULL), 
  (1331, 'Ogooue-Lolo', 79, NULL), 
  (1332, 'Ogooue-Maritime', 79, NULL), 
  (1333, 'Woleu-Ntem', 79, NULL), 
  (1334, 'Banjul', 80, NULL), 
  (1335, 'Basse', 80, NULL), 
  (1336, 'Brikama', 80, NULL), 
  (1337, 'Janjanbureh', 80, NULL), 
  (1338, 'Kanifing', 80, NULL), 
  (1339, 'Kerewan', 80, NULL), 
  (1340, 'Kuntaur', 80, NULL), 
  (1341, 'Mansakonko', 80, NULL), 
  (1342, 'Abhasia', 81, NULL), 
  (1343, 'Ajaria', 81, NULL), 
  (1344, 'Guria', 81, NULL), 
  (1345, 'Imereti', 81, NULL), 
  (1346, 'Kaheti', 81, NULL), 
  (1347, 'Kvemo Kartli', 81, NULL), 
  (1348, 'Mcheta-Mtianeti', 81, NULL), 
  (1349, 'Racha', 81, NULL), 
  (
    1350, 'Samagrelo-Zemo Svaneti', 81, 
    NULL
  ), 
  (
    1351, 'Samche-Zhavaheti', 81, NULL
  ), 
  (1352, 'Shida Kartli', 81, NULL), 
  (1353, 'Tbilisi', 81, NULL), 
  (1354, 'Auvergne', 82, NULL), 
  (
    1355, 'Baden-Wurttemberg', 82, NULL
  ), 
  (1356, 'Bavaria', 82, NULL), 
  (1357, 'Bayern', 82, NULL), 
  (1358, 'Beilstein Wurtt', 82, NULL), 
  (1359, 'Berlin', 82, NULL), 
  (1360, 'Brandenburg', 82, NULL), 
  (1361, 'Bremen', 82, NULL), 
  (1362, 'Dreisbach', 82, NULL), 
  (
    1363, 'Freistaat Bayern', 82, NULL
  ), 
  (1364, 'Hamburg', 82, NULL), 
  (1365, 'Hannover', 82, NULL), 
  (1366, 'Heroldstatt', 82, NULL), 
  (1367, 'Hessen', 82, NULL), 
  (1368, 'Kortenberg', 82, NULL), 
  (1369, 'Laasdorf', 82, NULL), 
  (
    1370, 'Land Baden-Wurttemberg', 82, 
    NULL
  ), 
  (1371, 'Land Bayern', 82, NULL), 
  (
    1372, 'Land Brandenburg', 82, NULL
  ), 
  (1373, 'Land Hessen', 82, NULL), 
  (
    1374, 'Land Mecklenburg-Vorpommern', 
    82, NULL
  ), 
  (
    1375, 'Land Nordrhein-Westfalen', 
    82, NULL
  ), 
  (
    1376, 'Land Rheinland-Pfalz', 82, 
    NULL
  ), 
  (1377, 'Land Sachsen', 82, NULL), 
  (
    1378, 'Land Sachsen-Anhalt', 82, NULL
  ), 
  (1379, 'Land Thuringen', 82, NULL), 
  (1380, 'Lower Saxony', 82, NULL), 
  (
    1381, 'Mecklenburg-Vorpommern', 82, 
    NULL
  ), 
  (1382, 'Mulfingen', 82, NULL), 
  (1383, 'Munich', 82, NULL), 
  (1384, 'Neubeuern', 82, NULL), 
  (1385, 'Niedersachsen', 82, NULL), 
  (1386, 'Noord-Holland', 82, NULL), 
  (
    1387, 'Nordrhein-Westfalen', 82, NULL
  ), 
  (
    1388, 'North Rhine-Westphalia', 82, 
    NULL
  ), 
  (1389, 'Osterode', 82, NULL), 
  (1390, 'Rheinland-Pfalz', 82, NULL), 
  (
    1391, 'Rhineland-Palatinate', 82, 
    NULL
  ), 
  (1392, 'Saarland', 82, NULL), 
  (1393, 'Sachsen', 82, NULL), 
  (1394, 'Sachsen-Anhalt', 82, NULL), 
  (1395, 'Saxony', 82, NULL), 
  (
    1396, 'Schleswig-Holstein', 82, NULL
  ), 
  (1397, 'Thuringia', 82, NULL), 
  (1398, 'Webling', 82, NULL), 
  (1399, 'Weinstrabe', 82, NULL), 
  (1400, 'schlobborn', 82, NULL), 
  (1401, 'Ashanti', 83, NULL), 
  (1402, 'Brong-Ahafo', 83, NULL), 
  (1403, 'Central', 83, NULL), 
  (1404, 'Eastern', 83, NULL), 
  (1405, 'Greater Accra', 83, NULL), 
  (1406, 'Northern', 83, NULL), 
  (1407, 'Upper East', 83, NULL), 
  (1408, 'Upper West', 83, NULL), 
  (1409, 'Volta', 83, NULL), 
  (1410, 'Western', 83, NULL), 
  (1411, 'Gibraltar', 84, NULL), 
  (1412, 'Acharnes', 85, NULL), 
  (1413, 'Ahaia', 85, NULL), 
  (
    1414, 'Aitolia kai Akarnania', 85, 
    NULL
  ), 
  (1415, 'Argolis', 85, NULL), 
  (1416, 'Arkadia', 85, NULL), 
  (1417, 'Arta', 85, NULL), 
  (1418, 'Attica', 85, NULL), 
  (1419, 'Attiki', 85, NULL), 
  (1420, 'Ayion Oros', 85, NULL), 
  (1421, 'Crete', 85, NULL), 
  (1422, 'Dodekanisos', 85, NULL), 
  (1423, 'Drama', 85, NULL), 
  (1424, 'Evia', 85, NULL), 
  (1425, 'Evritania', 85, NULL), 
  (1426, 'Evros', 85, NULL), 
  (1427, 'Evvoia', 85, NULL), 
  (1428, 'Florina', 85, NULL), 
  (1429, 'Fokis', 85, NULL), 
  (1430, 'Fthiotis', 85, NULL), 
  (1431, 'Grevena', 85, NULL), 
  (1432, 'Halandri', 85, NULL), 
  (1433, 'Halkidiki', 85, NULL), 
  (1434, 'Hania', 85, NULL), 
  (1435, 'Heraklion', 85, NULL), 
  (1436, 'Hios', 85, NULL), 
  (1437, 'Ilia', 85, NULL), 
  (1438, 'Imathia', 85, NULL), 
  (1439, 'Ioannina', 85, NULL), 
  (1440, 'Iraklion', 85, NULL), 
  (1441, 'Karditsa', 85, NULL), 
  (1442, 'Kastoria', 85, NULL), 
  (1443, 'Kavala', 85, NULL), 
  (1444, 'Kefallinia', 85, NULL), 
  (1445, 'Kerkira', 85, NULL), 
  (1446, 'Kiklades', 85, NULL), 
  (1447, 'Kilkis', 85, NULL), 
  (1448, 'Korinthia', 85, NULL), 
  (1449, 'Kozani', 85, NULL), 
  (1450, 'Lakonia', 85, NULL), 
  (1451, 'Larisa', 85, NULL), 
  (1452, 'Lasithi', 85, NULL), 
  (1453, 'Lesvos', 85, NULL), 
  (1454, 'Levkas', 85, NULL), 
  (1455, 'Magnisia', 85, NULL), 
  (1456, 'Messinia', 85, NULL), 
  (1457, 'Nomos Attikis', 85, NULL), 
  (1458, 'Nomos Zakynthou', 85, NULL), 
  (1459, 'Pella', 85, NULL), 
  (1460, 'Pieria', 85, NULL), 
  (1461, 'Piraios', 85, NULL), 
  (1462, 'Preveza', 85, NULL), 
  (1463, 'Rethimni', 85, NULL), 
  (1464, 'Rodopi', 85, NULL), 
  (1465, 'Samos', 85, NULL), 
  (1466, 'Serrai', 85, NULL), 
  (1467, 'Thesprotia', 85, NULL), 
  (1468, 'Thessaloniki', 85, NULL), 
  (1469, 'Trikala', 85, NULL), 
  (1470, 'Voiotia', 85, NULL), 
  (1471, 'West Greece', 85, NULL), 
  (1472, 'Xanthi', 85, NULL), 
  (1473, 'Zakinthos', 85, NULL), 
  (1474, 'Aasiaat', 86, NULL), 
  (1475, 'Ammassalik', 86, NULL), 
  (
    1476, 'Illoqqortoormiut', 86, NULL
  ), 
  (1477, 'Ilulissat', 86, NULL), 
  (1478, 'Ivittuut', 86, NULL), 
  (1479, 'Kangaatsiaq', 86, NULL), 
  (1480, 'Maniitsoq', 86, NULL), 
  (1481, 'Nanortalik', 86, NULL), 
  (1482, 'Narsaq', 86, NULL), 
  (1483, 'Nuuk', 86, NULL), 
  (1484, 'Paamiut', 86, NULL), 
  (1485, 'Qaanaaq', 86, NULL), 
  (1486, 'Qaqortoq', 86, NULL), 
  (1487, 'Qasigiannguit', 86, NULL), 
  (1488, 'Qeqertarsuaq', 86, NULL), 
  (1489, 'Sisimiut', 86, NULL), 
  (
    1490, 'Udenfor kommunal inddeling', 
    86, NULL
  ), 
  (1491, 'Upernavik', 86, NULL), 
  (1492, 'Uummannaq', 86, NULL), 
  (
    1493, 'Carriacou-Petite Martinique', 
    87, NULL
  ), 
  (1494, 'Saint Andrew', 87, NULL), 
  (1495, 'Saint Davids', 87, NULL), 
  (1496, 'Saint George\'s', 87, NULL), 
  (1497, 'Saint John', 87, NULL), 
  (1498, 'Saint Mark', 87, NULL), 
  (1499, 'Saint Patrick', 87, NULL), 
  (1500, 'Basse-Terre', 88, NULL), 
  (1501, 'Grande-Terre', 88, NULL), 
  (
    1502, 'Iles des Saintes', 88, NULL
  ), 
  (1503, 'La Desirade', 88, NULL), 
  (1504, 'Marie-Galante', 88, NULL), 
  (
    1505, 'Saint Barthelemy', 88, NULL
  ), 
  (1506, 'Saint Martin', 88, NULL), 
  (1507, 'Agana Heights', 89, NULL), 
  (1508, 'Agat', 89, NULL), 
  (1509, 'Barrigada', 89, NULL), 
  (
    1510, 'Chalan-Pago-Ordot', 89, NULL
  ), 
  (1511, 'Dededo', 89, NULL), 
  (1512, 'Hagatna', 89, NULL), 
  (1513, 'Inarajan', 89, NULL), 
  (1514, 'Mangilao', 89, NULL), 
  (1515, 'Merizo', 89, NULL), 
  (
    1516, 'Mongmong-Toto-Maite', 89, NULL
  ), 
  (1517, 'Santa Rita', 89, NULL), 
  (1518, 'Sinajana', 89, NULL), 
  (1519, 'Talofofo', 89, NULL), 
  (1520, 'Tamuning', 89, NULL), 
  (1521, 'Yigo', 89, NULL), 
  (1522, 'Yona', 89, NULL), 
  (1523, 'Alta Verapaz', 90, NULL), 
  (1524, 'Baja Verapaz', 90, NULL), 
  (1525, 'Chimaltenango', 90, NULL), 
  (1526, 'Chiquimula', 90, NULL), 
  (1527, 'El Progreso', 90, NULL), 
  (1528, 'Escuintla', 90, NULL), 
  (1529, 'Guatemala', 90, NULL), 
  (1530, 'Huehuetenango', 90, NULL), 
  (1531, 'Izabal', 90, NULL), 
  (1532, 'Jalapa', 90, NULL), 
  (1533, 'Jutiapa', 90, NULL), 
  (1534, 'Peten', 90, NULL), 
  (1535, 'Quezaltenango', 90, NULL), 
  (1536, 'Quiche', 90, NULL), 
  (1537, 'Retalhuleu', 90, NULL), 
  (1538, 'Sacatepequez', 90, NULL), 
  (1539, 'San Marcos', 90, NULL), 
  (1540, 'Santa Rosa', 90, NULL), 
  (1541, 'Solola', 90, NULL), 
  (1542, 'Suchitepequez', 90, NULL), 
  (1543, 'Totonicapan', 90, NULL), 
  (1544, 'Zacapa', 90, NULL), 
  (1545, 'Alderney', 91, NULL), 
  (1546, 'Castel', 91, NULL), 
  (1547, 'Forest', 91, NULL), 
  (1548, 'Saint Andrew', 91, NULL), 
  (1549, 'Saint Martin', 91, NULL), 
  (
    1550, 'Saint Peter Port', 91, NULL
  ), 
  (
    1551, 'Saint Pierre du Bois', 91, 
    NULL
  ), 
  (1552, 'Saint Sampson', 91, NULL), 
  (1553, 'Saint Saviour', 91, NULL), 
  (1554, 'Sark', 91, NULL), 
  (1555, 'Torteval', 91, NULL), 
  (1556, 'Vale', 91, NULL), 
  (1557, 'Beyla', 92, NULL), 
  (1558, 'Boffa', 92, NULL), 
  (1559, 'Boke', 92, NULL), 
  (1560, 'Conakry', 92, NULL), 
  (1561, 'Coyah', 92, NULL), 
  (1562, 'Dabola', 92, NULL), 
  (1563, 'Dalaba', 92, NULL), 
  (1564, 'Dinguiraye', 92, NULL), 
  (1565, 'Faranah', 92, NULL), 
  (1566, 'Forecariah', 92, NULL), 
  (1567, 'Fria', 92, NULL), 
  (1568, 'Gaoual', 92, NULL), 
  (1569, 'Gueckedou', 92, NULL), 
  (1570, 'Kankan', 92, NULL), 
  (1571, 'Kerouane', 92, NULL), 
  (1572, 'Kindia', 92, NULL), 
  (1573, 'Kissidougou', 92, NULL), 
  (1574, 'Koubia', 92, NULL), 
  (1575, 'Koundara', 92, NULL), 
  (1576, 'Kouroussa', 92, NULL), 
  (1577, 'Labe', 92, NULL), 
  (1578, 'Lola', 92, NULL), 
  (1579, 'Macenta', 92, NULL), 
  (1580, 'Mali', 92, NULL), 
  (1581, 'Mamou', 92, NULL), 
  (1582, 'Mandiana', 92, NULL), 
  (1583, 'Nzerekore', 92, NULL), 
  (1584, 'Pita', 92, NULL), 
  (1585, 'Siguiri', 92, NULL), 
  (1586, 'Telimele', 92, NULL), 
  (1587, 'Tougue', 92, NULL), 
  (1588, 'Yomou', 92, NULL), 
  (1589, 'Bafata', 93, NULL), 
  (1590, 'Bissau', 93, NULL), 
  (1591, 'Bolama', 93, NULL), 
  (1592, 'Cacheu', 93, NULL), 
  (1593, 'Gabu', 93, NULL), 
  (1594, 'Oio', 93, NULL), 
  (1595, 'Quinara', 93, NULL), 
  (1596, 'Tombali', 93, NULL), 
  (1597, 'Barima-Waini', 94, NULL), 
  (1598, 'Cuyuni-Mazaruni', 94, NULL), 
  (
    1599, 'Demerara-Mahaica', 94, NULL
  ), 
  (
    1600, 'East Berbice-Corentyne', 94, 
    NULL
  ), 
  (
    1601, 'Essequibo Islands-West Demerar', 
    94, NULL
  ), 
  (1602, 'Mahaica-Berbice', 94, NULL), 
  (
    1603, 'Pomeroon-Supenaam', 94, NULL
  ), 
  (1604, 'Potaro-Siparuni', 94, NULL), 
  (
    1605, 'Upper Demerara-Berbice', 94, 
    NULL
  ), 
  (
    1606, 'Upper Takutu-Upper Essequibo', 
    94, NULL
  ), 
  (1607, 'Artibonite', 95, NULL), 
  (1608, 'Centre', 95, NULL), 
  (1609, 'Grand\'Anse', 95, NULL), 
  (1610, 'Nord', 95, NULL), 
  (1611, 'Nord-Est', 95, NULL), 
  (1612, 'Nord-Ouest', 95, NULL), 
  (1613, 'Ouest', 95, NULL), 
  (1614, 'Sud', 95, NULL), 
  (1615, 'Sud-Est', 95, NULL), 
  (
    1616, 'Heard and McDonald Islands', 
    96, NULL
  ), 
  (1617, 'Atlantida', 97, NULL), 
  (1618, 'Choluteca', 97, NULL), 
  (1619, 'Colon', 97, NULL), 
  (1620, 'Comayagua', 97, NULL), 
  (1621, 'Copan', 97, NULL), 
  (1622, 'Cortes', 97, NULL), 
  (
    1623, 'Distrito Central', 97, NULL
  ), 
  (1624, 'El Paraiso', 97, NULL), 
  (
    1625, 'Francisco Morazan', 97, NULL
  ), 
  (1626, 'Gracias a Dios', 97, NULL), 
  (1627, 'Intibuca', 97, NULL), 
  (
    1628, 'Islas de la Bahia', 97, NULL
  ), 
  (1629, 'La Paz', 97, NULL), 
  (1630, 'Lempira', 97, NULL), 
  (1631, 'Ocotepeque', 97, NULL), 
  (1632, 'Olancho', 97, NULL), 
  (1633, 'Santa Barbara', 97, NULL), 
  (1634, 'Valle', 97, NULL), 
  (1635, 'Yoro', 97, NULL), 
  (1636, 'Hong Kong', 98, NULL), 
  (1637, 'Bacs-Kiskun', 99, NULL), 
  (1638, 'Baranya', 99, NULL), 
  (1639, 'Bekes', 99, NULL), 
  (
    1640, 'Borsod-Abauj-Zemplen', 99, 
    NULL
  ), 
  (1641, 'Budapest', 99, NULL), 
  (1642, 'Csongrad', 99, NULL), 
  (1643, 'Fejer', 99, NULL), 
  (
    1644, 'Gyor-Moson-Sopron', 99, NULL
  ), 
  (1645, 'Hajdu-Bihar', 99, NULL), 
  (1646, 'Heves', 99, NULL), 
  (
    1647, 'Jasz-Nagykun-Szolnok', 99, 
    NULL
  ), 
  (
    1648, 'Komarom-Esztergom', 99, NULL
  ), 
  (1649, 'Nograd', 99, NULL), 
  (1650, 'Pest', 99, NULL), 
  (1651, 'Somogy', 99, NULL), 
  (
    1652, 'Szabolcs-Szatmar-Bereg', 99, 
    NULL
  ), 
  (1653, 'Tolna', 99, NULL), 
  (1654, 'Vas', 99, NULL), 
  (1655, 'Veszprem', 99, NULL), 
  (1656, 'Zala', 99, NULL), 
  (1657, 'Austurland', 100, NULL), 
  (
    1658, 'Gullbringusysla', 100, NULL
  ), 
  (
    1659, 'Hofu borgarsva i', 100, NULL
  ), 
  (
    1660, 'Nor urland eystra', 100, NULL
  ), 
  (
    1661, 'Nor urland vestra', 100, NULL
  ), 
  (1662, 'Su urland', 100, NULL), 
  (1663, 'Su urnes', 100, NULL), 
  (1664, 'Vestfir ir', 100, NULL), 
  (1665, 'Vesturland', 100, NULL), 
  (1666, 'Aceh', 102, NULL), 
  (1667, 'Bali', 102, NULL), 
  (
    1668, 'Bangka-Belitung', 102, NULL
  ), 
  (1669, 'Banten', 102, NULL), 
  (1670, 'Bengkulu', 102, NULL), 
  (1671, 'Gandaria', 102, NULL), 
  (1672, 'Gorontalo', 102, NULL), 
  (1673, 'Jakarta', 102, NULL), 
  (1674, 'Jambi', 102, NULL), 
  (1675, 'Jawa Barat', 102, NULL), 
  (1676, 'Jawa Tengah', 102, NULL), 
  (1677, 'Jawa Timur', 102, NULL), 
  (
    1678, 'Kalimantan Barat', 102, NULL
  ), 
  (
    1679, 'Kalimantan Selatan', 102, NULL
  ), 
  (
    1680, 'Kalimantan Tengah', 102, NULL
  ), 
  (
    1681, 'Kalimantan Timur', 102, NULL
  ), 
  (1682, 'Kendal', 102, NULL), 
  (1683, 'Lampung', 102, NULL), 
  (1684, 'Maluku', 102, NULL), 
  (1685, 'Maluku Utara', 102, NULL), 
  (
    1686, 'Nusa Tenggara Barat', 102, 
    NULL
  ), 
  (
    1687, 'Nusa Tenggara Timur', 102, 
    NULL
  ), 
  (1688, 'Papua', 102, NULL), 
  (1689, 'Riau', 102, NULL), 
  (1690, 'Riau Kepulauan', 102, NULL), 
  (1691, 'Solo', 102, NULL), 
  (
    1692, 'Sulawesi Selatan', 102, NULL
  ), 
  (
    1693, 'Sulawesi Tengah', 102, NULL
  ), 
  (
    1694, 'Sulawesi Tenggara', 102, NULL
  ), 
  (1695, 'Sulawesi Utara', 102, NULL), 
  (1696, 'Sumatera Barat', 102, NULL), 
  (
    1697, 'Sumatera Selatan', 102, NULL
  ), 
  (1698, 'Sumatera Utara', 102, NULL), 
  (1699, 'Yogyakarta', 102, NULL), 
  (1700, 'Ardabil', 103, NULL), 
  (
    1701, 'Azarbayjan-e Bakhtari', 103, 
    NULL
  ), 
  (
    1702, 'Azarbayjan-e Khavari', 103, 
    NULL
  ), 
  (1703, 'Bushehr', 103, NULL), 
  (
    1704, 'Chahar Mahal-e Bakhtiari', 
    103, NULL
  ), 
  (1705, 'Esfahan', 103, NULL), 
  (1706, 'Fars', 103, NULL), 
  (1707, 'Gilan', 103, NULL), 
  (1708, 'Golestan', 103, NULL), 
  (1709, 'Hamadan', 103, NULL), 
  (1710, 'Hormozgan', 103, NULL), 
  (1711, 'Ilam', 103, NULL), 
  (1712, 'Kerman', 103, NULL), 
  (1713, 'Kermanshah', 103, NULL), 
  (1714, 'Khorasan', 103, NULL), 
  (1715, 'Khuzestan', 103, NULL), 
  (
    1716, 'Kohgiluyeh-e Boyerahmad', 
    103, NULL
  ), 
  (1717, 'Kordestan', 103, NULL), 
  (1718, 'Lorestan', 103, NULL), 
  (1719, 'Markazi', 103, NULL), 
  (1720, 'Mazandaran', 103, NULL), 
  (
    1721, 'Ostan-e Esfahan', 103, NULL
  ), 
  (1722, 'Qazvin', 103, NULL), 
  (1723, 'Qom', 103, NULL), 
  (1724, 'Semnan', 103, NULL), 
  (
    1725, 'Sistan-e Baluchestan', 103, 
    NULL
  ), 
  (1726, 'Tehran', 103, NULL), 
  (1727, 'Yazd', 103, NULL), 
  (1728, 'Zanjan', 103, NULL), 
  (1729, 'Babil', 104, NULL), 
  (1730, 'Baghdad', 104, NULL), 
  (1731, 'Dahuk', 104, NULL), 
  (1732, 'Dhi Qar', 104, NULL), 
  (1733, 'Diyala', 104, NULL), 
  (1734, 'Erbil', 104, NULL), 
  (1735, 'Irbil', 104, NULL);
INSERT INTO `states` (
  `id`, `name`, `country_id`, `created_by`
) 
VALUES 
  (1736, 'Karbala', 104, NULL), 
  (1737, 'Kurdistan', 104, NULL), 
  (1738, 'Maysan', 104, NULL), 
  (1739, 'Ninawa', 104, NULL), 
  (1740, 'Salah-ad-Din', 104, NULL), 
  (1741, 'Wasit', 104, NULL), 
  (1742, 'al-Anbar', 104, NULL), 
  (1743, 'al-Basrah', 104, NULL), 
  (1744, 'al-Muthanna', 104, NULL), 
  (1745, 'al-Qadisiyah', 104, NULL), 
  (1746, 'an-Najaf', 104, NULL), 
  (
    1747, 'as-Sulaymaniyah', 104, NULL
  ), 
  (1748, 'at-Ta\'mim', 104, NULL), 
  (1749, 'Armagh', 105, NULL), 
  (1750, 'Carlow', 105, NULL), 
  (1751, 'Cavan', 105, NULL), 
  (1752, 'Clare', 105, NULL), 
  (1753, 'Cork', 105, NULL), 
  (1754, 'Donegal', 105, NULL), 
  (1755, 'Dublin', 105, NULL), 
  (1756, 'Galway', 105, NULL), 
  (1757, 'Kerry', 105, NULL), 
  (1758, 'Kildare', 105, NULL), 
  (1759, 'Kilkenny', 105, NULL), 
  (1760, 'Laois', 105, NULL), 
  (1761, 'Leinster', 105, NULL), 
  (1762, 'Leitrim', 105, NULL), 
  (1763, 'Limerick', 105, NULL), 
  (1764, 'Loch Garman', 105, NULL), 
  (1765, 'Longford', 105, NULL), 
  (1766, 'Louth', 105, NULL), 
  (1767, 'Mayo', 105, NULL), 
  (1768, 'Meath', 105, NULL), 
  (1769, 'Monaghan', 105, NULL), 
  (1770, 'Offaly', 105, NULL), 
  (1771, 'Roscommon', 105, NULL), 
  (1772, 'Sligo', 105, NULL), 
  (
    1773, 'Tipperary North Riding', 105, 
    NULL
  ), 
  (
    1774, 'Tipperary South Riding', 105, 
    NULL
  ), 
  (1775, 'Ulster', 105, NULL), 
  (1776, 'Waterford', 105, NULL), 
  (1777, 'Westmeath', 105, NULL), 
  (1778, 'Wexford', 105, NULL), 
  (1779, 'Wicklow', 105, NULL), 
  (1780, 'Beit Hanania', 106, NULL), 
  (
    1781, 'Ben Gurion Airport', 106, NULL
  ), 
  (1782, 'Bethlehem', 106, NULL), 
  (1783, 'Caesarea', 106, NULL), 
  (1784, 'Centre', 106, NULL), 
  (1785, 'Gaza', 106, NULL), 
  (1786, 'Hadaron', 106, NULL), 
  (1787, 'Haifa District', 106, NULL), 
  (1788, 'Hamerkaz', 106, NULL), 
  (1789, 'Hazafon', 106, NULL), 
  (1790, 'Hebron', 106, NULL), 
  (1791, 'Jaffa', 106, NULL), 
  (1792, 'Jerusalem', 106, NULL), 
  (1793, 'Khefa', 106, NULL), 
  (1794, 'Kiryat Yam', 106, NULL), 
  (1795, 'Lower Galilee', 106, NULL), 
  (1796, 'Qalqilya', 106, NULL), 
  (1797, 'Talme Elazar', 106, NULL), 
  (1798, 'Tel Aviv', 106, NULL), 
  (1799, 'Tsafon', 106, NULL), 
  (1800, 'Umm El Fahem', 106, NULL), 
  (1801, 'Yerushalayim', 106, NULL), 
  (1802, 'Abruzzi', 107, NULL), 
  (1803, 'Abruzzo', 107, NULL), 
  (1804, 'Agrigento', 107, NULL), 
  (1805, 'Alessandria', 107, NULL), 
  (1806, 'Ancona', 107, NULL), 
  (1807, 'Arezzo', 107, NULL), 
  (1808, 'Ascoli Piceno', 107, NULL), 
  (1809, 'Asti', 107, NULL), 
  (1810, 'Avellino', 107, NULL), 
  (1811, 'Bari', 107, NULL), 
  (1812, 'Basilicata', 107, NULL), 
  (1813, 'Belluno', 107, NULL), 
  (1814, 'Benevento', 107, NULL), 
  (1815, 'Bergamo', 107, NULL), 
  (1816, 'Biella', 107, NULL), 
  (1817, 'Bologna', 107, NULL), 
  (1818, 'Bolzano', 107, NULL), 
  (1819, 'Brescia', 107, NULL), 
  (1820, 'Brindisi', 107, NULL), 
  (1821, 'Calabria', 107, NULL), 
  (1822, 'Campania', 107, NULL), 
  (1823, 'Cartoceto', 107, NULL), 
  (1824, 'Caserta', 107, NULL), 
  (1825, 'Catania', 107, NULL), 
  (1826, 'Chieti', 107, NULL), 
  (1827, 'Como', 107, NULL), 
  (1828, 'Cosenza', 107, NULL), 
  (1829, 'Cremona', 107, NULL), 
  (1830, 'Cuneo', 107, NULL), 
  (1831, 'Emilia-Romagna', 107, NULL), 
  (1832, 'Ferrara', 107, NULL), 
  (1833, 'Firenze', 107, NULL), 
  (1834, 'Florence', 107, NULL), 
  (1835, 'Forli-Cesena ', 107, NULL), 
  (
    1836, 'Friuli-Venezia Giulia', 107, 
    NULL
  ), 
  (1837, 'Frosinone', 107, NULL), 
  (1838, 'Genoa', 107, NULL), 
  (1839, 'Gorizia', 107, NULL), 
  (1840, 'L\'Aquila', 107, NULL), 
  (1841, 'Lazio', 107, NULL), 
  (1842, 'Lecce', 107, NULL), 
  (1843, 'Lecco', 107, NULL), 
  (1844, 'Lecco Province', 107, NULL), 
  (1845, 'Liguria', 107, NULL), 
  (1846, 'Lodi', 107, NULL), 
  (1847, 'Lombardia', 107, NULL), 
  (1848, 'Lombardy', 107, NULL), 
  (1849, 'Macerata', 107, NULL), 
  (1850, 'Mantova', 107, NULL), 
  (1851, 'Marche', 107, NULL), 
  (1852, 'Messina', 107, NULL), 
  (1853, 'Milan', 107, NULL), 
  (1854, 'Modena', 107, NULL), 
  (1855, 'Molise', 107, NULL), 
  (1856, 'Molteno', 107, NULL), 
  (1857, 'Montenegro', 107, NULL), 
  (
    1858, 'Monza and Brianza', 107, NULL
  ), 
  (1859, 'Naples', 107, NULL), 
  (1860, 'Novara', 107, NULL), 
  (1861, 'Padova', 107, NULL), 
  (1862, 'Parma', 107, NULL), 
  (1863, 'Pavia', 107, NULL), 
  (1864, 'Perugia', 107, NULL), 
  (1865, 'Pesaro-Urbino', 107, NULL), 
  (1866, 'Piacenza', 107, NULL), 
  (1867, 'Piedmont', 107, NULL), 
  (1868, 'Piemonte', 107, NULL), 
  (1869, 'Pisa', 107, NULL), 
  (1870, 'Pordenone', 107, NULL), 
  (1871, 'Potenza', 107, NULL), 
  (1872, 'Puglia', 107, NULL), 
  (1873, 'Reggio Emilia', 107, NULL), 
  (1874, 'Rimini', 107, NULL), 
  (1875, 'Roma', 107, NULL), 
  (1876, 'Salerno', 107, NULL), 
  (1877, 'Sardegna', 107, NULL), 
  (1878, 'Sassari', 107, NULL), 
  (1879, 'Savona', 107, NULL), 
  (1880, 'Sicilia', 107, NULL), 
  (1881, 'Siena', 107, NULL), 
  (1882, 'Sondrio', 107, NULL), 
  (1883, 'South Tyrol', 107, NULL), 
  (1884, 'Taranto', 107, NULL), 
  (1885, 'Teramo', 107, NULL), 
  (1886, 'Torino', 107, NULL), 
  (1887, 'Toscana', 107, NULL), 
  (1888, 'Trapani', 107, NULL), 
  (
    1889, 'Trentino-Alto Adige', 107, 
    NULL
  ), 
  (1890, 'Trento', 107, NULL), 
  (1891, 'Treviso', 107, NULL), 
  (1892, 'Udine', 107, NULL), 
  (1893, 'Umbria', 107, NULL), 
  (1894, 'Valle d\'Aosta', 107, NULL), 
  (1895, 'Varese', 107, NULL), 
  (1896, 'Veneto', 107, NULL), 
  (1897, 'Venezia', 107, NULL), 
  (
    1898, 'Verbano-Cusio-Ossola', 107, 
    NULL
  ), 
  (1899, 'Vercelli', 107, NULL), 
  (1900, 'Verona', 107, NULL), 
  (1901, 'Vicenza', 107, NULL), 
  (1902, 'Viterbo', 107, NULL), 
  (
    1903, 'Buxoro Viloyati', 108, NULL
  ), 
  (1904, 'Clarendon', 108, NULL), 
  (1905, 'Hanover', 108, NULL), 
  (1906, 'Kingston', 108, NULL), 
  (1907, 'Manchester', 108, NULL), 
  (1908, 'Portland', 108, NULL), 
  (1909, 'Saint Andrews', 108, NULL), 
  (1910, 'Saint Ann', 108, NULL), 
  (
    1911, 'Saint Catherine', 108, NULL
  ), 
  (
    1912, 'Saint Elizabeth', 108, NULL
  ), 
  (1913, 'Saint James', 108, NULL), 
  (1914, 'Saint Mary', 108, NULL), 
  (1915, 'Saint Thomas', 108, NULL), 
  (1916, 'Trelawney', 108, NULL), 
  (1917, 'Westmoreland', 108, NULL), 
  (1918, 'Aichi', 109, NULL), 
  (1919, 'Akita', 109, NULL), 
  (1920, 'Aomori', 109, NULL), 
  (1921, 'Chiba', 109, NULL), 
  (1922, 'Ehime', 109, NULL), 
  (1923, 'Fukui', 109, NULL), 
  (1924, 'Fukuoka', 109, NULL), 
  (1925, 'Fukushima', 109, NULL), 
  (1926, 'Gifu', 109, NULL), 
  (1927, 'Gumma', 109, NULL), 
  (1928, 'Hiroshima', 109, NULL), 
  (1929, 'Hokkaido', 109, NULL), 
  (1930, 'Hyogo', 109, NULL), 
  (1931, 'Ibaraki', 109, NULL), 
  (1932, 'Ishikawa', 109, NULL), 
  (1933, 'Iwate', 109, NULL), 
  (1934, 'Kagawa', 109, NULL), 
  (1935, 'Kagoshima', 109, NULL), 
  (1936, 'Kanagawa', 109, NULL), 
  (1937, 'Kanto', 109, NULL), 
  (1938, 'Kochi', 109, NULL), 
  (1939, 'Kumamoto', 109, NULL), 
  (1940, 'Kyoto', 109, NULL), 
  (1941, 'Mie', 109, NULL), 
  (1942, 'Miyagi', 109, NULL), 
  (1943, 'Miyazaki', 109, NULL), 
  (1944, 'Nagano', 109, NULL), 
  (1945, 'Nagasaki', 109, NULL), 
  (1946, 'Nara', 109, NULL), 
  (1947, 'Niigata', 109, NULL), 
  (1948, 'Oita', 109, NULL), 
  (1949, 'Okayama', 109, NULL), 
  (1950, 'Okinawa', 109, NULL), 
  (1951, 'Osaka', 109, NULL), 
  (1952, 'Saga', 109, NULL), 
  (1953, 'Saitama', 109, NULL), 
  (1954, 'Shiga', 109, NULL), 
  (1955, 'Shimane', 109, NULL), 
  (1956, 'Shizuoka', 109, NULL), 
  (1957, 'Tochigi', 109, NULL), 
  (1958, 'Tokushima', 109, NULL), 
  (1959, 'Tokyo', 109, NULL), 
  (1960, 'Tottori', 109, NULL), 
  (1961, 'Toyama', 109, NULL), 
  (1962, 'Wakayama', 109, NULL), 
  (1963, 'Yamagata', 109, NULL), 
  (1964, 'Yamaguchi', 109, NULL), 
  (1965, 'Yamanashi', 109, NULL), 
  (1966, 'Grouville', 110, NULL), 
  (1967, 'Saint Brelade', 110, NULL), 
  (1968, 'Saint Clement', 110, NULL), 
  (1969, 'Saint Helier', 110, NULL), 
  (1970, 'Saint John', 110, NULL), 
  (1971, 'Saint Lawrence', 110, NULL), 
  (1972, 'Saint Martin', 110, NULL), 
  (1973, 'Saint Mary', 110, NULL), 
  (1974, 'Saint Peter', 110, NULL), 
  (1975, 'Saint Saviour', 110, NULL), 
  (1976, 'Trinity', 110, NULL), 
  (1977, '\'Ajlun', 111, NULL), 
  (1978, 'Amman', 111, NULL), 
  (1979, 'Irbid', 111, NULL), 
  (1980, 'Jarash', 111, NULL), 
  (1981, 'Ma\'an', 111, NULL), 
  (1982, 'Madaba', 111, NULL), 
  (1983, 'al-\'Aqabah', 111, NULL), 
  (1984, 'al-Balqa\'', 111, NULL), 
  (1985, 'al-Karak', 111, NULL), 
  (1986, 'al-Mafraq', 111, NULL), 
  (1987, 'at-Tafilah', 111, NULL), 
  (1988, 'az-Zarqa\'', 111, NULL), 
  (1989, 'Akmecet', 112, NULL), 
  (1990, 'Akmola', 112, NULL), 
  (1991, 'Aktobe', 112, NULL), 
  (1992, 'Almati', 112, NULL), 
  (1993, 'Atirau', 112, NULL), 
  (
    1994, 'Batis Kazakstan', 112, NULL
  ), 
  (
    1995, 'Burlinsky Region', 112, NULL
  ), 
  (1996, 'Karagandi', 112, NULL), 
  (1997, 'Kostanay', 112, NULL), 
  (1998, 'Mankistau', 112, NULL), 
  (
    1999, 'Ontustik Kazakstan', 112, NULL
  ), 
  (2000, 'Pavlodar', 112, NULL), 
  (
    2001, 'Sigis Kazakstan', 112, NULL
  ), 
  (
    2002, 'Soltustik Kazakstan', 112, 
    NULL
  ), 
  (2003, 'Taraz', 112, NULL), 
  (2004, 'Central', 113, NULL), 
  (2005, 'Coast', 113, NULL), 
  (2006, 'Eastern', 113, NULL), 
  (2007, 'Nairobi', 113, NULL), 
  (2008, 'North Eastern', 113, NULL), 
  (2009, 'Nyanza', 113, NULL), 
  (2010, 'Rift Valley', 113, NULL), 
  (2011, 'Western', 113, NULL), 
  (2012, 'Abaiang', 114, NULL), 
  (2013, 'Abemana', 114, NULL), 
  (2014, 'Aranuka', 114, NULL), 
  (2015, 'Arorae', 114, NULL), 
  (2016, 'Banaba', 114, NULL), 
  (2017, 'Beru', 114, NULL), 
  (2018, 'Butaritari', 114, NULL), 
  (2019, 'Kiritimati', 114, NULL), 
  (2020, 'Kuria', 114, NULL), 
  (2021, 'Maiana', 114, NULL), 
  (2022, 'Makin', 114, NULL), 
  (2023, 'Marakei', 114, NULL), 
  (2024, 'Nikunau', 114, NULL), 
  (2025, 'Nonouti', 114, NULL), 
  (2026, 'Onotoa', 114, NULL), 
  (
    2027, 'Phoenix Islands', 114, NULL
  ), 
  (
    2028, 'Tabiteuea North', 114, NULL
  ), 
  (
    2029, 'Tabiteuea South', 114, NULL
  ), 
  (2030, 'Tabuaeran', 114, NULL), 
  (2031, 'Tamana', 114, NULL), 
  (2032, 'Tarawa North', 114, NULL), 
  (2033, 'Tarawa South', 114, NULL), 
  (2034, 'Teraina', 114, NULL), 
  (2035, 'Chagangdo', 115, NULL), 
  (2036, 'Hamgyeongbukto', 115, NULL), 
  (2037, 'Hamgyeongnamdo', 115, NULL), 
  (2038, 'Hwanghaebukto', 115, NULL), 
  (2039, 'Hwanghaenamdo', 115, NULL), 
  (2040, 'Kaeseong', 115, NULL), 
  (2041, 'Kangweon', 115, NULL), 
  (2042, 'Nampo', 115, NULL), 
  (2043, 'Pyeonganbukto', 115, NULL), 
  (2044, 'Pyeongannamdo', 115, NULL), 
  (2045, 'Pyeongyang', 115, NULL), 
  (2046, 'Yanggang', 115, NULL), 
  (2047, 'Busan', 116, NULL), 
  (2048, 'Cheju', 116, NULL), 
  (2049, 'Chollabuk', 116, NULL), 
  (2050, 'Chollanam', 116, NULL), 
  (2051, 'Chungbuk', 116, NULL), 
  (2052, 'Chungcheongbuk', 116, NULL), 
  (2053, 'Chungcheongnam', 116, NULL), 
  (2054, 'Chungnam', 116, NULL), 
  (2055, 'Daegu', 116, NULL), 
  (2056, 'Gangwon-do', 116, NULL), 
  (2057, 'Goyang-si', 116, NULL), 
  (2058, 'Gyeonggi-do', 116, NULL), 
  (2059, 'Gyeongsang ', 116, NULL), 
  (
    2060, 'Gyeongsangnam-do', 116, NULL
  ), 
  (2061, 'Incheon', 116, NULL), 
  (2062, 'Jeju-Si', 116, NULL), 
  (2063, 'Jeonbuk', 116, NULL), 
  (2064, 'Kangweon', 116, NULL), 
  (2065, 'Kwangju', 116, NULL), 
  (2066, 'Kyeonggi', 116, NULL), 
  (2067, 'Kyeongsangbuk', 116, NULL), 
  (2068, 'Kyeongsangnam', 116, NULL), 
  (2069, 'Kyonggi-do', 116, NULL), 
  (2070, 'Kyungbuk-Do', 116, NULL), 
  (2071, 'Kyunggi-Do', 116, NULL), 
  (2072, 'Kyunggi-do', 116, NULL), 
  (2073, 'Pusan', 116, NULL), 
  (2074, 'Seoul', 116, NULL), 
  (2075, 'Sudogwon', 116, NULL), 
  (2076, 'Taegu', 116, NULL), 
  (2077, 'Taejeon', 116, NULL), 
  (
    2078, 'Taejon-gwangyoksi', 116, NULL
  ), 
  (2079, 'Ulsan', 116, NULL), 
  (2080, 'Wonju', 116, NULL), 
  (2081, 'gwangyoksi', 116, NULL), 
  (2082, 'Al Asimah', 117, NULL), 
  (2083, 'Hawalli', 117, NULL), 
  (2084, 'Mishref', 117, NULL), 
  (2085, 'Qadesiya', 117, NULL), 
  (2086, 'Safat', 117, NULL), 
  (2087, 'Salmiya', 117, NULL), 
  (2088, 'al-Ahmadi', 117, NULL), 
  (2089, 'al-Farwaniyah', 117, NULL), 
  (2090, 'al-Jahra', 117, NULL), 
  (2091, 'al-Kuwayt', 117, NULL), 
  (2092, 'Batken', 118, NULL), 
  (2093, 'Bishkek', 118, NULL), 
  (2094, 'Chui', 118, NULL), 
  (2095, 'Issyk-Kul', 118, NULL), 
  (2096, 'Jalal-Abad', 118, NULL), 
  (2097, 'Naryn', 118, NULL), 
  (2098, 'Osh', 118, NULL), 
  (2099, 'Talas', 118, NULL), 
  (2100, 'Attopu', 119, NULL), 
  (2101, 'Bokeo', 119, NULL), 
  (2102, 'Bolikhamsay', 119, NULL), 
  (2103, 'Champasak', 119, NULL), 
  (2104, 'Houaphanh', 119, NULL), 
  (2105, 'Khammouane', 119, NULL), 
  (2106, 'Luang Nam Tha', 119, NULL), 
  (2107, 'Luang Prabang', 119, NULL), 
  (2108, 'Oudomxay', 119, NULL), 
  (2109, 'Phongsaly', 119, NULL), 
  (2110, 'Saravan', 119, NULL), 
  (2111, 'Savannakhet', 119, NULL), 
  (2112, 'Sekong', 119, NULL), 
  (
    2113, 'Viangchan Prefecture', 119, 
    NULL
  ), 
  (
    2114, 'Viangchan Province', 119, NULL
  ), 
  (2115, 'Xaignabury', 119, NULL), 
  (2116, 'Xiang Khuang', 119, NULL), 
  (2117, 'Aizkraukles', 120, NULL), 
  (2118, 'Aluksnes', 120, NULL), 
  (2119, 'Balvu', 120, NULL), 
  (2120, 'Bauskas', 120, NULL), 
  (2121, 'Cesu', 120, NULL), 
  (2122, 'Daugavpils', 120, NULL), 
  (
    2123, 'Daugavpils City', 120, NULL
  ), 
  (2124, 'Dobeles', 120, NULL), 
  (2125, 'Gulbenes', 120, NULL), 
  (2126, 'Jekabspils', 120, NULL), 
  (2127, 'Jelgava', 120, NULL), 
  (2128, 'Jelgavas', 120, NULL), 
  (2129, 'Jurmala City', 120, NULL), 
  (2130, 'Kraslavas', 120, NULL), 
  (2131, 'Kuldigas', 120, NULL), 
  (2132, 'Liepaja', 120, NULL), 
  (2133, 'Liepajas', 120, NULL), 
  (2134, 'Limbazhu', 120, NULL), 
  (2135, 'Ludzas', 120, NULL), 
  (2136, 'Madonas', 120, NULL), 
  (2137, 'Ogres', 120, NULL), 
  (2138, 'Preilu', 120, NULL), 
  (2139, 'Rezekne', 120, NULL), 
  (2140, 'Rezeknes', 120, NULL), 
  (2141, 'Riga', 120, NULL), 
  (2142, 'Rigas', 120, NULL), 
  (2143, 'Saldus', 120, NULL), 
  (2144, 'Talsu', 120, NULL), 
  (2145, 'Tukuma', 120, NULL), 
  (2146, 'Valkas', 120, NULL), 
  (2147, 'Valmieras', 120, NULL), 
  (2148, 'Ventspils', 120, NULL), 
  (2149, 'Ventspils City', 120, NULL), 
  (2150, 'Beirut', 121, NULL), 
  (2151, 'Jabal Lubnan', 121, NULL), 
  (
    2152, 'Mohafazat Liban-Nord', 121, 
    NULL
  ), 
  (
    2153, 'Mohafazat Mont-Liban', 121, 
    NULL
  ), 
  (2154, 'Sidon', 121, NULL), 
  (2155, 'al-Biqa', 121, NULL), 
  (2156, 'al-Janub', 121, NULL), 
  (2157, 'an-Nabatiyah', 121, NULL), 
  (2158, 'ash-Shamal', 121, NULL), 
  (2159, 'Berea', 122, NULL), 
  (2160, 'Butha-Buthe', 122, NULL), 
  (2161, 'Leribe', 122, NULL), 
  (2162, 'Mafeteng', 122, NULL), 
  (2163, 'Maseru', 122, NULL), 
  (2164, 'Mohale\'s Hoek', 122, NULL), 
  (2165, 'Mokhotlong', 122, NULL), 
  (2166, 'Qacha\'s Nek', 122, NULL), 
  (2167, 'Quthing', 122, NULL), 
  (2168, 'Thaba-Tseka', 122, NULL), 
  (2169, 'Bomi', 123, NULL), 
  (2170, 'Bong', 123, NULL), 
  (2171, 'Grand Bassa', 123, NULL), 
  (
    2172, 'Grand Cape Mount', 123, NULL
  ), 
  (2173, 'Grand Gedeh', 123, NULL), 
  (2174, 'Loffa', 123, NULL), 
  (2175, 'Margibi', 123, NULL), 
  (
    2176, 'Maryland and Grand Kru', 123, 
    NULL
  ), 
  (2177, 'Montserrado', 123, NULL), 
  (2178, 'Nimba', 123, NULL), 
  (2179, 'Rivercess', 123, NULL), 
  (2180, 'Sinoe', 123, NULL), 
  (2181, 'Ajdabiya', 124, NULL), 
  (2182, 'Fezzan', 124, NULL), 
  (2183, 'Banghazi', 124, NULL), 
  (2184, 'Darnah', 124, NULL), 
  (2185, 'Ghadamis', 124, NULL), 
  (2186, 'Gharyan', 124, NULL), 
  (2187, 'Misratah', 124, NULL), 
  (2188, 'Murzuq', 124, NULL), 
  (2189, 'Sabha', 124, NULL), 
  (2190, 'Sawfajjin', 124, NULL), 
  (2191, 'Surt', 124, NULL), 
  (2192, 'Tarabulus', 124, NULL), 
  (2193, 'Tarhunah', 124, NULL), 
  (2194, 'Tripolitania', 124, NULL), 
  (2195, 'Tubruq', 124, NULL), 
  (2196, 'Yafran', 124, NULL), 
  (2197, 'Zlitan', 124, NULL), 
  (2198, 'al-\'Aziziyah', 124, NULL), 
  (2199, 'al-Fatih', 124, NULL), 
  (
    2200, 'al-Jabal al Akhdar', 124, NULL
  ), 
  (2201, 'al-Jufrah', 124, NULL), 
  (2202, 'al-Khums', 124, NULL), 
  (2203, 'al-Kufrah', 124, NULL), 
  (
    2204, 'an-Nuqat al-Khams', 124, NULL
  ), 
  (2205, 'ash-Shati\'', 124, NULL), 
  (2206, 'az-Zawiyah', 124, NULL), 
  (2207, 'Balzers', 125, NULL), 
  (2208, 'Eschen', 125, NULL), 
  (2209, 'Gamprin', 125, NULL), 
  (2210, 'Mauren', 125, NULL), 
  (2211, 'Planken', 125, NULL), 
  (2212, 'Ruggell', 125, NULL), 
  (2213, 'Schaan', 125, NULL), 
  (2214, 'Schellenberg', 125, NULL), 
  (2215, 'Triesen', 125, NULL), 
  (2216, 'Triesenberg', 125, NULL), 
  (2217, 'Vaduz', 125, NULL), 
  (2218, 'Alytaus', 126, NULL), 
  (2219, 'Anyksciai', 126, NULL), 
  (2220, 'Kauno', 126, NULL), 
  (2221, 'Klaipedos', 126, NULL), 
  (2222, 'Marijampoles', 126, NULL), 
  (2223, 'Panevezhio', 126, NULL), 
  (2224, 'Panevezys', 126, NULL), 
  (2225, 'Shiauliu', 126, NULL), 
  (2226, 'Taurages', 126, NULL), 
  (2227, 'Telshiu', 126, NULL), 
  (2228, 'Telsiai', 126, NULL), 
  (2229, 'Utenos', 126, NULL), 
  (2230, 'Vilniaus', 126, NULL), 
  (2231, 'Capellen', 127, NULL), 
  (2232, 'Clervaux', 127, NULL), 
  (2233, 'Diekirch', 127, NULL), 
  (2234, 'Echternach', 127, NULL), 
  (
    2235, 'Esch-sur-Alzette', 127, NULL
  ), 
  (2236, 'Grevenmacher', 127, NULL), 
  (2237, 'Luxembourg', 127, NULL), 
  (2238, 'Mersch', 127, NULL), 
  (2239, 'Redange', 127, NULL), 
  (2240, 'Remich', 127, NULL), 
  (2241, 'Vianden', 127, NULL), 
  (2242, 'Wiltz', 127, NULL), 
  (2243, 'Macau', 128, NULL), 
  (2244, 'Berovo', 129, NULL), 
  (2245, 'Bitola', 129, NULL), 
  (2246, 'Brod', 129, NULL), 
  (2247, 'Debar', 129, NULL), 
  (2248, 'Delchevo', 129, NULL), 
  (2249, 'Demir Hisar', 129, NULL), 
  (2250, 'Gevgelija', 129, NULL), 
  (2251, 'Gostivar', 129, NULL), 
  (2252, 'Kavadarci', 129, NULL), 
  (2253, 'Kichevo', 129, NULL), 
  (2254, 'Kochani', 129, NULL), 
  (2255, 'Kratovo', 129, NULL), 
  (2256, 'Kriva Palanka', 129, NULL), 
  (2257, 'Krushevo', 129, NULL), 
  (2258, 'Kumanovo', 129, NULL), 
  (2259, 'Negotino', 129, NULL), 
  (2260, 'Ohrid', 129, NULL), 
  (2261, 'Prilep', 129, NULL), 
  (2262, 'Probishtip', 129, NULL), 
  (2263, 'Radovish', 129, NULL), 
  (2264, 'Resen', 129, NULL), 
  (2265, 'Shtip', 129, NULL), 
  (2266, 'Skopje', 129, NULL), 
  (2267, 'Struga', 129, NULL), 
  (2268, 'Strumica', 129, NULL), 
  (2269, 'Sveti Nikole', 129, NULL), 
  (2270, 'Tetovo', 129, NULL), 
  (2271, 'Valandovo', 129, NULL), 
  (2272, 'Veles', 129, NULL), 
  (2273, 'Vinica', 129, NULL), 
  (2274, 'Antananarivo', 130, NULL), 
  (2275, 'Antsiranana', 130, NULL), 
  (2276, 'Fianarantsoa', 130, NULL), 
  (2277, 'Mahajanga', 130, NULL), 
  (2278, 'Toamasina', 130, NULL), 
  (2279, 'Toliary', 130, NULL), 
  (2280, 'Balaka', 131, NULL), 
  (2281, 'Blantyre City', 131, NULL), 
  (2282, 'Chikwawa', 131, NULL), 
  (2283, 'Chiradzulu', 131, NULL), 
  (2284, 'Chitipa', 131, NULL), 
  (2285, 'Dedza', 131, NULL), 
  (2286, 'Dowa', 131, NULL), 
  (2287, 'Karonga', 131, NULL), 
  (2288, 'Kasungu', 131, NULL), 
  (2289, 'Lilongwe City', 131, NULL), 
  (2290, 'Machinga', 131, NULL), 
  (2291, 'Mangochi', 131, NULL), 
  (2292, 'Mchinji', 131, NULL), 
  (2293, 'Mulanje', 131, NULL), 
  (2294, 'Mwanza', 131, NULL), 
  (2295, 'Mzimba', 131, NULL), 
  (2296, 'Mzuzu City', 131, NULL), 
  (2297, 'Nkhata Bay', 131, NULL), 
  (2298, 'Nkhotakota', 131, NULL), 
  (2299, 'Nsanje', 131, NULL), 
  (2300, 'Ntcheu', 131, NULL), 
  (2301, 'Ntchisi', 131, NULL), 
  (2302, 'Phalombe', 131, NULL), 
  (2303, 'Rumphi', 131, NULL), 
  (2304, 'Salima', 131, NULL), 
  (2305, 'Thyolo', 131, NULL), 
  (
    2306, 'Zomba Municipality', 131, NULL
  ), 
  (2307, 'Johor', 132, NULL), 
  (2308, 'Kedah', 132, NULL), 
  (2309, 'Kelantan', 132, NULL), 
  (2310, 'Kuala Lumpur', 132, NULL), 
  (2311, 'Labuan', 132, NULL), 
  (2312, 'Melaka', 132, NULL), 
  (2313, 'Negeri Johor', 132, NULL), 
  (
    2314, 'Negeri Sembilan', 132, NULL
  ), 
  (2315, 'Pahang', 132, NULL), 
  (2316, 'Penang', 132, NULL), 
  (2317, 'Perak', 132, NULL), 
  (2318, 'Perlis', 132, NULL), 
  (2319, 'Pulau Pinang', 132, NULL), 
  (2320, 'Sabah', 132, NULL), 
  (2321, 'Sarawak', 132, NULL), 
  (2322, 'Selangor', 132, NULL), 
  (2323, 'Sembilan', 132, NULL), 
  (2324, 'Terengganu', 132, NULL), 
  (2325, 'Alif Alif', 133, NULL), 
  (2326, 'Alif Dhaal', 133, NULL), 
  (2327, 'Baa', 133, NULL), 
  (2328, 'Dhaal', 133, NULL), 
  (2329, 'Faaf', 133, NULL), 
  (2330, 'Gaaf Alif', 133, NULL), 
  (2331, 'Gaaf Dhaal', 133, NULL), 
  (2332, 'Ghaviyani', 133, NULL), 
  (2333, 'Haa Alif', 133, NULL), 
  (2334, 'Haa Dhaal', 133, NULL), 
  (2335, 'Kaaf', 133, NULL), 
  (2336, 'Laam', 133, NULL), 
  (2337, 'Lhaviyani', 133, NULL), 
  (2338, 'Male', 133, NULL), 
  (2339, 'Miim', 133, NULL), 
  (2340, 'Nuun', 133, NULL), 
  (2341, 'Raa', 133, NULL), 
  (2342, 'Shaviyani', 133, NULL), 
  (2343, 'Siin', 133, NULL), 
  (2344, 'Thaa', 133, NULL), 
  (2345, 'Vaav', 133, NULL), 
  (2346, 'Bamako', 134, NULL), 
  (2347, 'Gao', 134, NULL), 
  (2348, 'Kayes', 134, NULL), 
  (2349, 'Kidal', 134, NULL), 
  (2350, 'Koulikoro', 134, NULL), 
  (2351, 'Mopti', 134, NULL), 
  (2352, 'Segou', 134, NULL), 
  (2353, 'Sikasso', 134, NULL), 
  (2354, 'Tombouctou', 134, NULL), 
  (
    2355, 'Gozo and Comino', 135, NULL
  ), 
  (2356, 'Inner Harbour', 135, NULL), 
  (2357, 'Northern', 135, NULL), 
  (2358, 'Outer Harbour', 135, NULL), 
  (2359, 'South Eastern', 135, NULL), 
  (2360, 'Valletta', 135, NULL), 
  (2361, 'Western', 135, NULL), 
  (2362, 'Castletown', 136, NULL), 
  (2363, 'Douglas', 136, NULL), 
  (2364, 'Laxey', 136, NULL), 
  (2365, 'Onchan', 136, NULL), 
  (2366, 'Peel', 136, NULL), 
  (2367, 'Port Erin', 136, NULL), 
  (
    2368, 'Port Saint Mary', 136, NULL
  ), 
  (2369, 'Ramsey', 136, NULL), 
  (2370, 'Ailinlaplap', 137, NULL), 
  (2371, 'Ailuk', 137, NULL), 
  (2372, 'Arno', 137, NULL), 
  (2373, 'Aur', 137, NULL), 
  (2374, 'Bikini', 137, NULL), 
  (2375, 'Ebon', 137, NULL), 
  (2376, 'Enewetak', 137, NULL), 
  (2377, 'Jabat', 137, NULL), 
  (2378, 'Jaluit', 137, NULL), 
  (2379, 'Kili', 137, NULL), 
  (2380, 'Kwajalein', 137, NULL), 
  (2381, 'Lae', 137, NULL), 
  (2382, 'Lib', 137, NULL), 
  (2383, 'Likiep', 137, NULL), 
  (2384, 'Majuro', 137, NULL), 
  (2385, 'Maloelap', 137, NULL), 
  (2386, 'Mejit', 137, NULL), 
  (2387, 'Mili', 137, NULL), 
  (2388, 'Namorik', 137, NULL), 
  (2389, 'Namu', 137, NULL), 
  (2390, 'Rongelap', 137, NULL), 
  (2391, 'Ujae', 137, NULL), 
  (2392, 'Utrik', 137, NULL), 
  (2393, 'Wotho', 137, NULL), 
  (2394, 'Wotje', 137, NULL), 
  (2395, 'Fort-de-France', 138, NULL), 
  (2396, 'La Trinite', 138, NULL), 
  (2397, 'Le Marin', 138, NULL), 
  (2398, 'Saint-Pierre', 138, NULL), 
  (2399, 'Adrar', 139, NULL), 
  (2400, 'Assaba', 139, NULL), 
  (2401, 'Brakna', 139, NULL), 
  (
    2402, 'Dhakhlat Nawadibu', 139, NULL
  ), 
  (2403, 'Hudh-al-Gharbi', 139, NULL), 
  (
    2404, 'Hudh-ash-Sharqi', 139, NULL
  ), 
  (2405, 'Inshiri', 139, NULL), 
  (2406, 'Nawakshut', 139, NULL), 
  (2407, 'Qidimagha', 139, NULL), 
  (2408, 'Qurqul', 139, NULL), 
  (2409, 'Taqant', 139, NULL), 
  (2410, 'Tiris Zammur', 139, NULL), 
  (2411, 'Trarza', 139, NULL), 
  (2412, 'Black River', 140, NULL), 
  (2413, 'Eau Coulee', 140, NULL), 
  (2414, 'Flacq', 140, NULL), 
  (2415, 'Floreal', 140, NULL), 
  (2416, 'Grand Port', 140, NULL), 
  (2417, 'Moka', 140, NULL), 
  (2418, 'Pamplempousses', 140, NULL), 
  (
    2419, 'Plaines Wilhelm', 140, NULL
  ), 
  (2420, 'Port Louis', 140, NULL), 
  (
    2421, 'Riviere du Rempart', 140, NULL
  ), 
  (2422, 'Rodrigues', 140, NULL), 
  (2423, 'Rose Hill', 140, NULL), 
  (2424, 'Savanne', 140, NULL), 
  (2425, 'Mayotte', 141, NULL), 
  (2426, 'Pamanzi', 141, NULL), 
  (2427, 'Aguascalientes', 142, NULL), 
  (
    2428, 'Baja California', 142, NULL
  ), 
  (
    2429, 'Baja California Sur', 142, 
    NULL
  ), 
  (2430, 'Campeche', 142, NULL), 
  (2431, 'Chiapas', 142, NULL), 
  (2432, 'Chihuahua', 142, NULL), 
  (2433, 'Coahuila', 142, NULL), 
  (2434, 'Colima', 142, NULL), 
  (
    2435, 'Distrito Federal', 142, NULL
  ), 
  (2436, 'Durango', 142, NULL), 
  (
    2437, 'Estado de Mexico', 142, NULL
  ), 
  (2438, 'Guanajuato', 142, NULL), 
  (2439, 'Guerrero', 142, NULL), 
  (2440, 'Hidalgo', 142, NULL), 
  (2441, 'Jalisco', 142, NULL), 
  (2442, 'Mexico', 142, NULL), 
  (2443, 'Michoacan', 142, NULL), 
  (2444, 'Morelos', 142, NULL), 
  (2445, 'Nayarit', 142, NULL), 
  (2446, 'Nuevo Leon', 142, NULL), 
  (2447, 'Oaxaca', 142, NULL), 
  (2448, 'Puebla', 142, NULL), 
  (2449, 'Queretaro', 142, NULL), 
  (2450, 'Quintana Roo', 142, NULL), 
  (
    2451, 'San Luis Potosi', 142, NULL
  ), 
  (2452, 'Sinaloa', 142, NULL), 
  (2453, 'Sonora', 142, NULL), 
  (2454, 'Tabasco', 142, NULL), 
  (2455, 'Tamaulipas', 142, NULL), 
  (2456, 'Tlaxcala', 142, NULL), 
  (2457, 'Veracruz', 142, NULL), 
  (2458, 'Yucatan', 142, NULL), 
  (2459, 'Zacatecas', 142, NULL), 
  (2460, 'Chuuk', 143, NULL), 
  (2461, 'Kusaie', 143, NULL), 
  (2462, 'Pohnpei', 143, NULL), 
  (2463, 'Yap', 143, NULL), 
  (2464, 'Balti', 144, NULL), 
  (2465, 'Cahul', 144, NULL), 
  (2466, 'Chisinau', 144, NULL), 
  (2467, 'Chisinau Oras', 144, NULL), 
  (2468, 'Edinet', 144, NULL), 
  (2469, 'Gagauzia', 144, NULL), 
  (2470, 'Lapusna', 144, NULL), 
  (2471, 'Orhei', 144, NULL), 
  (2472, 'Soroca', 144, NULL), 
  (2473, 'Taraclia', 144, NULL), 
  (2474, 'Tighina', 144, NULL), 
  (2475, 'Transnistria', 144, NULL), 
  (2476, 'Ungheni', 144, NULL), 
  (2477, 'Fontvieille', 145, NULL), 
  (2478, 'La Condamine', 145, NULL), 
  (2479, 'Monaco-Ville', 145, NULL), 
  (2480, 'Monte Carlo', 145, NULL), 
  (2481, 'Arhangaj', 146, NULL), 
  (2482, 'Bajan-Olgij', 146, NULL), 
  (2483, 'Bajanhongor', 146, NULL), 
  (2484, 'Bulgan', 146, NULL), 
  (2485, 'Darhan-Uul', 146, NULL), 
  (2486, 'Dornod', 146, NULL), 
  (2487, 'Dornogovi', 146, NULL), 
  (2488, 'Dundgovi', 146, NULL), 
  (2489, 'Govi-Altaj', 146, NULL), 
  (2490, 'Govisumber', 146, NULL), 
  (2491, 'Hentij', 146, NULL), 
  (2492, 'Hovd', 146, NULL), 
  (2493, 'Hovsgol', 146, NULL), 
  (2494, 'Omnogovi', 146, NULL), 
  (2495, 'Orhon', 146, NULL), 
  (2496, 'Ovorhangaj', 146, NULL), 
  (2497, 'Selenge', 146, NULL), 
  (2498, 'Suhbaatar', 146, NULL), 
  (2499, 'Tov', 146, NULL), 
  (2500, 'Ulaanbaatar', 146, NULL), 
  (2501, 'Uvs', 146, NULL), 
  (2502, 'Zavhan', 146, NULL), 
  (2503, 'Montserrat', 147, NULL), 
  (2504, 'Agadir', 148, NULL), 
  (2505, 'Casablanca', 148, NULL), 
  (
    2506, 'Chaouia-Ouardigha', 148, NULL
  ), 
  (2507, 'Doukkala-Abda', 148, NULL), 
  (2508, 'Fes-Boulemane', 148, NULL), 
  (
    2509, 'Gharb-Chrarda-Beni Hssen', 
    148, NULL
  ), 
  (2510, 'Guelmim', 148, NULL), 
  (2511, 'Kenitra', 148, NULL), 
  (
    2512, 'Marrakech-Tensift-Al Haouz', 
    148, NULL
  ), 
  (
    2513, 'Meknes-Tafilalet', 148, NULL
  ), 
  (2514, 'Oriental', 148, NULL), 
  (2515, 'Oujda', 148, NULL), 
  (
    2516, 'Province de Tanger', 148, NULL
  ), 
  (
    2517, 'Rabat-Sale-Zammour-Zaer', 
    148, NULL
  ), 
  (2518, 'Sala Al Jadida', 148, NULL), 
  (2519, 'Settat', 148, NULL), 
  (
    2520, 'Souss Massa-Draa', 148, NULL
  ), 
  (2521, 'Tadla-Azilal', 148, NULL), 
  (
    2522, 'Tangier-Tetouan', 148, NULL
  ), 
  (
    2523, 'Taza-Al Hoceima-Taounate', 
    148, NULL
  ), 
  (
    2524, 'Wilaya de Casablanca', 148, 
    NULL
  ), 
  (
    2525, 'Wilaya de Rabat-Sale', 148, 
    NULL
  ), 
  (2526, 'Cabo Delgado', 149, NULL), 
  (2527, 'Gaza', 149, NULL), 
  (2528, 'Inhambane', 149, NULL), 
  (2529, 'Manica', 149, NULL), 
  (2530, 'Maputo', 149, NULL), 
  (
    2531, 'Maputo Provincia', 149, NULL
  ), 
  (2532, 'Nampula', 149, NULL), 
  (2533, 'Niassa', 149, NULL), 
  (2534, 'Sofala', 149, NULL), 
  (2535, 'Tete', 149, NULL), 
  (2536, 'Zambezia', 149, NULL), 
  (2537, 'Ayeyarwady', 150, NULL), 
  (2538, 'Bago', 150, NULL), 
  (2539, 'Chin', 150, NULL), 
  (2540, 'Kachin', 150, NULL), 
  (2541, 'Kayah', 150, NULL), 
  (2542, 'Kayin', 150, NULL), 
  (2543, 'Magway', 150, NULL), 
  (2544, 'Mandalay', 150, NULL), 
  (2545, 'Mon', 150, NULL), 
  (2546, 'Nay Pyi Taw', 150, NULL), 
  (2547, 'Rakhine', 150, NULL), 
  (2548, 'Sagaing', 150, NULL), 
  (2549, 'Shan', 150, NULL), 
  (2550, 'Tanintharyi', 150, NULL), 
  (2551, 'Yangon', 150, NULL), 
  (2552, 'Caprivi', 151, NULL), 
  (2553, 'Erongo', 151, NULL), 
  (2554, 'Hardap', 151, NULL), 
  (2555, 'Karas', 151, NULL), 
  (2556, 'Kavango', 151, NULL), 
  (2557, 'Khomas', 151, NULL), 
  (2558, 'Kunene', 151, NULL), 
  (2559, 'Ohangwena', 151, NULL), 
  (2560, 'Omaheke', 151, NULL), 
  (2561, 'Omusati', 151, NULL), 
  (2562, 'Oshana', 151, NULL), 
  (2563, 'Oshikoto', 151, NULL), 
  (2564, 'Otjozondjupa', 151, NULL), 
  (2565, 'Yaren', 152, NULL), 
  (2566, 'Bagmati', 153, NULL), 
  (2567, 'Bheri', 153, NULL), 
  (2568, 'Dhawalagiri', 153, NULL), 
  (2569, 'Gandaki', 153, NULL), 
  (2570, 'Janakpur', 153, NULL), 
  (2571, 'Karnali', 153, NULL), 
  (2572, 'Koshi', 153, NULL), 
  (2573, 'Lumbini', 153, NULL), 
  (2574, 'Mahakali', 153, NULL), 
  (2575, 'Mechi', 153, NULL), 
  (2576, 'Narayani', 153, NULL), 
  (2577, 'Rapti', 153, NULL), 
  (2578, 'Sagarmatha', 153, NULL), 
  (2579, 'Seti', 153, NULL), 
  (2580, 'Bonaire', 154, NULL), 
  (2581, 'Curacao', 154, NULL), 
  (2582, 'Saba', 154, NULL), 
  (2583, 'Sint Eustatius', 154, NULL), 
  (2584, 'Sint Maarten', 154, NULL), 
  (2585, 'Amsterdam', 155, NULL), 
  (2586, 'Benelux', 155, NULL), 
  (2587, 'Drenthe', 155, NULL), 
  (2588, 'Flevoland', 155, NULL), 
  (2589, 'Friesland', 155, NULL), 
  (2590, 'Gelderland', 155, NULL), 
  (2591, 'Groningen', 155, NULL), 
  (2592, 'Limburg', 155, NULL), 
  (2593, 'Noord-Brabant', 155, NULL), 
  (2594, 'Noord-Holland', 155, NULL), 
  (2595, 'Overijssel', 155, NULL), 
  (2596, 'South Holland', 155, NULL), 
  (2597, 'Utrecht', 155, NULL), 
  (2598, 'Zeeland', 155, NULL), 
  (2599, 'Zuid-Holland', 155, NULL), 
  (2600, 'Iles', 156, NULL), 
  (2601, 'Nord', 156, NULL), 
  (2602, 'Sud', 156, NULL), 
  (
    2603, 'Area Outside Region', 157, 
    NULL
  ), 
  (2604, 'Auckland', 157, NULL), 
  (2605, 'Bay of Plenty', 157, NULL), 
  (2606, 'Canterbury', 157, NULL), 
  (2607, 'Christchurch', 157, NULL), 
  (2608, 'Gisborne', 157, NULL), 
  (2609, 'Hawke\'s Bay', 157, NULL), 
  (
    2610, 'Manawatu-Wanganui', 157, NULL
  ), 
  (2611, 'Marlborough', 157, NULL), 
  (2612, 'Nelson', 157, NULL), 
  (2613, 'Northland', 157, NULL), 
  (2614, 'Otago', 157, NULL), 
  (2615, 'Rodney', 157, NULL), 
  (2616, 'Southland', 157, NULL), 
  (2617, 'Taranaki', 157, NULL), 
  (2618, 'Tasman', 157, NULL), 
  (2619, 'Waikato', 157, NULL), 
  (2620, 'Wellington', 157, NULL), 
  (2621, 'West Coast', 157, NULL), 
  (
    2622, 'Atlantico Norte', 158, NULL
  ), 
  (2623, 'Atlantico Sur', 158, NULL), 
  (2624, 'Boaco', 158, NULL), 
  (2625, 'Carazo', 158, NULL), 
  (2626, 'Chinandega', 158, NULL), 
  (2627, 'Chontales', 158, NULL), 
  (2628, 'Esteli', 158, NULL), 
  (2629, 'Granada', 158, NULL), 
  (2630, 'Jinotega', 158, NULL), 
  (2631, 'Leon', 158, NULL), 
  (2632, 'Madriz', 158, NULL), 
  (2633, 'Managua', 158, NULL), 
  (2634, 'Masaya', 158, NULL), 
  (2635, 'Matagalpa', 158, NULL), 
  (2636, 'Nueva Segovia', 158, NULL), 
  (2637, 'Rio San Juan', 158, NULL), 
  (2638, 'Rivas', 158, NULL), 
  (2639, 'Agadez', 159, NULL), 
  (2640, 'Diffa', 159, NULL), 
  (2641, 'Dosso', 159, NULL), 
  (2642, 'Maradi', 159, NULL), 
  (2643, 'Niamey', 159, NULL), 
  (2644, 'Tahoua', 159, NULL), 
  (2645, 'Tillabery', 159, NULL), 
  (2646, 'Zinder', 159, NULL), 
  (2647, 'Abia', 160, NULL), 
  (
    2648, 'Abuja Federal Capital Territor', 
    160, NULL
  ), 
  (2649, 'Adamawa', 160, NULL), 
  (2650, 'Akwa Ibom', 160, NULL), 
  (2651, 'Anambra', 160, NULL), 
  (2652, 'Bauchi', 160, NULL), 
  (2653, 'Bayelsa', 160, NULL), 
  (2654, 'Benue', 160, NULL), 
  (2655, 'Borno', 160, NULL), 
  (2656, 'Cross River', 160, NULL), 
  (2657, 'Delta', 160, NULL), 
  (2658, 'Ebonyi', 160, NULL), 
  (2659, 'Edo', 160, NULL), 
  (2660, 'Ekiti', 160, NULL), 
  (2661, 'Enugu', 160, NULL), 
  (2662, 'Gombe', 160, NULL), 
  (2663, 'Imo', 160, NULL), 
  (2664, 'Jigawa', 160, NULL), 
  (2665, 'Kaduna', 160, NULL), 
  (2666, 'Kano', 160, NULL), 
  (2667, 'Katsina', 160, NULL), 
  (2668, 'Kebbi', 160, NULL), 
  (2669, 'Kogi', 160, NULL), 
  (2670, 'Kwara', 160, NULL), 
  (2671, 'Lagos', 160, NULL), 
  (2672, 'Nassarawa', 160, NULL), 
  (2673, 'Niger', 160, NULL), 
  (2674, 'Ogun', 160, NULL), 
  (2675, 'Ondo', 160, NULL), 
  (2676, 'Osun', 160, NULL), 
  (2677, 'Oyo', 160, NULL), 
  (2678, 'Plateau', 160, NULL), 
  (2679, 'Rivers', 160, NULL), 
  (2680, 'Sokoto', 160, NULL), 
  (2681, 'Taraba', 160, NULL), 
  (2682, 'Yobe', 160, NULL), 
  (2683, 'Zamfara', 160, NULL), 
  (2684, 'Niue', 161, NULL), 
  (2685, 'Norfolk Island', 162, NULL), 
  (
    2686, 'Northern Islands', 163, NULL
  ), 
  (2687, 'Rota', 163, NULL), 
  (2688, 'Saipan', 163, NULL), 
  (2689, 'Tinian', 163, NULL), 
  (2690, 'Akershus', 164, NULL), 
  (2691, 'Aust Agder', 164, NULL), 
  (2692, 'Bergen', 164, NULL), 
  (2693, 'Buskerud', 164, NULL), 
  (2694, 'Finnmark', 164, NULL), 
  (2695, 'Hedmark', 164, NULL), 
  (2696, 'Hordaland', 164, NULL), 
  (
    2697, 'Moere og Romsdal', 164, NULL
  ), 
  (2698, 'Nord Trondelag', 164, NULL), 
  (2699, 'Nordland', 164, NULL), 
  (2700, 'Oestfold', 164, NULL), 
  (2701, 'Oppland', 164, NULL), 
  (2702, 'Oslo', 164, NULL), 
  (2703, 'Rogaland', 164, NULL), 
  (
    2704, 'Soer Troendelag', 164, NULL
  ), 
  (
    2705, 'Sogn og Fjordane', 164, NULL
  ), 
  (2706, 'Stavern', 164, NULL), 
  (2707, 'Sykkylven', 164, NULL), 
  (2708, 'Telemark', 164, NULL), 
  (2709, 'Troms', 164, NULL), 
  (2710, 'Vest Agder', 164, NULL), 
  (2711, 'Vestfold', 164, NULL), 
  (2713, 'Al Buraimi', 165, NULL), 
  (2714, 'Dhufar', 165, NULL), 
  (2715, 'Masqat', 165, NULL), 
  (2716, 'Musandam', 165, NULL), 
  (2717, 'Rusayl', 165, NULL), 
  (2718, 'Wadi Kabir', 165, NULL), 
  (2719, 'ad-Dakhiliyah', 165, NULL), 
  (2720, 'adh-Dhahirah', 165, NULL), 
  (2721, 'al-Batinah', 165, NULL), 
  (2722, 'ash-Sharqiyah', 165, NULL), 
  (2723, 'Baluchistan', 166, NULL), 
  (
    2724, 'Federal Capital Area', 166, 
    NULL
  ), 
  (
    2725, 'Federally administered Tribal ', 
    166, NULL
  ), 
  (
    2726, 'North-West Frontier', 166, 
    NULL
  ), 
  (2727, 'Northern Areas', 166, NULL), 
  (2728, 'Punjab', 166, NULL), 
  (2729, 'Sind', 166, NULL), 
  (2730, 'Aimeliik', 167, NULL), 
  (2731, 'Airai', 167, NULL), 
  (2732, 'Angaur', 167, NULL), 
  (2733, 'Hatobohei', 167, NULL), 
  (2734, 'Kayangel', 167, NULL), 
  (2735, 'Koror', 167, NULL), 
  (2736, 'Melekeok', 167, NULL), 
  (2737, 'Ngaraard', 167, NULL), 
  (2738, 'Ngardmau', 167, NULL), 
  (2739, 'Ngaremlengui', 167, NULL), 
  (2740, 'Ngatpang', 167, NULL), 
  (2741, 'Ngchesar', 167, NULL), 
  (2742, 'Ngerchelong', 167, NULL), 
  (2743, 'Ngiwal', 167, NULL), 
  (2744, 'Peleliu', 167, NULL), 
  (2745, 'Sonsorol', 167, NULL), 
  (2746, 'Ariha', 168, NULL), 
  (2747, 'Bayt Lahm', 168, NULL), 
  (2748, 'Bethlehem', 168, NULL), 
  (2749, 'Dayr-al-Balah', 168, NULL), 
  (2750, 'Ghazzah', 168, NULL), 
  (
    2751, 'Ghazzah ash-Shamaliyah', 168, 
    NULL
  ), 
  (2752, 'Janin', 168, NULL), 
  (2753, 'Khan Yunis', 168, NULL), 
  (2754, 'Nabulus', 168, NULL), 
  (2755, 'Qalqilyah', 168, NULL), 
  (2756, 'Rafah', 168, NULL), 
  (
    2757, 'Ram Allah wal-Birah', 168, 
    NULL
  ), 
  (2758, 'Salfit', 168, NULL), 
  (2759, 'Tubas', 168, NULL), 
  (2760, 'Tulkarm', 168, NULL), 
  (2761, 'al-Khalil', 168, NULL), 
  (2762, 'al-Quds', 168, NULL), 
  (2763, 'Bocas del Toro', 169, NULL), 
  (2764, 'Chiriqui', 169, NULL), 
  (2765, 'Cocle', 169, NULL), 
  (2766, 'Colon', 169, NULL), 
  (2767, 'Darien', 169, NULL), 
  (2768, 'Embera', 169, NULL), 
  (2769, 'Herrera', 169, NULL), 
  (2770, 'Kuna Yala', 169, NULL), 
  (2771, 'Los Santos', 169, NULL), 
  (2772, 'Ngobe Bugle', 169, NULL), 
  (2773, 'Panama', 169, NULL), 
  (2774, 'Veraguas', 169, NULL), 
  (
    2775, 'East New Britain', 170, NULL
  ), 
  (2776, 'East Sepik', 170, NULL), 
  (
    2777, 'Eastern Highlands', 170, NULL
  ), 
  (2778, 'Enga', 170, NULL), 
  (2779, 'Fly River', 170, NULL), 
  (2780, 'Gulf', 170, NULL), 
  (2781, 'Madang', 170, NULL), 
  (2782, 'Manus', 170, NULL), 
  (2783, 'Milne Bay', 170, NULL), 
  (2784, 'Morobe', 170, NULL), 
  (
    2785, 'National Capital District', 
    170, NULL
  ), 
  (2786, 'New Ireland', 170, NULL), 
  (2787, 'North Solomons', 170, NULL), 
  (2788, 'Oro', 170, NULL), 
  (2789, 'Sandaun', 170, NULL), 
  (2790, 'Simbu', 170, NULL), 
  (
    2791, 'Southern Highlands', 170, NULL
  ), 
  (
    2792, 'West New Britain', 170, NULL
  ), 
  (
    2793, 'Western Highlands', 170, NULL
  ), 
  (2794, 'Alto Paraguay', 171, NULL), 
  (2795, 'Alto Parana', 171, NULL), 
  (2796, 'Amambay', 171, NULL), 
  (2797, 'Asuncion', 171, NULL), 
  (2798, 'Boqueron', 171, NULL), 
  (2799, 'Caaguazu', 171, NULL), 
  (2800, 'Caazapa', 171, NULL), 
  (2801, 'Canendiyu', 171, NULL), 
  (2802, 'Central', 171, NULL), 
  (2803, 'Concepcion', 171, NULL), 
  (2804, 'Cordillera', 171, NULL), 
  (2805, 'Guaira', 171, NULL), 
  (2806, 'Itapua', 171, NULL), 
  (2807, 'Misiones', 171, NULL), 
  (2808, 'Neembucu', 171, NULL), 
  (2809, 'Paraguari', 171, NULL), 
  (
    2810, 'Presidente Hayes', 171, NULL
  ), 
  (2811, 'San Pedro', 171, NULL), 
  (2812, 'Amazonas', 172, NULL), 
  (2813, 'Ancash', 172, NULL), 
  (2814, 'Apurimac', 172, NULL), 
  (2815, 'Arequipa', 172, NULL), 
  (2816, 'Ayacucho', 172, NULL), 
  (2817, 'Cajamarca', 172, NULL), 
  (2818, 'Cusco', 172, NULL), 
  (2819, 'Huancavelica', 172, NULL), 
  (2820, 'Huanuco', 172, NULL), 
  (2821, 'Ica', 172, NULL), 
  (2822, 'Junin', 172, NULL), 
  (2823, 'La Libertad', 172, NULL), 
  (2824, 'Lambayeque', 172, NULL), 
  (2825, 'Lima y Callao', 172, NULL), 
  (2826, 'Loreto', 172, NULL), 
  (2827, 'Madre de Dios', 172, NULL), 
  (2828, 'Moquegua', 172, NULL), 
  (2829, 'Pasco', 172, NULL), 
  (2830, 'Piura', 172, NULL), 
  (2831, 'Puno', 172, NULL), 
  (2832, 'San Martin', 172, NULL), 
  (2833, 'Tacna', 172, NULL), 
  (2834, 'Tumbes', 172, NULL), 
  (2835, 'Ucayali', 172, NULL), 
  (2836, 'Batangas', 173, NULL), 
  (2837, 'Bicol', 173, NULL), 
  (2838, 'Bulacan', 173, NULL), 
  (2839, 'Cagayan', 173, NULL), 
  (2840, 'Caraga', 173, NULL), 
  (2841, 'Central Luzon', 173, NULL), 
  (
    2842, 'Central Mindanao', 173, NULL
  ), 
  (
    2843, 'Central Visayas', 173, NULL
  ), 
  (2844, 'Cordillera', 173, NULL), 
  (2845, 'Davao', 173, NULL), 
  (
    2846, 'Eastern Visayas', 173, NULL
  ), 
  (
    2847, 'Greater Metropolitan Area', 
    173, NULL
  ), 
  (2848, 'Ilocos', 173, NULL), 
  (2849, 'Laguna', 173, NULL), 
  (2850, 'Luzon', 173, NULL), 
  (2851, 'Mactan', 173, NULL), 
  (
    2852, 'Metropolitan Manila Area', 
    173, NULL
  ), 
  (
    2853, 'Muslim Mindanao', 173, NULL
  ), 
  (
    2854, 'Northern Mindanao', 173, NULL
  ), 
  (
    2855, 'Southern Mindanao', 173, NULL
  ), 
  (
    2856, 'Southern Tagalog', 173, NULL
  ), 
  (
    2857, 'Western Mindanao', 173, NULL
  ), 
  (
    2858, 'Western Visayas', 173, NULL
  ), 
  (
    2859, 'Pitcairn Island', 174, NULL
  ), 
  (2860, 'Biale Blota', 175, NULL), 
  (2861, 'Dobroszyce', 175, NULL), 
  (2862, 'Dolnoslaskie', 175, NULL), 
  (
    2863, 'Dziekanow Lesny', 175, NULL
  ), 
  (2864, 'Hopowo', 175, NULL), 
  (2865, 'Kartuzy', 175, NULL), 
  (2866, 'Koscian', 175, NULL), 
  (2867, 'Krakow', 175, NULL), 
  (
    2868, 'Kujawsko-Pomorskie', 175, NULL
  ), 
  (2869, 'Lodzkie', 175, NULL), 
  (2870, 'Lubelskie', 175, NULL), 
  (2871, 'Lubuskie', 175, NULL), 
  (2872, 'Malomice', 175, NULL), 
  (2873, 'Malopolskie', 175, NULL), 
  (2874, 'Mazowieckie', 175, NULL), 
  (2875, 'Mirkow', 175, NULL), 
  (2876, 'Opolskie', 175, NULL), 
  (2877, 'Ostrowiec', 175, NULL), 
  (2878, 'Podkarpackie', 175, NULL), 
  (2879, 'Podlaskie', 175, NULL), 
  (2880, 'Polska', 175, NULL), 
  (2881, 'Pomorskie', 175, NULL), 
  (2882, 'Poznan', 175, NULL), 
  (2883, 'Pruszkow', 175, NULL), 
  (2884, 'Rymanowska', 175, NULL), 
  (2885, 'Rzeszow', 175, NULL), 
  (2886, 'Slaskie', 175, NULL), 
  (2887, 'Stare Pole', 175, NULL), 
  (2888, 'Swietokrzyskie', 175, NULL), 
  (
    2889, 'Warminsko-Mazurskie', 175, 
    NULL
  ), 
  (2890, 'Warsaw', 175, NULL), 
  (2891, 'Wejherowo', 175, NULL), 
  (2892, 'Wielkopolskie', 175, NULL), 
  (2893, 'Wroclaw', 175, NULL), 
  (
    2894, 'Zachodnio-Pomorskie', 175, 
    NULL
  ), 
  (2895, 'Zukowo', 175, NULL), 
  (2896, 'Abrantes', 176, NULL), 
  (2897, 'Acores', 176, NULL), 
  (2898, 'Alentejo', 176, NULL), 
  (2899, 'Algarve', 176, NULL), 
  (2900, 'Braga', 176, NULL), 
  (2901, 'Centro', 176, NULL), 
  (
    2902, 'Distrito de Leiria', 176, NULL
  ), 
  (
    2903, 'Distrito de Viana do Castelo', 
    176, NULL
  ), 
  (
    2904, 'Distrito de Vila Real', 176, 
    NULL
  ), 
  (
    2905, 'Distrito do Porto', 176, NULL
  ), 
  (
    2906, 'Lisboa e Vale do Tejo', 176, 
    NULL
  ), 
  (2907, 'Madeira', 176, NULL), 
  (2908, 'Norte', 176, NULL), 
  (2909, 'Paivas', 176, NULL), 
  (2910, 'Arecibo', 177, NULL), 
  (2911, 'Bayamon', 177, NULL), 
  (2912, 'Carolina', 177, NULL), 
  (2913, 'Florida', 177, NULL), 
  (2914, 'Guayama', 177, NULL), 
  (2915, 'Humacao', 177, NULL), 
  (
    2916, 'Mayaguez-Aguadilla', 177, NULL
  ), 
  (2917, 'Ponce', 177, NULL), 
  (2918, 'Salinas', 177, NULL), 
  (2919, 'San Juan', 177, NULL), 
  (2920, 'Doha', 178, NULL), 
  (
    2921, 'Jarian-al-Batnah', 178, NULL
  ), 
  (2922, 'Umm Salal', 178, NULL), 
  (2923, 'ad-Dawhah', 178, NULL), 
  (2924, 'al-Ghuwayriyah', 178, NULL), 
  (2925, 'al-Jumayliyah', 178, NULL), 
  (2926, 'al-Khawr', 178, NULL), 
  (2927, 'al-Wakrah', 178, NULL), 
  (2928, 'ar-Rayyan', 178, NULL), 
  (2929, 'ash-Shamal', 178, NULL), 
  (2930, 'Saint-Benoit', 179, NULL), 
  (2931, 'Saint-Denis', 179, NULL), 
  (2932, 'Saint-Paul', 179, NULL), 
  (2933, 'Saint-Pierre', 179, NULL), 
  (2934, 'Alba', 180, NULL), 
  (2935, 'Arad', 180, NULL), 
  (2936, 'Arges', 180, NULL), 
  (2937, 'Bacau', 180, NULL), 
  (2938, 'Bihor', 180, NULL), 
  (
    2939, 'Bistrita-Nasaud', 180, NULL
  ), 
  (2940, 'Botosani', 180, NULL), 
  (2941, 'Braila', 180, NULL), 
  (2942, 'Brasov', 180, NULL), 
  (2943, 'Bucuresti', 180, NULL), 
  (2944, 'Buzau', 180, NULL), 
  (2945, 'Calarasi', 180, NULL), 
  (2946, 'Caras-Severin', 180, NULL), 
  (2947, 'Cluj', 180, NULL), 
  (2948, 'Constanta', 180, NULL), 
  (2949, 'Covasna', 180, NULL), 
  (2950, 'Dambovita', 180, NULL), 
  (2951, 'Dolj', 180, NULL), 
  (2952, 'Galati', 180, NULL), 
  (2953, 'Giurgiu', 180, NULL), 
  (2954, 'Gorj', 180, NULL), 
  (2955, 'Harghita', 180, NULL), 
  (2956, 'Hunedoara', 180, NULL), 
  (2957, 'Ialomita', 180, NULL), 
  (2958, 'Iasi', 180, NULL), 
  (2959, 'Ilfov', 180, NULL), 
  (2960, 'Maramures', 180, NULL), 
  (2961, 'Mehedinti', 180, NULL), 
  (2962, 'Mures', 180, NULL), 
  (2963, 'Neamt', 180, NULL), 
  (2964, 'Olt', 180, NULL), 
  (2965, 'Prahova', 180, NULL), 
  (2966, 'Salaj', 180, NULL), 
  (2967, 'Satu Mare', 180, NULL), 
  (2968, 'Sibiu', 180, NULL), 
  (2969, 'Sondelor', 180, NULL), 
  (2970, 'Suceava', 180, NULL), 
  (2971, 'Teleorman', 180, NULL), 
  (2972, 'Timis', 180, NULL), 
  (2973, 'Tulcea', 180, NULL), 
  (2974, 'Valcea', 180, NULL), 
  (2975, 'Vaslui', 180, NULL), 
  (2976, 'Vrancea', 180, NULL), 
  (2977, 'Adygeja', 181, NULL), 
  (2978, 'Aga', 181, NULL), 
  (2979, 'Alanija', 181, NULL), 
  (2980, 'Altaj', 181, NULL), 
  (2981, 'Amur', 181, NULL), 
  (2982, 'Arhangelsk', 181, NULL), 
  (2983, 'Astrahan', 181, NULL), 
  (2984, 'Bashkortostan', 181, NULL), 
  (2985, 'Belgorod', 181, NULL), 
  (2986, 'Brjansk', 181, NULL), 
  (2987, 'Burjatija', 181, NULL), 
  (2988, 'Chechenija', 181, NULL), 
  (2989, 'Cheljabinsk', 181, NULL), 
  (2990, 'Chita', 181, NULL), 
  (2991, 'Chukotka', 181, NULL), 
  (2992, 'Chuvashija', 181, NULL), 
  (2993, 'Dagestan', 181, NULL), 
  (2994, 'Evenkija', 181, NULL), 
  (2995, 'Gorno-Altaj', 181, NULL), 
  (2996, 'Habarovsk', 181, NULL), 
  (2997, 'Hakasija', 181, NULL), 
  (2998, 'Hanty-Mansija', 181, NULL), 
  (2999, 'Ingusetija', 181, NULL), 
  (3000, 'Irkutsk', 181, NULL), 
  (3001, 'Ivanovo', 181, NULL), 
  (3002, 'Jamalo-Nenets', 181, NULL), 
  (3003, 'Jaroslavl', 181, NULL), 
  (3004, 'Jevrej', 181, NULL), 
  (
    3005, 'Kabardino-Balkarija', 181, 
    NULL
  ), 
  (3006, 'Kaliningrad', 181, NULL), 
  (3007, 'Kalmykija', 181, NULL), 
  (3008, 'Kaluga', 181, NULL), 
  (3009, 'Kamchatka', 181, NULL), 
  (
    3010, 'Karachaj-Cherkessija', 181, 
    NULL
  ), 
  (3011, 'Karelija', 181, NULL), 
  (3012, 'Kemerovo', 181, NULL), 
  (
    3013, 'Khabarovskiy Kray', 181, NULL
  ), 
  (3014, 'Kirov', 181, NULL), 
  (3015, 'Komi', 181, NULL), 
  (
    3016, 'Komi-Permjakija', 181, NULL
  ), 
  (3017, 'Korjakija', 181, NULL), 
  (3018, 'Kostroma', 181, NULL), 
  (3019, 'Krasnodar', 181, NULL), 
  (3020, 'Krasnojarsk', 181, NULL), 
  (
    3021, 'Krasnoyarskiy Kray', 181, NULL
  ), 
  (3022, 'Kurgan', 181, NULL), 
  (3023, 'Kursk', 181, NULL), 
  (3024, 'Leningrad', 181, NULL), 
  (3025, 'Lipeck', 181, NULL), 
  (3026, 'Magadan', 181, NULL), 
  (3027, 'Marij El', 181, NULL), 
  (3028, 'Mordovija', 181, NULL), 
  (3029, 'Moscow', 181, NULL), 
  (
    3030, 'Moskovskaja Oblast', 181, NULL
  ), 
  (
    3031, 'Moskovskaya Oblast', 181, NULL
  ), 
  (3032, 'Moskva', 181, NULL), 
  (3033, 'Murmansk', 181, NULL), 
  (3034, 'Nenets', 181, NULL), 
  (
    3035, 'Nizhnij Novgorod', 181, NULL
  ), 
  (3036, 'Novgorod', 181, NULL), 
  (3037, 'Novokusnezk', 181, NULL), 
  (3038, 'Novosibirsk', 181, NULL), 
  (3039, 'Omsk', 181, NULL), 
  (3040, 'Orenburg', 181, NULL), 
  (3041, 'Orjol', 181, NULL), 
  (3042, 'Penza', 181, NULL), 
  (3043, 'Perm', 181, NULL), 
  (3044, 'Primorje', 181, NULL), 
  (3045, 'Pskov', 181, NULL), 
  (
    3046, 'Pskovskaya Oblast', 181, NULL
  ), 
  (3047, 'Rjazan', 181, NULL), 
  (3048, 'Rostov', 181, NULL), 
  (3049, 'Saha', 181, NULL), 
  (3050, 'Sahalin', 181, NULL), 
  (3051, 'Samara', 181, NULL), 
  (3052, 'Samarskaya', 181, NULL), 
  (
    3053, 'Sankt-Peterburg', 181, NULL
  ), 
  (3054, 'Saratov', 181, NULL), 
  (3055, 'Smolensk', 181, NULL), 
  (3056, 'Stavropol', 181, NULL), 
  (3057, 'Sverdlovsk', 181, NULL), 
  (3058, 'Tajmyrija', 181, NULL), 
  (3059, 'Tambov', 181, NULL), 
  (3060, 'Tatarstan', 181, NULL), 
  (3061, 'Tjumen', 181, NULL), 
  (3062, 'Tomsk', 181, NULL), 
  (3063, 'Tula', 181, NULL), 
  (3064, 'Tver', 181, NULL), 
  (3065, 'Tyva', 181, NULL), 
  (3066, 'Udmurtija', 181, NULL), 
  (3067, 'Uljanovsk', 181, NULL), 
  (
    3068, 'Ulyanovskaya Oblast', 181, 
    NULL
  ), 
  (3069, 'Ust-Orda', 181, NULL), 
  (3070, 'Vladimir', 181, NULL), 
  (3071, 'Volgograd', 181, NULL), 
  (3072, 'Vologda', 181, NULL), 
  (3073, 'Voronezh', 181, NULL), 
  (3074, 'Butare', 182, NULL), 
  (3075, 'Byumba', 182, NULL), 
  (3076, 'Cyangugu', 182, NULL), 
  (3077, 'Gikongoro', 182, NULL), 
  (3078, 'Gisenyi', 182, NULL), 
  (3079, 'Gitarama', 182, NULL), 
  (3080, 'Kibungo', 182, NULL), 
  (3081, 'Kibuye', 182, NULL), 
  (3082, 'Kigali-ngali', 182, NULL), 
  (3083, 'Ruhengeri', 182, NULL), 
  (3084, 'Ascension', 183, NULL), 
  (3085, 'Gough Island', 183, NULL), 
  (3086, 'Saint Helena', 183, NULL), 
  (
    3087, 'Tristan da Cunha', 183, NULL
  ), 
  (
    3088, 'Christ Church Nichola Town', 
    184, NULL
  ), 
  (
    3089, 'Saint Anne Sandy Point', 184, 
    NULL
  ), 
  (
    3090, 'Saint George Basseterre', 
    184, NULL
  ), 
  (
    3091, 'Saint George Gingerland', 
    184, NULL
  ), 
  (
    3092, 'Saint James Windward', 184, 
    NULL
  ), 
  (
    3093, 'Saint John Capesterre', 184, 
    NULL
  ), 
  (
    3094, 'Saint John Figtree', 184, NULL
  ), 
  (
    3095, 'Saint Mary Cayon', 184, NULL
  ), 
  (
    3096, 'Saint Paul Capesterre', 184, 
    NULL
  ), 
  (
    3097, 'Saint Paul Charlestown', 184, 
    NULL
  ), 
  (
    3098, 'Saint Peter Basseterre', 184, 
    NULL
  ), 
  (
    3099, 'Saint Thomas Lowland', 184, 
    NULL
  ), 
  (
    3100, 'Saint Thomas Middle Island', 
    184, NULL
  ), 
  (
    3101, 'Trinity Palmetto Point', 184, 
    NULL
  ), 
  (3102, 'Anse-la-Raye', 185, NULL), 
  (3103, 'Canaries', 185, NULL), 
  (3104, 'Castries', 185, NULL), 
  (3105, 'Choiseul', 185, NULL), 
  (3106, 'Dennery', 185, NULL), 
  (3107, 'Gros Inlet', 185, NULL), 
  (3108, 'Laborie', 185, NULL), 
  (3109, 'Micoud', 185, NULL), 
  (3110, 'Soufriere', 185, NULL), 
  (3111, 'Vieux Fort', 185, NULL), 
  (
    3112, 'Miquelon-Langlade', 186, NULL
  ), 
  (3113, 'Saint-Pierre', 186, NULL), 
  (3114, 'Charlotte', 187, NULL), 
  (3115, 'Grenadines', 187, NULL), 
  (3116, 'Saint Andrew', 187, NULL), 
  (3117, 'Saint David', 187, NULL), 
  (3118, 'Saint George', 187, NULL), 
  (3119, 'Saint Patrick', 187, NULL), 
  (3120, 'A\'ana', 188, NULL), 
  (3121, 'Aiga-i-le-Tai', 188, NULL), 
  (3122, 'Atua', 188, NULL), 
  (3123, 'Fa\'asaleleaga', 188, NULL), 
  (3124, 'Gaga\'emauga', 188, NULL), 
  (3125, 'Gagaifomauga', 188, NULL), 
  (3126, 'Palauli', 188, NULL), 
  (3127, 'Satupa\'itea', 188, NULL), 
  (3128, 'Tuamasaga', 188, NULL), 
  (3129, 'Va\'a-o-Fonoti', 188, NULL), 
  (3130, 'Vaisigano', 188, NULL), 
  (3131, 'Acquaviva', 189, NULL), 
  (3132, 'Borgo Maggiore', 189, NULL), 
  (3133, 'Chiesanuova', 189, NULL), 
  (3134, 'Domagnano', 189, NULL), 
  (3135, 'Faetano', 189, NULL), 
  (3136, 'Fiorentino', 189, NULL), 
  (3137, 'Montegiardino', 189, NULL), 
  (3138, 'San Marino', 189, NULL), 
  (3139, 'Serravalle', 189, NULL), 
  (3140, 'Agua Grande', 190, NULL), 
  (3141, 'Cantagalo', 190, NULL), 
  (3142, 'Lemba', 190, NULL), 
  (3143, 'Lobata', 190, NULL), 
  (3144, 'Me-Zochi', 190, NULL), 
  (3145, 'Pague', 190, NULL), 
  (3146, 'Al Khobar', 191, NULL), 
  (3147, 'Aseer', 191, NULL), 
  (3148, 'Ash Sharqiyah', 191, NULL), 
  (3149, 'Asir', 191, NULL), 
  (
    3150, 'Central Province', 191, NULL
  ), 
  (
    3151, 'Eastern Province', 191, NULL
  ), 
  (3152, 'Ha\'il', 191, NULL), 
  (3153, 'Jawf', 191, NULL), 
  (3154, 'Jizan', 191, NULL), 
  (3155, 'Makkah', 191, NULL), 
  (3156, 'Najran', 191, NULL), 
  (3157, 'Qasim', 191, NULL), 
  (3158, 'Tabuk', 191, NULL), 
  (
    3159, 'Western Province', 191, NULL
  ), 
  (3160, 'al-Bahah', 191, NULL), 
  (
    3161, 'al-Hudud-ash-Shamaliyah', 
    191, NULL
  ), 
  (3162, 'al-Madinah', 191, NULL), 
  (3163, 'ar-Riyad', 191, NULL), 
  (3164, 'Dakar', 192, NULL), 
  (3165, 'Diourbel', 192, NULL), 
  (3166, 'Fatick', 192, NULL), 
  (3167, 'Kaolack', 192, NULL), 
  (3168, 'Kolda', 192, NULL), 
  (3169, 'Louga', 192, NULL), 
  (3170, 'Saint-Louis', 192, NULL), 
  (3171, 'Tambacounda', 192, NULL), 
  (3172, 'Thies', 192, NULL), 
  (3173, 'Ziguinchor', 192, NULL), 
  (3174, 'Central Serbia', 193, NULL), 
  (
    3175, 'Kosovo and Metohija', 193, 
    NULL
  ), 
  (3176, 'Vojvodina', 193, NULL), 
  (3177, 'Anse Boileau', 194, NULL), 
  (3178, 'Anse Royale', 194, NULL), 
  (3179, 'Cascade', 194, NULL), 
  (3180, 'Takamaka', 194, NULL), 
  (3181, 'Victoria', 194, NULL), 
  (3182, 'Eastern', 195, NULL), 
  (3183, 'Northern', 195, NULL), 
  (3184, 'Southern', 195, NULL), 
  (3185, 'Western', 195, NULL), 
  (3186, 'Singapore', 196, NULL), 
  (
    3187, 'Banskobystricky', 197, NULL
  ), 
  (3188, 'Bratislavsky', 197, NULL), 
  (3189, 'Kosicky', 197, NULL), 
  (3190, 'Nitriansky', 197, NULL), 
  (3191, 'Presovsky', 197, NULL), 
  (3192, 'Trenciansky', 197, NULL), 
  (3193, 'Trnavsky', 197, NULL), 
  (3194, 'Zilinsky', 197, NULL), 
  (3195, 'Benedikt', 198, NULL), 
  (3196, 'Gorenjska', 198, NULL), 
  (3197, 'Gorishka', 198, NULL), 
  (
    3198, 'Jugovzhodna Slovenija', 198, 
    NULL
  ), 
  (3199, 'Koroshka', 198, NULL), 
  (
    3200, 'Notranjsko-krashka', 198, NULL
  ), 
  (3201, 'Obalno-krashka', 198, NULL), 
  (3202, 'Obcina Domzale', 198, NULL), 
  (3203, 'Obcina Vitanje', 198, NULL), 
  (
    3204, 'Osrednjeslovenska', 198, NULL
  ), 
  (3205, 'Podravska', 198, NULL), 
  (3206, 'Pomurska', 198, NULL), 
  (3207, 'Savinjska', 198, NULL), 
  (
    3208, 'Slovenian Littoral', 198, NULL
  ), 
  (
    3209, 'Spodnjeposavska', 198, NULL
  ), 
  (3210, 'Zasavska', 198, NULL), 
  (3211, 'Pitcairn', 199, NULL), 
  (3212, 'Central', 200, NULL), 
  (3213, 'Choiseul', 200, NULL), 
  (3214, 'Guadalcanal', 200, NULL), 
  (3215, 'Isabel', 200, NULL), 
  (
    3216, 'Makira and Ulawa', 200, NULL
  ), 
  (3217, 'Malaita', 200, NULL), 
  (
    3218, 'Rennell and Bellona', 200, 
    NULL
  ), 
  (3219, 'Temotu', 200, NULL), 
  (3220, 'Western', 200, NULL), 
  (3221, 'Awdal', 201, NULL), 
  (3222, 'Bakol', 201, NULL), 
  (3223, 'Banadir', 201, NULL), 
  (3224, 'Bari', 201, NULL), 
  (3225, 'Bay', 201, NULL), 
  (3226, 'Galgudug', 201, NULL), 
  (3227, 'Gedo', 201, NULL), 
  (3228, 'Hiran', 201, NULL), 
  (3229, 'Jubbada Hose', 201, NULL), 
  (3230, 'Jubbadha Dexe', 201, NULL), 
  (3231, 'Mudug', 201, NULL), 
  (3232, 'Nugal', 201, NULL), 
  (3233, 'Sanag', 201, NULL), 
  (
    3234, 'Shabellaha Dhexe', 201, NULL
  ), 
  (
    3235, 'Shabellaha Hose', 201, NULL
  ), 
  (3236, 'Togdher', 201, NULL), 
  (3237, 'Woqoyi Galbed', 201, NULL), 
  (3238, 'Eastern Cape', 202, NULL), 
  (3239, 'Free State', 202, NULL), 
  (3240, 'Gauteng', 202, NULL), 
  (3241, 'Kempton Park', 202, NULL), 
  (3242, 'Kramerville', 202, NULL), 
  (3243, 'KwaZulu Natal', 202, NULL), 
  (3244, 'Limpopo', 202, NULL), 
  (3245, 'Mpumalanga', 202, NULL), 
  (3246, 'North West', 202, NULL), 
  (3247, 'Northern Cape', 202, NULL), 
  (3248, 'Parow', 202, NULL), 
  (3249, 'Table View', 202, NULL), 
  (3250, 'Umtentweni', 202, NULL), 
  (3251, 'Western Cape', 202, NULL), 
  (3252, 'South Georgia', 203, NULL), 
  (
    3253, 'Central Equatoria', 204, NULL
  ), 
  (3254, 'A Coruna', 205, NULL), 
  (3255, 'Alacant', 205, NULL), 
  (3256, 'Alava', 205, NULL), 
  (3257, 'Albacete', 205, NULL), 
  (3258, 'Almeria', 205, NULL), 
  (3259, 'Andalucia', 205, NULL), 
  (3260, 'Asturias', 205, NULL), 
  (3261, 'Avila', 205, NULL), 
  (3262, 'Badajoz', 205, NULL), 
  (3263, 'Balears', 205, NULL), 
  (3264, 'Barcelona', 205, NULL), 
  (3265, 'Bertamirans', 205, NULL), 
  (3266, 'Biscay', 205, NULL), 
  (3267, 'Burgos', 205, NULL), 
  (3268, 'Caceres', 205, NULL), 
  (3269, 'Cadiz', 205, NULL), 
  (3270, 'Cantabria', 205, NULL), 
  (3271, 'Castello', 205, NULL), 
  (3272, 'Catalunya', 205, NULL), 
  (3273, 'Ceuta', 205, NULL), 
  (3274, 'Ciudad Real', 205, NULL), 
  (
    3275, 'Comunidad Autonoma de Canarias', 
    205, NULL
  ), 
  (
    3276, 'Comunidad Autonoma de Cataluna', 
    205, NULL
  ), 
  (
    3277, 'Comunidad Autonoma de Galicia', 
    205, NULL
  ), 
  (
    3278, 'Comunidad Autonoma de las Isla', 
    205, NULL
  ), 
  (
    3279, 'Comunidad Autonoma del Princip', 
    205, NULL
  ), 
  (
    3280, 'Comunidad Valenciana', 205, 
    NULL
  ), 
  (3281, 'Cordoba', 205, NULL), 
  (3282, 'Cuenca', 205, NULL), 
  (3283, 'Gipuzkoa', 205, NULL), 
  (3284, 'Girona', 205, NULL), 
  (3285, 'Granada', 205, NULL), 
  (3286, 'Guadalajara', 205, NULL), 
  (3287, 'Guipuzcoa', 205, NULL), 
  (3288, 'Huelva', 205, NULL), 
  (3289, 'Huesca', 205, NULL), 
  (3290, 'Jaen', 205, NULL), 
  (3291, 'La Rioja', 205, NULL), 
  (3292, 'Las Palmas', 205, NULL), 
  (3293, 'Leon', 205, NULL), 
  (3294, 'Lerida', 205, NULL), 
  (3295, 'Lleida', 205, NULL), 
  (3296, 'Lugo', 205, NULL), 
  (3297, 'Madrid', 205, NULL), 
  (3298, 'Malaga', 205, NULL), 
  (3299, 'Melilla', 205, NULL), 
  (3300, 'Murcia', 205, NULL), 
  (3301, 'Navarra', 205, NULL), 
  (3302, 'Ourense', 205, NULL), 
  (3303, 'Pais Vasco', 205, NULL), 
  (3304, 'Palencia', 205, NULL), 
  (3305, 'Pontevedra', 205, NULL), 
  (3306, 'Salamanca', 205, NULL), 
  (
    3307, 'Santa Cruz de Tenerife', 205, 
    NULL
  ), 
  (3308, 'Segovia', 205, NULL), 
  (3309, 'Sevilla', 205, NULL), 
  (3310, 'Soria', 205, NULL), 
  (3311, 'Tarragona', 205, NULL), 
  (3312, 'Tenerife', 205, NULL), 
  (3313, 'Teruel', 205, NULL), 
  (3314, 'Toledo', 205, NULL), 
  (3315, 'Valencia', 205, NULL), 
  (3316, 'Valladolid', 205, NULL), 
  (3317, 'Vizcaya', 205, NULL), 
  (3318, 'Zamora', 205, NULL), 
  (3319, 'Zaragoza', 205, NULL), 
  (3320, 'Amparai', 206, NULL), 
  (3321, 'Anuradhapuraya', 206, NULL), 
  (3322, 'Badulla', 206, NULL), 
  (3323, 'Boralesgamuwa', 206, NULL), 
  (3324, 'Colombo', 206, NULL), 
  (3325, 'Galla', 206, NULL), 
  (3326, 'Gampaha', 206, NULL), 
  (3327, 'Hambantota', 206, NULL), 
  (3328, 'Kalatura', 206, NULL), 
  (3329, 'Kegalla', 206, NULL), 
  (3330, 'Kilinochchi', 206, NULL), 
  (3331, 'Kurunegala', 206, NULL), 
  (3332, 'Madakalpuwa', 206, NULL), 
  (3333, 'Maha Nuwara', 206, NULL), 
  (3334, 'Malwana', 206, NULL), 
  (3335, 'Mannarama', 206, NULL), 
  (3336, 'Matale', 206, NULL), 
  (3337, 'Matara', 206, NULL), 
  (3338, 'Monaragala', 206, NULL), 
  (3339, 'Mullaitivu', 206, NULL), 
  (
    3340, 'North Eastern Province', 206, 
    NULL
  ), 
  (
    3341, 'North Western Province', 206, 
    NULL
  ), 
  (3342, 'Nuwara Eliya', 206, NULL), 
  (3343, 'Polonnaruwa', 206, NULL), 
  (3344, 'Puttalama', 206, NULL), 
  (3345, 'Ratnapuraya', 206, NULL), 
  (
    3346, 'Southern Province', 206, NULL
  ), 
  (3347, 'Tirikunamalaya', 206, NULL), 
  (3348, 'Tuscany', 206, NULL), 
  (3349, 'Vavuniyawa', 206, NULL), 
  (
    3350, 'Western Province', 206, NULL
  ), 
  (3351, 'Yapanaya', 206, NULL), 
  (3352, 'kadawatha', 206, NULL), 
  (3353, 'A\'ali-an-Nil', 207, NULL), 
  (3354, 'Bahr-al-Jabal', 207, NULL), 
  (
    3355, 'Central Equatoria', 207, NULL
  ), 
  (
    3356, 'Gharb Bahr-al-Ghazal', 207, 
    NULL
  ), 
  (3357, 'Gharb Darfur', 207, NULL), 
  (3358, 'Gharb Kurdufan', 207, NULL), 
  (
    3359, 'Gharb-al-Istiwa\'iyah', 207, 
    NULL
  ), 
  (3360, 'Janub Darfur', 207, NULL), 
  (3361, 'Janub Kurdufan', 207, NULL), 
  (3362, 'Junqali', 207, NULL), 
  (3363, 'Kassala', 207, NULL), 
  (3364, 'Nahr-an-Nil', 207, NULL), 
  (
    3365, 'Shamal Bahr-al-Ghazal', 207, 
    NULL
  ), 
  (3366, 'Shamal Darfur', 207, NULL), 
  (
    3367, 'Shamal Kurdufan', 207, NULL
  ), 
  (
    3368, 'Sharq-al-Istiwa\'iyah', 207, 
    NULL
  ), 
  (3369, 'Sinnar', 207, NULL), 
  (3370, 'Warab', 207, NULL), 
  (
    3371, 'Wilayat al Khartum', 207, NULL
  ), 
  (
    3372, 'al-Bahr-al-Ahmar', 207, NULL
  ), 
  (3373, 'al-Buhayrat', 207, NULL), 
  (3374, 'al-Jazirah', 207, NULL), 
  (3375, 'al-Khartum', 207, NULL), 
  (3376, 'al-Qadarif', 207, NULL), 
  (3377, 'al-Wahdah', 207, NULL), 
  (
    3378, 'an-Nil-al-Abyad', 207, NULL
  ), 
  (
    3379, 'an-Nil-al-Azraq', 207, NULL
  ), 
  (3380, 'ash-Shamaliyah', 207, NULL), 
  (3381, 'Brokopondo', 208, NULL), 
  (3382, 'Commewijne', 208, NULL), 
  (3383, 'Coronie', 208, NULL), 
  (3384, 'Marowijne', 208, NULL), 
  (3385, 'Nickerie', 208, NULL), 
  (3386, 'Para', 208, NULL), 
  (3387, 'Paramaribo', 208, NULL), 
  (3388, 'Saramacca', 208, NULL), 
  (3389, 'Wanica', 208, NULL), 
  (3390, 'Svalbard', 209, NULL), 
  (3391, 'Hhohho', 210, NULL), 
  (3392, 'Lubombo', 210, NULL), 
  (3393, 'Manzini', 210, NULL), 
  (3394, 'Shiselweni', 210, NULL), 
  (3395, 'Alvsborgs Lan', 211, NULL), 
  (3396, 'Angermanland', 211, NULL), 
  (3397, 'Blekinge', 211, NULL), 
  (3398, 'Bohuslan', 211, NULL), 
  (3399, 'Dalarna', 211, NULL), 
  (3400, 'Gavleborg', 211, NULL), 
  (3401, 'Gaza', 211, NULL), 
  (3402, 'Gotland', 211, NULL), 
  (3403, 'Halland', 211, NULL), 
  (3404, 'Jamtland', 211, NULL), 
  (3405, 'Jonkoping', 211, NULL), 
  (3406, 'Kalmar', 211, NULL), 
  (3407, 'Kristianstads', 211, NULL), 
  (3408, 'Kronoberg', 211, NULL);
INSERT INTO `states` (
  `id`, `name`, `country_id`, `created_by`
) 
VALUES 
  (3409, 'Norrbotten', 211, NULL), 
  (3410, 'Orebro', 211, NULL), 
  (3411, 'Ostergotland', 211, NULL), 
  (3412, 'Saltsjo-Boo', 211, NULL), 
  (3413, 'Skane', 211, NULL), 
  (3414, 'Smaland', 211, NULL), 
  (3415, 'Sodermanland', 211, NULL), 
  (3416, 'Stockholm', 211, NULL), 
  (3417, 'Uppsala', 211, NULL), 
  (3418, 'Varmland', 211, NULL), 
  (3419, 'Vasterbotten', 211, NULL), 
  (3420, 'Vastergotland', 211, NULL), 
  (3421, 'Vasternorrland', 211, NULL), 
  (3422, 'Vastmanland', 211, NULL), 
  (
    3423, 'Vastra Gotaland', 211, NULL
  ), 
  (3424, 'Aargau', 212, NULL), 
  (
    3425, 'Appenzell Inner-Rhoden', 212, 
    NULL
  ), 
  (
    3426, 'Appenzell-Ausser Rhoden', 
    212, NULL
  ), 
  (
    3427, 'Basel-Landschaft', 212, NULL
  ), 
  (3428, 'Basel-Stadt', 212, NULL), 
  (3429, 'Bern', 212, NULL), 
  (3430, 'Canton Ticino', 212, NULL), 
  (3431, 'Fribourg', 212, NULL), 
  (3432, 'Geneve', 212, NULL), 
  (3433, 'Glarus', 212, NULL), 
  (3434, 'Graubunden', 212, NULL), 
  (3435, 'Heerbrugg', 212, NULL), 
  (3436, 'Jura', 212, NULL), 
  (3437, 'Kanton Aargau', 212, NULL), 
  (3438, 'Luzern', 212, NULL), 
  (
    3439, 'Morbio Inferiore', 212, NULL
  ), 
  (3440, 'Muhen', 212, NULL), 
  (3441, 'Neuchatel', 212, NULL), 
  (3442, 'Nidwalden', 212, NULL), 
  (3443, 'Obwalden', 212, NULL), 
  (3444, 'Sankt Gallen', 212, NULL), 
  (3445, 'Schaffhausen', 212, NULL), 
  (3446, 'Schwyz', 212, NULL), 
  (3447, 'Solothurn', 212, NULL), 
  (3448, 'Thurgau', 212, NULL), 
  (3449, 'Ticino', 212, NULL), 
  (3450, 'Uri', 212, NULL), 
  (3451, 'Valais', 212, NULL), 
  (3452, 'Vaud', 212, NULL), 
  (3453, 'Vauffelin', 212, NULL), 
  (3454, 'Zug', 212, NULL), 
  (3455, 'Zurich', 212, NULL), 
  (3456, 'Aleppo', 213, NULL), 
  (3457, 'Dar\'a', 213, NULL), 
  (3458, 'Dayr-az-Zawr', 213, NULL), 
  (3459, 'Dimashq', 213, NULL), 
  (3460, 'Halab', 213, NULL), 
  (3461, 'Hamah', 213, NULL), 
  (3462, 'Hims', 213, NULL), 
  (3463, 'Idlib', 213, NULL), 
  (
    3464, 'Madinat Dimashq', 213, NULL
  ), 
  (3465, 'Tartus', 213, NULL), 
  (3466, 'al-Hasakah', 213, NULL), 
  (3467, 'al-Ladhiqiyah', 213, NULL), 
  (3468, 'al-Qunaytirah', 213, NULL), 
  (3469, 'ar-Raqqah', 213, NULL), 
  (3470, 'as-Suwayda', 213, NULL), 
  (3471, 'Changhwa', 214, NULL), 
  (3472, 'Chiayi Hsien', 214, NULL), 
  (3473, 'Chiayi Shih', 214, NULL), 
  (3474, 'Eastern Taipei', 214, NULL), 
  (3475, 'Hsinchu Hsien', 214, NULL), 
  (3476, 'Hsinchu Shih', 214, NULL), 
  (3477, 'Hualien', 214, NULL), 
  (3478, 'Ilan', 214, NULL), 
  (
    3479, 'Kaohsiung Hsien', 214, NULL
  ), 
  (3480, 'Kaohsiung Shih', 214, NULL), 
  (3481, 'Keelung Shih', 214, NULL), 
  (3482, 'Kinmen', 214, NULL), 
  (3483, 'Miaoli', 214, NULL), 
  (3484, 'Nantou', 214, NULL), 
  (
    3485, 'Northern Taiwan', 214, NULL
  ), 
  (3486, 'Penghu', 214, NULL), 
  (3487, 'Pingtung', 214, NULL), 
  (3488, 'Taichung', 214, NULL), 
  (3489, 'Taichung Hsien', 214, NULL), 
  (3490, 'Taichung Shih', 214, NULL), 
  (3491, 'Tainan Hsien', 214, NULL), 
  (3492, 'Tainan Shih', 214, NULL), 
  (3493, 'Taipei Hsien', 214, NULL), 
  (
    3494, 'Taipei Shih / Taipei Hsien', 
    214, NULL
  ), 
  (3495, 'Taitung', 214, NULL), 
  (3496, 'Taoyuan', 214, NULL), 
  (3497, 'Yilan', 214, NULL), 
  (3498, 'Yun-Lin Hsien', 214, NULL), 
  (3499, 'Yunlin', 214, NULL), 
  (3500, 'Dushanbe', 215, NULL), 
  (
    3501, 'Gorno-Badakhshan', 215, NULL
  ), 
  (3502, 'Karotegin', 215, NULL), 
  (3503, 'Khatlon', 215, NULL), 
  (3504, 'Sughd', 215, NULL), 
  (3505, 'Arusha', 216, NULL), 
  (3506, 'Dar es Salaam', 216, NULL), 
  (3507, 'Dodoma', 216, NULL), 
  (3508, 'Iringa', 216, NULL), 
  (3509, 'Kagera', 216, NULL), 
  (3510, 'Kigoma', 216, NULL), 
  (3511, 'Kilimanjaro', 216, NULL), 
  (3512, 'Lindi', 216, NULL), 
  (3513, 'Mara', 216, NULL), 
  (3514, 'Mbeya', 216, NULL), 
  (3515, 'Morogoro', 216, NULL), 
  (3516, 'Mtwara', 216, NULL), 
  (3517, 'Mwanza', 216, NULL), 
  (3518, 'Pwani', 216, NULL), 
  (3519, 'Rukwa', 216, NULL), 
  (3520, 'Ruvuma', 216, NULL), 
  (3521, 'Shinyanga', 216, NULL), 
  (3522, 'Singida', 216, NULL), 
  (3523, 'Tabora', 216, NULL), 
  (3524, 'Tanga', 216, NULL), 
  (
    3525, 'Zanzibar and Pemba', 216, NULL
  ), 
  (3526, 'Amnat Charoen', 217, NULL), 
  (3527, 'Ang Thong', 217, NULL), 
  (3528, 'Bangkok', 217, NULL), 
  (3529, 'Buri Ram', 217, NULL), 
  (3530, 'Chachoengsao', 217, NULL), 
  (3531, 'Chai Nat', 217, NULL), 
  (3532, 'Chaiyaphum', 217, NULL), 
  (
    3533, 'Changwat Chaiyaphum', 217, 
    NULL
  ), 
  (3534, 'Chanthaburi', 217, NULL), 
  (3535, 'Chiang Mai', 217, NULL), 
  (3536, 'Chiang Rai', 217, NULL), 
  (3537, 'Chon Buri', 217, NULL), 
  (3538, 'Chumphon', 217, NULL), 
  (3539, 'Kalasin', 217, NULL), 
  (3540, 'Kamphaeng Phet', 217, NULL), 
  (3541, 'Kanchanaburi', 217, NULL), 
  (3542, 'Khon Kaen', 217, NULL), 
  (3543, 'Krabi', 217, NULL), 
  (3544, 'Krung Thep', 217, NULL), 
  (3545, 'Lampang', 217, NULL), 
  (3546, 'Lamphun', 217, NULL), 
  (3547, 'Loei', 217, NULL), 
  (3548, 'Lop Buri', 217, NULL), 
  (3549, 'Mae Hong Son', 217, NULL), 
  (3550, 'Maha Sarakham', 217, NULL), 
  (3551, 'Mukdahan', 217, NULL), 
  (3552, 'Nakhon Nayok', 217, NULL), 
  (3553, 'Nakhon Pathom', 217, NULL), 
  (3554, 'Nakhon Phanom', 217, NULL), 
  (
    3555, 'Nakhon Ratchasima', 217, NULL
  ), 
  (3556, 'Nakhon Sawan', 217, NULL), 
  (
    3557, 'Nakhon Si Thammarat', 217, 
    NULL
  ), 
  (3558, 'Nan', 217, NULL), 
  (3559, 'Narathiwat', 217, NULL), 
  (
    3560, 'Nong Bua Lam Phu', 217, NULL
  ), 
  (3561, 'Nong Khai', 217, NULL), 
  (3562, 'Nonthaburi', 217, NULL), 
  (3563, 'Pathum Thani', 217, NULL), 
  (3564, 'Pattani', 217, NULL), 
  (3565, 'Phangnga', 217, NULL), 
  (3566, 'Phatthalung', 217, NULL), 
  (3567, 'Phayao', 217, NULL), 
  (3568, 'Phetchabun', 217, NULL), 
  (3569, 'Phetchaburi', 217, NULL), 
  (3570, 'Phichit', 217, NULL), 
  (3571, 'Phitsanulok', 217, NULL), 
  (
    3572, 'Phra Nakhon Si Ayutthaya', 
    217, NULL
  ), 
  (3573, 'Phrae', 217, NULL), 
  (3574, 'Phuket', 217, NULL), 
  (3575, 'Prachin Buri', 217, NULL), 
  (
    3576, 'Prachuap Khiri Khan', 217, 
    NULL
  ), 
  (3577, 'Ranong', 217, NULL), 
  (3578, 'Ratchaburi', 217, NULL), 
  (3579, 'Rayong', 217, NULL), 
  (3580, 'Roi Et', 217, NULL), 
  (3581, 'Sa Kaeo', 217, NULL), 
  (3582, 'Sakon Nakhon', 217, NULL), 
  (3583, 'Samut Prakan', 217, NULL), 
  (3584, 'Samut Sakhon', 217, NULL), 
  (
    3585, 'Samut Songkhran', 217, NULL
  ), 
  (3586, 'Saraburi', 217, NULL), 
  (3587, 'Satun', 217, NULL), 
  (3588, 'Si Sa Ket', 217, NULL), 
  (3589, 'Sing Buri', 217, NULL), 
  (3590, 'Songkhla', 217, NULL), 
  (3591, 'Sukhothai', 217, NULL), 
  (3592, 'Suphan Buri', 217, NULL), 
  (3593, 'Surat Thani', 217, NULL), 
  (3594, 'Surin', 217, NULL), 
  (3595, 'Tak', 217, NULL), 
  (3596, 'Trang', 217, NULL), 
  (3597, 'Trat', 217, NULL), 
  (
    3598, 'Ubon Ratchathani', 217, NULL
  ), 
  (3599, 'Udon Thani', 217, NULL), 
  (3600, 'Uthai Thani', 217, NULL), 
  (3601, 'Uttaradit', 217, NULL), 
  (3602, 'Yala', 217, NULL), 
  (3603, 'Yasothon', 217, NULL), 
  (3604, 'Centre', 218, NULL), 
  (3605, 'Kara', 218, NULL), 
  (3606, 'Maritime', 218, NULL), 
  (3607, 'Plateaux', 218, NULL), 
  (3608, 'Savanes', 218, NULL), 
  (3609, 'Atafu', 219, NULL), 
  (3610, 'Fakaofo', 219, NULL), 
  (3611, 'Nukunonu', 219, NULL), 
  (3612, 'Eua', 220, NULL), 
  (3613, 'Ha\'apai', 220, NULL), 
  (3614, 'Niuas', 220, NULL), 
  (3615, 'Tongatapu', 220, NULL), 
  (3616, 'Vava\'u', 220, NULL), 
  (
    3617, 'Arima-Tunapuna-Piarco', 221, 
    NULL
  ), 
  (3618, 'Caroni', 221, NULL), 
  (3619, 'Chaguanas', 221, NULL), 
  (
    3620, 'Couva-Tabaquite-Talparo', 
    221, NULL
  ), 
  (3621, 'Diego Martin', 221, NULL), 
  (3622, 'Glencoe', 221, NULL), 
  (3623, 'Penal Debe', 221, NULL), 
  (3624, 'Point Fortin', 221, NULL), 
  (3625, 'Port of Spain', 221, NULL), 
  (3626, 'Princes Town', 221, NULL), 
  (3627, 'Saint George', 221, NULL), 
  (3628, 'San Fernando', 221, NULL), 
  (3629, 'San Juan', 221, NULL), 
  (3630, 'Sangre Grande', 221, NULL), 
  (3631, 'Siparia', 221, NULL), 
  (3632, 'Tobago', 221, NULL), 
  (3633, 'Aryanah', 222, NULL), 
  (3634, 'Bajah', 222, NULL), 
  (3635, 'Bin \'Arus', 222, NULL), 
  (3636, 'Binzart', 222, NULL), 
  (
    3637, 'Gouvernorat de Ariana', 222, 
    NULL
  ), 
  (
    3638, 'Gouvernorat de Nabeul', 222, 
    NULL
  ), 
  (
    3639, 'Gouvernorat de Sousse', 222, 
    NULL
  ), 
  (
    3640, 'Hammamet Yasmine', 222, NULL
  ), 
  (3641, 'Jundubah', 222, NULL), 
  (3642, 'Madaniyin', 222, NULL), 
  (3643, 'Manubah', 222, NULL), 
  (3644, 'Monastir', 222, NULL), 
  (3645, 'Nabul', 222, NULL), 
  (3646, 'Qabis', 222, NULL), 
  (3647, 'Qafsah', 222, NULL), 
  (3648, 'Qibili', 222, NULL), 
  (3649, 'Safaqis', 222, NULL), 
  (3650, 'Sfax', 222, NULL), 
  (3651, 'Sidi Bu Zayd', 222, NULL), 
  (3652, 'Silyanah', 222, NULL), 
  (3653, 'Susah', 222, NULL), 
  (3654, 'Tatawin', 222, NULL), 
  (3655, 'Tawzar', 222, NULL), 
  (3656, 'Tunis', 222, NULL), 
  (3657, 'Zaghwan', 222, NULL), 
  (3658, 'al-Kaf', 222, NULL), 
  (3659, 'al-Mahdiyah', 222, NULL), 
  (3660, 'al-Munastir', 222, NULL), 
  (3661, 'al-Qasrayn', 222, NULL), 
  (3662, 'al-Qayrawan', 222, NULL), 
  (3663, 'Adana', 223, NULL), 
  (3664, 'Adiyaman', 223, NULL), 
  (3665, 'Afyon', 223, NULL), 
  (3666, 'Agri', 223, NULL), 
  (3667, 'Aksaray', 223, NULL), 
  (3668, 'Amasya', 223, NULL), 
  (3669, 'Ankara', 223, NULL), 
  (3670, 'Antalya', 223, NULL), 
  (3671, 'Ardahan', 223, NULL), 
  (3672, 'Artvin', 223, NULL), 
  (3673, 'Aydin', 223, NULL), 
  (3674, 'Balikesir', 223, NULL), 
  (3675, 'Bartin', 223, NULL), 
  (3676, 'Batman', 223, NULL), 
  (3677, 'Bayburt', 223, NULL), 
  (3678, 'Bilecik', 223, NULL), 
  (3679, 'Bingol', 223, NULL), 
  (3680, 'Bitlis', 223, NULL), 
  (3681, 'Bolu', 223, NULL), 
  (3682, 'Burdur', 223, NULL), 
  (3683, 'Bursa', 223, NULL), 
  (3684, 'Canakkale', 223, NULL), 
  (3685, 'Cankiri', 223, NULL), 
  (3686, 'Corum', 223, NULL), 
  (3687, 'Denizli', 223, NULL), 
  (3688, 'Diyarbakir', 223, NULL), 
  (3689, 'Duzce', 223, NULL), 
  (3690, 'Edirne', 223, NULL), 
  (3691, 'Elazig', 223, NULL), 
  (3692, 'Erzincan', 223, NULL), 
  (3693, 'Erzurum', 223, NULL), 
  (3694, 'Eskisehir', 223, NULL), 
  (3695, 'Gaziantep', 223, NULL), 
  (3696, 'Giresun', 223, NULL), 
  (3697, 'Gumushane', 223, NULL), 
  (3698, 'Hakkari', 223, NULL), 
  (3699, 'Hatay', 223, NULL), 
  (3700, 'Icel', 223, NULL), 
  (3701, 'Igdir', 223, NULL), 
  (3702, 'Isparta', 223, NULL), 
  (3703, 'Istanbul', 223, NULL), 
  (3704, 'Izmir', 223, NULL), 
  (3705, 'Kahramanmaras', 223, NULL), 
  (3706, 'Karabuk', 223, NULL), 
  (3707, 'Karaman', 223, NULL), 
  (3708, 'Kars', 223, NULL), 
  (3709, 'Karsiyaka', 223, NULL), 
  (3710, 'Kastamonu', 223, NULL), 
  (3711, 'Kayseri', 223, NULL), 
  (3712, 'Kilis', 223, NULL), 
  (3713, 'Kirikkale', 223, NULL), 
  (3714, 'Kirklareli', 223, NULL), 
  (3715, 'Kirsehir', 223, NULL), 
  (3716, 'Kocaeli', 223, NULL), 
  (3717, 'Konya', 223, NULL), 
  (3718, 'Kutahya', 223, NULL), 
  (3719, 'Lefkosa', 223, NULL), 
  (3720, 'Malatya', 223, NULL), 
  (3721, 'Manisa', 223, NULL), 
  (3722, 'Mardin', 223, NULL), 
  (3723, 'Mugla', 223, NULL), 
  (3724, 'Mus', 223, NULL), 
  (3725, 'Nevsehir', 223, NULL), 
  (3726, 'Nigde', 223, NULL), 
  (3727, 'Ordu', 223, NULL), 
  (3728, 'Osmaniye', 223, NULL), 
  (3729, 'Rize', 223, NULL), 
  (3730, 'Sakarya', 223, NULL), 
  (3731, 'Samsun', 223, NULL), 
  (3732, 'Sanliurfa', 223, NULL), 
  (3733, 'Siirt', 223, NULL), 
  (3734, 'Sinop', 223, NULL), 
  (3735, 'Sirnak', 223, NULL), 
  (3736, 'Sivas', 223, NULL), 
  (3737, 'Tekirdag', 223, NULL), 
  (3738, 'Tokat', 223, NULL), 
  (3739, 'Trabzon', 223, NULL), 
  (3740, 'Tunceli', 223, NULL), 
  (3741, 'Usak', 223, NULL), 
  (3742, 'Van', 223, NULL), 
  (3743, 'Yalova', 223, NULL), 
  (3744, 'Yozgat', 223, NULL), 
  (3745, 'Zonguldak', 223, NULL), 
  (3746, 'Ahal', 224, NULL), 
  (3747, 'Asgabat', 224, NULL), 
  (3748, 'Balkan', 224, NULL), 
  (3749, 'Dasoguz', 224, NULL), 
  (3750, 'Lebap', 224, NULL), 
  (3751, 'Mari', 224, NULL), 
  (3752, 'Grand Turk', 225, NULL), 
  (
    3753, 'South Caicos and East Caicos', 
    225, NULL
  ), 
  (3754, 'Funafuti', 226, NULL), 
  (3755, 'Nanumanga', 226, NULL), 
  (3756, 'Nanumea', 226, NULL), 
  (3757, 'Niutao', 226, NULL), 
  (3758, 'Nui', 226, NULL), 
  (3759, 'Nukufetau', 226, NULL), 
  (3760, 'Nukulaelae', 226, NULL), 
  (3761, 'Vaitupu', 226, NULL), 
  (3762, 'Central', 227, NULL), 
  (3763, 'Eastern', 227, NULL), 
  (3764, 'Northern', 227, NULL), 
  (3765, 'Western', 227, NULL), 
  (3766, 'Cherkas\'ka', 228, NULL), 
  (3767, 'Chernihivs\'ka', 228, NULL), 
  (3768, 'Chernivets\'ka', 228, NULL), 
  (3769, 'Crimea', 228, NULL), 
  (
    3770, 'Dnipropetrovska', 228, NULL
  ), 
  (3771, 'Donets\'ka', 228, NULL), 
  (
    3772, 'Ivano-Frankivs\'ka', 228, NULL
  ), 
  (3773, 'Kharkiv', 228, NULL), 
  (3774, 'Kharkov', 228, NULL), 
  (3775, 'Khersonska', 228, NULL), 
  (
    3776, 'Khmel\'nyts\'ka', 228, NULL
  ), 
  (3777, 'Kirovohrad', 228, NULL), 
  (3778, 'Krym', 228, NULL), 
  (3779, 'Kyyiv', 228, NULL), 
  (3780, 'Kyyivs\'ka', 228, NULL), 
  (3781, 'L\'vivs\'ka', 228, NULL), 
  (3782, 'Luhans\'ka', 228, NULL), 
  (3783, 'Mykolayivs\'ka', 228, NULL), 
  (3784, 'Odes\'ka', 228, NULL), 
  (3785, 'Odessa', 228, NULL), 
  (3786, 'Poltavs\'ka', 228, NULL), 
  (3787, 'Rivnens\'ka', 228, NULL), 
  (3788, 'Sevastopol\'', 228, NULL), 
  (3789, 'Sums\'ka', 228, NULL), 
  (
    3790, 'Ternopil\'s\'ka', 228, NULL
  ), 
  (3791, 'Volyns\'ka', 228, NULL), 
  (3792, 'Vynnyts\'ka', 228, NULL), 
  (3793, 'Zakarpats\'ka', 228, NULL), 
  (3794, 'Zaporizhia', 228, NULL), 
  (3795, 'Zhytomyrs\'ka', 228, NULL), 
  (3796, 'Abu Zabi', 229, NULL), 
  (3797, 'Ajman', 229, NULL), 
  (3798, 'Dubai', 229, NULL), 
  (3799, 'Ras al-Khaymah', 229, NULL), 
  (3800, 'Sharjah', 229, NULL), 
  (3801, 'Sharjha', 229, NULL), 
  (3802, 'Umm al Qaywayn', 229, NULL), 
  (3803, 'al-Fujayrah', 229, NULL), 
  (3804, 'ash-Shariqah', 229, NULL), 
  (3805, 'Aberdeen', 230, NULL), 
  (3806, 'Aberdeenshire', 230, NULL), 
  (3807, 'Argyll', 230, NULL), 
  (3808, 'Armagh', 230, NULL), 
  (3809, 'Bedfordshire', 230, NULL), 
  (3810, 'Belfast', 230, NULL), 
  (3811, 'Berkshire', 230, NULL), 
  (3812, 'Birmingham', 230, NULL), 
  (3813, 'Brechin', 230, NULL), 
  (3814, 'Bridgnorth', 230, NULL), 
  (3815, 'Bristol', 230, NULL), 
  (
    3816, 'Buckinghamshire', 230, NULL
  ), 
  (3817, 'Cambridge', 230, NULL), 
  (3818, 'Cambridgeshire', 230, NULL), 
  (
    3819, 'Channel Islands', 230, NULL
  ), 
  (3820, 'Cheshire', 230, NULL), 
  (3821, 'Cleveland', 230, NULL), 
  (3822, 'Co Fermanagh', 230, NULL), 
  (3823, 'Conwy', 230, NULL), 
  (3824, 'Cornwall', 230, NULL), 
  (3825, 'Coventry', 230, NULL), 
  (3826, 'Craven Arms', 230, NULL), 
  (3827, 'Cumbria', 230, NULL), 
  (3828, 'Denbighshire', 230, NULL), 
  (3829, 'Derby', 230, NULL), 
  (3830, 'Derbyshire', 230, NULL), 
  (3831, 'Devon', 230, NULL), 
  (
    3832, 'Dial Code Dungannon', 230, 
    NULL
  ), 
  (3833, 'Didcot', 230, NULL), 
  (3834, 'Dorset', 230, NULL), 
  (3835, 'Dunbartonshire', 230, NULL), 
  (3836, 'Durham', 230, NULL), 
  (
    3837, 'East Dunbartonshire', 230, 
    NULL
  ), 
  (3838, 'East Lothian', 230, NULL), 
  (3839, 'East Midlands', 230, NULL), 
  (3840, 'East Sussex', 230, NULL), 
  (3841, 'East Yorkshire', 230, NULL), 
  (3842, 'England', 230, NULL), 
  (3843, 'Essex', 230, NULL), 
  (3844, 'Fermanagh', 230, NULL), 
  (3845, 'Fife', 230, NULL), 
  (3846, 'Flintshire', 230, NULL), 
  (3847, 'Fulham', 230, NULL), 
  (3848, 'Gainsborough', 230, NULL), 
  (3849, 'Glocestershire', 230, NULL), 
  (3850, 'Gwent', 230, NULL), 
  (3851, 'Hampshire', 230, NULL), 
  (3852, 'Hants', 230, NULL), 
  (3853, 'Herefordshire', 230, NULL), 
  (3854, 'Hertfordshire', 230, NULL), 
  (3855, 'Ireland', 230, NULL), 
  (3856, 'Isle Of Man', 230, NULL), 
  (3857, 'Isle of Wight', 230, NULL), 
  (3858, 'Kenford', 230, NULL), 
  (3859, 'Kent', 230, NULL), 
  (3860, 'Kilmarnock', 230, NULL), 
  (3861, 'Lanarkshire', 230, NULL), 
  (3862, 'Lancashire', 230, NULL), 
  (3863, 'Leicestershire', 230, NULL), 
  (3864, 'Lincolnshire', 230, NULL), 
  (3865, 'Llanymynech', 230, NULL), 
  (3866, 'London', 230, NULL), 
  (3867, 'Ludlow', 230, NULL), 
  (3868, 'Manchester', 230, NULL), 
  (3869, 'Mayfair', 230, NULL), 
  (3870, 'Merseyside', 230, NULL), 
  (3871, 'Mid Glamorgan', 230, NULL), 
  (3872, 'Middlesex', 230, NULL), 
  (3873, 'Mildenhall', 230, NULL), 
  (3874, 'Monmouthshire', 230, NULL), 
  (3875, 'Newton Stewart', 230, NULL), 
  (3876, 'Norfolk', 230, NULL), 
  (
    3877, 'North Humberside', 230, NULL
  ), 
  (
    3878, 'North Yorkshire', 230, NULL
  ), 
  (
    3879, 'Northamptonshire', 230, NULL
  ), 
  (3880, 'Northants', 230, NULL), 
  (
    3881, 'Northern Ireland', 230, NULL
  ), 
  (3882, 'Northumberland', 230, NULL), 
  (
    3883, 'Nottinghamshire', 230, NULL
  ), 
  (3884, 'Oxford', 230, NULL), 
  (3885, 'Powys', 230, NULL), 
  (3886, 'Roos-shire', 230, NULL), 
  (3887, 'SUSSEX', 230, NULL), 
  (3888, 'Sark', 230, NULL), 
  (3889, 'Scotland', 230, NULL), 
  (
    3890, 'Scottish Borders', 230, NULL
  ), 
  (3891, 'Shropshire', 230, NULL), 
  (3892, 'Somerset', 230, NULL), 
  (
    3893, 'South Glamorgan', 230, NULL
  ), 
  (3894, 'South Wales', 230, NULL), 
  (
    3895, 'South Yorkshire', 230, NULL
  ), 
  (3896, 'Southwell', 230, NULL), 
  (3897, 'Staffordshire', 230, NULL), 
  (3898, 'Strabane', 230, NULL), 
  (3899, 'Suffolk', 230, NULL), 
  (3900, 'Surrey', 230, NULL), 
  (3901, 'Sussex', 230, NULL), 
  (3902, 'Twickenham', 230, NULL), 
  (3903, 'Tyne and Wear', 230, NULL), 
  (3904, 'Tyrone', 230, NULL), 
  (3905, 'Utah', 230, NULL), 
  (3906, 'Wales', 230, NULL), 
  (3907, 'Warwickshire', 230, NULL), 
  (3908, 'West Lothian', 230, NULL), 
  (3909, 'West Midlands', 230, NULL), 
  (3910, 'West Sussex', 230, NULL), 
  (3911, 'West Yorkshire', 230, NULL), 
  (3912, 'Whissendine', 230, NULL), 
  (3913, 'Wiltshire', 230, NULL), 
  (3914, 'Wokingham', 230, NULL), 
  (3915, 'Worcestershire', 230, NULL), 
  (3916, 'Wrexham', 230, NULL), 
  (3917, 'Wurttemberg', 230, NULL), 
  (3918, 'Yorkshire', 230, NULL), 
  (3919, 'Alabama', 231, NULL), 
  (3920, 'Alaska', 231, NULL), 
  (3921, 'Arizona', 231, NULL), 
  (3922, 'Arkansas', 231, NULL), 
  (3923, 'Byram', 231, NULL), 
  (3924, 'California', 231, NULL), 
  (3925, 'Cokato', 231, NULL), 
  (3926, 'Colorado', 231, NULL), 
  (3927, 'Connecticut', 231, NULL), 
  (3928, 'Delaware', 231, NULL), 
  (
    3929, 'District of Columbia', 231, 
    NULL
  ), 
  (3930, 'Florida', 231, NULL), 
  (3931, 'Georgia', 231, NULL), 
  (3932, 'Hawaii', 231, NULL), 
  (3933, 'Idaho', 231, NULL), 
  (3934, 'Illinois', 231, NULL), 
  (3935, 'Indiana', 231, NULL), 
  (3936, 'Iowa', 231, NULL), 
  (3937, 'Kansas', 231, NULL), 
  (3938, 'Kentucky', 231, NULL), 
  (3939, 'Louisiana', 231, NULL), 
  (3940, 'Lowa', 231, NULL), 
  (3941, 'Maine', 231, NULL), 
  (3942, 'Maryland', 231, NULL), 
  (3943, 'Massachusetts', 231, NULL), 
  (3944, 'Medfield', 231, NULL), 
  (3945, 'Michigan', 231, NULL), 
  (3946, 'Minnesota', 231, NULL), 
  (3947, 'Mississippi', 231, NULL), 
  (3948, 'Missouri', 231, NULL), 
  (3949, 'Montana', 231, NULL), 
  (3950, 'Nebraska', 231, NULL), 
  (3951, 'Nevada', 231, NULL), 
  (3952, 'New Hampshire', 231, NULL), 
  (3953, 'New Jersey', 231, NULL), 
  (3954, 'New Jersy', 231, NULL), 
  (3955, 'New Mexico', 231, NULL), 
  (3956, 'New York', 231, NULL), 
  (3957, 'North Carolina', 231, NULL), 
  (3958, 'North Dakota', 231, NULL), 
  (3959, 'Ohio', 231, NULL), 
  (3960, 'Oklahoma', 231, NULL), 
  (3961, 'Ontario', 231, NULL), 
  (3962, 'Oregon', 231, NULL), 
  (3963, 'Pennsylvania', 231, NULL), 
  (3964, 'Ramey', 231, NULL), 
  (3965, 'Rhode Island', 231, NULL), 
  (3966, 'South Carolina', 231, NULL), 
  (3967, 'South Dakota', 231, NULL), 
  (3968, 'Sublimity', 231, NULL), 
  (3969, 'Tennessee', 231, NULL), 
  (3970, 'Texas', 231, NULL), 
  (3971, 'Trimble', 231, NULL), 
  (3972, 'Utah', 231, NULL), 
  (3973, 'Vermont', 231, NULL), 
  (3974, 'Virginia', 231, NULL), 
  (3975, 'Washington', 231, NULL), 
  (3976, 'West Virginia', 231, NULL), 
  (3977, 'Wisconsin', 231, NULL), 
  (3978, 'Wyoming', 231, NULL), 
  (
    3979, 'United States Minor Outlying I', 
    232, NULL
  ), 
  (3980, 'Artigas', 233, NULL), 
  (3981, 'Canelones', 233, NULL), 
  (3982, 'Cerro Largo', 233, NULL), 
  (3983, 'Colonia', 233, NULL), 
  (3984, 'Durazno', 233, NULL), 
  (3985, 'FLorida', 233, NULL), 
  (3986, 'Flores', 233, NULL), 
  (3987, 'Lavalleja', 233, NULL), 
  (3988, 'Maldonado', 233, NULL), 
  (3989, 'Montevideo', 233, NULL), 
  (3990, 'Paysandu', 233, NULL), 
  (3991, 'Rio Negro', 233, NULL), 
  (3992, 'Rivera', 233, NULL), 
  (3993, 'Rocha', 233, NULL), 
  (3994, 'Salto', 233, NULL), 
  (3995, 'San Jose', 233, NULL), 
  (3996, 'Soriano', 233, NULL), 
  (3997, 'Tacuarembo', 233, NULL), 
  (3998, 'Treinta y Tres', 233, NULL), 
  (3999, 'Andijon', 234, NULL), 
  (4000, 'Buhoro', 234, NULL), 
  (
    4001, 'Buxoro Viloyati', 234, NULL
  ), 
  (4002, 'Cizah', 234, NULL), 
  (4003, 'Fargona', 234, NULL), 
  (4004, 'Horazm', 234, NULL), 
  (4005, 'Kaskadar', 234, NULL), 
  (
    4006, 'Korakalpogiston', 234, NULL
  ), 
  (4007, 'Namangan', 234, NULL), 
  (4008, 'Navoi', 234, NULL), 
  (4009, 'Samarkand', 234, NULL), 
  (4010, 'Sirdare', 234, NULL), 
  (4011, 'Surhondar', 234, NULL), 
  (4012, 'Toskent', 234, NULL), 
  (4013, 'Malampa', 235, NULL), 
  (4014, 'Penama', 235, NULL), 
  (4015, 'Sanma', 235, NULL), 
  (4016, 'Shefa', 235, NULL), 
  (4017, 'Tafea', 235, NULL), 
  (4018, 'Torba', 235, NULL), 
  (
    4019, 'Vatican City State (Holy See)', 
    236, NULL
  ), 
  (4020, 'Amazonas', 237, NULL), 
  (4021, 'Anzoategui', 237, NULL), 
  (4022, 'Apure', 237, NULL), 
  (4023, 'Aragua', 237, NULL), 
  (4024, 'Barinas', 237, NULL), 
  (4025, 'Bolivar', 237, NULL), 
  (4026, 'Carabobo', 237, NULL), 
  (4027, 'Cojedes', 237, NULL), 
  (4028, 'Delta Amacuro', 237, NULL), 
  (
    4029, 'Distrito Federal', 237, NULL
  ), 
  (4030, 'Falcon', 237, NULL), 
  (4031, 'Guarico', 237, NULL), 
  (4032, 'Lara', 237, NULL), 
  (4033, 'Merida', 237, NULL), 
  (4034, 'Miranda', 237, NULL), 
  (4035, 'Monagas', 237, NULL), 
  (4036, 'Nueva Esparta', 237, NULL), 
  (4037, 'Portuguesa', 237, NULL), 
  (4038, 'Sucre', 237, NULL), 
  (4039, 'Tachira', 237, NULL), 
  (4040, 'Trujillo', 237, NULL), 
  (4041, 'Vargas', 237, NULL), 
  (4042, 'Yaracuy', 237, NULL), 
  (4043, 'Zulia', 237, NULL), 
  (4044, 'Bac Giang', 238, NULL), 
  (4045, 'Binh Dinh', 238, NULL), 
  (4046, 'Binh Duong', 238, NULL), 
  (4047, 'Da Nang', 238, NULL), 
  (
    4048, 'Dong Bang Song Cuu Long', 
    238, NULL
  ), 
  (
    4049, 'Dong Bang Song Hong', 238, 
    NULL
  ), 
  (4050, 'Dong Nai', 238, NULL), 
  (4051, 'Dong Nam Bo', 238, NULL), 
  (
    4052, 'Duyen Hai Mien Trung', 238, 
    NULL
  ), 
  (4053, 'Hanoi', 238, NULL), 
  (4054, 'Hung Yen', 238, NULL), 
  (4055, 'Khu Bon Cu', 238, NULL), 
  (4056, 'Long An', 238, NULL), 
  (
    4057, 'Mien Nui Va Trung Du', 238, 
    NULL
  ), 
  (4058, 'Thai Nguyen', 238, NULL), 
  (
    4059, 'Thanh Pho Ho Chi Minh', 238, 
    NULL
  ), 
  (4060, 'Thu Do Ha Noi', 238, NULL), 
  (4061, 'Tinh Can Tho', 238, NULL), 
  (4062, 'Tinh Da Nang', 238, NULL), 
  (4063, 'Tinh Gia Lai', 238, NULL), 
  (4064, 'Anegada', 239, NULL), 
  (4065, 'Jost van Dyke', 239, NULL), 
  (4066, 'Tortola', 239, NULL), 
  (4067, 'Saint Croix', 240, NULL), 
  (4068, 'Saint John', 240, NULL), 
  (4069, 'Saint Thomas', 240, NULL), 
  (4070, 'Alo', 241, NULL), 
  (4071, 'Singave', 241, NULL), 
  (4072, 'Wallis', 241, NULL), 
  (4073, 'Bu Jaydur', 242, NULL), 
  (4074, 'Wad-adh-Dhahab', 242, NULL), 
  (4075, 'al-\'Ayun', 242, NULL), 
  (4076, 'as-Samarah', 242, NULL), 
  (4077, '\'Adan', 243, NULL), 
  (4078, 'Abyan', 243, NULL), 
  (4079, 'Dhamar', 243, NULL), 
  (4080, 'Hadramaut', 243, NULL), 
  (4081, 'Hajjah', 243, NULL), 
  (4082, 'Hudaydah', 243, NULL), 
  (4083, 'Ibb', 243, NULL), 
  (4084, 'Lahij', 243, NULL), 
  (4085, 'Ma\'rib', 243, NULL), 
  (4086, 'Madinat San\'a', 243, NULL), 
  (4087, 'Sa\'dah', 243, NULL), 
  (4088, 'Sana', 243, NULL), 
  (4089, 'Shabwah', 243, NULL), 
  (4090, 'Ta\'izz', 243, NULL), 
  (4091, 'al-Bayda', 243, NULL), 
  (4092, 'al-Hudaydah', 243, NULL), 
  (4093, 'al-Jawf', 243, NULL), 
  (4094, 'al-Mahrah', 243, NULL), 
  (4095, 'al-Mahwit', 243, NULL), 
  (4096, 'Central Serbia', 244, NULL), 
  (
    4097, 'Kosovo and Metohija', 244, 
    NULL
  ), 
  (4098, 'Montenegro', 244, NULL), 
  (
    4099, 'Republic of Serbia', 244, NULL
  ), 
  (4100, 'Serbia', 244, NULL), 
  (4101, 'Vojvodina', 244, NULL), 
  (4102, 'Central', 245, NULL), 
  (4103, 'Copperbelt', 245, NULL), 
  (4104, 'Eastern', 245, NULL), 
  (4105, 'Luapala', 245, NULL), 
  (4106, 'Lusaka', 245, NULL), 
  (4107, 'North-Western', 245, NULL), 
  (4108, 'Northern', 245, NULL), 
  (4109, 'Southern', 245, NULL), 
  (4110, 'Western', 245, NULL), 
  (4111, 'Bulawayo', 246, NULL), 
  (4112, 'Harare', 246, NULL), 
  (4113, 'Manicaland', 246, NULL), 
  (
    4114, 'Mashonaland Central', 246, 
    NULL
  ), 
  (
    4115, 'Mashonaland East', 246, NULL
  ), 
  (
    4116, 'Mashonaland West', 246, NULL
  ), 
  (4117, 'Masvingo', 246, NULL), 
  (
    4118, 'Matabeleland North', 246, NULL
  ), 
  (
    4119, 'Matabeleland South', 246, NULL
  ), 
  (4120, 'Midlands', 246, NULL), 
  (4121, 'hn', 238, 1), 
  (4122, 'adrar 01', 3, 1);
CREATE TABLE `theme_colors` (
  `setting_id` int(11) NOT NULL, 
  `setting_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `setting_value` text COLLATE utf8_unicode_ci NOT NULL, 
  `setting_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `setting_status` int(11) NOT NULL, 
  `setting_ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `setting_is_default` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
INSERT INTO `theme_colors` (
  `setting_id`, `setting_key`, `setting_value`, 
  `setting_type`, `setting_status`, 
  `setting_ipaddress`, `setting_is_default`
) 
VALUES 
  (
    1, 'front_header_color_before_scroll', 
    'transparent', 'theme', 1, '141.11.28.221', 
    0
  ), 
  (
    2, 'front_header_color_after_scroll', 
    '#e98024', 'theme', 1, '141.11.28.221', 
    0
  ), 
  (
    3, 'front_button_color', '#f1a05a', 
    'theme', 1, '141.11.28.221', 0
  ), 
  (
    4, 'front_button_hover_color', '#f66b14', 
    'theme', 1, '141.11.28.221', 0
  ), 
  (
    5, 'front_button_text_color', '#ffffff', 
    'theme', 1, '141.11.28.221', 0
  ), 
  (
    6, 'front_footer_color', '#363839', 
    'theme', 1, '141.11.28.221', 0
  ), 
  (
    7, 'front_header_button_color_before_scroll', 
    '#e98024', 'theme', 1, '141.11.28.221', 
    0
  ), 
  (
    8, 'front_header_button_text_color_before_scroll', 
    '#ffffff', 'theme', 1, '141.11.28.221', 
    0
  ), 
  (
    9, 'front_header_button_hover_color_before_scroll', 
    '#f66b14', 'theme', 1, '141.11.28.221', 
    0
  ), 
  (
    10, 'front_header_button_color_after_scroll', 
    '#ffffff', 'theme', 1, '141.11.28.221', 
    0
  ), 
  (
    11, 'front_header_button_text_color_after_scroll', 
    '#e98024', 'theme', 1, '141.11.28.221', 
    0
  ), 
  (
    12, 'front_header_button_hover_color_after_scroll', 
    '#fc535e', 'theme', 1, '141.11.28.221', 
    0
  ), 
  (
    13, 'front_runner_bar_color', '#e98024', 
    'theme', 1, '141.11.28.221', 0
  ), 
  (
    14, 'front_runner_bar_text_color', 
    '#ffffff', 'theme', 1, '141.11.28.221', 
    0
  ), 
  (
    15, 'front_theme_text_color', '#e98024', 
    'theme', 1, '141.11.28.221', 0
  ), 
  (
    16, 'front_faq_before_hover_color', 
    '#6a6a6a', 'theme', 1, '141.11.28.221', 
    0
  ), 
  (
    17, 'front_faq_after_hover_color', 
    '#e98024', 'theme', 1, '141.11.28.221', 
    0
  );
CREATE TABLE `theme_faq` (
  `faq_id` int(11) NOT NULL, 
  `faq_theme_id` int(11) NOT NULL, 
  `faq_question` text COLLATE utf8_unicode_ci NOT NULL, 
  `faq_answer` text COLLATE utf8_unicode_ci NOT NULL, 
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL, 
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1', 
  `Created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `theme_homecontent` (
  `homecontent_id` int(11) NOT NULL, 
  `theme_id` int(11) NOT NULL, 
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `description` longtext COLLATE utf8_unicode_ci NOT NULL, 
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL, 
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1', 
  `created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `theme_home_sections_setting` (
  `sec_id` int(11) NOT NULL, 
  `theme_id` int(11) NOT NULL, 
  `sec_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `sec_position` tinyint(1) NOT NULL, 
  `sec_is_enable` tinyint(1) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `theme_home_sections_setting` (
  `sec_id`, `theme_id`, `sec_title`, 
  `sec_position`, `sec_is_enable`
) 
VALUES 
  (1, 0, 'Membership Section', 1, 1), 
  (2, 0, 'Home Content', 2, 1), 
  (3, 0, 'Home Section', 3, 1), 
  (4, 0, 'Video Section', 4, 1), 
  (
    5, 0, 'Recommendation Section', 5, 
    1
  );
CREATE TABLE `theme_links` (
  `tlink_id` int(11) NOT NULL, 
  `tlink_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `tlink_url` text COLLATE utf8_unicode_ci NOT NULL, 
  `tlink_position` tinyint(4) NOT NULL, 
  `tlink_status` tinyint(1) NOT NULL DEFAULT '1', 
  `tlink_target_blank` tinyint(1) NOT NULL DEFAULT '1', 
  `tlink_created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `theme_pages` (
  `page_id` int(11) NOT NULL, 
  `theme_id` int(11) NOT NULL, 
  `page_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `parent_id` int(11) DEFAULT NULL, 
  `top_banner_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `top_banner_sub_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `page_content_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `page_content` longtext COLLATE utf8_unicode_ci NOT NULL, 
  `link_footer_section` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `is_header_menu` tinyint(1) NOT NULL DEFAULT '0', 
  `is_header_dropdown` tinyint(1) NOT NULL DEFAULT '0', 
  `position` int(11) NOT NULL COMMENT 'moved var(50) to int(11)', 
  `page_type` enum('editable', 'fixed') COLLATE utf8_unicode_ci DEFAULT 'editable', 
  `page_banner_image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `created` datetime DEFAULT CURRENT_TIMESTAMP, 
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `theme_pages` (
  `page_id`, `theme_id`, `page_name`, 
  `slug`, `parent_id`, `top_banner_title`, 
  `top_banner_sub_title`, `page_content_title`, 
  `page_content`, `link_footer_section`, 
  `is_header_menu`, `is_header_dropdown`, 
  `position`, `page_type`, `page_banner_image`, 
  `created`, `status`
) 
VALUES 
  (
    1, 0, 'Home', '/', 0, '', '', '', '', '', 
    1, 0, 1, 'fixed', NULL, '2021-03-15 05:34:48', 
    1
  ), 
  (
    2, 0, 'Faq', 'faq', 0, '', '', '', '', '', 
    1, 0, 2, 'fixed', NULL, '2021-03-15 05:40:51', 
    1
  ), 
  (
    3, 0, 'Terms', 'terms-of-use', NULL, 
    '', '', '', '', '', 1, 0, 3, 'fixed', NULL, 
    '2021-03-15 05:46:09', 1
  ), 
  (
    4, 0, 'Contact', 'contact', NULL, '', 
    '', '', '', '', 1, 0, 4, 'fixed', NULL, 
    '2021-03-15 05:48:16', 1
  );
CREATE TABLE `theme_recommendation` (
  `recommendation_id` int(11) NOT NULL, 
  `theme_id` int(11) NOT NULL, 
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `occupation` varchar(100) COLLATE utf8_unicode_ci NOT NULL, 
  `description` text COLLATE utf8_unicode_ci NOT NULL, 
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL, 
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1', 
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `theme_sections` (
  `section_id` int(11) NOT NULL, 
  `theme_id` int(11) NOT NULL, 
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `description` text COLLATE utf8_unicode_ci NOT NULL, 
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `link` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `button_text` varchar(100) COLLATE utf8_unicode_ci NOT NULL, 
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL, 
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1', 
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `theme_setting` (
  `setting_id` int(11) NOT NULL, 
  `setting_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `setting_value` text COLLATE utf8_unicode_ci NOT NULL, 
  `setting_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `setting_status` int(11) NOT NULL, 
  `setting_ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL, 
  `setting_is_default` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
CREATE TABLE `theme_settings` (
  `settings_id` int(11) NOT NULL, 
  `theme_id` int(11) NOT NULL, 
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `custom_logo_size` tinyint(1) NOT NULL DEFAULT '0', 
  `log_custom_height` smallint(6) NOT NULL, 
  `log_custom_width` smallint(6) NOT NULL, 
  `top_banner_slider` text COLLATE utf8_unicode_ci NOT NULL, 
  `membership_top_title` text COLLATE utf8_unicode_ci NOT NULL, 
  `membership_sub_title` text COLLATE utf8_unicode_ci NOT NULL, 
  `contact_us_t_title` text COLLATE utf8_unicode_ci NOT NULL, 
  `contact_us_slug_title` text COLLATE utf8_unicode_ci NOT NULL, 
  `contact_sec_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `contact_sec_subtitle` text COLLATE utf8_unicode_ci NOT NULL, 
  `contact_us_email` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `contact_us_full_address` text COLLATE utf8_unicode_ci NOT NULL, 
  `contact_us_phone` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `contact_us_iframe` text COLLATE utf8_unicode_ci NOT NULL, 
  `contact_banner_image` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `youtube_link` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `facebook_link` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `twitter_link` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `instegram_link` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `whatsapp_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL, 
  `whatsapp_default_msg` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `footer_about_title` text COLLATE utf8_unicode_ci NOT NULL, 
  `footer_about_text` text COLLATE utf8_unicode_ci NOT NULL, 
  `footer_menu_title_a` text COLLATE utf8_unicode_ci NOT NULL, 
  `footer_menu_title_b` text COLLATE utf8_unicode_ci NOT NULL, 
  `footer_menu_title_c` text COLLATE utf8_unicode_ci NOT NULL, 
  `footer_menu_title_d` text COLLATE utf8_unicode_ci NOT NULL, 
  `banner_bottom_title` text COLLATE utf8_unicode_ci NOT NULL, 
  `banner_bottom_slug` text COLLATE utf8_unicode_ci NOT NULL, 
  `banner_button_text` text COLLATE utf8_unicode_ci NOT NULL, 
  `banner_button_link` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `copyright` text COLLATE utf8_unicode_ci NOT NULL, 
  `video_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `video_sub_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `login_img` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `reg_img` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `terms_img` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `login_content` text COLLATE utf8_unicode_ci NOT NULL, 
  `reg_content` text COLLATE utf8_unicode_ci NOT NULL, 
  `terms_content` text COLLATE utf8_unicode_ci NOT NULL, 
  `home_section_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `home_section_subtitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `recommendation_section_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `recommendation_section_subtitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `faq_banner_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `faq_section_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `faq_section_subtitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `faq_banner_image` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `homepage_video_section_bg` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `theme_sliders` (
  `slider_id` int(11) NOT NULL, 
  `theme_id` int(11) NOT NULL, 
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `description` text COLLATE utf8_unicode_ci NOT NULL, 
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL, 
  `link` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `button_text` varchar(100) COLLATE utf8_unicode_ci NOT NULL, 
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1', 
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `theme_videos` (
  `video_id` int(11) NOT NULL, 
  `theme_id` int(11) NOT NULL, 
  `video_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `video_sub_title` text COLLATE utf8_unicode_ci NOT NULL, 
  `video_link` varchar(200) COLLATE utf8_unicode_ci NOT NULL, 
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL, 
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1', 
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `tickets` (
  `id` bigint(20) NOT NULL, 
  `ticket_id` text NOT NULL COMMENT 'like AF10254', 
  `user_id` bigint(20) NOT NULL, 
  `subject_id` int(11) NOT NULL, 
  `last_replay` text, 
  `status` int(11) NOT NULL COMMENT '1=open, 2=pending, 3 =close', 
  `created_at` datetime DEFAULT NULL, 
  `updated_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 ROW_FORMAT = DYNAMIC;
CREATE TABLE `tickets_reply` (
  `id` bigint(20) NOT NULL, 
  `ticket_id` text NOT NULL, 
  `message` text, 
  `attachment` text, 
  `message_type` int(11) NOT NULL COMMENT '1 for text ,2 files ', 
  `user_id` bigint(20) NOT NULL, 
  `user_type` int(11) NOT NULL COMMENT '1 for admin ,2 affiliate/vendor', 
  `created_at` datetime DEFAULT NULL, 
  `updated_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 ROW_FORMAT = DYNAMIC;
CREATE TABLE `tickets_subject` (
  `id` bigint(20) NOT NULL, 
  `subject` text NOT NULL, 
  `user_id` bigint(20) NOT NULL, 
  `status` enum('0', '1') NOT NULL COMMENT '0 deactivate, 1 active ', 
  `created_at` datetime DEFAULT NULL, 
  `updated_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 ROW_FORMAT = DYNAMIC;
CREATE TABLE `todo_list` (
  `id` bigint(20) NOT NULL, 
  `user_id` bigint(20) NOT NULL, 
  `notes` text NOT NULL, 
  `is_done` enum('0', '1') NOT NULL COMMENT '0 for open, 1 for close', 
  `todo_date` date NOT NULL, 
  `created_at` datetime DEFAULT NULL, 
  `updated_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 ROW_FORMAT = DYNAMIC;
CREATE TABLE `uncompleted_payment` (
  `id` int(10) UNSIGNED NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `payment_module` tinyint(2) UNSIGNED NOT NULL, 
  `completed_id` int(10) UNSIGNED NOT NULL, 
  `content` text COLLATE utf8_unicode_ci NOT NULL, 
  `additional_info` text COLLATE utf8_unicode_ci NOT NULL, 
  `datetime` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
CREATE TABLE `unsubscribed_emails` (
  `id` int(11) NOT NULL, 
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
CREATE TABLE `users` (
  `id` int(11) NOT NULL, 
  `plan_id` int(11) NOT NULL DEFAULT '-1', 
  `refid` int(11) NOT NULL, 
  `level_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0', 
  `type` varchar(255) CHARACTER SET utf8 DEFAULT 'user', 
  `firstname` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `lastname` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `email` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `username` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `password` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL, 
  `twaddress` text CHARACTER SET utf8 NOT NULL, 
  `address1` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `address2` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `ucity` varchar(50) CHARACTER SET utf8 DEFAULT NULL, 
  `ucountry` varchar(50) CHARACTER SET utf8 DEFAULT NULL, 
  `state` varchar(50) CHARACTER SET utf8 DEFAULT NULL, 
  `uzip` varchar(50) CHARACTER SET utf8 DEFAULT NULL, 
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `online` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '1', 
  `unique_url` text CHARACTER SET utf8, 
  `bitly_unique_url` text CHARACTER SET utf8, 
  `updated_at` datetime NOT NULL, 
  `google_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `facebook_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `twitter_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `umode` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `PhoneNumber` varchar(40) CHARACTER SET utf8 DEFAULT NULL, 
  `Addressone` text CHARACTER SET utf8, 
  `Addresstwo` text CHARACTER SET utf8, 
  `City` varchar(40) CHARACTER SET utf8 DEFAULT NULL, 
  `Country` varchar(40) CHARACTER SET utf8 DEFAULT NULL, 
  `StateProvince` varchar(40) CHARACTER SET utf8 DEFAULT NULL, 
  `Zip` varchar(50) CHARACTER SET utf8 DEFAULT NULL, 
  `f_link` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `t_link` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `l_link` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `products_wishlist` text CHARACTER SET utf8, 
  `product_commission` float DEFAULT '0', 
  `affiliate_commission` float DEFAULT '0', 
  `product_commission_paid` float DEFAULT '0', 
  `affiliate_commission_paid` float DEFAULT '0', 
  `product_total_click` int(11) DEFAULT NULL, 
  `product_total_sale` int(11) DEFAULT NULL, 
  `affiliate_total_click` int(11) DEFAULT NULL, 
  `sale_commission` float DEFAULT '0', 
  `sale_commission_paid` float DEFAULT '0', 
  `status` int(11) NOT NULL DEFAULT '1', 
  `reg_approved` tinyint(1) NOT NULL DEFAULT '1', 
  `is_vendor` tinyint(1) NOT NULL, 
  `store_meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `store_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `store_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `store_contact_us_map` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `store_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `store_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `store_contact_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `store_terms_condition` text CHARACTER SET utf8 NOT NULL, 
  `value` text CHARACTER SET utf8 NOT NULL, 
  `last_ping` datetime DEFAULT NULL, 
  `install_location_details` text CHARACTER SET utf8 NOT NULL, 
  `token` text COLLATE utf8_unicode_ci, 
  `created_at` datetime DEFAULT NULL, 
  `device_type` int(11) NOT NULL DEFAULT '1' COMMENT '1 = android, 2 = ios', 
  `device_token` text COLLATE utf8_unicode_ci, 
  `groups` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `users` (
  `id`, `plan_id`, `refid`, `level_id`, 
  `type`, `firstname`, `lastname`, 
  `email`, `username`, `password`, 
  `phone`, `twaddress`, `address1`, 
  `address2`, `ucity`, `ucountry`, 
  `state`, `uzip`, `avatar`, `online`, 
  `unique_url`, `bitly_unique_url`, 
  `updated_at`, `google_id`, `facebook_id`, 
  `twitter_id`, `umode`, `PhoneNumber`, 
  `Addressone`, `Addresstwo`, `City`, 
  `Country`, `StateProvince`, `Zip`, 
  `f_link`, `t_link`, `l_link`, `products_wishlist`, 
  `product_commission`, `affiliate_commission`, 
  `product_commission_paid`, `affiliate_commission_paid`, 
  `product_total_click`, `product_total_sale`, 
  `affiliate_total_click`, `sale_commission`, 
  `sale_commission_paid`, `status`, 
  `reg_approved`, `is_vendor`, `store_meta`, 
  `store_slug`, `store_name`, `store_contact_us_map`, 
  `store_address`, `store_email`, 
  `store_contact_number`, `store_terms_condition`, 
  `value`, `last_ping`, `install_location_details`, 
  `token`, `created_at`, `device_type`, 
  `device_token`, `groups`
) 
VALUES 
  (
    1, -1, 0, 0, 'admin', 'Admin', 'Admin', 
    'dai@devnguyen.com', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 
    '', '', '', '', '', '', '', '', 'yq9nU8bwx0YpRA3QNXlE4C1vMV7Ifk2J.png', 
    '1', '', '', '0000-00-00 00:00:00', 
    '', '', '', '', '123456', '', '', '', 
    '', NULL, '', '', '', '', NULL, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 1, 1, 0, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, '', '', '2022-09-01 18:37:18', 
    '', NULL, '0000-00-00 00:00:00', 
    1, NULL, NULL
  ), 
  (
    7, -1, 0, 0, 'client', 'client1', 'client1', 
    'client1@affiliatepro.org', 'client1', 
    '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', 
    NULL, '', '', '', NULL, NULL, NULL, NULL, 
    NULL, '1', NULL, NULL, '0000-00-00 00:00:00', 
    NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, '[\"1\"]', 0, 0, 0, 0, NULL, 
    NULL, NULL, 0, 0, 1, 1, 0, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, '', '', 
    '2020-12-20 12:26:07', '', NULL, 
    '2020-12-20 06:02:02', 1, NULL, NULL
  ), 
  (
    8, 7, 0, 0, 'user', 'user1', 'user1', 
    'user1@affiliatepro.org', 'user1', 
    '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', 
    '+33 6 12 34 56 78', '', '', '', '', 
    '75', '0', '', '', '0', '', '', '2022-07-26 21:24:25', 
    '', '', '', '', '', '', '', '', '75', '', 
    '', '', '', '', NULL, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 1, 1, 1, '{\"cover_text_color\":\"#FFFFFF\",\"cover_show_vendor_name\":1}', 
    'vendor-store', 'vendor store', 
    '', '', '', '', '', '[]', '2022-08-20 08:05:13', 
    '', NULL, '2022-07-26 21:24:25', 
    1, NULL, NULL
  ), 
  (
    9, 8, 8, 0, 'user', 'user2', 'user2', 
    'user2@affiliatepro.org', 'user2', 
    '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', 
    '+33 6 12 34 56 79', '', '', '', '', 
    '75', '0', '', '', '0', '', '', '2022-07-26 21:26:24', 
    '', '', '', '', '', '', '', '', '75', '', 
    '', '', '', '', NULL, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, '', '[]', '2022-08-03 21:22:59', 
    '', NULL, '2022-07-26 21:26:24', 
    1, NULL, NULL
  ), 
  (
    10, 9, 9, 0, 'user', 'user3', 'user3', 
    'user3@affiliatepro.org', 'user3', 
    '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', 
    '+33 6 12 34 56 77', '', '', '', '', 
    '13', '0', '', '', '0', '', '', '2022-07-27 16:48:47', 
    '', '', '', '', '', '', '', '', '13', '', 
    '', '', '', '', NULL, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, '', '[]', NULL, '', 
    NULL, '2022-07-27 16:48:47', 1, NULL, 
    NULL
  );
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL, 
  `group_name` varchar(60) NOT NULL, 
  `group_description` text, 
  `avatar` varchar(100) DEFAULT NULL, 
  `is_default` enum('1', '0') NOT NULL DEFAULT '0' COMMENT '1=>for set default,0=>not set default', 
  `created_at` datetime NOT NULL, 
  `updated_at` varchar(20) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 ROW_FORMAT = DYNAMIC;
CREATE TABLE `user_lms_product` (
  `id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `order_id` int(11) NOT NULL, 
  `lms_product` text COLLATE utf8_unicode_ci
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
CREATE TABLE `user_payment_request` (
  `user_payment_request_id` int(11) NOT NULL, 
  `user_payment_request_user_id` int(11) DEFAULT NULL, 
  `user_payment_request_amount` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `user_payment_request_amount_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `user_payment_request_amount_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `user_payment_request_payment_mode` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `user_payment_request_ipaddress` varchar(20) CHARACTER SET utf8 DEFAULT NULL, 
  `user_payment_request_created_date` datetime NOT NULL, 
  `user_payment_request_updated_date` datetime NOT NULL, 
  `user_payment_request_user_agent` text CHARACTER SET utf8, 
  `user_payment_request_os` text CHARACTER SET utf8, 
  `user_payment_request_browser` text CHARACTER SET utf8, 
  `user_payment_request_isp` text CHARACTER SET utf8, 
  `user_payment_request_created_by` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `user_payment_request_updated_by` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `vendor_config` (
  `setting_id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `setting_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `setting_value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `setting_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `setting_status` int(11) NOT NULL, 
  `setting_ipaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `setting_is_default` int(11) NOT NULL DEFAULT '0'
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
CREATE TABLE `vendor_deposit` (
  `vd_id` int(11) NOT NULL, 
  `vd_user_id` int(11) NOT NULL, 
  `vd_amount` double NOT NULL, 
  `vd_status` int(11) NOT NULL, 
  `vd_payment_method` varchar(50) COLLATE utf8_unicode_ci NOT NULL, 
  `vd_txn_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL, 
  `vd_meta` text COLLATE utf8_unicode_ci, 
  `vd_created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;
CREATE TABLE `vendor_setting` (
  `user_id` int(11) NOT NULL, 
  `vendor_status` int(11) NOT NULL DEFAULT '0', 
  `affiliate_sale_commission_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL, 
  `affiliate_commission_value` float DEFAULT '0', 
  `affiliate_click_count` int(11) DEFAULT NULL, 
  `affiliate_click_amount` float DEFAULT '0', 
  `form_affiliate_click_count` int(11) DEFAULT NULL, 
  `form_affiliate_click_amount` float DEFAULT '0', 
  `form_affiliate_sale_commission_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL, 
  `form_affiliate_commission_value` float DEFAULT '0'
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `version_update` (
  `update_id` int(11) NOT NULL, 
  `code` varchar(50) CHARACTER SET utf8 NOT NULL, 
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
  `script_version` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `wallet` (
  `id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `from_user_id` int(11) DEFAULT NULL, 
  `amount` double NOT NULL, 
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL, 
  `type` varchar(30) CHARACTER SET utf8 NOT NULL, 
  `dis_type` varchar(25) CHARACTER SET utf8 DEFAULT NULL, 
  `status` int(11) NOT NULL DEFAULT '1', 
  `commission_status` int(11) NOT NULL DEFAULT '0' COMMENT '1 = Cancel, 2 = Trash', 
  `reference_id` int(11) NOT NULL, 
  `reference_id_2` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `ip_details` text CHARACTER SET utf8, 
  `comm_from` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'store', 
  `domain_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `page_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL, 
  `is_action` int(11) NOT NULL DEFAULT '0', 
  `parent_id` int(11) NOT NULL DEFAULT '0', 
  `group_id` double(22, 0) DEFAULT '0', 
  `is_vendor` int(11) NOT NULL DEFAULT '0', 
  `wv` varchar(3) CHARACTER SET utf8 DEFAULT NULL, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `wallet_recursion` (
  `id` int(11) NOT NULL, 
  `transaction_id` int(11) NOT NULL, 
  `type` varchar(30) CHARACTER SET utf8 NOT NULL, 
  `status` tinyint(1) NOT NULL DEFAULT '0', 
  `custom_time` bigint(20) DEFAULT NULL, 
  `next_transaction` datetime NOT NULL, 
  `last_transaction` datetime NOT NULL, 
  `endtime` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `wallet_request` (
  `id` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `amount` double NOT NULL, 
  `comment` text CHARACTER SET utf8 NOT NULL, 
  `status` int(11) NOT NULL, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `wallet_requests` (
  `id` int(11) NOT NULL, 
  `tran_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, 
  `total` double NOT NULL, 
  `status` int(11) NOT NULL, 
  `user_id` int(11) NOT NULL, 
  `prefer_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
CREATE TABLE `wallet_requests_history` (
  `id` int(11) NOT NULL, 
  `req_id` int(11) NOT NULL, 
  `status` int(11) NOT NULL, 
  `comment` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `transaction_id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `created_at` datetime NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
ALTER TABLE 
  `affiliateads` 
ADD 
  PRIMARY KEY (`affiliateads_id`);
ALTER TABLE 
  `affiliate_action` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `affiliate_session_log` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `award_level` 
ADD 
  PRIMARY KEY (`id`) USING BTREE;
ALTER TABLE 
  `cart` 
ADD 
  PRIMARY KEY (`cart_id`);
ALTER TABLE 
  `categories` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `cities` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `ci_session` 
ADD 
  PRIMARY KEY (`id`) USING BTREE, 
ADD 
  KEY `ci_session_timestamp` (`timestamp`) USING BTREE;
ALTER TABLE 
  `clicks_views` 
ADD 
  PRIMARY KEY (`clicks_views_id`);
ALTER TABLE 
  `countries` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `coupon` 
ADD 
  PRIMARY KEY (`coupon_id`);
ALTER TABLE 
  `currency` 
ADD 
  PRIMARY KEY (`currency_id`);
ALTER TABLE 
  `deposit_requests_history` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `form` 
ADD 
  PRIMARY KEY (`form_id`);
ALTER TABLE 
  `form_action` 
ADD 
  PRIMARY KEY (`action_id`);
ALTER TABLE 
  `form_coupon` 
ADD 
  PRIMARY KEY (`form_coupon_id`);
ALTER TABLE 
  `integration_admin_clicks_action` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `integration_category` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `integration_clicks_action` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `integration_clicks_logs` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `integration_orders` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `integration_programs` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `integration_refer_product_action` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `integration_tools` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `integration_tools_ads` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `language` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `last_seen` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `mail_templates` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `membership_buy_history` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `membership_plans` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `membership_user` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `meta_data` 
ADD 
  PRIMARY KEY (`meta_id`);
ALTER TABLE 
  `notification` 
ADD 
  PRIMARY KEY (`notification_id`);
ALTER TABLE 
  `order` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `orders_history` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `order_products` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `order_proof` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `pagebuilder_theme` 
ADD 
  PRIMARY KEY (`theme_id`);
ALTER TABLE 
  `pagebuilder_theme_page` 
ADD 
  PRIMARY KEY (`page_id`);
ALTER TABLE 
  `payment_detail` 
ADD 
  PRIMARY KEY (`payment_id`);
ALTER TABLE 
  `paypal_accounts` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `product` 
ADD 
  PRIMARY KEY (`product_id`);
ALTER TABLE 
  `productslog` 
ADD 
  PRIMARY KEY (`productslog_id`);
ALTER TABLE 
  `product_action` 
ADD 
  PRIMARY KEY (`action_id`);
ALTER TABLE 
  `product_action_admin` 
ADD 
  PRIMARY KEY (`action_id`);
ALTER TABLE 
  `product_affiliate` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `product_categories` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `product_media_upload` 
ADD 
  PRIMARY KEY (`product_media_upload_id`);
ALTER TABLE 
  `product_meta` 
ADD 
  PRIMARY KEY (`product_meta_id`);
ALTER TABLE 
  `rating` 
ADD 
  PRIMARY KEY (`rating_id`);
ALTER TABLE 
  `refer_market_action` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `refer_product_action` 
ADD 
  PRIMARY KEY (`action_id`);
ALTER TABLE 
  `setting` 
ADD 
  PRIMARY KEY (`setting_id`);
ALTER TABLE 
  `shipping_address` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `slugs` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `states` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `theme_colors` 
ADD 
  PRIMARY KEY (`setting_id`);
ALTER TABLE 
  `theme_faq` 
ADD 
  PRIMARY KEY (`faq_id`);
ALTER TABLE 
  `theme_homecontent` 
ADD 
  PRIMARY KEY (`homecontent_id`);
ALTER TABLE 
  `theme_home_sections_setting` 
ADD 
  PRIMARY KEY (`sec_id`);
ALTER TABLE 
  `theme_links` 
ADD 
  PRIMARY KEY (`tlink_id`);
ALTER TABLE 
  `theme_pages` 
ADD 
  PRIMARY KEY (`page_id`), 
ADD 
  KEY `status` (`status`) USING BTREE, 
ADD 
  KEY `is_header_menu` (`is_header_menu`) USING BTREE, 
ADD 
  KEY `is_header_dropdown` (`is_header_dropdown`) USING BTREE;
ALTER TABLE 
  `theme_recommendation` 
ADD 
  PRIMARY KEY (`recommendation_id`);
ALTER TABLE 
  `theme_sections` 
ADD 
  PRIMARY KEY (`section_id`);
ALTER TABLE 
  `theme_setting` 
ADD 
  PRIMARY KEY (`setting_id`);
ALTER TABLE 
  `theme_settings` 
ADD 
  PRIMARY KEY (`settings_id`);
ALTER TABLE 
  `theme_sliders` 
ADD 
  PRIMARY KEY (`slider_id`);
ALTER TABLE 
  `theme_videos` 
ADD 
  PRIMARY KEY (`video_id`);
ALTER TABLE 
  `tickets` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `tickets_reply` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `tickets_subject` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `todo_list` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `uncompleted_payment` 
ADD 
  PRIMARY KEY (`id`) USING BTREE;
ALTER TABLE 
  `unsubscribed_emails` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `users` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `user_groups` 
ADD 
  PRIMARY KEY (`id`) USING BTREE;
ALTER TABLE 
  `user_lms_product` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `user_payment_request` 
ADD 
  PRIMARY KEY (`user_payment_request_id`);
ALTER TABLE 
  `vendor_config` 
ADD 
  PRIMARY KEY (`setting_id`) USING BTREE;
ALTER TABLE 
  `vendor_deposit` 
ADD 
  PRIMARY KEY (`vd_id`);
ALTER TABLE 
  `vendor_setting` 
ADD 
  PRIMARY KEY (`user_id`);
ALTER TABLE 
  `version_update` 
ADD 
  PRIMARY KEY (`update_id`);
ALTER TABLE 
  `wallet` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `wallet_recursion` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `wallet_request` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `wallet_requests` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `wallet_requests_history` 
ADD 
  PRIMARY KEY (`id`);
ALTER TABLE 
  `affiliateads` MODIFY `affiliateads_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `affiliate_action` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `affiliate_session_log` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `award_level` MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 4;
ALTER TABLE 
  `cart` MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `categories` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 6;
ALTER TABLE 
  `cities` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `clicks_views` MODIFY `clicks_views_id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 6;
ALTER TABLE 
  `countries` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 247;
ALTER TABLE 
  `coupon` MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `currency` MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 103;
ALTER TABLE 
  `deposit_requests_history` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `form` MODIFY `form_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `form_action` MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `form_coupon` MODIFY `form_coupon_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `integration_admin_clicks_action` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `integration_category` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 13;
ALTER TABLE 
  `integration_clicks_action` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `integration_clicks_logs` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `integration_orders` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `integration_programs` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `integration_refer_product_action` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `integration_tools` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `integration_tools_ads` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `language` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 135;
ALTER TABLE 
  `last_seen` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `mail_templates` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 79;
ALTER TABLE 
  `membership_buy_history` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 7;
ALTER TABLE 
  `membership_plans` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 6;
ALTER TABLE 
  `membership_user` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 10;
ALTER TABLE 
  `meta_data` MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `notification` MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `order` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `orders_history` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `order_products` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `order_proof` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `pagebuilder_theme` MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `pagebuilder_theme_page` MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `payment_detail` MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `paypal_accounts` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `product` MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `productslog` MODIFY `productslog_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `product_action` MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `product_action_admin` MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `product_affiliate` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `product_categories` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `product_media_upload` MODIFY `product_media_upload_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `product_meta` MODIFY `product_meta_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `rating` MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `refer_market_action` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `refer_product_action` MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `setting` MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 246;
ALTER TABLE 
  `shipping_address` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `slugs` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `states` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 4123;
ALTER TABLE 
  `theme_colors` MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 18;
ALTER TABLE 
  `theme_faq` MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `theme_homecontent` MODIFY `homecontent_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `theme_home_sections_setting` MODIFY `sec_id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 6;
ALTER TABLE 
  `theme_links` MODIFY `tlink_id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 2;
ALTER TABLE 
  `theme_pages` MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 5;
ALTER TABLE 
  `theme_recommendation` MODIFY `recommendation_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `theme_sections` MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `theme_setting` MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `theme_settings` MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `theme_sliders` MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `theme_videos` MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `tickets` MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `tickets_reply` MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `tickets_subject` MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `todo_list` MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `uncompleted_payment` MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `unsubscribed_emails` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `users` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
  AUTO_INCREMENT = 12;
ALTER TABLE 
  `user_groups` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `user_lms_product` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `user_payment_request` MODIFY `user_payment_request_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `vendor_config` MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `vendor_deposit` MODIFY `vd_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `version_update` MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `wallet` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `wallet_recursion` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `wallet_request` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `wallet_requests` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE 
  `wallet_requests_history` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
