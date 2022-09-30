use `yzn-user-organization`;


--
-- Table structure for table `default_config`
--

DROP TABLE IF EXISTS `default_config`;

CREATE TABLE `default_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `default_img` varchar(255) NOT NULL COMMENT '默认图片',
  `type` varchar(20) NOT NULL COMMENT '类型',
  `platform` tinyint NOT NULL COMMENT '平台:1-app,2-PC',
  `ports_type` smallint NOT NULL COMMENT '1-表示logo、2-默认背景、3-首页Banner、4-直播Banner',
  `status` tinyint NOT NULL COMMENT '状态:0-正常;1-禁用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 COMMENT='系统图片默认配置表';


--
-- Table structure for table `dict_sys_data`
--

DROP TABLE IF EXISTS `dict_sys_data`;

CREATE TABLE `dict_sys_data` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典id',
  `dict_type_code` varchar(32) DEFAULT NULL COMMENT '一级字典键',
  `dict_no` varchar(32) DEFAULT NULL COMMENT '二级字典键',
  `dict_no_value` varchar(32) DEFAULT NULL COMMENT '二级字典值',
  `dict_no_description` varchar(50) DEFAULT NULL COMMENT '二级字典描述',
  `dict_code` varchar(32) DEFAULT NULL COMMENT '三级字典键',
  `dict_code_value` varchar(32) DEFAULT NULL COMMENT '三级字典值',
  `dict_code_description` varchar(50) DEFAULT NULL COMMENT '三级字典描述',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `status` varchar(2) NOT NULL DEFAULT '0' COMMENT '状态(0正常,1禁用)',
  `is_delete` varchar(2) NOT NULL DEFAULT 'N' COMMENT '是否删除',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`dict_id`) USING BTREE,
  KEY `idx_dict_sys_data_dict_no` (`dict_no`) USING BTREE,
  KEY `idx_dict_sys_data_dict_type_code` (`dict_type_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 COMMENT='系统字典数据表';


--
-- Table structure for table `dict_sys_type`
--

DROP TABLE IF EXISTS `dict_sys_type`;

