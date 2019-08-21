SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- DROP TABLE `blog_categories`, `blog_categories_details`, `blog_post`, `blog_post_categories`, `blog_post_details`, `blog_settings`, `files_management`, `pages`, `pages_details`, `page_builder_data`, `page_builder_data_values`, `page_builder_forms`, `page_builder_forms_data`, `page_builder_forms_data_values`, `page_builder_forms_fields`, `page_builder_group`, `page_builder_object`, `page_builder_object_list`, `routing_system`, `settings_smtp`, `settings_website`, `system_updates`, `user`, `user_profile`, `user_recover`, `user_roles`, `user_stored_data`, `user_transactional_emails`;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `bcid` int(22) NOT NULL,
  `bc_title` varchar(256) NOT NULL,
  `bc_slug` varchar(256) NOT NULL,
  `bc_cover` varchar(256) NOT NULL,
  `bc_body` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories_details`
--

CREATE TABLE `blog_categories_details` (
  `bcd_bcid` int(22) NOT NULL,
  `bcd_seo_title` varchar(256) NOT NULL,
  `bcd_seo_description` text NOT NULL,
  `bcd_parent` int(22) DEFAULT NULL,
  `bcd_template` varchar(256) NOT NULL,
  `bcd_status` enum('PUBLISHED','DRAFT','DELETED','PASSWORD_PROTECTED') NOT NULL DEFAULT 'DRAFT',
  `bcd_date_created` int(11) NOT NULL,
  `bcd_date_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `bpid` int(22) NOT NULL,
  `bp_title` varchar(256) NOT NULL,
  `bp_slug` varchar(256) NOT NULL,
  `bp_preview` text NOT NULL,
  `bp_cover` varchar(256) NOT NULL,
  `bp_body` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_categories`
--

CREATE TABLE `blog_post_categories` (
  `pbc_bcid` int(22) NOT NULL,
  `pbc_bpid` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_details`
--

