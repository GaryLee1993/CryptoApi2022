use `yzn-biz-manager`;


--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='参数配置表';


--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='系统部门表';


--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='字典数据表';


--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='字典类型表';


--
-- Table structure for table `sys_init_config`
--

DROP TABLE IF EXISTS `sys_init_config`;

CREATE TABLE `sys_init_config` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `private_domain` varchar(100) DEFAULT '' COMMENT '私域域名',
  `private_ip` varchar(100) DEFAULT '' COMMENT '私域IP',
  `private_key` varchar(500) DEFAULT '' COMMENT '秘钥',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `user_id` bigint DEFAULT NULL COMMENT '系统管理员用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 ROW_FORMAT=DYNAMIC COMMENT='参数配置表';


--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';


--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `is_work_flow` varchar(20) DEFAULT '1' COMMENT '应用工作流：0  是   1否',
  `menu_key` varchar(30) DEFAULT NULL COMMENT '菜单唯一标识Key',
  `menu_type_json` varchar(50) DEFAULT '[]' COMMENT '菜单分类(如企业菜单、商城菜单)',
  `role_type_json` varchar(50) DEFAULT '[]' COMMENT '角色菜单分类',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE KEY `menu_key` (`menu_key`) USING BTREE,
  KEY `is_work_flow` (`is_work_flow`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2632 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';


--
-- Table structure for table `sys_menu_org`
--

DROP TABLE IF EXISTS `sys_menu_org`;

CREATE TABLE `sys_menu_org` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `is_work_flow` varchar(20) DEFAULT '1' COMMENT '应用工作流：0  是   1否',
  `menu_key` varchar(30) DEFAULT NULL COMMENT '菜单唯一标识Key',
  `menu_type_json` varchar(50) DEFAULT '[]' COMMENT '菜单分类(如企业菜单、商城菜单)',
  `role_type_json` varchar(50) DEFAULT '[]' COMMENT '角色菜单分类',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE KEY `menu_key` (`menu_key`) USING BTREE,
  KEY `is_work_flow` (`is_work_flow`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';


--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='通知公告表';


--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';


--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';


--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色节点ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `role_type` int DEFAULT NULL COMMENT '角色类型: 0 系统管理员  1超级管理员    2编辑员   3审核员  4发布员  5门店管理员 6品牌管理员',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `audit_sort` int DEFAULT NULL COMMENT '审核序号(从1开始) 1审核员 2编辑员  3发布员  0不是审核角色',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `parent_id` bigint DEFAULT '0' COMMENT '父级ID',
  `menu_type` int DEFAULT NULL COMMENT '角色菜单类型：0  企业   1电商',
  `brand_name` varchar(60) DEFAULT NULL COMMENT '角色所属品牌名称',
  `store_name` varchar(60) DEFAULT NULL COMMENT '角色所属店铺名称',
  PRIMARY KEY (`role_id`) USING BTREE,
  KEY `role_type, menu_type` (`role_type`,`menu_type`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';


--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';


--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '用户ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';


--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT '0' COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户姓名',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码(APP注册的用户)',
  `avatar` varchar(2000) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码(加密的)',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `organization_id` bigint DEFAULT NULL COMMENT '根节点组织id(字段无效)',
  `is_reset_pwd` tinyint(1) DEFAULT '1' COMMENT '是否重置密码：0 不重置  1重置 ',
  `app_user_id` bigint DEFAULT NULL COMMENT 'app端用户id(与手机号对应关系)',
  `organisation` varchar(30) DEFAULT '0' COMMENT '所属组织：0 集团  1下属企业  2单一型',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建人id',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `app_dept_id` bigint DEFAULT NULL COMMENT 'app端部门ID(保留字段未用到)',
  `app_dept_name` varchar(20) DEFAULT NULL COMMENT 'app端部门名称(保留字段未用到)',
  `app_post_id` bigint DEFAULT NULL COMMENT 'app端职务ID(保留字段未用到)',
  `app_post_name` varchar(20) DEFAULT NULL COMMENT 'app端职务名称(保留字段未用到)',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID(无效字段)',
  `store_name` varchar(100) DEFAULT NULL COMMENT '店铺名称(无效字段)',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID(无效字段)',
  `brand_name` varchar(50) DEFAULT NULL COMMENT '品牌名称(无效字段)',
  `identity_type_id` bigint DEFAULT NULL COMMENT '管理员-身份类型ID',
  `manage_type` int DEFAULT NULL COMMENT '管理员-管理类型：0 董事会  1监事会  2经理局',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `create_user_id` (`create_user_id`) USING BTREE,
  KEY `app_user_id` (`app_user_id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE,
  KEY `phonenumber` (`phonenumber`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';


--
-- Table structure for table `sys_user_menu`
--

DROP TABLE IF EXISTS `sys_user_menu`;

CREATE TABLE `sys_user_menu` (
  `user_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`user_id`,`menu_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';


--
-- Table structure for table `sys_user_old`
--

DROP TABLE IF EXISTS `sys_user_old`;

CREATE TABLE `sys_user_old` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT '0' COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户姓名',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码(APP注册的用户)',
  `avatar` varchar(2000) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码(加密的)',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `organization_id` bigint DEFAULT NULL COMMENT '根节点组织id(字段无效)',
  `is_reset_pwd` tinyint(1) DEFAULT '1' COMMENT '是否重置密码：0 不重置  1重置 ',
  `app_user_id` bigint DEFAULT NULL COMMENT 'app端用户id(与手机号对应关系)',
  `organisation` varchar(30) DEFAULT '0' COMMENT '所属组织：0 集团  1下属企业  2单一型',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建人id',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `app_dept_id` bigint DEFAULT NULL COMMENT 'app端部门ID(保留字段未用到)',
  `
app_dept_name` varchar(20) DEFAULT NULL COMMENT 'app端部门名称(保留字段未用到)',
  `app_post_id` bigint DEFAULT NULL COMMENT 'app端职务ID(保留字段未用到)',
  `app_post_name` varchar(20) DEFAULT NULL COMMENT 'app端职务名称(保留字段未用到)',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID(无效字段)',
  `store_name` varchar(100) DEFAULT NULL COMMENT '店铺名称(无效字段)',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID(无效字段)',
  `brand_name` varchar(50) DEFAULT NULL COMMENT '品牌名称(无效字段)',
  `identity_type_id` bigint DEFAULT NULL COMMENT '管理员-身份类型ID',
  `manage_type` int DEFAULT NULL COMMENT '管理员-管理类型：0 董事会  1监事会  2经理局',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `create_user_id` (`create_user_id`) USING BTREE,
  KEY `app_user_id` (`app_user_id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE,
  KEY `phonenumber` (`phonenumber`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='用户信息表';


--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';


--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';


--
-- Table structure for table `temp_store`
--

DROP TABLE IF EXISTS `temp_store`;

CREATE TABLE `temp_store` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '店铺ID',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='废弃表';