CREATE TABLE `dict_sys_type` (
  `dict_type_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典类型id',
  `dict_type_code` varchar(32) DEFAULT NULL COMMENT '键',
  `dict_type_value` varchar(32) DEFAULT NULL COMMENT '值',
  `dict_type_description` varchar(50) DEFAULT NULL COMMENT '描述',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `sys_no` varchar(32) NOT NULL DEFAULT 'ALL' COMMENT '系统(ALL全平台,PC电脑端,Android安卓端,Apply苹果端,MAC,UNIX)',
  `sys_no_description` varchar(50) NOT NULL DEFAULT '全平台' COMMENT '系统描述',
  `is_delete` varchar(2) NOT NULL DEFAULT 'N' COMMENT '是否删除',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `status` varchar(2) DEFAULT NULL COMMENT '状态(0正常,1禁用)',
  PRIMARY KEY (`dict_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 COMMENT='系统字典类型表';


--
-- Table structure for table `guide_area`
--

DROP TABLE IF EXISTS `guide_area`;

CREATE TABLE `guide_area` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `sort` int DEFAULT '0' COMMENT '排序',
  `link` varchar(500) DEFAULT NULL COMMENT '点击的链接',
  `status` tinyint DEFAULT '0' COMMENT '显示状态：0 显示  1不显示',
  `is_fix` tinyint DEFAULT '0' COMMENT '是否固定：0 是  1不是',
  `menu_type` int DEFAULT NULL COMMENT '菜单类型：重要的字段',
  `audit_status` tinyint DEFAULT '0' COMMENT '审核状态：0待审核  1通过  2拒绝',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `icon` varchar(2000) DEFAULT NULL COMMENT 'APP图标',
  `pc_icon` varchar(2000) DEFAULT NULL COMMENT 'pc端图标',
  `pc_nav_back` varchar(2000) DEFAULT NULL COMMENT 'PC导航栏背景图',
  `index_type` int DEFAULT NULL COMMENT 'APP金刚区类型：0  大图标    1小图标',
  `pc_index_type` int DEFAULT NULL COMMENT 'PC金刚区类型：0  大图标    1导航栏',
  `class_type` int DEFAULT NULL COMMENT '应用类型：对应guide_area_class_config表主键ID',
  `init_id` bigint DEFAULT NULL COMMENT '初始化ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_object_id` (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=378 COMMENT='组织金刚区';


--
-- Table structure for table `guide_area_class_config`
--

DROP TABLE IF EXISTS `guide_area_class_config`;

CREATE TABLE `guide_area_class_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `sort` smallint DEFAULT '0' COMMENT '排序',
  `status` tinyint DEFAULT '0' COMMENT '0 显示  1不显示',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 COMMENT='类型配置表';


--
-- Table structure for table `guide_area_config_init`
--

DROP TABLE IF EXISTS `guide_area_config_init`;

CREATE TABLE `guide_area_config_init` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `icon` varchar(2000) DEFAULT NULL COMMENT 'APP图标',
  `apply_type` smallint DEFAULT NULL COMMENT '应用类型：2 企业集团  3企业下属企业  4企业单一型',
  `menu_type` smallint DEFAULT NULL COMMENT '菜单类型：重要的字段',
  `is_fix` tinyint DEFAULT '0' COMMENT '0 是  1不是',
  `sort` smallint DEFAULT '0' COMMENT '排序',
  `link` varchar(500) DEFAULT NULL COMMENT '点击的链接',
  `status` tinyint DEFAULT '0' COMMENT '0 显示  1不显示',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `type` varchar(40) DEFAULT NULL COMMENT '类型:标识哪个组织  如 学校、企业、协会',
  `class_type` int DEFAULT NULL COMMENT '分类id',
  `index_type` tinyint DEFAULT '1' COMMENT 'APP金刚区类型：0  大图标    1小图标',
  `scen_id` varchar(80) DEFAULT NULL COMMENT '应用场景id：逗号分隔',
  `banner_status` tinyint DEFAULT '0' COMMENT '是否关联banner：0  关联  1不关联',
  `pc_icon` varchar(2000) DEFAULT NULL COMMENT 'pc端图标',
  `pc_index_type` tinyint DEFAULT '1' COMMENT 'PC金刚区类型：0  大图标    1导航栏',
  `pc_nav_back` varchar(2000) DEFAULT NULL COMMENT '导航栏背景图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 COMMENT='导航区初始化表';


--
-- Table structure for table `home_footer_settings`
--

DROP TABLE IF EXISTS `home_footer_settings`;

CREATE TABLE `home_footer_settings` (
  `org_id` bigint NOT NULL COMMENT '组织ID',
  `head_type` tinyint NOT NULL DEFAULT '3' COMMENT '设置类型：1-图片;2-视频;3-文字',
  `head_content` varchar(120) DEFAULT NULL COMMENT '页眉内容(文字类型才有)',
  `head_picture` varchar(500) DEFAULT NULL COMMENT '页眉图片(图片类型才有)',
  `file_type` tinyint NOT NULL COMMENT '设置类型：1-图片;2-视频;3-文字',
  `picture_path` varchar(500) DEFAULT NULL COMMENT '图片路径',
  `pic_jump_type` tinyint DEFAULT '0' COMMENT '图片模式跳转链接',
  `pic_jump_link` varchar(500) DEFAULT NULL COMMENT '跳转ID或者网页',
  `content1` varchar(45) DEFAULT NULL COMMENT '内容1(文字类型才有)',
  `is_bold1` tinyint(1) DEFAULT '0' COMMENT '内容1是否加粗：0 不加1 加粗（文字模式才有）',
  `jump_type1` tinyint DEFAULT NULL COMMENT '内容1的跳转类型',
  `jump_link1` varchar(500) DEFAULT '0' COMMENT '跳转ID或者网页',
  `is_underline1` tinyint(1) DEFAULT '0' COMMENT '内容3是否加下划线：0 不加1 加粗（文字模式才有）',
  `content2` varchar(45) DEFAULT NULL COMMENT '内容2(文字类型才有)',
  `is_bold2` tinyint(1) DEFAULT '0' COMMENT '内容2是否加粗：0 不加1 加粗（文字模式才有）',
  `jump_type2` tinyint DEFAULT '0' COMMENT '内容2的跳转类型',
  `jump_link2` varchar(500) DEFAULT '0' COMMENT '跳转ID或者网页',
  `is_underline2` tinyint(1) DEFAULT '0' COMMENT '内容3是否加下划线：0 不加1 加粗（文字模式才有）',
  `content3` varchar(45) DEFAULT NULL COMMENT '内容3(文字类型才有)',
  `is_bold3` tinyint(1) DEFAULT '0' COMMENT '内容3是否加粗：0 不加1 加粗（文字模式才有）',
  `jump_type3` tinyint DEFAULT '0' COMMENT '内容的跳转类型',
  `jump_link3` varchar(500) DEFAULT '0' COMMENT '跳转ID或者网页',
  `is_underline3` tinyint(1) DEFAULT '0' COMMENT '内容3是否加下划线：0 不加1 加粗（文字模式才有）',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态:-1-删除;0-正常;1-禁用;2-审核中;3-审核不通过',
  `op_user_id` varchar(40) DEFAULT NULL COMMENT '操作用户ID',
  `op_user_name` varchar(40) DEFAULT NULL COMMENT '操作用户名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content_id` varchar(24) DEFAULT NULL COMMENT '审核ID',
  `verify_status` tinyint(1) DEFAULT NULL COMMENT '审核状态:0-审核中,1-审核通过,2-审核驳回',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `org_id_union` (`org_id`) USING BTREE COMMENT '组织ID唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=2 COMMENT='首页页脚设置表';


--
-- Table structure for table `landing_page`
--

DROP TABLE IF EXISTS `landing_page`;

CREATE TABLE `landing_page` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) DEFAULT NULL COMMENT '唯一码',
  `biz_type` smallint DEFAULT NULL COMMENT '业务类型:1-活动; 2-精彩回顾; 3-新闻;4-新鲜事; 5-咨询;6-直播; 7-网页; 10-店铺；11-商品；20-组织；21-校友；22-企业；23-协会；30-用户；',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `ref_id` bigint DEFAULT NULL COMMENT '业务映射ID,根据业务类型输入ID',
  `content` text COMMENT '内容',
  `status` tinyint DEFAULT '0' COMMENT '状态:0-正常,1-关闭',
  `style` tinyint DEFAULT '0' COMMENT '类型:0-短暂,1-持久',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '生成时间',
  `end_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_landing_page_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 COMMENT='落地页信息表';


--
-- Table structure for table `org_brand_info`
--

DROP TABLE IF EXISTS `org_brand_info`;

CREATE TABLE `org_brand_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `root_id` bigint DEFAULT NULL COMMENT '顶级企业',
  `brand_logo` varchar(512) NOT NULL COMMENT '品牌logo',
  `brand_name` varchar(64) NOT NULL COMMENT '品牌名称（中文）',
  `brand_first` varchar(8) NOT NULL COMMENT '品牌首字母',
  `brand_simple` varchar(32) NOT NULL COMMENT '品牌简称(英文)',
  `brand_type` tinyint NOT NULL DEFAULT '1' COMMENT '品牌类型：1-国内;2-国外',
  `sort` smallint NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态:-1-删除;0-正常;1禁用',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `pc_brand_logo` tinytext COMMENT '品牌PC logo',
  `content_id` varchar(24) DEFAULT NULL COMMENT '品牌logo审核ID',
  `verify_status` tinyint DEFAULT NULL COMMENT '审核状态0审核中，1审核成功，2审核失败',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_org_brand_info_org_id` (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 COMMENT='组织品牌表';


--
-- Table structure for table `org_deploy_info`
--

DROP TABLE IF EXISTS `org_deploy_info`;

CREATE TABLE `org_deploy_info` (
  `odi_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `system_admin_name` varchar(30) DEFAULT NULL COMMENT '系统管理员姓名',
  `telephone` varchar(11) DEFAULT NULL COMMENT '系统管理员手机号',
  `admin_account` varchar(64) DEFAULT NULL COMMENT '系统管理员初始化账号',
  `admin_secret` varchar(128) DEFAULT NULL COMMENT '系统管理员初始化密码',
  `app_privacy_url` varchar(1000) DEFAULT NULL COMMENT 'APP访问私域地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`odi_id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 COMMENT='企业布署信息';