CREATE TABLE `blog_post_details` (
  `bpd_bpid` int(22) NOT NULL,
  `bpd_seo_title` varchar(256) NOT NULL,
  `bpd_seo_description` text NOT NULL,
  `bpd_status` enum('PUBLISHED','DRAFT','DELETED','PASSWORD_PROTECTED') NOT NULL DEFAULT 'DRAFT',
  `bpd_template` varchar(256) NOT NULL,
  `bpd_date_created` int(11) NOT NULL,
  `bpd_date_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_settings`
--

CREATE TABLE `blog_settings` (
  `bsid` int(11) NOT NULL,
  `bs_name` varchar(256) NOT NULL,
  `bs_body` text NOT NULL,
  `bs_seo_name` varchar(256) NOT NULL,
  `bs_seo_description` text NOT NULL,
  `bs_cover` varchar(256) NOT NULL,
  `bs_template` varchar(56) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `files_management`
--

CREATE TABLE `files_management` (
  `fid` int(22) NOT NULL,
  `uid` int(22) NOT NULL,
  `filename` varchar(256) NOT NULL,
  `filegroup` varchar(56) NOT NULL,
  `filetype` varchar(56) NOT NULL,
  `location` varchar(256) NOT NULL,
  `used_by` varchar(56) NOT NULL,
  `uploaded_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrate`
--

CREATE TABLE `migrate` (
  `mid` bigint(20) NOT NULL,
  `migrate_filename` varchar(256) NOT NULL,
  `migrate_module` varchar(256) NOT NULL,
  `migrate_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `pid` int(22) NOT NULL,
  `page_title` varchar(256) NOT NULL,
  `page_slug` varchar(256) NOT NULL,
  `page_body` longtext NOT NULL,
  `page_front` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pages_details`
--

CREATE TABLE `pages_details` (
  `pd_pid` int(22) NOT NULL,
  `pd_seo_title` varchar(256) NOT NULL,
  `pd_seo_description` text NOT NULL,
  `pd_status` enum('PUBLISHED','DRAFT','DELETED','PASSWORD_PROTECTED') NOT NULL DEFAULT 'DRAFT',
  `pd_template` varchar(250) NOT NULL,
  `pd_date_created` int(11) NOT NULL,
  `pd_date_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_data`
--

CREATE TABLE `page_builder_data` (
  `pbd_id` bigint(22) NOT NULL,
  `pbd_pbo_id` bigint(22) NOT NULL,
  `pbd_module` varchar(56) NOT NULL,
  `pbd_object_id` bigint(22) NOT NULL,
  `pbd_group` varchar(56) NOT NULL,
  `pbd_weight` int(11) NOT NULL,
  `pbd_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_data_values`
--

CREATE TABLE `page_builder_data_values` (
  `pbdv_id` bigint(22) NOT NULL,
  `pbdv_pbd_id` bigint(22) NOT NULL,
  `pbdv_pbo_id` bigint(22) NOT NULL,
  `pbdv_module` varchar(56) NOT NULL,
  `pbdv_object_id` bigint(22) NOT NULL,
  `pbdv_group` varchar(56) NOT NULL,
  `pbdv_parent` int(11) DEFAULT NULL,
  `pbdv_pbol_id` bigint(22) NOT NULL,
  `pbdv_pbol_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_forms`
--

CREATE TABLE `page_builder_forms` (
  `pbf_id` bigint(22) NOT NULL,
  `pbf_name` varchar(256) NOT NULL,
  `pbf_description` text NOT NULL,
  `pbf_notification_emails` text NOT NULL,
  `pbf_button_name` varchar(256) NOT NULL,
  `pbf_message` text NOT NULL,
  `pbf_recaptcha` tinyint(1) NOT NULL DEFAULT 0,
  `pbf_machine_name` varchar(256) NOT NULL,
  `pbf_repeater` tinyint(1) NOT NULL,
  `pbf_created` int(11) NOT NULL,
  `pbf_updated` int(11) NOT NULL,
  `pbf_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_forms_data`
--

CREATE TABLE `page_builder_forms_data` (
  `pbfd_id` bigint(22) NOT NULL,
  `pbfd_pbf_id` bigint(22) NOT NULL,
  `pbfd_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_forms_data_values`
--

CREATE TABLE `page_builder_forms_data_values` (
  `pbfdv_id` bigint(22) NOT NULL,
  `pbfdv_pbf_id` bigint(22) NOT NULL,
  `pbfdv_pbff_id` bigint(22) NOT NULL,
  `pbfdv_pbff_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_forms_fields`
--

CREATE TABLE `page_builder_forms_fields` (
  `pbff_id` bigint(22) NOT NULL,
  `pbff_pbf_id` bigint(22) NOT NULL,
  `pbff_type` varchar(50) NOT NULL,
  `pbff_name` varchar(256) NOT NULL,
  `pbff_machine_name` varchar(256) NOT NULL,
  `pbff_values` text NOT NULL,
  `pbff_default_value` text NOT NULL,
  `pbff_json` longtext NOT NULL,
  `pbff_weight` int(11) NOT NULL,
  `pbff_created` int(11) NOT NULL,
  `pbff_updated` int(11) NOT NULL,
  `pbff_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_group`
--

CREATE TABLE `page_builder_group` (
  `pbid` bigint(22) NOT NULL,
  `pbg_name` varchar(256) NOT NULL,
  `pbg_machine_name` varchar(256) NOT NULL,
  `pbg_description` text NOT NULL,
  `pbg_date` int(11) NOT NULL,
  `pbg_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_builder_group`
--

INSERT INTO `page_builder_group` (`pbid`, `pbg_name`, `pbg_machine_name`, `pbg_description`, `pbg_date`, `pbg_status`) VALUES
(1, 'Chart', 'chart', '', 1558176846, 1),
(2, 'Misc', 'misc', '', 1558176850, 1),
(3, 'Pricing', 'pricing', '', 1558176856, 1),
(4, 'eCommerce', 'ecommerce', '', 1558176865, 1),
(5, 'Sliders', 'sliders', '', 1558176872, 1),
(6, 'Gallery', 'gallery', '', 1558176879, 1),
(7, 'Contents', 'contents', '', 1558176887, 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_object`
--

CREATE TABLE `page_builder_object` (
  `pbo_id` bigint(22) NOT NULL,
  `pbo_pbid` bigint(22) NOT NULL,
  `pbo_name` varchar(256) NOT NULL,
  `pbo_description` text NOT NULL,
  `pbo_machine_name` varchar(256) NOT NULL,
  `pbo_repeater` tinyint(1) NOT NULL,
  `pbo_created` int(11) NOT NULL,
  `pbo_updated` int(11) NOT NULL,
  `pbo_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_builder_object`
--

INSERT INTO `page_builder_object` (`pbo_id`, `pbo_pbid`, `pbo_name`, `pbo_description`, `pbo_machine_name`, `pbo_repeater`, `pbo_created`, `pbo_updated`, `pbo_status`) VALUES
(1, 1, 'Line Chart', 'A line chart is a way of plotting data points on a line.', 'line_chart', 0, 1558560712, 1558560712, 1),
(2, 1, 'Bar Chart', 'A bar chart provides a way of showing data values represented as vertical bars.', 'bar_chart', 0, 1558564252, 1558564252, 1),
(3, 1, 'Doughnut and Pie', 'Pie and doughnut charts are probably the most commonly used charts.', 'doughnut_pie', 0, 1558563842, 1558563842, 1),
(4, 7, 'Tabs', 'Tabs are used to separate content into different panes.', 'tabs', 1, 1558565306, 1558565306, 1),
(5, 7, 'Two Column Widget', 'Headline, Title, Text, Button & Image', 'two_column_widget', 0, 1558870222, 1558870222, 1),
(6, 7, 'Center Text Widget', 'Headline / Title / Text & Buttons', 'center_text_widget', 1, 1558960697, 1558960697, 1),
(7, 7, 'Left Text Widget', 'Headline / Title / Text & Button', 'left_text_widget', 1, 1559082258, 1559082258, 1),
(8, 7, 'Center Text With Icon Widget', 'Image / Headline / Title / Text & Button', 'center_text_with_icon_widget', 1, 1559155693, 1559155693, 1),
(9, 7, 'Center Text Single Widget', 'Headline / Title / Text & Button', 'center_text_single_widget', 0, 1559161032, 1559161032, 1),
(10, 7, 'Center Text With Numbers', 'Number / Title & Text', 'center_text_with_numbers', 1, 1559161983, 1559161983, 1),
(11, 7, 'Image and Text Widget', 'Image / Headline / Title / Text & Button', 'image_and_text_widget', 1, 1559165557, 1559165557, 1),
(12, 7, 'Same Line Image and Text Widget', 'Image / Headline / Title / Text & Button', 'same_line_image_text_widget', 1, 1559169062, 1559169062, 1),
(13, 7, 'Widget With Background Image', 'Headline / Title / Text / Button & Image', 'widget_background_image', 0, 1559243113, 1559243113, 1),
(14, 7, 'Responsive Spacing', 'Small / Medium / Large / Extra Large', 'responsive_spacing', 1, 1559243975, 1559243975, 1),
(15, 5, 'Full Width Slider', 'Image / Headline / Title / Text & Button', 'full_width_slider', 1, 1559246079, 1559246079, 1),
(16, 5, 'Images Carousel with Links', 'Image / Title / Text / Link', 'images_carousel_links', 1, 1559251829, 1559251829, 1),
(17, 5, 'Testimonials', 'Text / Name & Role', 'testimonials_slider', 1, 1559253554, 1559253554, 1),
(18, 5, 'Tabs Style Slider', 'Image / Tab Name / Title / Text / Button / Image Location', 'tabs_style_slider', 1, 1559332164, 1559332164, 1),
(19, 4, 'Product Details', '', 'product_details', 0, 1559343547, 1559343547, 1),
(20, 4, 'Products Carousel', '', 'products_carousel', 1, 1559412747, 1559412747, 1),
(21, 4, 'Products List', 'Image / Title / Price / Description / Button', 'products_list', 1, 1559417012, 1559417012, 1),
(22, 6, 'Simple Gallery', '', 'simple_gallery', 0, 1559422234, 1559422234, 1),
(23, 6, 'Image & Name', '', 'image_name', 1, 1559422349, 1559422349, 1),
(24, 6, 'Image with text displayed on hover', '', 'image_text_gallery', 1, 1559472125, 1559472125, 1),
(25, 3, 'Packages List', 'Title / Price / Description / Button', 'packages_list', 1, 1559501926, 1559501926, 1),
(26, 3, 'Advanced Packages', 'Icon / Title / Price / Price per month-week / Description / Button', 'advanced_packages', 1, 1559502610, 1559502610, 1),
(27, 2, 'Simple Subscribe Form', '', 'simple_subscribe_form', 0, 1559505782, 1559505782, 1),
(28, 2, 'Full Width Iframe', '', 'full_width_iframe', 0, 1559509424, 1559509424, 1),
(29, 2, 'Two Column Iframe', '', 'two_column_iframe', 0, 1560197110, 1560197110, 1),
(30, 2, 'Social Links', '', 'social_links', 1, 1559513457, 1559513457, 1),
(31, 2, 'File Download', '', 'file_download', 1, 1559676757, 1559676757, 1),
(32, 2, 'Contact Us', 'Contact Us Form', 'contact_us_widget', 0, 1559686783, 1559686783, 1),
(33, 2, 'Form Widget', '', 'form_widget', 0, 1559988661, 1559988661, 1),
(34, 2, 'Two Column Widget Form', 'A two column widget, with a form', 'two_column_widget_form', 0, 1559994351, 1559994351, 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_object_list`
--

CREATE TABLE `page_builder_object_list` (
  `pbol_id` bigint(22) NOT NULL,
  `pbol_pbo_id` bigint(22) NOT NULL,
  `pbol_type` varchar(50) NOT NULL,
  `pbol_name` varchar(256) NOT NULL,
  `pbol_machine_name` varchar(256) NOT NULL,
  `pbol_values` text NOT NULL,
  `pbol_default_value` text NOT NULL,
  `pbol_json` longtext NOT NULL,
  `pbol_weight` int(11) NOT NULL,
  `pbol_created` int(11) NOT NULL,
  `pbol_updated` int(11) NOT NULL,
  `pbol_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_builder_object_list`
--

INSERT INTO `page_builder_object_list` (`pbol_id`, `pbol_pbo_id`, `pbol_type`, `pbol_name`, `pbol_machine_name`, `pbol_values`, `pbol_default_value`, `pbol_json`, `pbol_weight`, `pbol_created`, `pbol_updated`, `pbol_deleted`) VALUES
(1, 1, '_INPUT', 'Chart Label', 'chart_label', '', '', '{\"tempID\":1,\"name\":\"Chart Label\",\"machine_name\":\"chart_label\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1558559233, 1558560712, 0),
(2, 1, '_TEXTAREA', 'Labels', 'labels', '', '', '{\"tempID\":2,\"name\":\"Labels\",\"machine_name\":\"labels\",\"default_value\":\"\",\"placeholder\":\"Enter one by one separated by a comma.\",\"object\":\"_TEXTAREA\"}', 2, 1558559233, 1558560712, 0),
(3, 1, '_TEXTAREA', 'Data', 'data', '', '', '{\"tempID\":3,\"name\":\"Data\",\"machine_name\":\"data\",\"default_value\":\"\",\"placeholder\":\"Enter one by one separated by a comma.\",\"object\":\"_TEXTAREA\"}', 3, 1558559233, 1558560712, 0),
(4, 1, '_INPUT', 'Border Color', 'border_color', '', '', '{\"tempID\":\"1558560707-1068424696\",\"name\":\"Border Color\",\"machine_name\":\"border_color\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"color\",\"object\":\"_INPUT\"}', 4, 1558560712, 1558560712, 0),
(5, 2, '_INPUT', 'Chart Label', 'chart_label', '', '', '{\"tempID\":5,\"name\":\"Chart Label\",\"machine_name\":\"chart_label\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1558562896, 1558564252, 0),
(6, 2, '_TEXTAREA', 'Labels', 'labels', '', '', '{\"tempID\":6,\"name\":\"Labels\",\"machine_name\":\"labels\",\"default_value\":\"\",\"placeholder\":\"Enter one by one separated by a comma.\",\"object\":\"_TEXTAREA\"}', 2, 1558562896, 1558564252, 0),
(7, 2, '_TEXTAREA', 'Data', 'data', '', '', '{\"tempID\":7,\"name\":\"Data\",\"machine_name\":\"data\",\"default_value\":\"\",\"placeholder\":\"Enter one by one separated by a comma.\",\"object\":\"_TEXTAREA\"}', 3, 1558562896, 1558564252, 0),
(8, 2, '_TEXTAREA', 'Background Colors', 'background_colors', '', '', '{\"tempID\":8,\"name\":\"Background Colors\",\"machine_name\":\"background_colors\",\"default_value\":\"\",\"placeholder\":\"Enter one by one separated by a comma.\",\"object\":\"_TEXTAREA\"}', 4, 1558562896, 1558564252, 0),
(9, 3, '_INPUT', 'Chart Label', 'chart_label', '', '', '{\"tempID\":\"1558563547-645399172\",\"name\":\"Chart Label\",\"machine_name\":\"chart_label\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1558563842, 1558563842, NULL),
(10, 3, '_TEXTAREA', 'Labels', 'labels', '', '', '{\"tempID\":\"1558563578-219775184\",\"name\":\"Labels\",\"machine_name\":\"labels\",\"default_value\":\"\",\"placeholder\":\"Enter one by one separated by a comma.\",\"object\":\"_TEXTAREA\"}', 2, 1558563842, 1558563842, NULL),
(11, 3, '_TEXTAREA', 'Data', 'data', '', '', '{\"tempID\":\"1558563678-979103346\",\"name\":\"Data\",\"machine_name\":\"data\",\"default_value\":\"\",\"placeholder\":\"Enter one by one separated by a comma.\",\"object\":\"_TEXTAREA\"}', 3, 1558563842, 1558563842, NULL),
(12, 3, '_TEXTAREA', 'Background Colors', 'background_colors', '', '', '{\"tempID\":\"1558563696-1313657813\",\"name\":\"Background Colors\",\"machine_name\":\"background_colors\",\"default_value\":\"\",\"placeholder\":\"Enter one by one separated by a comma.\",\"object\":\"_TEXTAREA\"}', 4, 1558563842, 1558563842, NULL),
(13, 3, '_SELECT', 'Chart Type', 'chart_type', '', '', '{\"tempID\":\"1558563832-1195223705\",\"name\":\"Chart Type\",\"machine_name\":\"chart_type\",\"object_values\":\"\\\"doughnut : Doughnut\\\\r\\\\npie : Pie\\\"\",\"placeholder\":\"Chart Type Select\",\"values\":{\"doughnut\":\"Doughnut\",\"pie\":\"Pie\"},\"object\":\"_SELECT\"}', 5, 1558563842, 1558563842, NULL),
(14, 2, '_CHECKBOX', 'Horizontal Bar', 'horizontal_bar', '', '', '{\"tempID\":\"1558564250-886603072\",\"name\":\"Horizontal Bar\",\"machine_name\":\"horizontal_bar\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_CHECKBOX\"}', 5, 1558564252, 1558564252, 0),
(15, 4, '_INPUT', 'Name', 'name', '', '', '{\"tempID\":15,\"name\":\"Name\",\"machine_name\":\"name\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1558565282, 1558565306, 0),
(16, 4, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":16,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 2, 1558565282, 1558565306, 0),
(17, 5, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":17,\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1558865939, 1558870222, 0),
(18, 5, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":18,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1558865939, 1558870222, 0),
(19, 5, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":19,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1558865939, 1558870222, 0),
(20, 5, '_LINK', 'Button', 'button', '', '', '{\"tempID\":20,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 4, 1558865939, 1558870222, 0),
(21, 5, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":21,\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"default_fileName\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 5, 1558867620, 1558870222, 0),
(22, 5, '_CHECKBOX', 'Display image on the left', 'reverse_order', '', '', '{\"tempID\":\"1558870220-379891905\",\"name\":\"Display image on the left\",\"machine_name\":\"reverse_order\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_CHECKBOX\"}', 6, 1558870222, 1558870222, 0),
(23, 6, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":23,\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1558959824, 1558960697, 0),
(24, 6, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":24,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1558959824, 1558960697, 0),
(25, 6, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":25,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1558959824, 1558960697, 0),
(26, 6, '_LINK', 'Button', 'button', '', '', '{\"tempID\":26,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 4, 1558959824, 1558960697, 0),
(27, 6, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"27\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 5, 1558960160, 1558960697, 0),
(28, 7, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":28,\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1559082227, 1559082258, 0),
(29, 7, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":29,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559082227, 1559082258, 0),
(30, 7, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":30,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1559082227, 1559082258, 0),
(31, 7, '_LINK', 'Button', 'button', '', '', '{\"tempID\":31,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 4, 1559082227, 1559082258, 0),
(32, 7, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559082256-1393204286\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 5, 1559082258, 1559082258, 0),
(33, 8, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":33,\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"default_fileName\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 1, 1559155271, 1559155693, 0),
(34, 8, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":34,\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559155271, 1559155693, 0),
(35, 8, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":35,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 3, 1559155271, 1559155693, 0),
(36, 8, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":36,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 4, 1559155271, 1559155693, 0),
(37, 8, '_LINK', 'Button', 'button', '', '', '{\"tempID\":37,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 5, 1559155271, 1559155693, 0),
(38, 8, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"38\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 6, 1559155271, 1559155693, 0),
(39, 9, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":39,\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1559160932, 1559161032, 0),
(40, 9, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":40,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559160932, 1559161032, 0),
(41, 9, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":41,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1559160932, 1559161032, 0),
(42, 9, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559160920-633868337\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 5, 1559161032, 1559161032, 0),
(43, 9, '_LINK', 'Button', 'button', '', '', '{\"tempID\":\"1559161023-537307314\",\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 4, 1559161032, 1559161032, 0),
(44, 10, '_INPUT', 'Number', 'number', '', '', '{\"tempID\":45,\"name\":\"Number\",\"machine_name\":\"number\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1559161819, 1559161983, 0),
(45, 10, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":46,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559161819, 1559161983, 0),
(46, 10, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":47,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1559161819, 1559161983, 0),
(47, 10, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559161981-683413594\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 4, 1559161983, 1559161983, 0),
(48, 11, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":49,\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"default_fileName\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 1, 1559163055, 1559165557, 0),
(49, 11, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":50,\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559163055, 1559165557, 0),
(50, 11, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":51,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 3, 1559163055, 1559165557, 0),
(51, 11, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":52,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 4, 1559163055, 1559165557, 0),
(52, 11, '_LINK', 'Button', 'button', '', '', '{\"tempID\":53,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 5, 1559163055, 1559165557, 0),
(53, 11, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559165555-1198428753\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 6, 1559165557, 1559165557, 0),
(54, 12, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":\"1559169001-995926359\",\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 1, 1559169062, 1559169062, NULL),
(55, 12, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":\"1559169009-563911680\",\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559169062, 1559169062, NULL),
(56, 12, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":\"1559169014-822131619\",\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 3, 1559169062, 1559169062, NULL),
(57, 12, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":\"1559169023-978183430\",\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 4, 1559169062, 1559169062, NULL),
(58, 12, '_LINK', 'Button', 'button', '', '', '{\"tempID\":\"1559169039-553725765\",\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 5, 1559169062, 1559169062, NULL),
(59, 12, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559169059-1522642131\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 6, 1559169062, 1559169062, NULL),
(60, 13, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":61,\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1559241364, 1559243113, 0),
(61, 13, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":62,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559241364, 1559243113, 0),
(62, 13, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":63,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1559241364, 1559243113, 0),
(63, 13, '_LINK', 'Button', 'button', '', '', '{\"tempID\":64,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 4, 1559241364, 1559243113, 0),
(64, 13, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":65,\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"default_fileName\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 5, 1559241364, 1559243113, 0),
(65, 13, '_SELECT', 'Widget Position', 'widget_position', '', '', '{\"tempID\":\"69\",\"name\":\"Widget Position\",\"machine_name\":\"widget_position\",\"object_values\":\"\\\"start : Left\\\\r\\\\ncenter : Center\\\\r\\\\nend : Right\\\"\",\"placeholder\":\"Select Position\",\"values\":{\"start\":\"Left\",\"center\":\"Center\",\"end\":\"Right\"},\"object\":\"_SELECT\"}', 7, 1559241544, 1559243113, 0),
(66, 13, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559241301-786393286\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 6, 1559243113, 1559243113, 0),
(67, 13, '_SELECT', 'Text Align', 'text_align', '', '', '{\"tempID\":\"1559243111-473724896\",\"name\":\"Text Align\",\"machine_name\":\"text_align\",\"object_values\":\"\\\"text-left : Left\\\\r\\\\ntext-center : Center\\\\r\\\\ntext-right : Right\\\"\",\"placeholder\":\"Text Align\",\"values\":{\"text-left\":\"Left\",\"text-center\":\"Center\",\"text-right\":\"Right\"},\"object\":\"_SELECT\"}', 8, 1559243113, 1559243113, 0),
(68, 14, '_SELECT', 'Space', 'space', '', '', '{\"tempID\":\"1559243970-1049675843\",\"name\":\"Space\",\"machine_name\":\"space\",\"object_values\":\"\\\"small : Small\\\\r\\\\nmedium : Medium\\\\r\\\\nlarge : Large\\\\r\\\\nxl : Extra Large\\\"\",\"placeholder\":\"Select Space\",\"values\":{\"small\":\"Small\",\"medium\":\"Medium\",\"large\":\"Large\",\"xl\":\"Extra Large\"},\"object\":\"_SELECT\"}', 1, 1559243975, 1559243975, NULL),
(69, 15, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":74,\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559245535, 1559246079, 0),
(70, 15, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":75,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 3, 1559245535, 1559246079, 0),
(71, 15, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":76,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 4, 1559245535, 1559246079, 0),
(72, 15, '_LINK', 'Button', 'button', '', '', '{\"tempID\":77,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 5, 1559245535, 1559246079, 0),
(73, 15, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":78,\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"default_fileName\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 1, 1559245535, 1559246079, 0),
(74, 15, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559245484-1266927583\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 6, 1559246079, 1559246079, 0),
(75, 15, '_SELECT', 'Widget Position', 'widget_position', '', '', '{\"tempID\":\"1559245508-1274361500\",\"name\":\"Widget Position\",\"machine_name\":\"widget_position\",\"object_values\":\"\\\"start : Left\\\\r\\\\ncenter : Center\\\\r\\\\nend : Right\\\"\",\"placeholder\":\"Select Position\",\"values\":{\"start\":\"Left\",\"center\":\"Center\",\"end\":\"Right\"},\"object\":\"_SELECT\"}', 7, 1559246079, 1559246079, 0),
(76, 15, '_SELECT', 'Text Align', 'text_align', '', '', '{\"tempID\":\"1559245530-322842972\",\"name\":\"Text Align\",\"machine_name\":\"text_align\",\"object_values\":\"\\\"text-left : Left\\\\r\\\\ntext-center : Center\\\\r\\\\ntext-right : Right\\\"\",\"placeholder\":\"Text Align\",\"values\":{\"text-left\":\"Left\",\"text-center\":\"Center\",\"text-right\":\"Right\"},\"object\":\"_SELECT\"}', 8, 1559246079, 1559246079, 0),
(77, 16, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":85,\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"default_fileName\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 1, 1559250328, 1559251829, 0),
(78, 16, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":86,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559250328, 1559251829, 0),
(79, 16, '_INPUT', 'Link', 'link', '', '', '{\"tempID\":87,\"name\":\"Link\",\"machine_name\":\"link\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 4, 1559250328, 1559251829, 0),
(80, 16, '_TEXTAREA', 'Text', 'text', '', '', '{\"tempID\":\"1559251826-228498189\",\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXTAREA\"}', 3, 1559251829, 1559251829, 0),
(81, 17, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":89,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 1, 1559253183, 1559253554, 0),
(82, 17, '_INPUT', 'Name', 'name', '', '', '{\"tempID\":90,\"name\":\"Name\",\"machine_name\":\"name\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559253183, 1559253554, 0),
(83, 17, '_INPUT', 'Job Title', 'job_title', '', '', '{\"tempID\":91,\"name\":\"Job Title\",\"machine_name\":\"job_title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 3, 1559253183, 1559253554, 0),
(84, 17, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559253308-1542333027\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 4, 1559253554, 1559253554, 0),
(85, 18, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":94,\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"default_fileName\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 5, 1559256962, 1559332164, 0),
(86, 18, '_INPUT', 'Tab Name', 'tab_name', '', '', '{\"tempID\":95,\"name\":\"Tab Name\",\"machine_name\":\"tab_name\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 7, 1559256962, 1559332164, 0),
(87, 18, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":96,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559256962, 1559332164, 0),
(88, 18, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":97,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1559256962, 1559332164, 0),
(89, 18, '_LINK', 'Button', 'button', '', '', '{\"tempID\":98,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 4, 1559256962, 1559332164, 0),
(90, 18, '_SELECT', 'Image Location', 'image_location', '', '', '{\"tempID\":\"1559256960-116448286\",\"name\":\"Image Location\",\"machine_name\":\"image_location\",\"object_values\":\"\\\"left : Left\\\\r\\\\nright : Right\\\"\",\"placeholder\":\"Image Location\",\"values\":{\"left\":\"Left\",\"right\":\"Right\"},\"object\":\"_SELECT\"}', 6, 1559332164, 1559332164, 0),
(91, 18, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":\"1559332106-803840542\",\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1559332164, 1559332164, 0),
(92, 19, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":\"1559343480-288444145\",\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1559343547, 1559343547, NULL),
(93, 19, '_INPUT', 'Price', 'price', '', '', '{\"tempID\":\"1559343493-933357914\",\"name\":\"Price\",\"machine_name\":\"price\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559343547, 1559343547, NULL),
(94, 19, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":\"1559343505-142318553\",\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1559343547, 1559343547, NULL),
(95, 19, '_LINK', 'Button', 'button', '', '', '{\"tempID\":\"1559343519-662088915\",\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 4, 1559343547, 1559343547, NULL),
(96, 19, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":\"1559343538-584818093\",\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 5, 1559343547, 1559343547, NULL),
(97, 19, '_GALLERY', 'Gallery', 'gallery', '', '', '{\"tempID\":\"1559343527-843958183\",\"name\":\"Gallery\",\"machine_name\":\"gallery\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_GALLERY\"}', 6, 1559343547, 1559343547, NULL),
(98, 20, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":\"1559412607-444965460\",\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 1, 1559412747, 1559412747, NULL),
(99, 20, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":\"1559412627-546236555\",\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559412747, 1559412747, NULL),
(100, 20, '_TEXTAREA', 'Text', 'text', '', '', '{\"tempID\":\"1559412697-1420207023\",\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXTAREA\"}', 3, 1559412747, 1559412747, NULL),
(101, 20, '_INPUT', 'Price', 'price', '', '', '{\"tempID\":\"1559412636-563822126\",\"name\":\"Price\",\"machine_name\":\"price\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 4, 1559412747, 1559412747, NULL),
(102, 20, '_INPUT', 'Link', 'link', '', '', '{\"tempID\":\"1559412649-1211666792\",\"name\":\"Link\",\"machine_name\":\"link\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 5, 1559412747, 1559412747, NULL),
(103, 21, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":113,\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"default_fileName\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 1, 1559416869, 1559417012, 0),
(104, 21, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":114,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559416869, 1559417012, 0),
(105, 21, '_INPUT', 'Price', 'price', '', '', '{\"tempID\":115,\"name\":\"Price\",\"machine_name\":\"price\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 3, 1559416869, 1559417012, 0),
(106, 21, '_TEXTAREA', 'Description', 'description', '', '', '{\"tempID\":116,\"name\":\"Description\",\"machine_name\":\"description\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXTAREA\"}', 4, 1559416869, 1559417012, 0),
(107, 21, '_LINK', 'Button', 'button', '', '', '{\"tempID\":117,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 5, 1559416869, 1559417012, 0),
(108, 21, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559417010-1458065839\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 6, 1559417012, 1559417012, 0),
(109, 22, '_GALLERY', 'Images', 'images', '', '', '{\"tempID\":\"1559422222-493621402\",\"name\":\"Images\",\"machine_name\":\"images\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_GALLERY\"}', 1, 1559422234, 1559422234, NULL),
(110, 23, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":\"1559422313-310356484\",\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 1, 1559422349, 1559422349, NULL),
(111, 23, '_INPUT', 'Name', 'name', '', '', '{\"tempID\":\"1559422340-851832086\",\"name\":\"Name\",\"machine_name\":\"name\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559422349, 1559422349, NULL),
(112, 24, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":122,\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"default_fileName\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 1, 1559472025, 1559472125, 0),
(113, 24, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":123,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559472025, 1559472125, 0),
(114, 24, '_TEXTAREA', 'Text', 'text', '', '', '{\"tempID\":124,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXTAREA\"}', 3, 1559472025, 1559472125, 0),
(115, 24, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559472123-1006775000\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 4, 1559472125, 1559472125, 0),
(116, 25, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":126,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1559474580, 1559501926, 0),
(117, 25, '_INPUT', 'Price', 'price', '', '', '{\"tempID\":127,\"name\":\"Price\",\"machine_name\":\"price\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559474580, 1559501926, 0),
(118, 25, '_TEXTAREA', 'Description', 'description', '', '', '{\"tempID\":128,\"name\":\"Description\",\"machine_name\":\"description\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXTAREA\"}', 3, 1559474580, 1559501926, 0),
(119, 25, '_LINK', 'Button', 'button', '', '', '{\"tempID\":129,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 4, 1559474580, 1559501926, 0),
(120, 25, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559501625-1381370001\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 5, 1559501926, 1559501926, 0),
(121, 25, '_SELECT', 'Text Align', 'text_align', '', '', '{\"tempID\":\"1559501924-621768367\",\"name\":\"Text Align\",\"machine_name\":\"text_align\",\"object_values\":\"\\\"left : Left\\\\r\\\\ncenter : Center\\\\r\\\\nright : Right\\\"\",\"placeholder\":\"Text Align\",\"values\":{\"left\":\"Left\",\"center\":\"Center\",\"right\":\"Right\"},\"object\":\"_SELECT\"}', 6, 1559501926, 1559501926, 0),
(122, 26, '_IMAGE', 'Image', 'image', '', '', '{\"tempID\":\"1559502525-1032444488\",\"name\":\"Image\",\"machine_name\":\"image\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_IMAGE\"}', 1, 1559502610, 1559502610, NULL),
(123, 26, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":\"1559502457-37197361\",\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559502610, 1559502610, NULL),
(124, 26, '_INPUT', 'Price', 'price', '', '', '{\"tempID\":\"1559502464-1278395926\",\"name\":\"Price\",\"machine_name\":\"price\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 3, 1559502610, 1559502610, NULL),
(125, 26, '_INPUT', 'Price per', 'price_per', '', '', '{\"tempID\":\"1559502482-683717154\",\"name\":\"Price per\",\"machine_name\":\"price_per\",\"default_value\":\"\",\"placeholder\":\"month \\/ week\",\"type\":\"text\",\"object\":\"_INPUT\"}', 4, 1559502610, 1559502610, NULL),
(126, 26, '_TEXTAREA', 'Description', 'description', '', '', '{\"tempID\":\"1559502490-182232517\",\"name\":\"Description\",\"machine_name\":\"description\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXTAREA\"}', 5, 1559502610, 1559502610, NULL),
(127, 26, '_LINK', 'Button', 'button', '', '', '{\"tempID\":\"1559502497-1227956225\",\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_LINK\"}', 6, 1559502610, 1559502610, NULL),
(128, 26, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559502586-1179232517\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 7, 1559502610, 1559502610, NULL),
(129, 26, '_SELECT', 'Text Align', 'text_align', '', '', '{\"tempID\":\"1559502608-1516395690\",\"name\":\"Text Align\",\"machine_name\":\"text_align\",\"object_values\":\"\\\"left : Left\\\\r\\\\ncenter : Center\\\\r\\\\nright : Right\\\"\",\"placeholder\":\"Text Align\",\"values\":{\"left\":\"Left\",\"center\":\"Center\",\"right\":\"Right\"},\"object\":\"_SELECT\"}', 8, 1559502610, 1559502610, NULL),
(130, 27, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":141,\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1559505504, 1559505782, 0),
(131, 27, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":142,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 2, 1559505504, 1559505782, 0),
(132, 27, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":143,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1559505504, 1559505782, 0),
(133, 27, '_INPUT', 'Form Action', 'form_action', '', '', '{\"tempID\":144,\"name\":\"Form Action\",\"machine_name\":\"form_action\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 4, 1559505504, 1559505782, 0),
(134, 27, '_INPUT', 'Form ID / Name', 'form_id_name', '', '', '{\"tempID\":\"145\",\"name\":\"Form ID \\/ Name\",\"machine_name\":\"form_id_name\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 5, 1559505504, 1559505782, 0),
(135, 27, '_INPUT', 'Email Input ID / Name', 'email_input_id_name', '', '', '{\"tempID\":\"147\",\"name\":\"Email Input ID \\/ Name\",\"machine_name\":\"email_input_id_name\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 6, 1559505504, 1559505782, 0),
(136, 27, '_SELECT', 'Text Align', 'text_align', '', '', '{\"tempID\":\"1559505635-1548626348\",\"name\":\"Text Align\",\"machine_name\":\"text_align\",\"object_values\":\"\\\"left : Left\\\\r\\\\ncenter : Center\\\\r\\\\nright : Right\\\"\",\"placeholder\":\"Text Align\",\"values\":{\"left\":\"Left\",\"center\":\"Center\",\"right\":\"Right\"},\"object\":\"_SELECT\"}', 7, 1559505782, 1559505782, 0),
(137, 27, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559505662-152702892\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 8, 1559505782, 1559505782, 0),
(138, 28, '_TEXTAREA', 'Iframe', 'iframe', '', '', '{\"tempID\":\"152\",\"name\":\"Iframe\",\"machine_name\":\"iframe\",\"default_value\":\"\",\"placeholder\":\"\",\"object\":\"_TEXTAREA\"}', 1, 1559507359, 1559509424, 0),
(139, 29, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":153,\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"required\":\"\",\"object\":\"_INPUT\"}', 1, 1559507919, 1560197110, 0),
(140, 29, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":154,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"required\":\"\",\"object\":\"_INPUT\"}', 2, 1559507919, 1560197110, 0),
(141, 29, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":155,\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"required\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1559507919, 1560197110, 0),
(142, 29, '_LINK', 'Button', 'button', '', '', '{\"tempID\":156,\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"default_value_link\":\"\",\"default_value_target\":\"\",\"placeholder\":\"\",\"required\":\"\",\"object\":\"_LINK\"}', 4, 1559507919, 1560197110, 0),
(143, 29, '_TEXTAREA', 'Video Iframe', 'video_iframe', '', '', '{\"tempID\":157,\"name\":\"Video Iframe\",\"machine_name\":\"video_iframe\",\"default_value\":\"\",\"placeholder\":\"\",\"required\":\"\",\"object\":\"_TEXTAREA\"}', 5, 1559507919, 1560197110, 0),
(144, 30, '_INPUT', 'Link', 'link', '', '', '{\"tempID\":162,\"name\":\"Link\",\"machine_name\":\"link\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"object\":\"_INPUT\"}', 1, 1559512731, 1559513457, 0),
(145, 30, '_SELECT', 'Style', 'style', '', '', '{\"tempID\":\"165\",\"name\":\"Style\",\"machine_name\":\"style\",\"object_values\":\"\\\"color : Color\\\\r\\\\ngrey : Grey\\\\r\\\\nborderless : Borderless\\\"\",\"placeholder\":\"Icon Style\",\"values\":{\"color\":\"Color\",\"grey\":\"Grey\",\"borderless\":\"Borderless\"},\"object\":\"_SELECT\"}', 3, 1559513364, 1559513457, 0),
(146, 30, '_SELECT', 'Animation', 'animation', '', '', '{\"tempID\":\"166\",\"name\":\"Animation\",\"machine_name\":\"animation\",\"object_values\":\"\\\"animation : Animation\\\\r\\\\nno-animation : No Animation\\\\r\\\\nstatic : Static\\\"\",\"placeholder\":\"Hover Animation\",\"values\":{\"animation\":\"Animation\",\"no-animation\":\"No Animation\",\"static\":\"Static\"},\"object\":\"_SELECT\"}', 4, 1559513364, 1559513457, 0),
(147, 30, '_SELECT', 'Icon', 'icon', '', '', '{\"tempID\":\"1559512722-1269644079\",\"name\":\"Icon\",\"machine_name\":\"icon\",\"object_values\":\"\\\"icon-facebook : Facebook\\\\r\\\\nicon-twitter : Twitter\\\\r\\\\nicon-instagram : Instagram\\\\r\\\\nicon-behance : Behance\\\\r\\\\nicon-vimeo : Vimeo\\\\r\\\\nicon-youtube : Youtube\\\\r\\\\nicon-googleplus : Google+\\\\r\\\\nicon-rss : RSS\\\\r\\\\nicon-pinterest : Pinterest\\\\r\\\\nicon-tumblr : Tumblr\\\\r\\\\nicon-linkedin : LinkedIn\\\\r\\\\nicon-skype : Skype\\\\r\\\\nicon-github : Github\\\\r\\\\nicon-dribbble : Dribbble\\\"\",\"placeholder\":\"Icon\",\"values\":{\"icon-facebook\":\"Facebook\",\"icon-twitter\":\"Twitter\",\"icon-instagram\":\"Instagram\",\"icon-behance\":\"Behance\",\"icon-vimeo\":\"Vimeo\",\"icon-youtube\":\"Youtube\",\"icon-googleplus\":\"Google+\",\"icon-rss\":\"RSS\",\"icon-pinterest\":\"Pinterest\",\"icon-tumblr\":\"Tumblr\",\"icon-linkedin\":\"LinkedIn\",\"icon-skype\":\"Skype\",\"icon-github\":\"Github\",\"icon-dribbble\":\"Dribbble\"},\"object\":\"_SELECT\"}', 2, 1559513457, 1559513457, 0),
(148, 31, '_SELECT', 'Icon Style', 'icon_style', '', '', '{\"tempID\":\"168\",\"name\":\"Icon Style\",\"machine_name\":\"icon_style\",\"object_values\":\"\\\"classic : Classic\\\\r\\\\nhigh-contrast : High Contrast\\\\r\\\\nsquare-o : Square-O\\\\r\\\\nvivid : Vivid\\\"\",\"placeholder\":\"Icon Style\",\"values\":{\"classic\":\"Classic\",\"high-contrast\":\"High Contrast\",\"square-o\":\"Square-O\",\"vivid\":\"Vivid\"},\"object\":\"_SELECT\"}', 3, 1559585431, 1559676757, 0),
(149, 31, '_FILE', 'File', 'file', '', '', '{\"tempID\":\"169\",\"name\":\"File\",\"machine_name\":\"file\",\"default_value\":\"\",\"placeholder\":\"\",\"required\":\"1\",\"object\":\"_FILE\"}', 2, 1559585431, 1559676757, 0),
(150, 31, '_INPUT', 'Name', 'name', '', '', '{\"tempID\":\"172\",\"name\":\"Name\",\"machine_name\":\"name\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"required\":\"1\",\"object\":\"_INPUT\"}', 1, 1559587565, 1559676757, 0),
(151, 31, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559591320-749472149\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 4, 1559676757, 1559676757, 0),
(152, 31, '_SELECT', 'Column Align', 'column_align', '', '', '{\"tempID\":\"1559591520-175352811\",\"name\":\"Column Align\",\"machine_name\":\"column_align\",\"object_values\":\"\\\"beginning : Left\\\\r\\\\ncenter : Center\\\\r\\\\nend : Right\\\"\",\"placeholder\":\"Align to\",\"values\":{\"beginning\":\"Left\",\"center\":\"Center\",\"end\":\"Right\"},\"object\":\"_SELECT\"}', 5, 1559676757, 1559676757, 0),
(153, 32, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":179,\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"required\":\"\",\"object\":\"_INPUT\"}', 1, 1559686506, 1559686783, 0),
(154, 32, '_INPUT', 'Form ID', 'form_id', '', '', '{\"tempID\":181,\"name\":\"Form ID\",\"machine_name\":\"form_id\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"required\":\"\",\"object\":\"_INPUT\"}', 3, 1559686506, 1559686783, 0),
(155, 32, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":\"1559686560-464283385\",\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"required\":\"\",\"object\":\"_TEXT_EDITOR\"}', 2, 1559686783, 1559686783, 0),
(156, 32, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559686584-660201863\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"required\":\"\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 4, 1559686783, 1559686783, 0),
(157, 32, '_SELECT', 'Text Align', 'text_align', '', '', '{\"tempID\":\"1559686604-1400735169\",\"name\":\"Text Align\",\"machine_name\":\"text_align\",\"object_values\":\"\\\"left : Left\\\\r\\\\ncenter : Center\\\\r\\\\nright : Right\\\"\",\"placeholder\":\"Text Align\",\"required\":\"\",\"values\":{\"left\":\"Left\",\"center\":\"Center\",\"right\":\"Right\"},\"object\":\"_SELECT\"}', 5, 1559686783, 1559686783, 0),
(158, 32, '_SELECT', 'Column Align', 'column_align', '', '', '{\"tempID\":\"1559686642-1229997887\",\"name\":\"Column Align\",\"machine_name\":\"column_align\",\"object_values\":\"\\\"beginning : Left\\\\r\\\\ncenter : Center\\\\r\\\\nend : Right\\\"\",\"placeholder\":\"Column Align\",\"required\":\"\",\"values\":{\"beginning\":\"Left\",\"center\":\"Center\",\"end\":\"Right\"},\"object\":\"_SELECT\"}', 6, 1559686783, 1559686783, 0),
(159, 33, '_INPUT', 'Form Code', 'form_code', '', '', '{\"tempID\":\"1559988487-1547594050\",\"name\":\"Form Code\",\"machine_name\":\"form_code\",\"default_value\":\"\",\"placeholder\":\"form::ID\",\"type\":\"text\",\"required\":\"1\",\"object\":\"_INPUT\"}', 1, 1559988661, 1559988661, NULL),
(160, 33, '_INPUT', 'Container ID', 'container_id', '', '', '{\"tempID\":\"1559988648-1512110308\",\"name\":\"Container ID\",\"machine_name\":\"container_id\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"required\":\"\",\"object\":\"_INPUT\"}', 2, 1559988661, 1559988661, NULL),
(161, 33, '_SELECT', 'Columns', 'columns', '', '', '{\"tempID\":\"1559988558-22885286\",\"name\":\"Columns\",\"machine_name\":\"columns\",\"object_values\":\"\\\"1 : 1\\\\r\\\\n2 : 2\\\\r\\\\n3 : 3\\\\r\\\\n4 : 4\\\\r\\\\n5 : 5\\\\r\\\\n6 : 6\\\\r\\\\n7 : 7\\\\r\\\\n8 : 8\\\\r\\\\n9 : 9\\\\r\\\\n10 : 10\\\\r\\\\n11 : 11\\\\r\\\\n12 : 12\\\"\",\"placeholder\":\"Columns\",\"required\":\"\",\"values\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\",\"7\":\"7\",\"8\":\"8\",\"9\":\"9\",\"10\":\"10\",\"11\":\"11\",\"12\":\"12\"},\"object\":\"_SELECT\"}', 3, 1559988661, 1559988661, NULL),
(162, 33, '_SELECT', 'Column Align', 'column_align', '', '', '{\"tempID\":\"1559988576-87808431\",\"name\":\"Column Align\",\"machine_name\":\"column_align\",\"object_values\":\"\\\"beginning : Left\\\\r\\\\ncenter : Center\\\\r\\\\nend : Right\\\"\",\"placeholder\":\"Align to\",\"required\":\"\",\"values\":{\"beginning\":\"Left\",\"center\":\"Center\",\"end\":\"Right\"},\"object\":\"_SELECT\"}', 4, 1559988661, 1559988661, NULL),
(163, 34, '_INPUT', 'Headline', 'headline', '', '', '{\"tempID\":\"1559994010-329656518\",\"name\":\"Headline\",\"machine_name\":\"headline\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"required\":\"\",\"object\":\"_INPUT\"}', 1, 1559994351, 1559994351, NULL),
(164, 34, '_INPUT', 'Title', 'title', '', '', '{\"tempID\":\"1559994020-947304655\",\"name\":\"Title\",\"machine_name\":\"title\",\"default_value\":\"\",\"placeholder\":\"\",\"type\":\"text\",\"required\":\"\",\"object\":\"_INPUT\"}', 2, 1559994351, 1559994351, NULL);
INSERT INTO `page_builder_object_list` (`pbol_id`, `pbol_pbo_id`, `pbol_type`, `pbol_name`, `pbol_machine_name`, `pbol_values`, `pbol_default_value`, `pbol_json`, `pbol_weight`, `pbol_created`, `pbol_updated`, `pbol_deleted`) VALUES
(165, 34, '_TEXT_EDITOR', 'Text', 'text', '', '', '{\"tempID\":\"1559994041-1173916303\",\"name\":\"Text\",\"machine_name\":\"text\",\"default_value\":\"\",\"placeholder\":\"\",\"required\":\"\",\"object\":\"_TEXT_EDITOR\"}', 3, 1559994351, 1559994351, NULL),
(166, 34, '_LINK', 'Button', 'button', '', '', '{\"tempID\":\"1559994057-1368135343\",\"name\":\"Button\",\"machine_name\":\"button\",\"default_value\":\"\",\"placeholder\":\"\",\"required\":\"\",\"object\":\"_LINK\"}', 4, 1559994351, 1559994351, NULL),
(167, 34, '_INPUT', 'Form Code', 'form_code', '', '', '{\"tempID\":\"1559994189-642430306\",\"name\":\"Form Code\",\"machine_name\":\"form_code\",\"default_value\":\"\",\"placeholder\":\"form::ID\",\"type\":\"text\",\"required\":\"\",\"object\":\"_INPUT\"}', 5, 1559994351, 1559994351, NULL),
(168, 34, '_CHECKBOX', 'Display form on the left', 'reverse_order', '', '', '{\"tempID\":\"1559994089-1243632029\",\"name\":\"Display form on the left\",\"machine_name\":\"reverse_order\",\"default_value\":\"\",\"placeholder\":\"\",\"required\":\"\",\"object\":\"_CHECKBOX\"}', 6, 1559994351, 1559994351, NULL),
(169, 29, '_SELECT', 'Text Align', 'text_align', '', '', '{\"tempID\":\"1559507742-1255784816\",\"name\":\"Text Align\",\"machine_name\":\"text_align\",\"object_values\":\"\\\"left : Left\\\\r\\\\ncenter : Center\\\\r\\\\nright : Right\\\"\",\"placeholder\":\"Text Align\",\"values\":{\"left\":\"Left\",\"center\":\"Center\",\"right\":\"Right\"},\"object\":\"_SELECT\"}', 6, 1560197110, 1560197110, 0),
(170, 29, '_SELECT', 'Iframe Position', 'video_position', '', '', '{\"tempID\":\"1559507916-646395115\",\"name\":\"Iframe Position\",\"machine_name\":\"video_position\",\"object_values\":\"\\\"left : Left\\\\r\\\\nright : Right\\\"\",\"placeholder\":\"Iframe Position\",\"values\":{\"left\":\"Left\",\"right\":\"Right\"},\"object\":\"_SELECT\"}', 7, 1560197110, 1560197110, 0);

-- --------------------------------------------------------

--
-- Table structure for table `routing_system`
--

CREATE TABLE `routing_system` (
  `rid` bigint(22) NOT NULL,
  `object_id` bigint(22) NOT NULL,
  `route` varchar(256) NOT NULL,
  `module` varchar(56) NOT NULL,
  `namespace` varchar(56) NOT NULL,
  `action` varchar(56) NOT NULL,
  `type` enum('static','dynamic') NOT NULL DEFAULT 'static',
  `methods` varchar(56) NOT NULL,
  `required_roles` varchar(256) NOT NULL,
  `local_template` int(11) NOT NULL,
  `created_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settings_smtp`
--

CREATE TABLE `settings_smtp` (
  `id` int(11) NOT NULL,
  `hostname` varchar(150) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `noreply_email` varchar(56) NOT NULL,
  `noreply_name` varchar(56) NOT NULL,
  `tls` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `settings_website`
--

CREATE TABLE `settings_website` (
  `sw_id` int(11) NOT NULL,
  `sw_title` varchar(256) NOT NULL,
  `sw_description` text NOT NULL,
  `sw_page_builder_config` longtext NOT NULL,
  `sw_page_builder_data` longtext NOT NULL,
  `sw_front` tinyint(1) DEFAULT NULL,
  `sw_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings_website`
--

INSERT INTO `settings_website` (`sw_id`, `sw_title`, `sw_description`, `sw_page_builder_config`, `sw_page_builder_data`, `sw_front`, `sw_status`) VALUES
(1, 'Wknt - Homepage', 'Wknt CMS', '', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_updates`
--

CREATE TABLE `system_updates` (
  `suid` int(22) NOT NULL,
  `type` varchar(56) NOT NULL,
  `filename` varchar(156) NOT NULL,
  `version` varchar(50) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` bigint(22) NOT NULL,
  `username` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(250) NOT NULL,
  `logins` int(22) NOT NULL,
  `date_created` int(11) NOT NULL,
  `date_updated` int(11) NOT NULL,
  `date_login` int(11) NOT NULL,
  `session_id` varchar(256) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `username`, `email`, `password`, `logins`, `date_created`, `date_updated`, `date_login`, `session_id`, `status`) VALUES
(1, 'admin', 'admin@wknt.cms', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 1, 1560284356, 1560284356, 1560284366, 'ssid_0bfd59vvnmmb3aumiuc1qthpga', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `p_uid` bigint(22) NOT NULL,
  `p_first_name` varchar(256) NOT NULL,
  `p_last_name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`p_uid`, `p_first_name`, `p_last_name`) VALUES
(1, 'Wknt', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_recover`
--

CREATE TABLE `user_recover` (
  `id` bigint(22) NOT NULL,
  `r_uid` bigint(22) NOT NULL,
  `code_1` varchar(56) NOT NULL,
  `code_2` varchar(56) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `ur_uid` bigint(22) NOT NULL,
  `ur_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`ur_uid`, `ur_role`) VALUES
(1, 'moderator'),
(1, 'authenticated'),
(1, 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `user_stored_data`
--

CREATE TABLE `user_stored_data` (
  `id` bigint(22) NOT NULL,
  `user_id` bigint(22) NOT NULL,
  `table_name` varchar(56) DEFAULT NULL,
  `table_key` varchar(56) NOT NULL,
  `row_id` bigint(22) NOT NULL,
  `delete_files` int(1) DEFAULT NULL,
  `delete_files_location` varchar(56) NOT NULL,
  `stored_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_transactional_emails`
--

CREATE TABLE `user_transactional_emails` (
  `id` bigint(22) NOT NULL,
  `human_id` varchar(256) DEFAULT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `preview` text NOT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`bcid`);

--
-- Indexes for table `blog_categories_details`
--
ALTER TABLE `blog_categories_details`
  ADD PRIMARY KEY (`bcd_bcid`),
  ADD KEY `bcd_parent` (`bcd_parent`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`bpid`);

--
-- Indexes for table `blog_post_categories`
--
ALTER TABLE `blog_post_categories`
  ADD KEY `pbc_bcid` (`pbc_bcid`),
  ADD KEY `pbc_bpid` (`pbc_bpid`);

--
-- Indexes for table `blog_post_details`
--
ALTER TABLE `blog_post_details`
  ADD PRIMARY KEY (`bpd_bpid`);

--
-- Indexes for table `blog_settings`
--
ALTER TABLE `blog_settings`
  ADD PRIMARY KEY (`bsid`);

--
-- Indexes for table `files_management`
--
ALTER TABLE `files_management`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `migrate`
--
ALTER TABLE `migrate`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `pages_details`
--
ALTER TABLE `pages_details`
  ADD PRIMARY KEY (`pd_pid`),
  ADD KEY `pd_pid` (`pd_pid`);

--
-- Indexes for table `page_builder_data`
--
ALTER TABLE `page_builder_data`
  ADD PRIMARY KEY (`pbd_id`),
  ADD KEY `pbd_pbo_id` (`pbd_pbo_id`),
  ADD KEY `pbd_object_id` (`pbd_object_id`),
  ADD KEY `pbd_module` (`pbd_module`),
  ADD KEY `pbd_group` (`pbd_group`);

--
-- Indexes for table `page_builder_data_values`
--
ALTER TABLE `page_builder_data_values`
  ADD PRIMARY KEY (`pbdv_id`),
  ADD KEY `pbdv_pbo_id` (`pbdv_pbo_id`),
  ADD KEY `pbdv_pbd_id` (`pbdv_pbd_id`),
  ADD KEY `pbdv_module` (`pbdv_module`),
  ADD KEY `pbdv_object_id` (`pbdv_object_id`),
  ADD KEY `pbdv_pbol_id` (`pbdv_pbol_id`),
  ADD KEY `pbdv_parent` (`pbdv_parent`);

--
-- Indexes for table `page_builder_forms`
--
ALTER TABLE `page_builder_forms`
  ADD PRIMARY KEY (`pbf_id`);

--
-- Indexes for table `page_builder_forms_data`
--
ALTER TABLE `page_builder_forms_data`
  ADD PRIMARY KEY (`pbfd_id`),
  ADD KEY `pbd_pbo_id` (`pbfd_pbf_id`);

--
-- Indexes for table `page_builder_forms_data_values`
--
ALTER TABLE `page_builder_forms_data_values`
  ADD PRIMARY KEY (`pbfdv_id`),
  ADD KEY `pbdv_pbd_id` (`pbfdv_pbf_id`),
  ADD KEY `pbdv_pbol_id` (`pbfdv_pbff_id`);

--
-- Indexes for table `page_builder_forms_fields`
--
ALTER TABLE `page_builder_forms_fields`
  ADD PRIMARY KEY (`pbff_id`),
  ADD KEY `pbol_pbo_id` (`pbff_pbf_id`);

--
-- Indexes for table `page_builder_group`
--
ALTER TABLE `page_builder_group`
  ADD PRIMARY KEY (`pbid`);

--
-- Indexes for table `page_builder_object`
--
ALTER TABLE `page_builder_object`
  ADD PRIMARY KEY (`pbo_id`),
  ADD KEY `pbo_pbid` (`pbo_pbid`);

--
-- Indexes for table `page_builder_object_list`
--
ALTER TABLE `page_builder_object_list`
  ADD PRIMARY KEY (`pbol_id`),
  ADD KEY `pbol_pbo_id` (`pbol_pbo_id`);

--
-- Indexes for table `routing_system`
--
ALTER TABLE `routing_system`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `route` (`route`);

--
-- Indexes for table `settings_smtp`
--
ALTER TABLE `settings_smtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_website`
--
ALTER TABLE `settings_website`
  ADD PRIMARY KEY (`sw_id`);

--
-- Indexes for table `system_updates`
--
ALTER TABLE `system_updates`
  ADD PRIMARY KEY (`suid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`p_uid`),
  ADD KEY `p_uid` (`p_uid`);

--
-- Indexes for table `user_recover`
--
ALTER TABLE `user_recover`
  ADD PRIMARY KEY (`id`),
  ADD KEY `r_uid` (`r_uid`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `ur_uid` (`ur_uid`),
  ADD KEY `ur_role` (`ur_role`);

--
-- Indexes for table `user_stored_data`
--
ALTER TABLE `user_stored_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_transactional_emails`
--
ALTER TABLE `user_transactional_emails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `bcid` int(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `bpid` int(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post_details`
--
ALTER TABLE `blog_post_details`
  MODIFY `bpd_bpid` int(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_settings`
--
ALTER TABLE `blog_settings`
  MODIFY `bsid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files_management`
--
ALTER TABLE `files_management`
  MODIFY `fid` int(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrate`
--
ALTER TABLE `migrate`
  MODIFY `mid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `pid` int(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_builder_data`
--
ALTER TABLE `page_builder_data`
  MODIFY `pbd_id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_builder_data_values`
--
ALTER TABLE `page_builder_data_values`
  MODIFY `pbdv_id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_builder_forms`
--
ALTER TABLE `page_builder_forms`
  MODIFY `pbf_id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_builder_forms_data`
--
ALTER TABLE `page_builder_forms_data`
  MODIFY `pbfd_id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_builder_forms_data_values`
--
ALTER TABLE `page_builder_forms_data_values`
  MODIFY `pbfdv_id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_builder_forms_fields`
--
ALTER TABLE `page_builder_forms_fields`
  MODIFY `pbff_id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_builder_group`
--
ALTER TABLE `page_builder_group`
  MODIFY `pbid` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `page_builder_object`
--
ALTER TABLE `page_builder_object`
  MODIFY `pbo_id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `page_builder_object_list`
--
ALTER TABLE `page_builder_object_list`
  MODIFY `pbol_id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `routing_system`
--
ALTER TABLE `routing_system`
  MODIFY `rid` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings_smtp`
--
ALTER TABLE `settings_smtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings_website`
--
ALTER TABLE `settings_website`
  MODIFY `sw_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_updates`
--
ALTER TABLE `system_updates`
  MODIFY `suid` int(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_recover`
--
ALTER TABLE `user_recover`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_stored_data`
--
ALTER TABLE `user_stored_data`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_transactional_emails`
--
ALTER TABLE `user_transactional_emails`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
