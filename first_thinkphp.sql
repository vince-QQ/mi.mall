-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-08-20 09:02:21
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `first_thinkphp`
--

-- --------------------------------------------------------

--
-- 表的结构 `tp_address`
--

CREATE TABLE `tp_address` (
  `id` int(11) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `a_phone` varchar(255) NOT NULL,
  `a_area` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tp_address`
--

INSERT INTO `tp_address` (`id`, `a_name`, `a_phone`, `a_area`) VALUES
(1, '王思聪', '12356897458', '广东广州大学城'),
(2, '马云', '15647854569', '浙江杭州'),
(3, '马化腾', '13564568549', '广东深圳腾讯公司'),
(4, '刘强东', '18845687488', '京东集团京东大厦28楼董事长办公室'),
(5, '李彦宏', '18896569999', '百度公司董事长办公室'),
(6, '王石', '15588669955', '中国万科集团'),
(7, '蒲经理', '1568585945', '龙口商业大厦');

-- --------------------------------------------------------

--
-- 表的结构 `tp_cart`
--

CREATE TABLE `tp_cart` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `goods_price` float NOT NULL,
  `num` int(11) NOT NULL,
  `spec_content` varchar(255) NOT NULL,
  `goods_picurl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tp_cart`
--

INSERT INTO `tp_cart` (`id`, `uid`, `goods_id`, `goods_name`, `goods_price`, `num`, `spec_content`, `goods_picurl`) VALUES
(9, 1, 9, '小米平板', 2699, 1, '6G|红色', '20180813\\1d6327fce18fc33e1c01e25be4f44e69.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `tp_category`
--

CREATE TABLE `tp_category` (
  `id` int(11) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tp_category`
--

INSERT INTO `tp_category` (`id`, `c_name`, `parent_id`, `level`) VALUES
(1, '手机', 0, 1),
(2, '平板', 0, 1),
(3, '电脑', 0, 1),
(4, '小米', 1, 2),
(5, '红米', 1, 2),
(6, '苹果', 2, 2),
(7, 'iPad', 2, 2),
(8, '华为荣耀', 2, 2),
(9, '老板', 3, 2);

-- --------------------------------------------------------

--
-- 表的结构 `tp_comment`
--

CREATE TABLE `tp_comment` (
  `id` int(11) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `c_content` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tp_comment`
--

INSERT INTO `tp_comment` (`id`, `c_name`, `c_content`, `time`) VALUES
(1, 'freya', '这是一部很不好用的手机', '2018-08-17 20:02:43'),
(1, 'vince', '这是一部烂手机', '2018-08-17 20:08:29'),
(8, 'carter', '这部手机非常好用', '2018-08-17 20:13:32'),
(8, 'jordan', '这部手机还可以', '2018-08-17 20:21:48'),
(8, 'dsfgh', '退货问题仍然', '2018-08-18 20:42:08'),
(10, 'wade', '这部手机又贵又不好用', '2018-08-19 18:03:02'),
(1, '蒲经理', '这手机很好用', '2018-08-20 11:30:10');

-- --------------------------------------------------------

--
-- 表的结构 `tp_follow_tie`
--

CREATE TABLE `tp_follow_tie` (
  `id` int(11) NOT NULL,
  `main_tie_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `f_content` varchar(255) NOT NULL,
  `f_time` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `tp_goods`
--

CREATE TABLE `tp_goods` (
  `id` int(11) NOT NULL,
  `g_name` varchar(255) NOT NULL,
  `g_picurl` varchar(255) NOT NULL,
  `g_desc` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `d_price` float NOT NULL,
  `slide_picurl` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tp_goods`
--

INSERT INTO `tp_goods` (`id`, `g_name`, `g_picurl`, `g_desc`, `category_id`, `d_price`, `slide_picurl`, `price`) VALUES
(1, '小米手机', '20180812\\96b43c8bce24b92e287dd57fb988da2c.jpg', '<p>这是非常好用的小米手机</p>', 1, 2999, '["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]', 1999),
(8, 'iPhone8', '20180813\\ab1825e9923a067c0119281fff0f9af0.jpg', '<p>仨个人阿斯钢</p>', 6, 2399, '["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]', 1899),
(7, '红米手机', '20180812\\e868a966dee28d6a9f262ba3f2da56fe.jpg', '<p>这是很好用的垃圾手机</p>', 1, 1088, '["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]', 999),
(9, '小米平板', '20180813\\1d6327fce18fc33e1c01e25be4f44e69.jpg', '<p>爱人文化厅技术人员快吐了</p>', 4, 2389, '["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]', 1789),
(10, 'iPad 迷你4', '20180813\\b57da74cae3eddf1f5308ba72d3d45af.jpg', '<p>非常好用</p>', 7, 999, '["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]', 799),
(11, '华为荣耀A6', '20180813\\58b28bc2a552e2b4acf9aec4d5785ac9.jpg', '<p>sadfhsgjhsadgqergre</p>', 8, 3999, '["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]', 2799),
(12, 'iphoneX', '20180813\\87fd86047c9dd141a7e8d8a3c35fcf84.jpg', '<p>这是一部最新款的苹果手机</p>', 6, 8499, '["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]', 7899),
(18, '小米glaxyS4', '20180813\\30190d46d7ae48747726ca85a507ca9e.jpg', '<p>小米和三星合作的杰作</p>', 4, 3999, '["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]', 2999),
(19, '黑米手机', '20180819\\854f41d7bbfdd4b58d5123062a2c1e4c.jpg', '<p>这种手机那是非常好用</p>', 5, 6999, '["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]', 4999),
(20, '锤子手机', '20180819\\74da347cee86533b5ebe3505df1b75eb.jpg', '<p>这是一款非常新颖的手机</p>', 6, 6988, '["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]', 5988);

-- --------------------------------------------------------

--
-- 表的结构 `tp_goods_attr`
--

CREATE TABLE `tp_goods_attr` (
  `id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `spec_option_id` varchar(255) NOT NULL,
  `sku` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tp_goods_attr`
--

INSERT INTO `tp_goods_attr` (`id`, `good_id`, `spec_option_id`, `sku`, `price`) VALUES
(1, 9, '1|3', 100, 2699),
(2, 9, '1|4', 80, 2699),
(3, 9, '2|3', 70, 1699),
(4, 9, '2|4', 110, 1699),
(5, 18, '1|3', 100, 9999),
(6, 18, '1|4', 45, 9999),
(7, 18, '2|4', 52, 8888),
(8, 18, '2|3', 23, 8888),
(9, 19, '1|3', 189, 5599),
(10, 19, '1|4', 200, 5099),
(11, 20, '1|4', 56, 6086),
(12, 20, '2|4', 55, 6000),
(13, 20, '2|3', 23, 5888);

-- --------------------------------------------------------

--
-- 表的结构 `tp_goods_spec`
--

CREATE TABLE `tp_goods_spec` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(255) NOT NULL,
  `spec_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tp_goods_spec`
--

INSERT INTO `tp_goods_spec` (`id`, `cate_name`, `spec_name`) VALUES
(1, '手机', '版本'),
(2, '手机', '颜色');

-- --------------------------------------------------------

--
-- 表的结构 `tp_goods_spec_option`
--

CREATE TABLE `tp_goods_spec_option` (
  `id` int(11) NOT NULL,
  `spec_id` int(11) NOT NULL,
  `attr_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tp_goods_spec_option`
--

INSERT INTO `tp_goods_spec_option` (`id`, `spec_id`, `attr_name`) VALUES
(1, 1, '6G'),
(2, 1, '4G'),
(3, 2, '黄色'),
(4, 2, '红色');

-- --------------------------------------------------------

--
-- 表的结构 `tp_main_tie`
--

CREATE TABLE `tp_main_tie` (
  `id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `b_title` varchar(255) NOT NULL,
  `b_content` varchar(255) NOT NULL,
  `b_time` varchar(255) NOT NULL,
  `b_picurl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `tp_order`
--

CREATE TABLE `tp_order` (
  `id` int(11) NOT NULL,
  `order_sn` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `sum_num` int(11) NOT NULL,
  `sum_price` float NOT NULL,
  `status` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tp_order`
--

INSERT INTO `tp_order` (`id`, `order_sn`, `uid`, `sum_num`, `sum_price`, `status`, `time`) VALUES
(15, 1534736244, 79, 7, 28460, '已付款', '2018年08月20日 11:37:24'),
(14, 1534736176, 42, 7, 28460, '已付款', '2018年08月20日 11:36:16'),
(13, 1534729709, 2, 9, 28269, '已付款', '2018年08月20日 09:48:29'),
(12, 1534729702, 34, 9, 28269, '已付款', '2018年08月20日 09:48:22'),
(9, 1534727229, 92, 7, 23671, '已付款', '2018年08月20日 09:07:09'),
(10, 1534727332, 95, 7, 23671, '已付款', '2018年08月20日 09:08:52'),
(11, 1534727350, 61, 7, 23671, '已付款', '2018年08月20日 09:09:10');

-- --------------------------------------------------------

--
-- 表的结构 `tp_tie_user`
--

CREATE TABLE `tp_tie_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `touxiang` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `tp_user`
--

CREATE TABLE `tp_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tp_user`
--

INSERT INTO `tp_user` (`id`, `name`, `password`, `time`) VALUES
(1, '陈庆国', '123456', '2018-8-11'),
(13, '蒲', '456789', '2018-08-20 11:34:28'),
(12, '奥源', '123456', '2018-08-19 21:15:18'),
(11, 'vince', '68994667', '2018-08-17 15:42:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tp_address`
--
ALTER TABLE `tp_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_cart`
--
ALTER TABLE `tp_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_category`
--
ALTER TABLE `tp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_follow_tie`
--
ALTER TABLE `tp_follow_tie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_goods`
--
ALTER TABLE `tp_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_goods_attr`
--
ALTER TABLE `tp_goods_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_goods_spec`
--
ALTER TABLE `tp_goods_spec`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_goods_spec_option`
--
ALTER TABLE `tp_goods_spec_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_main_tie`
--
ALTER TABLE `tp_main_tie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_order`
--
ALTER TABLE `tp_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_tie_user`
--
ALTER TABLE `tp_tie_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_user`
--
ALTER TABLE `tp_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tp_address`
--
ALTER TABLE `tp_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `tp_cart`
--
ALTER TABLE `tp_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `tp_category`
--
ALTER TABLE `tp_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `tp_follow_tie`
--
ALTER TABLE `tp_follow_tie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tp_goods`
--
ALTER TABLE `tp_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `tp_goods_attr`
--
ALTER TABLE `tp_goods_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `tp_goods_spec`
--
ALTER TABLE `tp_goods_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tp_goods_spec_option`
--
ALTER TABLE `tp_goods_spec_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `tp_main_tie`
--
ALTER TABLE `tp_main_tie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tp_order`
--
ALTER TABLE `tp_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `tp_tie_user`
--
ALTER TABLE `tp_tie_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tp_user`
--
ALTER TABLE `tp_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
