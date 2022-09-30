use `yzn-biz-common`;


--
-- Table structure for table `banner_category`
--

DROP TABLE IF EXISTS `banner_category`;

CREATE TABLE `banner_category` (
  `wab_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `topic_type` int DEFAULT NULL COMMENT '主题类型:0—闪屏页，1—广告页，2—引导页，8-首页,9-直播,10-Mall旗舰店Banner，11-Mall 专题Banner,12-品牌；13-分类',
  `topic_name` varchar(64) DEFAULT NULL COMMENT '主题名称',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `every_of_time` int DEFAULT NULL COMMENT '每片展现时间',
  `every_of_freq` int DEFAULT NULL COMMENT '每片展现频率',
  `broadcast_time_total` int DEFAULT NULL COMMENT '视频播放时长',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态：1-开始，2-过期，3-禁用',
  `top_sort` int NOT NULL DEFAULT '1' COMMENT '主题排序:1-升序；2-降序',
  `company_id` bigint DEFAULT NULL COMMENT '公司id',
  `org_name` varchar(64) DEFAULT NULL COMMENT '组织名称',
  `store_id` bigint DEFAULT NULL COMMENT '商铺ID',
  `create_dtm` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dtm` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `app_type` int DEFAULT NULL COMMENT '平台类型：1-APP,2-PC',
  `topic_type_ref_id` bigint DEFAULT NULL COMMENT '主题类型映射业务ID',
  PRIMARY KEY (`wab_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 ROW_FORMAT=DYNAMIC COMMENT='Banner广告页播放主题';


--
-- Table structure for table `banner_category_detail`
--

DROP TABLE IF EXISTS `banner_category_detail`;

CREATE TABLE `banner_category_detail` (
  `wabs_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `wab_id` bigint DEFAULT NULL COMMENT '关联主题表id',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `source_type` int DEFAULT NULL COMMENT '资源类型:1-图片，2-视频',
  `pic_url` varchar(256) DEFAULT NULL COMMENT '图片地址',
  `video_url` varchar(128) DEFAULT NULL COMMENT '视频地址',
  `link_type` int DEFAULT '0' COMMENT '跳转类型:0 表示无跳转、1 活动、2 精彩回顾、3 新闻、4 新鲜事、5 咨询、6 直播、7 网页',
  `link_url` varchar(300) DEFAULT NULL COMMENT '跳转链接',
  `resource_status` int DEFAULT '1' COMMENT '状态：-1-删除,0-审核中, 1-启用,2-禁用',
  `using_type` int DEFAULT NULL COMMENT '使用类型',
  `layout_position` int DEFAULT '0' COMMENT '布局定位：0-中间；10-左边；20-右边；21-右1; 22-右2',
  `show_position` int DEFAULT '1' COMMENT '排序：1-升序；2-降序',
  `create_dtm` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dtm` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `verify_status` int DEFAULT '0' COMMENT '审核状态：0-审核中  1-审核通过 2-审核拒绝',
  `content_id` varchar(64) DEFAULT NULL COMMENT '审核ID',
  `verify_remark` varchar(256) DEFAULT NULL COMMENT '审核备注',
  `verify_step` int DEFAULT '0' COMMENT '审核步数',
  `user_id` bigint DEFAULT NULL COMMENT '发布人ID',
  `user_name` varchar(32) DEFAULT '' COMMENT '发布人',
  PRIMARY KEY (`wabs_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 ROW_FORMAT=DYNAMIC COMMENT='Banner广告页播放主题资源';


--
-- Table structure for table `banner_category_detail_temp`
--

DROP TABLE IF EXISTS `banner_category_detail_temp`;

CREATE TABLE `banner_category_detail_temp` (
  `bcdt_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `wabs_id` bigint DEFAULT NULL COMMENT '关联表category_detail表id',
  `wab_id` bigint DEFAULT NULL COMMENT '关联主题表id',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `source_type` int DEFAULT NULL COMMENT '资源类型:1-图片，2-视频',
  `pic_url` varchar(256) DEFAULT NULL COMMENT '图片地址',
  `video_url` varchar(128) DEFAULT NULL COMMENT '视频地址',
  `link_type` int DEFAULT '0' COMMENT '跳转类型:0 表示无跳转、1 活动、2 精彩回顾、3 新闻、4 新鲜事、5 咨询、6 直播、7 网页',
  `link_url` varchar(300) DEFAULT NULL COMMENT '跳转链接',
  `resource_status` int DEFAULT '1' COMMENT '状态：-1-删除, 1-启用，2-禁用',
  `using_type` int DEFAULT NULL COMMENT '使用类型',
  `layout_position` int DEFAULT '0' COMMENT '布局定位：0-中间；10-左边；20-右边；21-右1; 22-右2',
  `show_position` int DEFAULT '1' COMMENT '排序：1-升序；2-降序',
  `create_dtm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_dtm` datetime DEFAULT NULL COMMENT '更新时间',
  `verify_status` int DEFAULT '0' COMMENT '审核状态：0-审核中  1-审核通过 2-审核拒绝',
  `verify_step` int DEFAULT '1' COMMENT '审核步数',
  `op_type` int DEFAULT '0' COMMENT '0-添加；2-更新；3-删除',
  `user_id` bigint DEFAULT NULL COMMENT '修改用户ID',
  `content_id` varchar(64) DEFAULT NULL COMMENT '审核ID',
  PRIMARY KEY (`bcdt_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='Banner广告页播放主题资源';


--
-- Table structure for table `biz_aduit`
--

DROP TABLE IF EXISTS `biz_aduit`;

CREATE TABLE `biz_aduit` (
  `ba_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `biz_type` int DEFAULT NULL COMMENT '业务类型:1-新闻；2-朋友圈',
  `ref_id` bigint DEFAULT NULL COMMENT '关联审核内容id',
  `current_status` int DEFAULT NULL COMMENT '当前状态',
  `current_aduit_by` varchar(64) DEFAULT NULL COMMENT '当前审核人',
  `total_audit_nodes` int DEFAULT NULL COMMENT '总审核节点数',
  `current_audit_time` datetime DEFAULT NULL COMMENT '当前审核时间',
  `first_audit_time` datetime DEFAULT NULL COMMENT '首次审核时间',
  `last_audit_time` datetime DEFAULT NULL COMMENT '完成审核时间',
  PRIMARY KEY (`ba_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='业务审核表';


--
-- Table structure for table `biz_aduit_detail`
--

DROP TABLE IF EXISTS `biz_aduit_detail`;

CREATE TABLE `biz_aduit_detail` (
  `bad_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `audit_id` bigint DEFAULT NULL COMMENT '关联业务审核表主键id',
  `biz_type` int DEFAULT NULL COMMENT '业务类型:1人员 2直播 3活动 4公告 5主页 6新闻 7时尚分享 8精彩回顾 9视频  10基础信息 11banner 12概况 13金刚区',
  `ref_id` bigint DEFAULT NULL COMMENT '关联审核内容id',
  `sys_user_id` bigint DEFAULT NULL COMMENT 'IF 1-系统用户ID; IF 2-APP 用户',
  `audit_by` varchar(64) DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `status` int DEFAULT NULL COMMENT '审核状态：0审核通过 1审核驳回 2审核拒绝',
  `audit_seq` int DEFAULT NULL COMMENT '审核人序号',
  `audit_comment` varchar(100) DEFAULT NULL COMMENT '审核说明',
  `node_name` varchar(20) DEFAULT NULL COMMENT '节点名称',
  `user_from` int DEFAULT NULL COMMENT '用户来源：1-后台系统用户；2-APP用户',
  PRIMARY KEY (`bad_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='业务审核——详情表';


--
-- Table structure for table `link_share`
--

DROP TABLE IF EXISTS `link_share`;

CREATE TABLE `link_share` (
  `ls_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `biz_type` int DEFAULT NULL COMMENT '业务类型:1-活动; 2-精彩回顾; 3-新闻;4-新鲜事; 5-咨询;6-直播; 7-网页; 10-店铺；11-商品；20-组织；21-校友；30-用户；\r\n            ',
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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '消息内容',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '软删除：0 可用, 1删除',
  `status` int DEFAULT '0' COMMENT '消息状态：0未读，1已读',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=392 ROW_FORMAT=DYNAMIC COMMENT='消息';


--
-- Table structure for table `syn_fail_log`
--

DROP TABLE IF EXISTS `syn_fail_log`;

CREATE TABLE `syn_fail_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_code` varchar(32) DEFAULT NULL COMMENT '组织编码',
  `data_info` text COMMENT '同步数据JSON',
  `status` int DEFAULT NULL COMMENT '状态：10-成功 20-失败-继续同步，30-最终失败-终止同步',
  `syn_url` varchar(512) DEFAULT NULL COMMENT '同步路径',
  `exec_fail_count` int DEFAULT '0' COMMENT '失败执行次数',
  `description` varchar(1024) DEFAULT NULL COMMENT '描述',
  `proj_id` varchar(128) DEFAULT NULL COMMENT '项目标识',
  `servlet_path` varchar(128) DEFAULT NULL COMMENT '访问路径',
  `syn_commu_type` int DEFAULT '1' COMMENT '同步通讯类型：1-http全部路径；2-动态nacos模式',
  `callback_url` varchar(1024) DEFAULT NULL COMMENT '回调URL,格式：projId#servletPath或http://127.0.0.1/update',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1368 ROW_FORMAT=DYNAMIC COMMENT='同步失败记录表';


--
-- Table structure for table `xxl_job_group`
--

DROP TABLE IF EXISTS `xxl_job_group`;

CREATE TABLE `xxl_job_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `xxl_job_info`
--

DROP TABLE IF EXISTS `xxl_job_info`;

CREATE TABLE `xxl_job_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `xxl_job_lock`
--

DROP TABLE IF EXISTS `xxl_job_lock`;

CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `xxl_job_log`
--

DROP TABLE IF EXISTS `xxl_job_log`;

CREATE TABLE `xxl_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `I_trigger_time` (`trigger_time`) USING BTREE,
  KEY `I_handle_code` (`handle_code`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `xxl_job_log_report`
--

DROP TABLE IF EXISTS `xxl_job_log_report`;

CREATE TABLE `xxl_job_log_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `xxl_job_logglue`
--

DROP TABLE IF EXISTS `xxl_job_logglue`;

CREATE TABLE `xxl_job_logglue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `xxl_job_registry`
--

DROP TABLE IF EXISTS `xxl_job_registry`;

CREATE TABLE `xxl_job_registry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `xxl_job_user`
--

DROP TABLE IF EXISTS `xxl_job_user`;

CREATE TABLE `xxl_job_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 ROW_FORMAT=DYNAMIC;