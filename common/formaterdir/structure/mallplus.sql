use `mallplus`;


--
-- Table structure for table `cms_brand_story`
--

DROP TABLE IF EXISTS `cms_brand_story`;


CREATE TABLE `cms_brand_story` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_id` bigint NOT NULL COMMENT '组织ID',
  `brand_id` bigint NOT NULL COMMENT '品牌ID',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `sys_user_name` varchar(64) NOT NULL COMMENT '管理员—操作用户',
  `sys_user_id` bigint DEFAULT NULL COMMENT '管理员用户id',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态:-1-删除,0-启用,1-禁用',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  `verify_status` int DEFAULT '0' COMMENT '店铺状态:0-审核中,1-正常，2-关闭,3-审核不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 ROW_FORMAT=DYNAMIC COMMENT='品牌故事';


--
-- Table structure for table `cms_favorite`
--

DROP TABLE IF EXISTS `cms_favorite`;


CREATE TABLE `cms_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `type` int NOT NULL COMMENT '1 商品 2 文章 3 店铺 4 评论',
  `obj_id` bigint DEFAULT NULL COMMENT '关联的id',
  `store_id` bigint DEFAULT NULL,
  `member_id` bigint DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) DEFAULT NULL,
  `meno1` varchar(255) DEFAULT NULL,
  `meno2` varchar(255) DEFAULT NULL,
  `meno3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKAFC41E93339519D2` (`obj_id`) USING BTREE,
  KEY `FKAFC41E931E208F02` (`member_id`) USING BTREE,
  KEY `FKAFC41E931C0CA9F2` (`store_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='收藏表';


--
-- Table structure for table `cms_help`
--

DROP TABLE IF EXISTS `cms_help`;


CREATE TABLE `cms_help` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL COMMENT '类别',
  `icon` varchar(500) DEFAULT NULL COMMENT '图片',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `show_status` int DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `read_count` int DEFAULT '0' COMMENT '点击量',
  `content` mediumtext COMMENT '内容',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `sort` int DEFAULT NULL COMMENT '排序',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名称',
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  `verify_status` int DEFAULT '0' COMMENT '店铺状态:0-审核中,1-正常，2-关闭,3-审核不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 ROW_FORMAT=DYNAMIC COMMENT='帮助表';


--
-- Table structure for table `cms_help_category`
--

DROP TABLE IF EXISTS `cms_help_category`;


CREATE TABLE `cms_help_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `help_count` int DEFAULT '0' COMMENT '专题数量',
  `show_status` int DEFAULT NULL COMMENT '状态',
  `sort` int DEFAULT NULL COMMENT '排序',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 ROW_FORMAT=DYNAMIC COMMENT='帮助分类表';


--
-- Table structure for table `cms_member_notice`
--

DROP TABLE IF EXISTS `cms_member_notice`;


CREATE TABLE `cms_member_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `org_id` bigint NOT NULL COMMENT '组织ID',
  `brand_id` bigint NOT NULL COMMENT '品牌ID',
  `code` varchar(20) DEFAULT NULL COMMENT '随机码',
  `title` varchar(40) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  `sys_user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `sys_user_name` varchar(40) DEFAULT NULL COMMENT '操作用户名',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态:-1-删除,0-启用,1-禁用',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  `verify_status` int DEFAULT '0' COMMENT '店铺状态:0-审核中,1-正常，2-关闭,3-审核不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 ROW_FORMAT=DYNAMIC COMMENT='会员须知';


--
-- Table structure for table `cms_shop_banner`
--

DROP TABLE IF EXISTS `cms_shop_banner`;


CREATE TABLE `cms_shop_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `store_id` bigint DEFAULT NULL COMMENT '店铺iD',
  `biz_type` int DEFAULT NULL COMMENT '业务类型:10-banner图,21-我的配图,22-帮助配图,23-订单配图,24-地址配图',
  `title` varchar(40) DEFAULT NULL COMMENT '标题',
  `pic_url` varchar(256) DEFAULT NULL COMMENT '图片地址',
  `link_type` int DEFAULT '0' COMMENT '跳转类型:0 表示无跳转、1 活动、2 精彩回顾、3 新闻、4 新鲜事、5 咨询、6 直播、7 网页',
  `link_url` varchar(300) DEFAULT NULL COMMENT '跳转链接',
  `source_type` int DEFAULT '1' COMMENT '资源类型:1-图片，2-视频',
  `app_type` int DEFAULT NULL COMMENT '平台:1-app,2-PC',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态:-1-删除;0-正常;1-禁用',
  `sys_user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `sys_user_name` varchar(40) DEFAULT NULL COMMENT '用户名称',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `first_pic_path` varchar(255) DEFAULT '' COMMENT '视频第一帧图片',
  `content_id` varchar(32) DEFAULT NULL COMMENT '审核ID',
  `verify_status` tinyint(1) DEFAULT NULL COMMENT '审核状态:0-审核中,1-审核通过,2-审核驳回',
  `audit_type` tinyint DEFAULT '2' COMMENT '审核类型1：添加，2：修改：3：删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 ROW_FORMAT=DYNAMIC COMMENT='图片管理';


--
-- Table structure for table `cms_subject`
--

DROP TABLE IF EXISTS `cms_subject`;


CREATE TABLE `cms_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL COMMENT '分类',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `pic` varchar(500) DEFAULT NULL COMMENT '专题主图',
  `product_count` int DEFAULT '0' COMMENT '关联产品数量',
  `recommend_status` int DEFAULT '0' COMMENT '推荐',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `collect_count` int DEFAULT '0' COMMENT '收藏量',
  `read_count` int DEFAULT '0' COMMENT '点击量',
  `comment_count` int DEFAULT '0' COMMENT '评论量',
  `album_pics` mediumtext COMMENT '画册图片用逗号分割',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `subtitle` varchar(100) DEFAULT '',
  `show_status` int DEFAULT '0' COMMENT '显示状态：0->不显示；1->显示',
  `content` longtext COMMENT '内容',
  `forward_count` int DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) DEFAULT NULL COMMENT '专题分类名称',
  `area_id` bigint DEFAULT NULL,
  `member_id` bigint DEFAULT NULL,
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `area_name` varchar(255) DEFAULT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `video_src` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `company_id` bigint DEFAULT NULL COMMENT '企业ID,关联外部组织企业表',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='专题表';


--
-- Table structure for table `cms_subject_category`
--

DROP TABLE IF EXISTS `cms_subject_category`;


CREATE TABLE `cms_subject_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '标题',
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `subject_count` int DEFAULT '0' COMMENT '专题数量',
  `show_status` int DEFAULT NULL COMMENT '状态',
  `sort` int DEFAULT NULL COMMENT '排序',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `company_id` bigint DEFAULT NULL COMMENT '公司ID(品牌所创建企业）',
  `company_name` varchar(128) DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='专题分类表';


--
-- Table structure for table `cms_subject_product_relation`
--

DROP TABLE IF EXISTS `cms_subject_product_relation`;


CREATE TABLE `cms_subject_product_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `create_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间，新加',
  `update_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，新加',
  `sort` int DEFAULT NULL COMMENT '排序：1-升序，2-降序，新加',
  `status` int DEFAULT NULL COMMENT '1-启用; 2-禁用，新加',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='专题商品关系表';


--
-- Table structure for table `finance_check`
--

DROP TABLE IF EXISTS `finance_check`;


CREATE TABLE `finance_check` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `settlement_id` bigint DEFAULT NULL COMMENT '结算id',
  `total_order_amount` decimal(11,2) DEFAULT NULL,
  `total_pay_amount` decimal(11,2) DEFAULT NULL,
  `total_discount_amount` decimal(11,2) DEFAULT NULL,
  `total_refund_amount` decimal(11,2) DEFAULT NULL,
  `total_settle_amount` decimal(11,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `store_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='对账单表';


--
-- Table structure for table `finance_check_account`
--

DROP TABLE IF EXISTS `finance_check_account`;


CREATE TABLE `finance_check_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `check_id` bigint DEFAULT NULL COMMENT '结算id',
  `order_sn` varchar(40) DEFAULT NULL COMMENT '订单编号',
  `date_str` varchar(40) DEFAULT NULL COMMENT '订单日期',
  `member_id` int DEFAULT NULL,
  `member_name` varchar(30) DEFAULT NULL COMMENT '用户账号',
  `order_amount` decimal(11,2) DEFAULT NULL COMMENT '订单金额',
  `pay_amount` decimal(11,2) DEFAULT NULL COMMENT '实付金额',
  `discount_amount` decimal(11,2) DEFAULT NULL COMMENT '优惠金额',
  `refund_amount` decimal(11,2) DEFAULT NULL COMMENT '退款金额',
  `settle_amount` decimal(11,2) DEFAULT NULL COMMENT '对账单金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `store_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='对账单订单详情表';


--
-- Table structure for table `finance_order_statistic`
--

DROP TABLE IF EXISTS `finance_order_statistic`;


CREATE TABLE `finance_order_statistic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_str` varchar(20) DEFAULT NULL COMMENT '时间',
  `pay_order_num` int DEFAULT NULL COMMENT '支付订单数',
  `order_amount` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `refund_amount` decimal(11,2) DEFAULT NULL COMMENT '退款金额',
  `pay_amount` decimal(11,2) DEFAULT NULL COMMENT '支付金额',
  `transaction_user_num` int DEFAULT NULL COMMENT '成交用户数',
  `refund_order_num` int DEFAULT NULL COMMENT '退款订单数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `store_id` bigint DEFAULT NULL COMMENT '商家id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='对账订单统计表';


--
-- Table structure for table `finance_settlement`
--

DROP TABLE IF EXISTS `finance_settlement`;


CREATE TABLE `finance_settlement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `settlement_sn` varchar(40) DEFAULT NULL COMMENT '结算编号',
  `check_id` bigint DEFAULT NULL COMMENT '对账单',
  `start_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结算开始时间',
  `end_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结算结束时间',
  `status` int DEFAULT NULL COMMENT '结算状态：0 待确认   1已确认  2已结算',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '结算金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `name` varchar(40) DEFAULT NULL COMMENT '对账单名称',
  `store_id` bigint DEFAULT NULL COMMENT '商家id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='对账商家结算表';


--
-- Table structure for table `home_focus`
--

DROP TABLE IF EXISTS `home_focus`;


CREATE TABLE `home_focus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `focus_type` tinyint DEFAULT NULL COMMENT '焦点类型:1图片,2视频',
  `title` varchar(300) NOT NULL COMMENT '标题',
  `sub_title` varchar(300) DEFAULT NULL COMMENT '副标题',
  `topic_id` varchar(45) DEFAULT NULL COMMENT '专题跳转id',
  `cover` varchar(500) DEFAULT NULL COMMENT '封面',
  `video_path` varchar(500) DEFAULT NULL COMMENT '视频路径',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 ROW_FORMAT=DYNAMIC COMMENT='主页焦点图';


--
-- Table structure for table `home_focus_rel`
--

DROP TABLE IF EXISTS `home_focus_rel`;


CREATE TABLE `home_focus_rel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` bigint DEFAULT NULL COMMENT '焦点设置id',
  `fid` bigint DEFAULT NULL COMMENT '焦点id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=166 ROW_FORMAT=DYNAMIC COMMENT='焦点图设置与焦点元素中间表';


--
-- Table structure for table `home_focus_setting`
--

DROP TABLE IF EXISTS `home_focus_setting`;


CREATE TABLE `home_focus_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `focus_type` tinyint DEFAULT NULL COMMENT '1.表示图片轮播2.表示视频模式',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  `hp_id` bigint DEFAULT NULL COMMENT '主页设置id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 ROW_FORMAT=DYNAMIC COMMENT='主页焦点图设置';


--
-- Table structure for table `home_footer_jump`
--

DROP TABLE IF EXISTS `home_footer_jump`;


CREATE TABLE `home_footer_jump` (
  `id` int NOT NULL,
  `model` varchar(500) DEFAULT NULL COMMENT '模块名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='页脚跳转';


--
-- Table structure for table `home_footer_settings`
--

DROP TABLE IF EXISTS `home_footer_settings`;


CREATE TABLE `home_footer_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hp_id` bigint DEFAULT NULL COMMENT '主页设置的id',
  `ftype` tinyint DEFAULT NULL COMMENT '设置类型：1文字,2 图片',
  `logo_path` varchar(500) DEFAULT NULL COMMENT 'logo的路径(文字类型才有)',
  `content1` varchar(45) DEFAULT NULL COMMENT '内容1(文字类型才有)',
  `content2` varchar(45) DEFAULT NULL COMMENT '内容2(文字类型才有)',
  `content3` varchar(45) DEFAULT NULL COMMENT '内容3(文字类型才有)',
  `bold1` tinyint(1) DEFAULT '0' COMMENT '内容1是否加粗：0 不加1 加粗（文字模式才有）',
  `bold2` tinyint(1) DEFAULT '0' COMMENT '内容2是否加粗：0 不加1 加粗（文字模式才有）',
  `bold3` tinyint(1) DEFAULT '0' COMMENT '内容3是否加粗：0 不加1 加粗（文字模式才有）',
  `underline1` tinyint(1) DEFAULT NULL COMMENT '内容3是否加下划线：0 不加1 加粗（文字模式才有）',
  `underline2` tinyint(1) DEFAULT NULL COMMENT '内容3是否加下划线：0 不加1 加粗（文字模式才有）',
  `underline3` tinyint(1) DEFAULT NULL COMMENT '内容3是否加下划线：0 不加1 加粗（文字模式才有）',
  `jtype1` tinyint DEFAULT NULL COMMENT '内容1的跳转类型：1 首页2商品分类3专题列表4搜索5帮助与服务',
  `jtype2` tinyint DEFAULT NULL COMMENT '内容2的跳转类型：1 首页2商品分类3专题列表4搜索5帮助与服务',
  `jtype3` tinyint DEFAULT NULL COMMENT '内容3的跳转类型：1 首页2商品分类3专题列表4搜索5帮助与服务',
  `pj_type` tinyint DEFAULT NULL COMMENT '图片模式跳转链接',
  `pic` varchar(1000) DEFAULT NULL COMMENT '图片路劲(图片模式有)',
  `status` tinyint DEFAULT '1' COMMENT '状态:1已保存,2已发布',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 ROW_FORMAT=DYNAMIC COMMENT='首页页脚设置';


--
-- Table structure for table `home_guide_settings`
--

DROP TABLE IF EXISTS `home_guide_settings`;


CREATE TABLE `home_guide_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stype` tinyint DEFAULT NULL COMMENT '1.系统预置2.自定义',
  `hp_id` bigint DEFAULT NULL COMMENT '主页设置id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 ROW_FORMAT=DYNAMIC COMMENT='首页-导购设置';


--
-- Table structure for table `home_guide_settings_category1`
--

DROP TABLE IF EXISTS `home_guide_settings_category1`;


CREATE TABLE `home_guide_settings_category1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '一级分类id',
  `sid` bigint DEFAULT NULL COMMENT '导购区设置id',
  `name` varchar(45) DEFAULT NULL COMMENT '一级分类名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  `order_num` int DEFAULT NULL COMMENT '排序字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 ROW_FORMAT=DYNAMIC COMMENT='首页-导购区自定义设置一级分类';


--
-- Table structure for table `home_guide_settings_category2`
--

DROP TABLE IF EXISTS `home_guide_settings_category2`;


CREATE TABLE `home_guide_settings_category2` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '二级分类id',
  `c1_id` bigint NOT NULL COMMENT '一级分类id',
  `name` varchar(45) NOT NULL COMMENT '分来名称',
  `gc_id` int DEFAULT NULL COMMENT '商品分类id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  `order_num` int DEFAULT '0' COMMENT '数字越小排序越靠前',
  `pic` varchar(500) DEFAULT NULL COMMENT '配图',
  `gc_id_string` varchar(200) DEFAULT NULL COMMENT 'gc_id的全路径模式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 ROW_FORMAT=DYNAMIC COMMENT='首页导购区分类二级设置';


--
-- Table structure for table `home_guide_settings_recommend`
--

DROP TABLE IF EXISTS `home_guide_settings_recommend`;


CREATE TABLE `home_guide_settings_recommend` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hgc_id` bigint DEFAULT NULL COMMENT '导购设置id',
  `c1_id` varchar(45) DEFAULT NULL COMMENT '商品分类一级分类id',
  `gid` bigint NOT NULL COMMENT '关联的商品id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=139 ROW_FORMAT=DYNAMIC COMMENT='首页导购区自定义设置-推荐商品';


--
-- Table structure for table `home_page`
--

DROP TABLE IF EXISTS `home_page`;


CREATE TABLE `home_page` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '首页设置id',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  `operation` varchar(255) DEFAULT NULL COMMENT '标识审核状态：发布、删除',
  `name` varchar(45) DEFAULT NULL COMMENT '模板名称',
  `default_topic_num` int DEFAULT '0' COMMENT '默认专题个数',
  `max_topic_num` int DEFAULT '0' COMMENT '最大专题个数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publish_status` int DEFAULT '1' COMMENT '首页设置 发布状态：1已保存未发布,2是已发布',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  `brand_name` varchar(45) DEFAULT NULL COMMENT '品牌名称',
  `audit_status` int DEFAULT '1' COMMENT '审核状态:1发布待审核，2，发布审核中，3发布审核通过，4发布审核不通过，5删除审核中，6删除审核不通过，7删除审核通过，8，更新已保存，9更新审核中，10更新审核不通过，11更新审核通过',
  `audit_id` varchar(45) DEFAULT NULL COMMENT '审核id',
  `update_content` text COMMENT '更新暂存内容',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 ROW_FORMAT=DYNAMIC COMMENT='首页设置';


--
-- Table structure for table `home_page_store`
--

DROP TABLE IF EXISTS `home_page_store`;


CREATE TABLE `home_page_store` (
  `id` bigint NOT NULL,
  `store_id` bigint DEFAULT NULL COMMENT '店铺id',
  `hp_id` bigint DEFAULT NULL COMMENT '主页模板id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0使用 1删除',
  `status` int DEFAULT '1' COMMENT '使用状态 : 0禁用,1使用,2设置未刷新,3设置已刷新',
  `front_display` tinyint(1) DEFAULT '0' COMMENT 'app端是否显示',
  `backend_display` tinyint(1) DEFAULT '1' COMMENT '管理平台是否显示',
  `audit_status` int DEFAULT '1' COMMENT '审核状态：审核状态:1待审核，2，审核中，3审核通过，4审核不通过，5删除审核中，6删除审核通过',
  `audit_id` varchar(45) DEFAULT NULL COMMENT '审核id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='首页设置模板-门店';


--
-- Table structure for table `home_page_store_refresh`
--

DROP TABLE IF EXISTS `home_page_store_refresh`;


CREATE TABLE `home_page_store_refresh` (
  `id` bigint NOT NULL,
  `audit_status` int DEFAULT NULL COMMENT '审核状态：1待审核，2，审核中，3审核通过，4审核不通过',
  `user_id` bigint DEFAULT NULL COMMENT '人员id',
  `user_name` varchar(45) DEFAULT NULL COMMENT '用户名称',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `store_id` bigint DEFAULT NULL COMMENT '店铺id',
  `audit_id` varchar(100) DEFAULT NULL COMMENT '审核id',
  `hp_id` bigint DEFAULT NULL COMMENT '主页模板id',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `store_id_UNIQUE` (`store_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='主页管理刷新';


--
-- Table structure for table `home_slogan`
--

DROP TABLE IF EXISTS `home_slogan`;


CREATE TABLE `home_slogan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stype` int DEFAULT NULL COMMENT '类型1.文字2图片',
  `hp_id` bigint DEFAULT NULL COMMENT '主页配置id',
  `p1` varchar(45) DEFAULT NULL COMMENT '第一部分',
  `p2` varchar(45) DEFAULT NULL COMMENT '第二部分',
  `pic_path` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='首页-导购标语设置';


--
-- Table structure for table `home_title_settings`
--

DROP TABLE IF EXISTS `home_title_settings`;


CREATE TABLE `home_title_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_id` bigint NOT NULL COMMENT '品牌ID',
  `org_id` bigint NOT NULL COMMENT '所属企业id',
  `background_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '背景类型：1-纯色 2-图片',
  `background_content` varchar(255) DEFAULT '' COMMENT '背景内容：纯色为色号，图片为图片路径',
  `text_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '字体颜色：1-黑色 2-白色',
  `is_title_logo` tinyint(1) DEFAULT '0' COMMENT '0-关闭标题logo 1-标题为logo',
  `logo_pic` varchar(255) DEFAULT '' COMMENT 'logo图片路径',
  `logo_used` varchar(16) DEFAULT '0' COMMENT 'logo使用页面，多选#隔开(1#2#3)：1-首页 2-商品分类页 3-商品详情页 4-专题列表页 5-专题详情页',
  `publish_status` tinyint(1) DEFAULT '0' COMMENT '发布状态:：0-未发布 1-已发布',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 ROW_FORMAT=DYNAMIC COMMENT='首页标题设置';


--
-- Table structure for table `invoice_record`
--

DROP TABLE IF EXISTS `invoice_record`;


CREATE TABLE `invoice_record` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL COMMENT '发票抬头',
  `code` varchar(30) DEFAULT NULL COMMENT '发票税号',
  `frequency` mediumint unsigned DEFAULT '1' COMMENT '被使用次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='发票信息记录';


--
-- Table structure for table `oms_cart_item`
--

DROP TABLE IF EXISTS `oms_cart_item`;


CREATE TABLE `oms_cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单商品ID',
  `product_id` bigint DEFAULT NULL COMMENT '商品id',
  `product_sku_id` bigint DEFAULT NULL COMMENT '商品库存id',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `quantity` int DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '添加到购物车的价格(原价)',
  `present_price` decimal(10,2) DEFAULT NULL COMMENT '现在的价格(现价)',
  `product_pic` varchar(1000) DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) DEFAULT NULL COMMENT '商品副标题（卖点）',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_status` int DEFAULT '0' COMMENT '是否删除:0 删除  1未删除',
  `show_status` int DEFAULT '0' COMMENT '是否显示:0 显示  1不显示',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `store_name` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=860 ROW_FORMAT=DYNAMIC COMMENT='订单-购物车表';


--
-- Table structure for table `oms_express_company`
--

DROP TABLE IF EXISTS `oms_express_company`;


CREATE TABLE `oms_express_company` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `express` varchar(255) NOT NULL COMMENT '物流公司',
  `com_code` varchar(255) NOT NULL COMMENT '物流编号',
  `type` int NOT NULL DEFAULT '1' COMMENT '快递类型：1 : 国内快递 2:国际快递',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除状态：0 : 未删除 1: 已删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=471 ROW_FORMAT=DYNAMIC COMMENT='订单-物流公司信息表';


--
-- Table structure for table `oms_express_info`
--

DROP TABLE IF EXISTS `oms_express_info`;


CREATE TABLE `oms_express_info` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int unsigned DEFAULT NULL,
  `EXPRESS_CORP_ID` varchar(32) DEFAULT NULL COMMENT '物流公司编码',
  `EXPRESS_NO` varchar(32) DEFAULT NULL COMMENT '运单号',
  `EXPRESS_STATUS` tinyint DEFAULT NULL COMMENT '运单状态0.初始化 1.已发货 2 已签收',
  `EXPRESS_DETAIL` longtext COMMENT '物流详情',
  `UPDATE_TIME` datetime NOT NULL COMMENT '更新时间',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `IDX_EXPRESS_INFO_ORDER_ID` (`ORDER_ID`) USING BTREE,
  KEY `IDX_EXPRESS_INFO_UPDATETIME` (`UPDATE_TIME`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='物流信息表';


--
-- Table structure for table `oms_express_info_recording`
--

DROP TABLE IF EXISTS `oms_express_info_recording`;


CREATE TABLE `oms_express_info_recording` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` bigint DEFAULT NULL COMMENT '所属店铺',
  `order_id` bigint NOT NULL COMMENT '订单号',
  `express_comp_code` varchar(32) NOT NULL COMMENT '物流公司编码',
  `express_no` varchar(32) NOT NULL COMMENT '运单号',
  `express_status` tinyint NOT NULL DEFAULT '0' COMMENT '运单状态0.初始化 1.已发货 2 已签收',
  `express_detail` mediumtext NOT NULL COMMENT '物流详情',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_EXPRESS_INFO_ORDER_ID` (`order_id`) USING BTREE,
  KEY `IDX_EXPRESS_INFO_UPDATETIME` (`update_time`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='订单-物流信息表';


--
-- Table structure for table `oms_order`
--

DROP TABLE IF EXISTS `oms_order`;


CREATE TABLE `oms_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `discount_num` decimal(10,2) DEFAULT NULL COMMENT '折扣数',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '应付金额=订单总金额-运费金额-优惠券抵扣金额',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '折扣金额',
  `pay_type` int DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int DEFAULT NULL COMMENT '订单来源：0->PC订单；2->app订单',
  `status` int DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货(已付款)；2->已发货(待收货)；3->已完成(已收货)；4->已关闭(订单超时未支付)；5->无效订单',
  `order_type` int DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司',
  `outbound_sn` varchar(255) DEFAULT NULL COMMENT '出库单号(方便对账单对账)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `delivery_company_code` varchar(30) DEFAULT NULL COMMENT '物流公司（配送方式）编码',
  `receive_time` datetime DEFAULT NULL COMMENT '收货人-确认收货时间',
  `receiver_id` bigint DEFAULT NULL COMMENT '公域买家收货地址id(公域数据可能会删除)',
  `note` varchar(500) DEFAULT NULL COMMENT '买家备注',
  `confirm_status` int DEFAULT '0' COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int NOT NULL DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间(无效字段)',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间(无效字段)',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `store_name` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  `check_man` varchar(40) DEFAULT NULL COMMENT '对账人员(无效字段)',
  `check_time` datetime DEFAULT NULL COMMENT '对账时间(无效字段)',
  `check_status` int DEFAULT '0' COMMENT '对账状态：0 未对账  1已对账  2异常(无效字段)',
  `total_num` int DEFAULT NULL COMMENT '商品总数量',
  `try_query_count` int DEFAULT '0' COMMENT '订单查询重试次数',
  `name` varchar(100) DEFAULT NULL COMMENT '收货人姓名',
  `phone_number` varchar(64) DEFAULT NULL COMMENT '收货人手机号',
  `post_code` varchar(100) DEFAULT NULL COMMENT '收货人邮政编码',
  `province` varchar(100) DEFAULT NULL COMMENT '收货人省份/直辖市',
  `city` varchar(100) DEFAULT NULL COMMENT '收货人城市',
  `region` varchar(100) DEFAULT NULL COMMENT '收货人区',
  `detail_address` varchar(128) DEFAULT NULL COMMENT '收货人详细地址(街道)',
  `normal_order_overtime` bigint DEFAULT NULL COMMENT '订单超时过期时间戳',
  `enable_invoice` int DEFAULT '0' COMMENT '是否开具发票： 0-不开具 1-开具',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=788 ROW_FORMAT=DYNAMIC COMMENT='订单表';


--
-- Table structure for table `oms_order_invoice`
--

DROP TABLE IF EXISTS `oms_order_invoice`;


CREATE TABLE `oms_order_invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单发票表id',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `order_id` bigint DEFAULT NULL COMMENT '订单ID',
  `type` int DEFAULT '0' COMMENT '发票类型：0- 电子普通发票',
  `content` varchar(200) DEFAULT '明细' COMMENT '发票内容：明细',
  `invoice_type` int DEFAULT NULL COMMENT '发票抬头类型：0-个人  1-企业',
  `invoice_email` varchar(64) DEFAULT NULL COMMENT '发票-收票人邮箱',
  `name` varchar(60) DEFAULT NULL COMMENT '发票-抬头姓名（个人）',
  `company` varchar(200) DEFAULT NULL COMMENT '发票-抬头企业名称（企业）',
  `credit_code` varchar(100) DEFAULT NULL COMMENT '企业信用代码（发票抬头纳税号）',
  `enable` int DEFAULT NULL COMMENT '开票状态：0-未开票 1-已开票',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 ROW_FORMAT=DYNAMIC COMMENT='订单发票表';


--
-- Table structure for table `oms_order_item`
--

DROP TABLE IF EXISTS `oms_order_item`;


CREATE TABLE `oms_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单商品ID',
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `product_id` bigint DEFAULT NULL COMMENT '商品id',
  `product_pic` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售单价',
  `product_quantity` int DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint DEFAULT NULL COMMENT '商品库存Id',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '折扣总金额',
  `pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '应付金额=商品总金额-折扣总金额',
  `store_id` bigint DEFAULT NULL COMMENT '所属店铺',
  `store_name` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  `status` int DEFAULT NULL COMMENT '订单商品状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `discount_num` decimal(10,2) DEFAULT NULL COMMENT '折扣数',
  `sale_status` tinyint DEFAULT '-1' COMMENT '售后状态：-1 无效状态 0->待审核；1->退货成功；2->退货失败；3->已取消',
  `return_id` bigint DEFAULT NULL COMMENT '最近一次退货ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `product_sku_id` (`product_sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=842 ROW_FORMAT=DYNAMIC COMMENT='订单商品表';


--
-- Table structure for table `oms_order_operate_history`
--

DROP TABLE IF EXISTS `oms_order_operate_history`;


CREATE TABLE `oms_order_operate_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` int DEFAULT NULL COMMENT '现状态(订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单)',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `pre_status` int DEFAULT NULL COMMENT '原状态(订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1032 ROW_FORMAT=DYNAMIC COMMENT='订单操作历史记录';


--
-- Table structure for table `oms_order_remind_ship`
--

DROP TABLE IF EXISTS `oms_order_remind_ship`;


CREATE TABLE `oms_order_remind_ship` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `is_delete` int DEFAULT NULL COMMENT '删除状态：0 未删除  1已删除',
  `create_time` datetime DEFAULT NULL COMMENT '提醒时间',
  `store_id` bigint DEFAULT NULL COMMENT '店铺id',
  `is_ship` int DEFAULT NULL COMMENT '发货状态：0 未发货   1已发货',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `count` int DEFAULT NULL COMMENT '提醒次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 ROW_FORMAT=DYNAMIC COMMENT='订单提醒发货记录表';


--
-- Table structure for table `oms_order_return_apply`
--

DROP TABLE IF EXISTS `oms_order_return_apply`;


CREATE TABLE `oms_order_return_apply` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '售后申请ID',
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `order_item_id` bigint DEFAULT NULL COMMENT '订单商品id',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `sale_no` varchar(20) DEFAULT NULL COMMENT '售后编号（15位）',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号(冗余字段)',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额(冗余字段)',
  `pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '实付金额(冗余字段)',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `reason` varchar(30) DEFAULT NULL COMMENT '退货原因',
  `description` varchar(60) DEFAULT NULL COMMENT '退货说明（限制50个字以内）',
  `proof_pics` varchar(500) DEFAULT NULL COMMENT '凭证图片，以逗号隔开（最多上传3张图片）',
  `handle_note` varchar(100) DEFAULT NULL COMMENT '处理备注（限制100个字以内）',
  `sale_type` tinyint DEFAULT NULL COMMENT '售后类型:  1->仅退款；2->退货退款；3->换货',
  `status` tinyint DEFAULT '-1' COMMENT '申请状态：-1 无效状态 0->待审核；1->退货成功；2->退货失败；3->已取消',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `normal_return_overtime` datetime DEFAULT NULL COMMENT '退货处理超时过期时间（逾期未处理，退货系统自动达成）',
  `content_id` varchar(64) DEFAULT NULL COMMENT '审核ID',
  `is_delete` tinyint DEFAULT '0' COMMENT '是否删除：0->未删除 1->已删除',
  `is_auto` tinyint DEFAULT '0' COMMENT '是否自动退货成功：0->否  1->是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_oms_order_return_apply_user_id` (`user_id`),
  KEY `idx_oms_order_return_apply_order_id` (`order_id`),
  KEY `idx_oms_order_return_apply_order_item_id` (`order_item_id`),
  KEY `idx_oms_order_return_apply_create_time` (`create_time`),
  KEY `idx_oms_order_return_apply_normal_return_overtime` (`normal_return_overtime`),
  KEY `idx_oms_order_return_apply_store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 COMMENT='商品退货申请表';


--
-- Table structure for table `oms_order_setting`
--

DROP TABLE IF EXISTS `oms_order_setting`;


CREATE TABLE `oms_order_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `flash_order_overtime` int DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)(暂时不用)',
  `normal_order_overtime` int DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）(暂时不用)',
  `comment_overtime` int DEFAULT NULL COMMENT '订单完成后自动好评时间（天）(暂时不用)',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺(无效字段)',
  `remind_ship_count` int DEFAULT NULL COMMENT '每天提醒发货次数',
  `org_id` bigint DEFAULT NULL COMMENT '企业id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 ROW_FORMAT=DYNAMIC COMMENT='订单设置表';


--
-- Table structure for table `oms_pay_log`
--

DROP TABLE IF EXISTS `oms_pay_log`;


CREATE TABLE `oms_pay_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '支付ID',
  `order_id` varchar(64) DEFAULT NULL COMMENT '订单id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `pay_order_id` varchar(128) DEFAULT NULL COMMENT '支付中心-支付订单号',
  `mch_id` varchar(512) DEFAULT NULL COMMENT '支付中心-商户ID',
  `mch_order_no` varchar(128) DEFAULT NULL COMMENT '支付中心-商户订单号',
  `channel_id` varchar(24) DEFAULT NULL COMMENT '支付中心-渠道ID',
  `amount` bigint DEFAULT NULL COMMENT '支付中心-支付金额,单位分',
  `currency` varchar(10) DEFAULT 'cny' COMMENT '支付中心-三位货币代码,人民币:cny',
  `status` tinyint DEFAULT '0' COMMENT '支付中心-支付状态,0-订单生成,1-支付中(目前未使用),2-支付成功,3-业务处理完成',
  `client_ip` varchar(32) DEFAULT NULL COMMENT '支付中心-客户端IP',
  `device` varchar(64) DEFAULT NULL COMMENT '支付中心-设备',
  `subject` varchar(64) DEFAULT NULL COMMENT '支付中心-商品标题',
  `body` varchar(256) DEFAULT NULL COMMENT '支付中心-商品描述信息',
  `channel_mch_id` varchar(32) DEFAULT NULL COMMENT '支付中心-渠道商户ID',
  `channel_order_no` varchar(64) DEFAULT NULL COMMENT '支付中心-渠道订单号',
  `pay_succ_time` bigint DEFAULT NULL COMMENT '支付中心-订单支付成功时间',
  `channel_account` varchar(128) DEFAULT NULL COMMENT '支付中心-渠道金额',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=632 ROW_FORMAT=DYNAMIC COMMENT='订单支付日志表';


--
-- Table structure for table `oms_payments`
--

DROP TABLE IF EXISTS `oms_payments`;


CREATE TABLE `oms_payments` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '支付类型编码',
  `name` varchar(50) DEFAULT NULL COMMENT '支付类型名称',
  `is_online` tinyint unsigned DEFAULT '1' COMMENT '是否线上支付 1=线上支付 2=线下支付',
  `sort` smallint unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `memo` varchar(200) NOT NULL COMMENT '支付方式描述',
  `status` smallint unsigned NOT NULL DEFAULT '2' COMMENT '启用状态 1=启用 2=停用',
  `paramss` varchar(255) DEFAULT NULL COMMENT '参数',
  `icon` varchar(500) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 ROW_FORMAT=DYNAMIC COMMENT='订单-支付参数设置表';


--
-- Table structure for table `pms_brand`
--

DROP TABLE IF EXISTS `pms_brand`;


CREATE TABLE `pms_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '品牌名称',
  `first_letter` varchar(8) DEFAULT NULL COMMENT '首字母',
  `logo` varchar(255) DEFAULT NULL COMMENT '品牌logo',
  `sort` int DEFAULT NULL,
  `factory_status` int DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `product_count` int DEFAULT NULL COMMENT '产品数量',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '专区大图',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺(旗舰店）',
  `company_id` bigint DEFAULT NULL COMMENT '公司ID(品牌所创建企业）',
  `company_name` varchar(128) DEFAULT NULL COMMENT '公司名称',
  `short_name` varchar(255) DEFAULT NULL COMMENT '品牌简称',
  `status` int DEFAULT NULL COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品品牌表';


--
-- Table structure for table `pms_favorite`
--

DROP TABLE IF EXISTS `pms_favorite`;


CREATE TABLE `pms_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL COMMENT '会员id或用户id',
  `org_id` bigint DEFAULT NULL COMMENT '公司ID(品牌所创建企业）',
  `store_id` bigint DEFAULT NULL COMMENT '店铺id',
  `type` int NOT NULL COMMENT '1 商品 2 文章 3 店铺',
  `obj_id` bigint DEFAULT NULL COMMENT '商品id或文章id或店铺id',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `meno1` varchar(2000) DEFAULT NULL COMMENT '图片',
  `meno2` varchar(255) DEFAULT NULL COMMENT '价格',
  `meno3` varchar(255) DEFAULT NULL COMMENT '销量',
  `status` int DEFAULT NULL COMMENT '状态0表示有效1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKAFC41E93339519D2` (`obj_id`) USING BTREE,
  KEY `FKAFC41E931E208F02` (`member_id`) USING BTREE,
  KEY `FKAFC41E931C0CA9F2` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=829 ROW_FORMAT=DYNAMIC COMMENT='商品收藏表';


--
-- Table structure for table `pms_feight_template`
--

DROP TABLE IF EXISTS `pms_feight_template`;


CREATE TABLE `pms_feight_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '模板名称',
  `charge_type` int DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10,2) DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10,2) DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10,2) DEFAULT NULL COMMENT '续重(kg)',
  `continme_fee` decimal(10,2) DEFAULT NULL COMMENT '续费(元)',
  `dest` varchar(255) DEFAULT NULL COMMENT '目的地（省、市）',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int DEFAULT NULL COMMENT '1-启用;2-禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品运费模版表';


--
-- Table structure for table `pms_feight_template_dest`
--

DROP TABLE IF EXISTS `pms_feight_template_dest`;


CREATE TABLE `pms_feight_template_dest` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `feight_template_id` bigint DEFAULT NULL COMMENT '运费模板id',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `region` varchar(20) DEFAULT NULL COMMENT '区',
  `area_address` json DEFAULT NULL COMMENT '区域地址，[广东省-深圳市，广东省-广州市]',
  `first_weight` decimal(10,2) DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10,2) DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10,2) DEFAULT NULL COMMENT '续重(kg)',
  `continme_fee` decimal(10,2) DEFAULT NULL COMMENT '续费(元)',
  `status` int DEFAULT NULL COMMENT '状态：1-启用；2-禁用',
  `create_dtm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_dtm` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品运费模版目的地表';


--
-- Table structure for table `pms_product`
--

DROP TABLE IF EXISTS `pms_product`;


CREATE TABLE `pms_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  `product_category_id` bigint DEFAULT NULL COMMENT '商品分类id',
  `product_attribute_category_id` bigint DEFAULT NULL COMMENT '商品属性分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `pic` varchar(1000) DEFAULT NULL COMMENT '商品详情主图',
  `product_sn` varchar(64) DEFAULT NULL COMMENT '货号',
  `delete_status` int DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int DEFAULT '0' COMMENT '上架状态：0->无状态；1->上架; 2->下架',
  `publish_time` datetime DEFAULT NULL COMMENT '上架时间',
  `new_status` int DEFAULT '0' COMMENT '新品状态:0->不是新品；1->新品',
  `recommend_status` int DEFAULT '0' COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_time` datetime DEFAULT NULL COMMENT '审核时间',
  `verify_status` int DEFAULT '0' COMMENT '审核状态0表示审核中、1表示审核成功、2表示审核失败',
  `sort` int DEFAULT '0' COMMENT '排序',
  `sale` int DEFAULT '0' COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `description` mediumtext COMMENT '商品描述',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `stock` int DEFAULT '0' COMMENT '库存',
  `low_stock` int DEFAULT '0' COMMENT '库存预警值',
  `unit` varchar(16) DEFAULT NULL COMMENT '单位',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` tinyint DEFAULT '0' COMMENT '广告商品审核状态：0->不是广告商品；1->审核成功；2->审核中',
  `show_pics` varchar(2000) DEFAULT NULL COMMENT '广告商品展示图',
  `discount_status` int DEFAULT '0' COMMENT '是否参与打折 0不参与 1参与',
  `service_ids` varchar(64) DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `note` varchar(255) DEFAULT NULL COMMENT '注释',
  `album_pics` varchar(1000) DEFAULT NULL COMMENT '商品详情图片5张滚动图合集',
  `video_path` varchar(255) DEFAULT NULL COMMENT '商品视频路径',
  `first_pic_path` varchar(255) DEFAULT NULL COMMENT '视频第一帧图片',
  `detail_title` varchar(255) DEFAULT NULL,
  `detail_desc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `detail_html` mediumtext COMMENT '产品详情网页内容',
  `detail_mobile_html` mediumtext COMMENT '移动端网页详情',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) DEFAULT NULL COMMENT '商品分类名称',
  `member_id` bigint DEFAULT NULL COMMENT '会员id、或用户id',
  `hit` int DEFAULT '0' COMMENT '点击量',
  `type` int DEFAULT '0',
  `shipping` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '运费',
  `expire_time` datetime DEFAULT NULL COMMENT '到期时间',
  `share_img` varchar(255) DEFAULT NULL COMMENT '商品分享图片',
  `share_url` varchar(255) DEFAULT NULL COMMENT '分享链接',
  `album_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `org_id` bigint DEFAULT NULL COMMENT '企业id',
  `remarks` varchar(255) DEFAULT NULL COMMENT '商品备注',
  `attributes` varchar(255) NOT NULL DEFAULT '' COMMENT '所有属性集合：1、红色、黑色|2、L、M|3、300ML、500ML',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  `show_video_path` varchar(255) DEFAULT NULL COMMENT '广告商品视频路径',
  `show_first_pic_path` varchar(255) DEFAULT NULL COMMENT '广告商品视频第一帧图片',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_category_id` (`product_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146 ROW_FORMAT=DYNAMIC COMMENT='商品信息';


--
-- Table structure for table `pms_product_attribute`
--

DROP TABLE IF EXISTS `pms_product_attribute`;


CREATE TABLE `pms_product_attribute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `attribute_name` varchar(64) DEFAULT NULL COMMENT '属性名称',
  `select_type` int DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int DEFAULT '0' COMMENT '属性的类型；0->规格；1->参数',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `org_id` bigint DEFAULT NULL COMMENT '企业id',
  `main_attribute` int DEFAULT NULL COMMENT '商品主属性：0-非主属性；1-主属性',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `title` varchar(50) DEFAULT NULL COMMENT '对照标题',
  `remark` text COMMENT '属性对照说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 ROW_FORMAT=DYNAMIC COMMENT='商品属性参数表';


--
-- Table structure for table `pms_product_attribute_category`
--

DROP TABLE IF EXISTS `pms_product_attribute_category`;


CREATE TABLE `pms_product_attribute_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `attr_category_name` varchar(64) DEFAULT NULL COMMENT '属性分类名称',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `pic` varchar(255) DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `product_category_id` bigint DEFAULT NULL COMMENT '商品分类ID,关联pms_product_category',
  `status` int DEFAULT NULL COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 ROW_FORMAT=DYNAMIC COMMENT='商品属性分类表';


--
-- Table structure for table `pms_product_category`
--

DROP TABLE IF EXISTS `pms_product_category`;


CREATE TABLE `pms_product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '上级分类的编号：0表示一级分类',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  `brand_name` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  `category_name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `english_category_name` varchar(64) DEFAULT NULL COMMENT '英文分类名称',
  `banner_img` varchar(255) DEFAULT NULL COMMENT 'banner图',
  `level` int DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int DEFAULT NULL COMMENT '数量',
  `product_unit` varchar(64) DEFAULT NULL COMMENT '单位',
  `nav_status` int DEFAULT '0' COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `index_status` int NOT NULL DEFAULT '0' COMMENT '是否是首页分类0-->不是，1-->是',
  `sort` int DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) DEFAULT NULL,
  `description` mediumtext COMMENT '描述',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `status` int DEFAULT '0' COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `pc_category_img` varchar(255) DEFAULT NULL COMMENT 'pc分类图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 ROW_FORMAT=DYNAMIC COMMENT='商品分类';


--
-- Table structure for table `pms_product_category_attribute_relation`
--

DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;


CREATE TABLE `pms_product_category_attribute_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint DEFAULT NULL COMMENT '商品分类id',
  `product_attribute_id` bigint DEFAULT NULL COMMENT '商品属性id',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `company_id` bigint DEFAULT NULL COMMENT '企业ID',
  `status` int DEFAULT NULL COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品的分类和属性的关系表';


--
-- Table structure for table `pms_product_category_template`
--

DROP TABLE IF EXISTS `pms_product_category_template`;


CREATE TABLE `pms_product_category_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '上级分类的编号：0表示一级分类',
  `category_name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `english_category_name` varchar(64) DEFAULT NULL COMMENT '英文分类名称',
  `banner_img` varchar(255) DEFAULT NULL COMMENT 'banner图',
  `pc_category_img` varchar(255) DEFAULT NULL COMMENT 'pc分类图',
  `level` int DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `nav_status` int DEFAULT '0' COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `index_status` int DEFAULT '0' COMMENT '是否是首页分类0-->不是，1-->是',
  `sort` int DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) DEFAULT NULL,
  `description` mediumtext COMMENT '描述',
  `status` int DEFAULT NULL COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品分类';


--
-- Table structure for table `pms_product_footprint`
--

DROP TABLE IF EXISTS `pms_product_footprint`;


CREATE TABLE `pms_product_footprint` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `member_id` bigint NOT NULL COMMENT '用户id',
  `product_img` varchar(255) NOT NULL COMMENT '商品图片',
  `product_id` bigint NOT NULL COMMENT '商品id',
  `product_name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `company_id` bigint DEFAULT NULL COMMENT '企业ID',
  `status` int NOT NULL COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品足迹信息表';


--
-- Table structure for table `pms_product_relation`
--

DROP TABLE IF EXISTS `pms_product_relation`;


CREATE TABLE `pms_product_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL COMMENT '商品ID',
  `rel_product_id` bigint DEFAULT NULL COMMENT '关联商品ID',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `show_flag` int DEFAULT '0' COMMENT '广告商品标识 0非广告 1广告',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_PID_RELID` (`product_id`,`rel_product_id`,`show_flag`) USING BTREE COMMENT '防止重复关联'
) ENGINE=InnoDB AUTO_INCREMENT=374 ROW_FORMAT=DYNAMIC COMMENT='关联商品表';


--
-- Table structure for table `pms_product_search_keyword`
--

DROP TABLE IF EXISTS `pms_product_search_keyword`;


CREATE TABLE `pms_product_search_keyword` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品搜索记录表';


--
-- Table structure for table `pms_product_service`
--

DROP TABLE IF EXISTS `pms_product_service`;


CREATE TABLE `pms_product_service` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '对应商品表中的server_ids',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺(旗舰店）',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `member_id` bigint DEFAULT NULL COMMENT '会员id或用户id',
  `service_title` varchar(255) NOT NULL COMMENT '服务标题',
  `service_details` varchar(255) NOT NULL COMMENT '服务详情',
  `status` int NOT NULL COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `member_name` varchar(64) DEFAULT NULL COMMENT '发布者名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_TITLE` (`service_title`,`org_id`) USING BTREE COMMENT '防止重名'
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品服务信息表';


--
-- Table structure for table `pms_product_shop`
--

DROP TABLE IF EXISTS `pms_product_shop`;


CREATE TABLE `pms_product_shop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL COMMENT '商品ID',
  `delete_status` int DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int DEFAULT '0' COMMENT '上架状态：0->无状态；1->上架; 2->下架',
  `publish_time` datetime DEFAULT NULL COMMENT '上架时间',
  `recommend_status` int DEFAULT '0' COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_time` datetime DEFAULT NULL COMMENT '审核时间',
  `verify_status` int DEFAULT '0' COMMENT '审核状态0表示审核中、1表示审核成功、2表示审核失败',
  `sort` int DEFAULT '0' COMMENT '排序',
  `sale` int DEFAULT '0' COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `stock` int DEFAULT '0' COMMENT '库存',
  `low_stock` int DEFAULT '0' COMMENT '库存预警值',
  `note` varchar(255) DEFAULT NULL,
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `shipping` decimal(10,0) unsigned NOT NULL DEFAULT '0' COMMENT '运费',
  `expire_time` datetime DEFAULT NULL COMMENT '到期时间',
  `share_img` varchar(255) DEFAULT NULL COMMENT '分享图片',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `org_id` bigint DEFAULT NULL COMMENT '企业id',
  `status` int DEFAULT '0' COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `product_category_id` bigint DEFAULT NULL COMMENT '商品分类ID',
  `content_id` varchar(64) DEFAULT NULL COMMENT '审核ID用来查询审核状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_PID_STOREID` (`product_id`,`store_id`) USING BTREE COMMENT '防止重复提交',
  KEY `IDX_PRODUCT_STORE` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=206 ROW_FORMAT=DYNAMIC COMMENT='店铺商品信息表';


--
-- Table structure for table `pms_product_verify_record`
--

DROP TABLE IF EXISTS `pms_product_verify_record`;


CREATE TABLE `pms_product_verify_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` bigint DEFAULT NULL COMMENT '商品主键id',
  `verify_man` varchar(64) DEFAULT NULL COMMENT '审核人',
  `detail` varchar(255) DEFAULT NULL COMMENT '反馈详情',
  `store_id` bigint DEFAULT '1' COMMENT '所属店铺',
  `company_id` bigint DEFAULT NULL COMMENT '企业ID',
  `status` int DEFAULT NULL COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品审核记录';


--
-- Table structure for table `pms_sku_stock`
--

DROP TABLE IF EXISTS `pms_sku_stock`;


CREATE TABLE `pms_sku_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `sku_code` varchar(32) DEFAULT NULL COMMENT 'sku编码',
  `bar_code` varchar(50) DEFAULT NULL COMMENT '条形码',
  `name` varchar(255) DEFAULT NULL COMMENT '扩展使用用户组合属性',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '原始价格',
  `price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `stock` int DEFAULT '0' COMMENT '库存',
  `low_stock` int DEFAULT '0' COMMENT '预警库存',
  `pic` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `sale` int DEFAULT NULL COMMENT '销量',
  `lock_stock` int DEFAULT '0' COMMENT '锁定库存',
  `product_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `store_id` bigint DEFAULT NULL COMMENT '门店ID',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `sp` varchar(255) DEFAULT NULL COMMENT '销售属性1',
  `status` int DEFAULT '0' COMMENT '状态0表示有效、1表示无效',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_SKUCODE` (`sku_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=317 ROW_FORMAT=DYNAMIC COMMENT='商品库存信息表';


--
-- Table structure for table `pms_sku_stock_store`
--

DROP TABLE IF EXISTS `pms_sku_stock_store`;


CREATE TABLE `pms_sku_stock_store` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sku_id` bigint DEFAULT NULL COMMENT '总表SKU对应ID',
  `store_id` bigint DEFAULT NULL COMMENT '门店ID',
  `product_shop_id` bigint DEFAULT NULL COMMENT '店铺商品ID',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `verify_status` int DEFAULT '0' COMMENT '审核 状态0表示审核中、1表示审核成功、2表示审核失败',
  `publish_status` int DEFAULT '0' COMMENT '发布状态0未发布 1已发布',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '原始价格',
  `price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `stock` int DEFAULT '0' COMMENT '门店库存',
  `content_id` varchar(64) DEFAULT NULL COMMENT '审核ID用来查询审核状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=458 ROW_FORMAT=DYNAMIC COMMENT='商品库存信息表';


--
-- Table structure for table `show_product_workflow`
--

DROP TABLE IF EXISTS `show_product_workflow`;


CREATE TABLE `show_product_workflow` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` bigint DEFAULT NULL COMMENT '商品ID',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `rel_product_id` varchar(128) DEFAULT NULL COMMENT '关联商品ID,多个用逗号隔开',
  `show_pics` varchar(1024) DEFAULT NULL COMMENT '图片，多个逗号隔开',
  `show_first_pic_path` varchar(256) DEFAULT NULL COMMENT '视频第一帧图',
  `show_video_path` varchar(256) DEFAULT NULL COMMENT '视频地址',
  `sort` smallint DEFAULT '0' COMMENT '排序',
  `verify_status` tinyint DEFAULT '0' COMMENT '审核状态0表示审核中、1表示审核成功、2表示审核失败',
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  `audit_type` tinyint DEFAULT '1' COMMENT '审核类型1：添加，2：修改：3：删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id_index` (`product_id`) USING BTREE COMMENT '商品id索引'
) ENGINE=InnoDB AUTO_INCREMENT=27 COMMENT='广告商品审核表';


--
-- Table structure for table `statistic_store_day`
--

DROP TABLE IF EXISTS `statistic_store_day`;


CREATE TABLE `statistic_store_day` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `day_str` varchar(10) DEFAULT NULL COMMENT '日期字符串(2020-11-05)',
  `pay_order_count` int DEFAULT NULL COMMENT '成交订单数',
  `pay_member_count` int DEFAULT NULL COMMENT '成交人数',
  `pay_amount` decimal(20,2) DEFAULT NULL COMMENT '销售金额',
  `member_count` int DEFAULT NULL COMMENT '注册会员数',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `store_id` bigint DEFAULT NULL COMMENT '商户ID',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `day_str` (`day_str`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=628 ROW_FORMAT=DYNAMIC COMMENT='商家后台-商户日统计';


--
-- Table structure for table `statistic_store_order_day`
--

DROP TABLE IF EXISTS `statistic_store_order_day`;


CREATE TABLE `statistic_store_order_day` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_str` varchar(20) DEFAULT NULL COMMENT '时间',
  `pay_order_num` int DEFAULT NULL COMMENT '支付订单数',
  `order_amount` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `pay_amount` decimal(11,2) DEFAULT NULL COMMENT '支付金额',
  `transaction_user_num` int DEFAULT NULL COMMENT '成交用户数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商家后台-商户订单统计表';


--
-- Table structure for table `t_brand_home`
--

DROP TABLE IF EXISTS `t_brand_home`;


CREATE TABLE `t_brand_home` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '首页模板id',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌ID',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '模板名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `audit_id` char(24) NOT NULL DEFAULT '' COMMENT '审核ID',
  `audit_type` tinyint NOT NULL DEFAULT '1' COMMENT '操作类型1：添加，2：修改：3：删除',
  `audit_state` tinyint NOT NULL DEFAULT '-1' COMMENT '审核状态;-1-草稿,0-审核中,1-审核通过,2-审核不通过',
  `state` tinyint NOT NULL DEFAULT '-1' COMMENT '启用状态;-1-新增未启用,0-禁用,1-启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='品牌模板';


--
-- Table structure for table `t_brand_home_category`
--

DROP TABLE IF EXISTS `t_brand_home_category`;


CREATE TABLE `t_brand_home_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '模板分类ID',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌ID',
  `home_id` bigint NOT NULL DEFAULT '-1' COMMENT '模板ID',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `category_name` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pic_src` varchar(255) NOT NULL DEFAULT '' COMMENT '分类配图',
  `level` tinyint NOT NULL DEFAULT '1' COMMENT '层级;从1开始',
  `sort` smallint NOT NULL DEFAULT '1' COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='品牌模板商品分类';


--
-- Table structure for table `t_brand_home_focus`
--

DROP TABLE IF EXISTS `t_brand_home_focus`;


CREATE TABLE `t_brand_home_focus` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '属性分类ID',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌ID',
  `home_id` bigint NOT NULL DEFAULT '-1' COMMENT '模板ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `sub_title` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `focus_type` tinyint NOT NULL DEFAULT '1' COMMENT '焦点图类型;1-图片,2-视频',
  `pic_src` varchar(255) NOT NULL DEFAULT '' COMMENT '图片路径',
  `video_src` varchar(255) NOT NULL DEFAULT '' COMMENT '视频路径',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='品牌模板焦点区';


--
-- Table structure for table `t_brand_home_spu_rel`
--

DROP TABLE IF EXISTS `t_brand_home_spu_rel`;


CREATE TABLE `t_brand_home_spu_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '属性分类ID',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌ID',
  `home_id` bigint NOT NULL DEFAULT '-1' COMMENT '首页模板ID',
  `home_category_id` bigint NOT NULL DEFAULT '-1' COMMENT '模板商品分类ID',
  `rel_type` tinyint NOT NULL DEFAULT '2' COMMENT '关联类型;1-推荐商品,2-分类商品',
  `spu_id` bigint NOT NULL DEFAULT '-1' COMMENT '商品SPU ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='品牌模板商品关联';


--
-- Table structure for table `t_brand_home_topic_rel`
--

DROP TABLE IF EXISTS `t_brand_home_topic_rel`;


CREATE TABLE `t_brand_home_topic_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '属性分类ID',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌ID',
  `home_id` bigint NOT NULL DEFAULT '-1' COMMENT '首页模板ID',
  `topic_id` bigint NOT NULL DEFAULT '-1' COMMENT '专题ID',
  `sort` smallint NOT NULL DEFAULT '1' COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='品牌模板专题关联';


--
-- Table structure for table `t_brand_sku`
--

DROP TABLE IF EXISTS `t_brand_sku`;


CREATE TABLE `t_brand_sku` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'SKU ID',
  `brand_id` bigint NOT NULL COMMENT '品牌ID',
  `spu_id` bigint NOT NULL COMMENT '商品spu id',
  `sku_code` varchar(32) NOT NULL COMMENT 'sku编码',
  `bar_code` varchar(50) NOT NULL COMMENT '条形码',
  `price` bigint NOT NULL COMMENT '销售价格',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存',
  `original_price` bigint NOT NULL COMMENT '原始价格',
  `pic_src` varchar(255) NOT NULL DEFAULT '' COMMENT '展示图片',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `low_stock` int NOT NULL DEFAULT '0' COMMENT '预警库存',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_SKU_CODE` (`sku_code`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品sku信息表';


--
-- Table structure for table `t_brand_sku_attr`
--

DROP TABLE IF EXISTS `t_brand_sku_attr`;


CREATE TABLE `t_brand_sku_attr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'SKU属性ID',
  `spu_id` bigint NOT NULL DEFAULT '-1' COMMENT '商品ID',
  `sku_id` bigint NOT NULL DEFAULT '-1' COMMENT '商品sku主键id',
  `attr_id` bigint NOT NULL DEFAULT '-1' COMMENT '商品属性id',
  `attr_value` varchar(64) NOT NULL DEFAULT '' COMMENT '商品属性值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_product_id` (`spu_id`) USING BTREE,
  KEY `idx_sku_code` (`sku_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品sku属性值关联';


--
-- Table structure for table `t_brand_spu`
--

DROP TABLE IF EXISTS `t_brand_spu`;


CREATE TABLE `t_brand_spu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'SPU ID',
  `brand_id` bigint NOT NULL COMMENT '品牌id',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `spu_category_id` bigint NOT NULL COMMENT '商品分类id',
  `spu_attr_category_id` bigint NOT NULL COMMENT '商品属性分类id',
  `pic_src` varchar(560) NOT NULL COMMENT '商品详情主图',
  `video_src` varchar(255) NOT NULL COMMENT '商品视频路径',
  `video_first_src` varchar(255) NOT NULL COMMENT '视频第一帧图片',
  `price` bigint NOT NULL COMMENT 'spu价格;取sku最低价格',
  `discounted` tinyint NOT NULL DEFAULT '0' COMMENT '是否参与打折; 0-不参与,1-参与',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `product_code` varchar(64) NOT NULL COMMENT 'spu编码',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除状态;0-未删除,1-已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `audit_id` char(24) NOT NULL DEFAULT '' COMMENT '审核ID',
  `audit_type` tinyint NOT NULL DEFAULT '1' COMMENT '操作类型;1-添加,2-修改,3-删除',
  `audit_state` tinyint NOT NULL DEFAULT '-1' COMMENT '审核状态;-1-草稿,0-审核中,1-审核通过,2-审核不通过',
  `state` tinyint NOT NULL DEFAULT '-1' COMMENT '入库状态：-1-新增未启用,0-未入库,1-已入库',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_category_id` (`spu_category_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='品牌商品信息表';


--
-- Table structure for table `t_brand_spu_ad`
--

DROP TABLE IF EXISTS `t_brand_spu_ad`;


CREATE TABLE `t_brand_spu_ad` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_id` bigint NOT NULL COMMENT '品牌ID',
  `spu_id` bigint NOT NULL COMMENT '商品ID',
  `pic_src` varchar(1024) NOT NULL DEFAULT '' COMMENT '图片,多个逗号隔开',
  `video_src` varchar(256) NOT NULL DEFAULT '' COMMENT '视频地址',
  `video_first_src` varchar(256) NOT NULL DEFAULT '' COMMENT '视频第一帧图',
  `sort` smallint NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `audit_id` char(24) DEFAULT '' COMMENT '审核ID',
  `audit_state` tinyint NOT NULL DEFAULT '-1' COMMENT '审核状态;-1-草稿,0-审核中,1-审核通过,2-审核不通过',
  `audit_type` tinyint NOT NULL DEFAULT '1' COMMENT '操作类型;1-添加,2-修改,3-删除',
  `state` tinyint NOT NULL DEFAULT '-1' COMMENT '启用状态;1-禁用,0-启用,-1-新增未启用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_product_id` (`spu_id`) USING BTREE COMMENT '商品id索引'
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='分类广告商品表';


--
-- Table structure for table `t_brand_spu_ad_rel`
--

DROP TABLE IF EXISTS `t_brand_spu_ad_rel`;


CREATE TABLE `t_brand_spu_ad_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ad_spu_id` bigint NOT NULL COMMENT 't_brand_product_ad表主键',
  `rel_spu_id` bigint NOT NULL COMMENT '关联商品ID',
  `brand_id` bigint NOT NULL COMMENT '品牌ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_product_id` (`ad_spu_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='分类广告商品 关联商品表';


--
-- Table structure for table `t_brand_spu_attr`
--

DROP TABLE IF EXISTS `t_brand_spu_attr`;


CREATE TABLE `t_brand_spu_attr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `attr_category_id` bigint NOT NULL DEFAULT '0' COMMENT '属性分类ID',
  `attr_name` varchar(64) NOT NULL DEFAULT '' COMMENT '属性名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '对照标题',
  `remark` varchar(2048) NOT NULL DEFAULT '' COMMENT '属性对照说明',
  `sort` smallint NOT NULL DEFAULT '0' COMMENT '排序字段',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `attr_type` tinyint NOT NULL DEFAULT '2' COMMENT '属性的类型：1-颜色，2-其他',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品属性参数表';


--
-- Table structure for table `t_brand_spu_attr_category`
--

DROP TABLE IF EXISTS `t_brand_spu_attr_category`;


CREATE TABLE `t_brand_spu_attr_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '属性分类ID',
  `brand_id` bigint NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `attr_category_name` varchar(64) NOT NULL DEFAULT '' COMMENT '属性分类名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品属性分类表';


--
-- Table structure for table `t_brand_spu_attr_value`
--

DROP TABLE IF EXISTS `t_brand_spu_attr_value`;


CREATE TABLE `t_brand_spu_attr_value` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `attr_id` bigint NOT NULL DEFAULT '0' COMMENT '属性ID',
  `attr_value` varchar(64) NOT NULL DEFAULT '' COMMENT '属性值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品属性值表';


--
-- Table structure for table `t_brand_spu_category`
--

DROP TABLE IF EXISTS `t_brand_spu_category`;


CREATE TABLE `t_brand_spu_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `brand_id` bigint NOT NULL COMMENT '品牌id',
  `parent_id` bigint NOT NULL COMMENT '上级分类的编号：0表示一级分类',
  `category_name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `app_pic_src` varchar(255) NOT NULL DEFAULT '' COMMENT 'app分类图',
  `pc_pic_src` varchar(255) NOT NULL DEFAULT '' COMMENT 'pc分类图',
  `level` tinyint NOT NULL DEFAULT '0' COMMENT '分类层级：0开始增加',
  `sort` smallint NOT NULL DEFAULT '0' COMMENT '排序',
  `root_id` bigint NOT NULL DEFAULT '-1' COMMENT '根节点ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品分类';


--
-- Table structure for table `t_brand_spu_desc`
--

DROP TABLE IF EXISTS `t_brand_spu_desc`;


CREATE TABLE `t_brand_spu_desc` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌ID',
  `spu_id` bigint NOT NULL DEFAULT '-1' COMMENT '商品ID',
  `type` tinyint NOT NULL DEFAULT '2' COMMENT '显示终端;1-pc端,2-app端',
  `detail_html` mediumtext COMMENT '商品详细描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_product_id` (`spu_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品描述表';


--
-- Table structure for table `t_brand_spu_group`
--

DROP TABLE IF EXISTS `t_brand_spu_group`;


CREATE TABLE `t_brand_spu_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌id',
  `group_name` varchar(64) NOT NULL DEFAULT '' COMMENT '分组名称',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '分组描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品分组';


--
-- Table structure for table `t_brand_spu_group_rel`
--

DROP TABLE IF EXISTS `t_brand_spu_group_rel`;


CREATE TABLE `t_brand_spu_group_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `spu_group_id` bigint NOT NULL DEFAULT '-1' COMMENT '分组id',
  `spu_id` bigint NOT NULL DEFAULT '-1' COMMENT '商品id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品分组与商品关联表';


--
-- Table structure for table `t_brand_spu_pic`
--

DROP TABLE IF EXISTS `t_brand_spu_pic`;


CREATE TABLE `t_brand_spu_pic` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌ID',
  `spu_id` bigint NOT NULL DEFAULT '-1' COMMENT '商品ID',
  `pic_src` varchar(255) NOT NULL DEFAULT '' COMMENT '商品详情图片5张滚动图',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_product_id` (`spu_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品详细橱窗图片关联表';


--
-- Table structure for table `t_brand_spu_rel`
--

DROP TABLE IF EXISTS `t_brand_spu_rel`;


CREATE TABLE `t_brand_spu_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `spu_id` bigint NOT NULL DEFAULT '-1' COMMENT '商品ID',
  `rel_spu_id` bigint NOT NULL DEFAULT '-1' COMMENT '关联商品ID',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_product_id` (`spu_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='关联商品表';


--
-- Table structure for table `t_brand_topic`
--

DROP TABLE IF EXISTS `t_brand_topic`;


CREATE TABLE `t_brand_topic` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  `category_id` bigint NOT NULL COMMENT '专题所属分类',
  `title` varchar(45) NOT NULL COMMENT '标题',
  `sub_title` varchar(45) NOT NULL COMMENT '副标题',
  `content` text COMMENT '专题正文',
  `decorate_pic_src` varchar(255) NOT NULL DEFAULT '' COMMENT '装饰图地址',
  `pic_type` tinyint NOT NULL DEFAULT '1' COMMENT '封面类型 1-图片,2-视频',
  `pc_pic_src` varchar(255) NOT NULL COMMENT 'pc端封面图',
  `app_pic_src` varchar(2048) NOT NULL DEFAULT '' COMMENT 'app封面图片地址,多张用逗号隔开',
  `app_video_src` varchar(255) NOT NULL COMMENT 'app封面视频地址',
  `app_video_first_src` varchar(255) NOT NULL DEFAULT '' COMMENT 'app封面视频第一帧图地址',
  `has_spu` tinyint NOT NULL DEFAULT '0' COMMENT '是否关闭关联商品: 0-开启,1-关闭',
  `spu_id` bigint NOT NULL COMMENT '推荐单品商品id',
  `spu_pic_src` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐单品商品图片',
  `sort` smallint NOT NULL DEFAULT '1' COMMENT '排序',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '0表示正常使用1表示删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `audit_id` char(24) NOT NULL DEFAULT '' COMMENT '审核ID',
  `audit_type` tinyint NOT NULL DEFAULT '1' COMMENT '操作类型1：添加，2：修改：3：删除',
  `audit_state` tinyint NOT NULL DEFAULT '-1' COMMENT '审核状态;-1-草稿,0-审核中,1-审核通过,2-审核不通过',
  `state` tinyint NOT NULL DEFAULT '-1' COMMENT '启用状态;-1-新增未启用,0-禁用,1-启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='专题表';


--
-- Table structure for table `t_brand_topic_category`
--

DROP TABLE IF EXISTS `t_brand_topic_category`;


CREATE TABLE `t_brand_topic_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌id',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '0-未删除,1-删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='专题分类';


--
-- Table structure for table `t_brand_topic_spu_rel`
--

DROP TABLE IF EXISTS `t_brand_topic_spu_rel`;


CREATE TABLE `t_brand_topic_spu_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `topic_id` bigint NOT NULL COMMENT '专题id',
  `spu_id` bigint NOT NULL COMMENT '商品spu id',
  `deleted` tinyint NOT NULL DEFAULT '1' COMMENT '0-未删除,1-删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='专题关联商品';


--
-- Table structure for table `t_customer_favorite`
--

DROP TABLE IF EXISTS `t_customer_favorite`;


CREATE TABLE `t_customer_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `org_id` bigint NOT NULL DEFAULT '-1' COMMENT '组织id',
  `user_id` bigint NOT NULL DEFAULT '-1' COMMENT '用户id',
  `store_id` bigint NOT NULL DEFAULT '-1' COMMENT '店铺id',
  `spu_id` bigint NOT NULL DEFAULT '-1' COMMENT '商品信息id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `favorite_user_id` (`user_id`) USING BTREE,
  KEY `favorite_store_id` (`store_id`) USING BTREE,
  KEY `favorite_spu_id` (`spu_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='商品收藏表';


--
-- Table structure for table `t_store_home_rel`
--

DROP TABLE IF EXISTS `t_store_home_rel`;


CREATE TABLE `t_store_home_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `store_id` bigint NOT NULL DEFAULT '0' COMMENT '所属店铺',
  `home_id` bigint NOT NULL DEFAULT '0' COMMENT '模板id',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '启用状态;0-待启用,1-已启用,2-待更新',
  `home_detail` text COMMENT '模板详情',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `enable_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '启用时间',
  `renew_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='门店模板关联表';


--
-- Table structure for table `t_store_sku`
--

DROP TABLE IF EXISTS `t_store_sku`;


CREATE TABLE `t_store_sku` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '门店商品ID',
  `brand_id` bigint NOT NULL DEFAULT '-1' COMMENT '品牌ID',
  `store_id` bigint NOT NULL DEFAULT '-1' COMMENT '所属店铺',
  `spu_id` bigint NOT NULL DEFAULT '-1' COMMENT 'SPU ID',
  `sku_id` bigint NOT NULL DEFAULT '-1' COMMENT 'SKU ID',
  `stock` int NOT NULL DEFAULT '-1' COMMENT '库存',
  `shelf_stock` int NOT NULL DEFAULT '0' COMMENT '上架库存',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除;0-未删除,1-删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `audit_id` char(24) NOT NULL DEFAULT '' COMMENT '审核ID',
  `audit_type` tinyint NOT NULL DEFAULT '-1' COMMENT '操作类型1：添加，2：修改：3：删除',
  `audit_state` tinyint NOT NULL DEFAULT '-1' COMMENT '审核状态;-1-草稿,0-审核中,1-审核通过,2-审核不通过',
  `state` tinyint NOT NULL DEFAULT '-1' COMMENT '启用状态;-1-新增未启用,0-禁用,1-启用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unitId` (`brand_id`,`store_id`,`sku_id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='门店商品库存表';


--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;


CREATE TABLE `topic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL COMMENT '标题',
  `sub_title` varchar(45) DEFAULT NULL COMMENT '副标题',
  `category_id` bigint NOT NULL COMMENT '专题所属分类',
  `cover` varchar(500) NOT NULL COMMENT 'pc端封面图',
  `admin` varchar(45) DEFAULT NULL COMMENT '发布者',
  `admin_uid` varchar(45) DEFAULT NULL COMMENT '发布者用户id',
  `publish_status` int DEFAULT '1' COMMENT '发布状态:0是删除,1是待发布,2是发布',
  `audit_status` int DEFAULT '1' COMMENT '审核状态:1待审核，2，发布审核中，3发布审核通过，4发布审核不通过，5删除审核中，6删除审核不通过，7删除审核通过，8，更新已保存，9更新审核中，10更新审核不通过，11更新审核通过',
  `content` text COMMENT '专题正文',
  `recommend_rel_type` int DEFAULT '0' COMMENT '推荐专题类型:0.不推荐1.默认推荐，2自定义推荐',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0表示正常使用1表示删除',
  `is_close_rel_goods` tinyint(1) DEFAULT '0' COMMENT '是否关闭关联商品: 0开启1关闭',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  `from_id` bigint DEFAULT '-1' COMMENT ' 原始id (注:修改后会产生两条数据)',
  `is_modified` tinyint(1) DEFAULT '0' COMMENT '是否被修改过(修改过的在后台显示此数据，显示衍生数据)',
  `audit_id` varchar(50) DEFAULT NULL COMMENT '审核id',
  `brand_name` varchar(500) DEFAULT NULL COMMENT '品牌名称',
  `category_name` varchar(500) DEFAULT NULL COMMENT '分类名称',
  `operation` varchar(255) DEFAULT NULL,
  `update_content` text COMMENT '更新审核草稿',
  `org_id` bigint DEFAULT NULL COMMENT '专题中加入组织id',
  `num` int DEFAULT '1',
  `decorate` varchar(200) DEFAULT NULL COMMENT '装饰图地址',
  `recommend_item` bigint DEFAULT NULL COMMENT '推荐单品商品id',
  `cover_type` tinyint NOT NULL DEFAULT '1' COMMENT '封面类型 1：图片，2：视频',
  `cover_pic_path` varchar(2048) DEFAULT NULL COMMENT 'app封面图片地址，多张用逗号隔开',
  `cover_video_path` varchar(500) DEFAULT NULL COMMENT 'app封面视频地址',
  `first_pic_path` varchar(500) DEFAULT NULL COMMENT 'app封面视频第一帧图地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 ROW_FORMAT=DYNAMIC COMMENT='专题';


--
-- Table structure for table `topic_category`
--

DROP TABLE IF EXISTS `topic_category`;


CREATE TABLE `topic_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_id` bigint NOT NULL COMMENT '品牌id',
  `name` varchar(45) DEFAULT NULL COMMENT '分类名称',
  `audit_status` int DEFAULT '1' COMMENT '审核状态: 1 新建审核中，2新建审核不通过，3新建审核通过，4删除审核中，5删除审核不通过，6删除审核通过',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0未删除,1删除',
  `audit_id` varchar(45) DEFAULT NULL COMMENT '审核状态: 1 新建审核中，2新建审核不通过，3新建审核通过，4删除审核中，5删除审核不通过，6删除审核通过',
  `callback_id` int DEFAULT NULL COMMENT '标识审核id',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `brand_name` varchar(500) DEFAULT NULL COMMENT '品牌名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 ROW_FORMAT=DYNAMIC COMMENT='专题分类';


--
-- Table structure for table `topic_goods`
--

DROP TABLE IF EXISTS `topic_goods`;


CREATE TABLE `topic_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tid` bigint DEFAULT NULL COMMENT '主题id',
  `gid` bigint DEFAULT NULL COMMENT '商品id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除状态 0表示 正常使用1表示删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=430 ROW_FORMAT=DYNAMIC COMMENT='专题关联商品';


--
-- Table structure for table `topic_home_page`
--

DROP TABLE IF EXISTS `topic_home_page`;


CREATE TABLE `topic_home_page` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `topic_id` bigint NOT NULL COMMENT '专题id',
  `home_page_id` bigint NOT NULL COMMENT '主页模板id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=172 ROW_FORMAT=DYNAMIC COMMENT='将专题推荐到主页';


--
-- Table structure for table `topic_recommend`
--

DROP TABLE IF EXISTS `topic_recommend`;


CREATE TABLE `topic_recommend` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `topic_id` bigint NOT NULL COMMENT '主题id',
  `recommend_topic_id` bigint NOT NULL COMMENT '推荐主题id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除状态:0 正常使用 1表示删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 ROW_FORMAT=DYNAMIC COMMENT='专题推荐关系';


--
-- Table structure for table `ums_member_receive_address`
--

DROP TABLE IF EXISTS `ums_member_receive_address`;


CREATE TABLE `ums_member_receive_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '收货地址ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `name` varchar(100) DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) DEFAULT NULL COMMENT '收货人手机号',
  `default_status` int DEFAULT NULL COMMENT '是否为默认：0 不是  1是',
  `post_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `region` varchar(100) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) DEFAULT NULL COMMENT '详细地址(街道)',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '更新时间',
  `delete_status` int DEFAULT '0' COMMENT '删除状态：0 未删除  1已删除',
  `status` int DEFAULT NULL COMMENT '启用状态：0 启用  1禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='会员收货地址表';


--
-- Table structure for table `w_advertise_banner`
--

DROP TABLE IF EXISTS `w_advertise_banner`;


CREATE TABLE `w_advertise_banner` (
  `wab_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `topic_type` int DEFAULT NULL COMMENT '主题类型:0—闪屏页，1—广告页，2—引导页，8-首页banner,10-Mall旗舰店Banner，11-Mall 专题Banner,12-品牌；13-分类',
  `topic_name` varchar(64) DEFAULT NULL COMMENT '主题名称',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `every_of_time` int DEFAULT NULL COMMENT '每片展现时间',
  `every_of_freq` int DEFAULT NULL COMMENT '每片展现频率',
  `broadcast_time_total` int DEFAULT NULL COMMENT '视频播放时长',
  `status` int DEFAULT NULL COMMENT '状态：1-开始，2-过期，3-禁用',
  `top_sort` int DEFAULT NULL COMMENT '主题排序:1-升序；2-降序',
  `company_id` bigint DEFAULT NULL COMMENT '公司id',
  `store_id` bigint DEFAULT NULL COMMENT '商铺ID',
  `create_dtm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_dtm` datetime DEFAULT NULL COMMENT '更新时间',
  `app_type` int DEFAULT NULL COMMENT '平台类型：1-APP,2-PC',
  `topic_type_ref_id` bigint DEFAULT NULL COMMENT '主题类型映射业务ID',
  PRIMARY KEY (`wab_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='Banner广告页播放主题';


--
-- Table structure for table `w_advertise_banner_resource`
--

DROP TABLE IF EXISTS `w_advertise_banner_resource`;


CREATE TABLE `w_advertise_banner_resource` (
  `wabs_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `wab_id` bigint DEFAULT NULL COMMENT '关联主题表id',
  `source_type` int DEFAULT '1' COMMENT '资源类型:1-图片，2-视频',
  `pic_url` varchar(128) DEFAULT NULL COMMENT '图片地址',
  `video_url` varchar(128) DEFAULT NULL COMMENT '视频地址',
  `link_type` int DEFAULT '0' COMMENT '跳转类型:0 表示无跳转、1 活动、2 精彩回顾、3 新闻、4 新鲜事、5 咨询、6 直播、7 网页、8店铺、9商品详情',
  `link_url` varchar(128) DEFAULT NULL COMMENT '跳转链接',
  `resource_status` int DEFAULT '1' COMMENT '状态：1-启用，2-禁用',
  `using_type` int DEFAULT NULL COMMENT '使用类型',
  `create_dtm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_dtm` datetime DEFAULT NULL COMMENT '更新时间',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `show_position` int DEFAULT '0' COMMENT '显示位置',
  `layout_position` int DEFAULT '0' COMMENT '布局定位：0-中间；10-左边；20-右边；21-右1; 22-右2',
  PRIMARY KEY (`wabs_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='Banner广告页播放主题资源';


--
-- Table structure for table `w_brand_card_template`
--

DROP TABLE IF EXISTS `w_brand_card_template`;


CREATE TABLE `w_brand_card_template` (
  `wbct_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `brand_id` bigint NOT NULL COMMENT '品牌ID',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名称',
  `org_id` bigint DEFAULT NULL COMMENT '公司id',
  `card_backgroud` varchar(256) DEFAULT NULL COMMENT '卡片背景图',
  `brand_logo` varchar(256) DEFAULT NULL COMMENT '品牌Logo',
  `short_name` varchar(32) DEFAULT NULL COMMENT '简称',
  `create_dtm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_dtm` datetime DEFAULT NULL COMMENT '修改时间',
  `level_name` varchar(20) DEFAULT NULL COMMENT '等级名称',
  `discount` float(3,1) DEFAULT '10.0' COMMENT '折扣（0.*）表示',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态：-1-删除；0-正常，1-禁用',
  `add_user_name` varchar(40) DEFAULT NULL COMMENT '创建人',
  `content_id` varchar(32) DEFAULT NULL COMMENT '审核ID',
  `verify_status` tinyint(1) DEFAULT NULL COMMENT '审核状态:0-审核中,1-审核通过,2-审核驳回',
  PRIMARY KEY (`wbct_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 ROW_FORMAT=DYNAMIC COMMENT='品牌卡片模板';


--
-- Table structure for table `w_link_share`
--

DROP TABLE IF EXISTS `w_link_share`;


CREATE TABLE `w_link_share` (
  `ls_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `biz_type` int DEFAULT NULL COMMENT '业务类型:1-活动;2-精彩回顾;3-新闻;4-新鲜事;5-咨询;6-直播;7-网页;10-店铺;11-商品;20-组织;21-校友;30-用户',
  `ref_id` bigint DEFAULT NULL COMMENT '映射ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `status` int DEFAULT NULL COMMENT '状态:1-永久,2-暂时',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ls_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='链接分享表';


--
-- Table structure for table `w_mall_browse_store`
--

DROP TABLE IF EXISTS `w_mall_browse_store`;


CREATE TABLE `w_mall_browse_store` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `store_id` bigint NOT NULL COMMENT '店铺ID',
  `browse_address` varchar(100) DEFAULT NULL COMMENT '访问地点',
  `browse_time` datetime NOT NULL COMMENT '访问时间',
  `browse_ip` varchar(64) DEFAULT NULL COMMENT '所在ip',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_w_mall_browse_store_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38071 ROW_FORMAT=DYNAMIC COMMENT='用户浏览店铺日志';


--
-- Table structure for table `w_mall_shop`
--

DROP TABLE IF EXISTS `w_mall_shop`;


CREATE TABLE `w_mall_shop` (
  `store_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商铺id',
  `store_name` varchar(128) DEFAULT NULL COMMENT '店铺名称',
  `brand_name` varchar(32) DEFAULT NULL COMMENT '品牌名称',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `shop_type` int DEFAULT NULL COMMENT '店铺类型;1-直营,2-加盟',
  `shop_area` varchar(20) DEFAULT NULL COMMENT '店铺区域',
  `shop_address` varchar(256) DEFAULT NULL COMMENT '店铺地址',
  `content_id` varchar(32) DEFAULT NULL COMMENT '审核ID',
  `shop_status` int DEFAULT '0' COMMENT '店铺状态:0-审核中,1-正常，2-关闭,3-审核不通过',
  `location` varchar(128) DEFAULT NULL COMMENT '经度纬度，例如：34.678,78.498',
  `org_id` bigint DEFAULT NULL COMMENT '所属企业id',
  `create_dtm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_dtm` datetime DEFAULT NULL COMMENT '修改时间',
  `shop_image` varchar(500) DEFAULT NULL COMMENT '店铺形象图片',
  `telephone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `region_remark` varchar(255) DEFAULT NULL COMMENT '区域备注',
  `verify_status` int DEFAULT '0' COMMENT '审核状态:0-审核中,1-审核通过,2-审核驳回',
  `verify_remark` varchar(500) DEFAULT NULL COMMENT '审核备注',
  `admin_info` text COMMENT '管理员信息',
  `latitude` decimal(10,6) DEFAULT '0.000000' COMMENT '纬度坐标',
  `longitude` decimal(10,6) DEFAULT '0.000000' COMMENT '经度坐标',
  PRIMARY KEY (`store_id`) USING BTREE,
  UNIQUE KEY `short_name` (`store_name`) USING BTREE COMMENT '店铺名称唯一',
  KEY `idx_w_mall_shop_org_id` (`org_id`),
  KEY `idx_w_mall_shop_brand_id` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3686700000111 ROW_FORMAT=DYNAMIC COMMENT='旗舰店表';


--
-- Table structure for table `w_mall_shop_service`
--

DROP TABLE IF EXISTS `w_mall_shop_service`;


CREATE TABLE `w_mall_shop_service` (
  `wmss_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `store_id` bigint DEFAULT NULL COMMENT '商铺ID',
  `user_id` bigint DEFAULT NULL COMMENT '客服用户ID',
  `service_name` varchar(64) DEFAULT NULL COMMENT '客服姓名',
  `service_nick_name` varchar(64) DEFAULT NULL COMMENT '客服昵称',
  `telephone` varchar(16) DEFAULT NULL COMMENT '客服手机号码',
  `chat_id` bigint DEFAULT NULL COMMENT '讯聊ID',
  `status` int DEFAULT '1' COMMENT 'status：1-正常，2-冻结',
  `create_dtm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_dtm` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`wmss_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 ROW_FORMAT=DYNAMIC COMMENT='旗舰店——客服';


--
-- Table structure for table `w_member_card`
--

DROP TABLE IF EXISTS `w_member_card`;


CREATE TABLE `w_member_card` (
  `wmc_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `wm_id` bigint DEFAULT NULL COMMENT '关联会员表id',
  `user_id` bigint DEFAULT NULL COMMENT '主键id',
  `card_no` varchar(100) DEFAULT NULL COMMENT '卡编号',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `card_status` int DEFAULT NULL COMMENT '卡片状态：0-未启用，1-有效，2-已失效,3-审核中,4-审核驳回',
  `card_type` int DEFAULT NULL COMMENT '卡片类型:1-mall商城,2-办事大厅',
  `store_id` bigint DEFAULT NULL COMMENT '店铺id',
  `wbct_id` bigint DEFAULT NULL COMMENT '关联品牌卡片模板表id',
  `create_dtm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_dtm` datetime DEFAULT NULL COMMENT '修改时间',
  `telephone` varchar(64) DEFAULT NULL COMMENT '会员卡手机号',
  `total_consume_amount` decimal(11,2) DEFAULT NULL COMMENT '累积费用金额',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `last_name` varchar(64) DEFAULT NULL COMMENT '姓氏',
  `first_name` varchar(64) DEFAULT NULL COMMENT '名称',
  `username` varchar(128) DEFAULT NULL COMMENT '用户名称',
  `sex` int DEFAULT '0' COMMENT '性别：1-男，2-女，0-未知',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期 格式:yyyy-MM-dd',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `content_id` varchar(32) DEFAULT NULL COMMENT '审核ID',
  `adviser_id` varchar(10) DEFAULT NULL COMMENT '专属顾问ID',
  `adviser_user_id` varchar(32) DEFAULT NULL COMMENT '专属顾问用户ID',
  `adviser_info` varchar(50) DEFAULT NULL COMMENT '专属顾问信息',
  PRIMARY KEY (`wmc_id`) USING BTREE,
  UNIQUE KEY `user_brand` (`user_id`,`brand_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120 ROW_FORMAT=DYNAMIC COMMENT='会员卡表';


--
-- Table structure for table `w_payment_ref`
--

DROP TABLE IF EXISTS `w_payment_ref`;


CREATE TABLE `w_payment_ref` (
  `wpr_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `company_id` bigint DEFAULT NULL COMMENT '公司ID',
  `shop_model` int DEFAULT NULL COMMENT '收款模式:1-直营；2-加盟',
  `payment_channel` int DEFAULT NULL COMMENT '收款渠道：1-支付宝；2-微信',
  `status` int DEFAULT NULL COMMENT '状态：1-启用；2-禁用',
  `mch_id` varchar(32) DEFAULT NULL COMMENT '商铺ID,映射支付中心商铺表',
  `create_dtm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_dtm` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`wpr_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='支付映射信息';


--
-- Table structure for table `w_product_category_setting`
--

DROP TABLE IF EXISTS `w_product_category_setting`;


CREATE TABLE `w_product_category_setting` (
  `wmac_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_category_id` bigint DEFAULT NULL COMMENT '商品分类id,关联商品分类表',
  `goods_category_name` varchar(128) DEFAULT NULL COMMENT '商品各类名称',
  `store_id` bigint DEFAULT NULL COMMENT '商铺ID',
  `is_show` int DEFAULT NULL COMMENT '是否显示:0-不显示，1-显示',
  `sort` int DEFAULT NULL COMMENT '排序方式： 1-升序，2-降序',
  `is_index_show` int DEFAULT NULL COMMENT '是否首页显示：0-不显示，1-显示',
  `company_id` bigint DEFAULT NULL COMMENT '公司id',
  `create_dtm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_dtm` datetime DEFAULT NULL COMMENT '更新时间',
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`wmac_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='app商店显示商品配置表';