--
-- Table structure for table `organization_add`
--

DROP TABLE IF EXISTS `organization_add`;

CREATE TABLE `organization_add` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `post_id` int DEFAULT NULL COMMENT '职务id',
  `link_phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `dept_id` varchar(50) DEFAULT NULL COMMENT '部门id',
  `status` tinyint DEFAULT '0' COMMENT '加入状态：0通过  1待审核 2拒绝',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `add_time` datetime DEFAULT NULL COMMENT '加入时间',
  `manage_type` tinyint DEFAULT NULL COMMENT '管理类型',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `identity_type_id` smallint DEFAULT NULL COMMENT '身份类型ID',
  `sex` tinyint DEFAULT NULL COMMENT '性别：1-男，2-女，0-未知',
  `remark` varchar(100) DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 COMMENT='用户组织关系表';


--
-- Table structure for table `organization_add_verify`
--

DROP TABLE IF EXISTS `organization_add_verify`;

CREATE TABLE `organization_add_verify` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `add_id` bigint DEFAULT NULL COMMENT '加入组织ID',
  `quit_status` int DEFAULT '0' COMMENT '退出组织审核状态：0通过  1待审核 2拒绝',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `quit_audit_id` varchar(100) DEFAULT NULL COMMENT '退出组织的审核ID',
  `quit_remark` varchar(100) DEFAULT NULL COMMENT '退出组织的审核备注',
  `operation_type` int DEFAULT '0' COMMENT '操作类型：0 退出组织  1离职申请',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `add_id` (`add_id`) USING BTREE,
  KEY `operation_type` (`operation_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 COMMENT='用户组织关系表';


--
-- Table structure for table `organization_basic`
--

DROP TABLE IF EXISTS `organization_basic`;

CREATE TABLE `organization_basic` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_id` bigint NOT NULL COMMENT '组织ID',
  `org_name` varchar(64) NOT NULL COMMENT '组织名称',
  `referred` varchar(32) DEFAULT NULL COMMENT '组织简称',
  `type` varchar(10) NOT NULL COMMENT 'pc或app',
  `logo` varchar(255) NOT NULL COMMENT 'Logo',
  `notes` varchar(255) NOT NULL COMMENT '说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `content_id` varchar(45) DEFAULT NULL COMMENT '审核id',
  `verify_state` tinyint DEFAULT NULL COMMENT '审核状态、0审核中、1审核失败、2审核成功',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 COMMENT='组织基本信息表';


--
-- Table structure for table `organization_dept`
--

DROP TABLE IF EXISTS `organization_dept`;

CREATE TABLE `organization_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `dept_sort` smallint NOT NULL COMMENT '显示顺序',
  `status` tinyint(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `identity_type_id` int DEFAULT NULL COMMENT '身份类型id',
  `init_id` bigint DEFAULT NULL COMMENT '初始化ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `object_id` (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 COMMENT='组织人员部门表';


--
-- Table structure for table `organization_dept_init`
--

DROP TABLE IF EXISTS `organization_dept_init`;

CREATE TABLE `organization_dept_init` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `dept_name` varchar(50) DEFAULT NULL,
  `dept_sort` smallint NOT NULL COMMENT '显示顺序',
  `status` tinyint NOT NULL COMMENT '状态（0正常 1停用）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `identity_type_id` smallint DEFAULT NULL COMMENT '身份类型id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identity_type_id` (`identity_type_id`) USING BTREE,
  KEY `idx_organization_dept_init_identity_type_id` (`identity_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 COMMENT='组织人员部门表';


--
-- Table structure for table `organization_employee`
--

DROP TABLE IF EXISTS `organization_employee`;

CREATE TABLE `organization_employee` (
  `id` bigint NOT NULL COMMENT '员工目录ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '员工姓名',
  `post_id` int DEFAULT NULL COMMENT '员工职务id',
  `link_phone` varchar(255) DEFAULT NULL COMMENT '员工联系电话',
  `dept_id` varchar(50) DEFAULT NULL COMMENT '员工部门id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `add_time` datetime DEFAULT NULL COMMENT '员工加入时间',
  `manage_type` int DEFAULT NULL COMMENT '管理类型',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `identity_type_id` int DEFAULT NULL COMMENT '身份类型ID',
  `is_delete` int DEFAULT '0' COMMENT '职务状态：0在职 1离职',
  `is_manager` int DEFAULT '0' COMMENT '是否是企业后台管理员：0 不是管理员  1管理员',
  `is_adviser` int DEFAULT '0' COMMENT '是否是顾问:0-不是顾问;1-是顾问',
  `is_store` int DEFAULT '0' COMMENT '是否是门店人员：0 不是门店人员  1是门店人员',
  `sex` tinyint DEFAULT NULL COMMENT '性别：1-男，2-女，0-未知',
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB COMMENT='用户组织关系表';


--
-- Table structure for table `organization_info`
--

DROP TABLE IF EXISTS `organization_info`;

CREATE TABLE `organization_info` (
  `oi_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_name` varchar(120) DEFAULT NULL COMMENT '组织名称',
  `short_name` varchar(30) DEFAULT NULL COMMENT '组织简称',
  `org_address` varchar(100) DEFAULT NULL COMMENT '组织地址',
  `icon` varchar(2000) DEFAULT NULL COMMENT 'app图标',
  `pc_icon` varchar(2000) DEFAULT NULL COMMENT 'pc图标',
  `type_id` bigint DEFAULT NULL COMMENT '分类ID',
  `parent_id` bigint DEFAULT NULL COMMENT '父节点ID',
  `root_id` bigint DEFAULT NULL COMMENT '公司总部id',
  `status` tinyint DEFAULT NULL COMMENT '状态（0正常 1停用）',
  `join_audit_status` tinyint DEFAULT '1' COMMENT '0 开启加入审核   1关闭加入审核',
  `instruction` varchar(255) DEFAULT NULL COMMENT '公司介绍',
  `province_name` varchar(40) DEFAULT NULL COMMENT '省份',
  `city_name` varchar(30) DEFAULT NULL COMMENT '市',
  `area_name` varchar(40) DEFAULT NULL COMMENT '区',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` char(1) DEFAULT NULL COMMENT '是否删除：0 未删除  1已删除',
  `total_num` int DEFAULT '0' COMMENT '总人数',
  `biz_type` tinyint DEFAULT NULL COMMENT '类型：0销售类 1服务类',
  `org_telephone` varchar(16) DEFAULT NULL COMMENT '企业电话',
  `level_num` tinyint DEFAULT NULL COMMENT '级数：从0开始',
  `edit_verify_status` tinyint DEFAULT '1' COMMENT '编辑审核状态：0 审核中    1审核通过  2审核拒绝',
  `edit_verify_remark` varchar(100) DEFAULT '1' COMMENT '编辑审核备注',
  `add_verify_status` tinyint DEFAULT '1' COMMENT '添加审核状态：0 审核中    1审核通过  2审核拒绝',
  `add_verify_remark` varchar(100) DEFAULT '' COMMENT '添加审核备注',
  `content_id` char(24) DEFAULT NULL COMMENT '审核ID',
  PRIMARY KEY (`oi_id`) USING BTREE,
  KEY `org_name` (`org_name`) USING BTREE,
  KEY `root_id` (`root_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3600000000039 COMMENT='机构信息表';


--
-- Table structure for table `organization_position`
--

DROP TABLE IF EXISTS `organization_position`;

CREATE TABLE `organization_position` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_name` varchar(50) DEFAULT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` tinyint NOT NULL COMMENT '状态（0正常 1停用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `identity_type_id` int DEFAULT NULL COMMENT '身份类型id',
  `init_id` bigint DEFAULT NULL COMMENT '初始化ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `object_id` (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154 COMMENT='组织职务表';


--
-- Table structure for table `organization_position_init`
--

DROP TABLE IF EXISTS `organization_position_init`;

CREATE TABLE `organization_position_init` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_name` varchar(50) DEFAULT NULL COMMENT '岗位名称',
  `post_sort` smallint NOT NULL COMMENT '显示顺序',
  `status` tinyint NOT NULL COMMENT '状态（0正常 1停用）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `identity_type_id` int DEFAULT NULL COMMENT '身份类型id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identity_type_id` (`identity_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 COMMENT='组织职务初始化表';


--
-- Table structure for table `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;

CREATE TABLE `user_detail` (
  `user_id` bigint unsigned NOT NULL COMMENT '用户表id，关联用户表主键id',
  `mobile` varchar(16) DEFAULT NULL COMMENT '联系方式',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `idx_user_detail_mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB COMMENT='用户详情表';


--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_id` bigint unsigned NOT NULL COMMENT '私域用户id',
  `telephone` varchar(16) DEFAULT NULL,
  `login_pwd` varchar(128) DEFAULT NULL COMMENT '登录密码',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `user_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别：1-男，2-女，0-未知',
  `real_name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `salt` varchar(64) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态:-1-已注销,0-启用,1-禁用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `idx_user_info_telephone` (`telephone`) USING BTREE
) ENGINE=InnoDB COMMENT='用户信息表';


--
-- Table structure for table `user_info_new`
--

DROP TABLE IF EXISTS `user_info_new`;

CREATE TABLE `user_info_new` (
  `u_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id,数据库自增',
  `user_id` bigint DEFAULT NULL COMMENT '私域用户id',
  `telephone` varchar(32) DEFAULT NULL,
  `login_pwd` varchar(128) DEFAULT NULL COMMENT '登录密码',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐值',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态:-1-已注销,0-启用,1-禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`u_id`) USING BTREE,
  KEY `idx_user_info_telephone` (`telephone`) USING BTREE,
  KEY `idx_user_info_user_id` (`user_id`) USING BTREE,
  KEY `idx_user_info_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB COMMENT='用户信息表';


--
-- Table structure for table `user_login_code`
--

DROP TABLE IF EXISTS `user_login_code`;

CREATE TABLE `user_login_code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL COMMENT '唯一码',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `token` varchar(64) DEFAULT NULL COMMENT '令牌',
  `status` tinyint DEFAULT '0' COMMENT '状态:0未使用;1已扫未确定;2同意;3拒绝;4已超时',
  `hold_time` bigint DEFAULT NULL COMMENT '维持时间',
  `add_time` bigint DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB COMMENT='用户登录表';


--
-- Table structure for table `user_org_member`
--

DROP TABLE IF EXISTS `user_org_member`;

CREATE TABLE `user_org_member` (
  `urm_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `member_no` varchar(32) DEFAULT NULL COMMENT '会员编号',
  `member_status` tinyint DEFAULT NULL COMMENT '会员状态：0-未生效，1-有效，2-已失效',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `member_type` tinyint DEFAULT NULL COMMENT '会员类型：1-mall商城；2-办事大厅',
  `refer_id` bigint DEFAULT NULL COMMENT '参照id，不同类型会员，映射不同ID',
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`urm_id`) USING BTREE,
  KEY `idx_user_org_member_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 COMMENT='用户组织会员表';


--
-- Table structure for table `user_tipoff`
--

DROP TABLE IF EXISTS `user_tipoff`;

CREATE TABLE `user_tipoff` (
  `ut_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `tipoff_user_id` bigint DEFAULT NULL COMMENT '被举报用户ID',
  `tipoff_type_content` varchar(128) DEFAULT NULL COMMENT '举报类型值',
  `supplying_content` varchar(255) DEFAULT NULL COMMENT '补充内容',
  `tipoff_pictures` varchar(1024) DEFAULT NULL COMMENT '举报证据',
  `status` tinyint DEFAULT '1' COMMENT '状态：0-初始化；1-受理中；2-已受理',
  `tipoff_channel_from` varchar(64) DEFAULT NULL COMMENT '举报通道',
  `update_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`ut_id`) USING BTREE,
  KEY `idx_user_tipoff_tipoff_user_id` (`tipoff_user_id`) USING BTREE,
  KEY `idx_user_tipoff_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB COMMENT='用户举报信息表';


--
-- Table structure for table `user_tipoff_type`
--

DROP TABLE IF EXISTS `user_tipoff_type`;

CREATE TABLE `user_tipoff_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '举报类型ID',
  `name` varchar(64) NOT NULL COMMENT '举报类型名称',
  `sort` tinyint(1) NOT NULL DEFAULT '1' COMMENT '排序',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0启用,1禁用)',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(0正常,1禁用)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 COMMENT='用户举报类型';


DROP PROCEDURE IF EXISTS `update_dept_id`;
CREATE PROCEDURE `update_dept_id`()
BEGIN
    DECLARE row_id BIGINT;
    DECLARE n BIGINT default 10000;
    DECLARE done INT;
    DECLARE rs_cursor CURSOR FOR
        SELECT	id FROM	`yzn-user-organization2`.organization_dept;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
    OPEN rs_cursor;
    cursor_loop:LOOP
        FETCH rs_cursor INTO row_id;
        IF done=1 THEN
            leave cursor_loop;
        END IF;
        set n=n+1;
        UPDATE `yzn-user-organization2`.organization_dept SET dept_id = n WHERE id=row_id;
        UPDATE `yzn-user-organization2`.organization_add SET dept_id = n WHERE dept_id=row_id;
        UPDATE `yzn-user-organization2`.organization_employee SET dept_id = n WHERE dept_id=row_id;
        UPDATE `yzn-user-organization2`.organization_dept SET id = n WHERE id=row_id;
    END LOOP cursor_loop;
    CLOSE rs_cursor;
END;

DROP PROCEDURE IF EXISTS `updateOrgLevel`;
CREATE PROCEDURE `updateOrgLevel`()
BEGIN
    DECLARE parentId BIGINT;
    DECLARE parentLevel INT;
    DECLARE orgId BIGINT;
    DECLARE level INT;
    DECLARE temp_level INT;
    DECLARE done INT;
    -- 定义游标
    DECLARE rs_cursor CURSOR FOR
        -- 查询组织列表
        SELECT t1.oi_id as parentId,
               t1.level_num as parentLevel,
               t2.oi_id as orgId,
               t2.level_num as level
        from `yzn-user-organization2`.organization_info AS t1,
             `yzn-user-organization2`.organization_info AS t2
        where t2.parent_id = t1.oi_id ORDER BY t2.create_time;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
    OPEN rs_cursor;
    cursor_loop:LOOP
        FETCH rs_cursor INTO parentId,parentLevel,orgId,level; -- 取数据
        IF done=1 THEN
            leave cursor_loop;
        END IF;
        -- 查询表  父组织级数
        SELECT parentId;
        SELECT orgId;
        -- 更新下级级数
        update `yzn-user-organization2`.organization_info a set a.level_num=(SELECT c.level_num+1 from (SELECT aa.level_num from organization_info aa where aa.oi_id=parentId ) c) where a.oi_id=orgId;
        -- 关闭游标
    END LOOP cursor_loop;
    CLOSE rs_cursor;
END;