use `yzn-biz-cms`;


--
-- Table structure for table `activity_background`
--

DROP TABLE IF EXISTS `activity_background`;

CREATE TABLE `activity_background` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `path` varchar(1000) DEFAULT NULL COMMENT '路径',
  `is_top` int DEFAULT NULL COMMENT '是否置顶 0是1否',
  `status` int DEFAULT NULL COMMENT '状态 0有效 1无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `content_id` varchar(32) DEFAULT NULL COMMENT '审核ID',
  `verify_status` tinyint DEFAULT '0' COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 ROW_FORMAT=DYNAMIC COMMENT='活动背景图表';


--
-- Table structure for table `activity_cancel`
--

DROP TABLE IF EXISTS `activity_cancel`;

CREATE TABLE `activity_cancel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `act_id` bigint DEFAULT NULL COMMENT '活动ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `status` int DEFAULT NULL COMMENT '状态0有效1无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='活动取消表';


--
-- Table structure for table `activity_info`
--

DROP TABLE IF EXISTS `activity_info`;

CREATE TABLE `activity_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `root_id` bigint DEFAULT NULL COMMENT '最大组织id',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `org_name` varchar(128) DEFAULT NULL COMMENT '组织名称',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `type` varchar(32) DEFAULT NULL COMMENT '类型、对应学校、公司',
  `activity_name` varchar(128) DEFAULT NULL COMMENT '活动名称',
  `activity_background_img` varchar(1024) DEFAULT NULL COMMENT '活动背景图',
  `activity_address` varchar(256) DEFAULT NULL COMMENT '活动地址',
  `registration_end_time` datetime DEFAULT NULL COMMENT '报名截止日期',
  `cancellation_time` datetime DEFAULT NULL COMMENT '报名取消时间',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `total` int DEFAULT NULL COMMENT '活动可报名人数',
  `enrollment` int DEFAULT NULL COMMENT '活动报名人数',
  `number_peers` int DEFAULT NULL COMMENT '同行人数',
  `contacts` varchar(32) DEFAULT NULL COMMENT '联系人',
  `contacts_number` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `activity_describe` text COMMENT '活动详情',
  `annex` text COMMENT '附件',
  `text_html` text COMMENT '前端使用活动详情',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0表示审核中、1表示审核成功、2表示审核失败',
  `verify_step` int DEFAULT NULL COMMENT '审核步骤',
  `remark` varchar(512) DEFAULT NULL COMMENT '审核备注',
  `is_top` int DEFAULT NULL COMMENT '是置顶、1是不置顶',
  `is_end` int DEFAULT NULL COMMENT '活动是否结束0表示已结束、1表示未结束',
  `is_cancel` int DEFAULT NULL COMMENT '活动是否取消0表示已取消、1表示未取消',
  `is_chat` int DEFAULT NULL COMMENT '是否同步到群聊0表示同步、1表示不同步',
  `width` varchar(32) DEFAULT NULL COMMENT '前端使用、屏幕的宽度',
  `group_id` varchar(64) DEFAULT '' COMMENT '讯聊群id',
  `status` int DEFAULT NULL COMMENT '状态0表示有效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  `source` int DEFAULT NULL COMMENT '来源0-APP 1-PC',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=166 ROW_FORMAT=DYNAMIC COMMENT='活动详情表';


--
-- Table structure for table `activity_participate`
--

DROP TABLE IF EXISTS `activity_participate`;

CREATE TABLE `activity_participate` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `act_id` bigint DEFAULT NULL COMMENT '活动ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `contacts` varchar(255) DEFAULT NULL COMMENT '联系人',
  `contacts_number` varchar(32) DEFAULT NULL COMMENT '联系人号码',
  `enrollment` int DEFAULT NULL COMMENT '报名人数',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` int DEFAULT NULL COMMENT '状态0有效1无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 ROW_FORMAT=DYNAMIC COMMENT='活动参与表';


--
-- Table structure for table `activity_review`
--

DROP TABLE IF EXISTS `activity_review`;

CREATE TABLE `activity_review` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `act_id` bigint DEFAULT NULL COMMENT '活动ID',
  `root_id` bigint DEFAULT NULL COMMENT '最大组织ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `org_name` varchar(128) DEFAULT NULL COMMENT '组织名称',
  `type` varchar(32) DEFAULT NULL COMMENT '类型学校 企业',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `contacts` varchar(32) DEFAULT NULL COMMENT '联系人',
  `title` varchar(128) DEFAULT NULL COMMENT '精彩回顾标题',
  `cover` varchar(1024) DEFAULT NULL COMMENT '精彩回顾封面',
  `content` text COMMENT '内容',
  `verify_step` int DEFAULT NULL COMMENT '审核步骤',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0表示审核中、1表示审核成功、2表示审核失败',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `is_delete` int DEFAULT NULL COMMENT '是否删除0删除 1不删除',
  `is_top` int DEFAULT NULL COMMENT '是否置顶0是1不是',
  `status` int DEFAULT NULL COMMENT '状态0有效1无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `content_id` varchar(45) DEFAULT NULL COMMENT '审核id',
  `source` int DEFAULT NULL COMMENT '来源0-APP 1-PC',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 ROW_FORMAT=DYNAMIC COMMENT='活动精彩回顾';


--
-- Table structure for table `activity_sys_config`
--

DROP TABLE IF EXISTS `activity_sys_config`;

CREATE TABLE `activity_sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `param_key` varchar(32) DEFAULT NULL COMMENT '参数KEY',
  `param_value` varchar(128) DEFAULT NULL COMMENT '参数值',
  `status` int DEFAULT NULL COMMENT '状态 0有效 1无效',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 ROW_FORMAT=DYNAMIC COMMENT='活动配置表';


--
-- Table structure for table `article_praise`
--

DROP TABLE IF EXISTS `article_praise`;

CREATE TABLE `article_praise` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` bigint DEFAULT NULL COMMENT '文单ID',
  `is_praise` int DEFAULT NULL COMMENT '是否点赞',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `is_discuss` int DEFAULT NULL COMMENT '评论状态  0评论过 1没有',
  `is_collection` int DEFAULT NULL COMMENT '收藏状态 0收藏过 1没有',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `category` int DEFAULT NULL COMMENT '类别5新鲜事  6活动  7朋友圈  8资讯',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 ROW_FORMAT=DYNAMIC COMMENT='文章点赞评论记录表';


--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` varchar(32) NOT NULL COMMENT '评论id',
  `answer_id` varchar(32) DEFAULT NULL COMMENT '文章id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `content` varchar(1024) DEFAULT NULL COMMENT '回复内容',
  `zan_number` int DEFAULT NULL COMMENT '赞数量',
  `add_time` datetime DEFAULT NULL COMMENT '评论时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户昵称\r\n',
  `user_image` varchar(1024) DEFAULT NULL COMMENT '用户头像\r\n',
  `state` varchar(2) DEFAULT NULL COMMENT '分类（0家装设计 1软装设计 2精品）\r\n',
  `discuss_number` int DEFAULT NULL COMMENT '评论数',
  `delete_state` int DEFAULT NULL COMMENT '是否删除',
  `use_state` int DEFAULT NULL COMMENT '是否使用0使用 1不使用',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='评论表';


--
-- Table structure for table `comment_relation`
--

DROP TABLE IF EXISTS `comment_relation`;

CREATE TABLE `comment_relation` (
  `id` varchar(32) NOT NULL,
  `zan` int DEFAULT NULL COMMENT '是否点赞0否1是',
  `discuss` int DEFAULT NULL COMMENT '是否评论0否1是',
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='评论关系表';


--
-- Table structure for table `comment_reply`
--

DROP TABLE IF EXISTS `comment_reply`;

CREATE TABLE `comment_reply` (
  `reply_id` varchar(32) NOT NULL COMMENT '回复id',
  `comment_id` varchar(32) DEFAULT NULL COMMENT '评论id',
  `discuss_info_state` int DEFAULT NULL COMMENT '评论信息状态0不显示1显示',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `replyuser_id` bigint DEFAULT NULL COMMENT '回复的那条评论的用户id',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `zan_number` int DEFAULT NULL COMMENT '赞数量',
  `add_time` datetime DEFAULT NULL COMMENT '回复评论时间',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户昵称',
  `user_image` varchar(1024) DEFAULT NULL COMMENT '用户头像',
  `pid` varchar(32) DEFAULT NULL COMMENT '上级id（确认x回复x的关系  用于删除）',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `replyuser_name` varchar(32) DEFAULT NULL COMMENT '回复的那条评论的用户昵称',
  `replyuser_image` varchar(255) DEFAULT NULL COMMENT '回复的那条评论的用户头像',
  `delete_state` int DEFAULT NULL COMMENT '是否删除0否1是',
  `use_state` int DEFAULT NULL COMMENT '使用状态0否1是',
  `state` int DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='评论回复表';


--
-- Table structure for table `content_verify_history`
--

DROP TABLE IF EXISTS `content_verify_history`;

CREATE TABLE `content_verify_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content_id` bigint DEFAULT NULL COMMENT '内容ID',
  `content_type` int DEFAULT NULL COMMENT '内容类型1人员 2直播 3活动 4公告 5主页 6新闻 7时尚分享 8精彩回顾 9视频',
  `verify_step` int DEFAULT NULL COMMENT '审核步骤1一级审核 2二级审核 3三级审核',
  `verify_status` int DEFAULT NULL COMMENT '审核状态0通过1不通过',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='内容审核记录表';


--
-- Table structure for table `copyright`
--

DROP TABLE IF EXISTS `copyright`;

CREATE TABLE `copyright` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `root_id` bigint DEFAULT NULL COMMENT '最大组织ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `org_name` varchar(64) DEFAULT NULL COMMENT '组织名称',
  `type` varchar(32) DEFAULT NULL COMMENT '类型学校、企业',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `copyright` varchar(512) DEFAULT NULL COMMENT '版权文字',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0表示审核中1表示审核成功2表示审核失败',
  `status` int DEFAULT NULL COMMENT '状态0有效1无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 ROW_FORMAT=DYNAMIC COMMENT='版权信息表';


--
-- Table structure for table `introduce`
--

DROP TABLE IF EXISTS `introduce`;

CREATE TABLE `introduce` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classify_id` bigint DEFAULT NULL COMMENT '类型ID',
  `type` varchar(32) DEFAULT NULL COMMENT '学校、企业',
  `content` text COMMENT '内容介绍',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `is_draft` int DEFAULT NULL COMMENT '是否有附件，0是1否',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='概况内容';


--
-- Table structure for table `introduce_draft`
--

DROP TABLE IF EXISTS `introduce_draft`;

CREATE TABLE `introduce_draft` (
  `id` bigint NOT NULL COMMENT '主键',
  `content` text COMMENT '内容介绍',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='概况内容草稿';


--
-- Table structure for table `introduce_name`
--

DROP TABLE IF EXISTS `introduce_name`;

CREATE TABLE `introduce_name` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` bigint DEFAULT NULL COMMENT '类型ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型 企业、学校',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='自我介绍表';


--
-- Table structure for table `introduce_name_draft`
--

DROP TABLE IF EXISTS `introduce_name_draft`;

CREATE TABLE `introduce_name_draft` (
  `id` bigint NOT NULL COMMENT '主键',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型 企业、学校',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `type_id` bigint DEFAULT NULL COMMENT '类型ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='自我介绍草稿表';


--
-- Table structure for table `introduce_son_name`
--

DROP TABLE IF EXISTS `introduce_son_name`;

CREATE TABLE `introduce_son_name` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ito_id` bigint DEFAULT NULL COMMENT '机构ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型 企业、学校',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='下属机构介绍表';


--
-- Table structure for table `introduce_son_name_draft`
--

DROP TABLE IF EXISTS `introduce_son_name_draft`;

CREATE TABLE `introduce_son_name_draft` (
  `id` bigint NOT NULL COMMENT '主键',
  `ito_id` bigint DEFAULT NULL COMMENT '机构ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型 企业、学校',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='下属机构介绍草稿表';


--
-- Table structure for table `leader`
--

DROP TABLE IF EXISTS `leader`;

CREATE TABLE `leader` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型 企业、学校',
  `name` varchar(32) DEFAULT NULL COMMENT '领导名称',
  `post` varchar(32) DEFAULT NULL COMMENT '领导职务',
  `introduction` text COMMENT '自我介始',
  `image` varchar(1024) DEFAULT NULL COMMENT '图片',
  `rank_id` bigint DEFAULT NULL COMMENT '对应领导分类表主键id',
  `sort` int DEFAULT NULL COMMENT '排序',
  `status` int DEFAULT NULL COMMENT '状态0有效 1无效',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `is_draft` int DEFAULT NULL COMMENT '是否有附件0有 1没有',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0表示审核中、1表示审核成功2、表示审核失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='领导分类表';


--
-- Table structure for table `leader_draft`
--

DROP TABLE IF EXISTS `leader_draft`;

CREATE TABLE `leader_draft` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '领导名称',
  `post` varchar(32) DEFAULT NULL COMMENT '领导职务',
  `rank_id` bigint DEFAULT NULL COMMENT '对应领导分类表主键id',
  `introduction` text COMMENT '自我介始',
  `image` varchar(1024) DEFAULT NULL COMMENT '图片',
  `sort` int DEFAULT NULL COMMENT '排序',
  `status` int DEFAULT NULL COMMENT '状态0有效 1无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='领导附件表';


--
-- Table structure for table `link_category`
--

DROP TABLE IF EXISTS `link_category`;

CREATE TABLE `link_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `root_id` bigint DEFAULT NULL COMMENT '最大组织ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `category_name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `org_name` varchar(64) DEFAULT NULL COMMENT '组织名称',
  `sort` int DEFAULT NULL COMMENT '排序',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型学校、企业',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0表示审核中1表示审核成功2表示审核失败',
  `status` int DEFAULT NULL COMMENT '状态0有效1无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 ROW_FORMAT=DYNAMIC COMMENT='链接分类表';


--
-- Table structure for table `link_info`
--

DROP TABLE IF EXISTS `link_info`;

CREATE TABLE `link_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `child_id` bigint DEFAULT NULL COMMENT '子链接ID',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID',
  `link_name` varchar(64) DEFAULT NULL COMMENT '链接名称',
  `link_address` varchar(512) DEFAULT NULL COMMENT '链接地址',
  `is_default` int DEFAULT NULL COMMENT '是否默认0是 1否',
  `sort` int DEFAULT NULL COMMENT '排序',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `status` int DEFAULT NULL COMMENT '状态0有效1无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 ROW_FORMAT=DYNAMIC COMMENT='链接详情表';


--
-- Table structure for table `live_verify`
--

DROP TABLE IF EXISTS `live_verify`;

CREATE TABLE `live_verify` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_id` bigint DEFAULT NULL COMMENT '直播内容ID',
  `theme` varchar(100) DEFAULT NULL COMMENT '主题',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `org_name` varchar(64) DEFAULT NULL COMMENT '企业名称',
  `verify_step` int DEFAULT NULL COMMENT '审核步骤',
  `verify_status` int DEFAULT NULL COMMENT '审核状态0表示审核中、1表示审核成功2、表示审核失败',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `phone` varchar(20) DEFAULT NULL COMMENT '发布人手机号',
  `user_name` varchar(64) DEFAULT NULL COMMENT '发起人',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `content_info` text COMMENT '详情',
  `callback_address` varchar(256) DEFAULT NULL COMMENT '回调接口',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='直播审核记录表';


--
-- Table structure for table `menu_classify`
--

DROP TABLE IF EXISTS `menu_classify`;

CREATE TABLE `menu_classify` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '类型名称',
  `sort` int DEFAULT NULL COMMENT '排序',
  `status` int DEFAULT NULL COMMENT '是否启用0启用1禁用',
  `text_type` varchar(32) DEFAULT NULL COMMENT '内容类型 富文本 rich 列表lead 树形tree',
  `menu_type` int DEFAULT NULL COMMENT '菜单编号 0学校概况 1校友总会  7分会 8商会',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `type` varchar(32) DEFAULT NULL COMMENT '组织类型 对应 校友  企业',
  `classify_explain` varchar(32) DEFAULT NULL COMMENT '分类说明',
  `is_default` int DEFAULT NULL COMMENT '是否为默认 默认得分类不可删除 0默认 1后加的',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0审核中 1成功 2失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='菜单类型表';


--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) DEFAULT NULL COMMENT '消息主体内容',
  `m_type` varchar(45) DEFAULT NULL COMMENT '消息一级分类：1 互动，2系统，3，交易物流',
  `sub_type` varchar(45) DEFAULT NULL COMMENT '二级分类：1.评论 2点赞',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='消息中心-消息存储';


--
-- Table structure for table `my_participate`
--

DROP TABLE IF EXISTS `my_participate`;

CREATE TABLE `my_participate` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int DEFAULT NULL COMMENT '类型 0收藏1点赞 2评论 3分享',
  `category` int DEFAULT NULL COMMENT '分类5新鲜事 6活动 7朋友圈 8资讯  9直播',
  `title` varchar(512) DEFAULT NULL COMMENT '标题',
  `image` varchar(1024) DEFAULT NULL COMMENT '图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `article_id` bigint DEFAULT NULL COMMENT '文章id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=872 ROW_FORMAT=DYNAMIC COMMENT='我的参与表';


--
-- Table structure for table `new_user_self_category`
--

DROP TABLE IF EXISTS `new_user_self_category`;

CREATE TABLE `new_user_self_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_id` bigint DEFAULT NULL COMMENT '新闻ID',
  `sort` int DEFAULT NULL COMMENT '排序',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `is_show` int DEFAULT NULL COMMENT '是否展示0是1否',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `type` varchar(255) DEFAULT NULL COMMENT '组织类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4814 ROW_FORMAT=DYNAMIC COMMENT='用户新闻分类表';


--
-- Table structure for table `news_category`
--

DROP TABLE IF EXISTS `news_category`;

CREATE TABLE `news_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nav_id` bigint DEFAULT NULL COMMENT '新闻分类ID',
  `sort` int DEFAULT NULL COMMENT '排序',
  `type_name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型学校、企业',
  `org_name` varchar(64) DEFAULT NULL COMMENT '组织名称',
  `root_id` bigint DEFAULT NULL COMMENT '最大组织ID',
  `status` int DEFAULT NULL COMMENT '状态0有效1无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operation` int DEFAULT NULL COMMENT '是否默认 0默认 1追加',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 ROW_FORMAT=DYNAMIC COMMENT='新闻分类表';


--
-- Table structure for table `news_info`
--

DROP TABLE IF EXISTS `news_info`;

CREATE TABLE `news_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `is_top` int DEFAULT NULL COMMENT '是否置顶0是1否',
  `source` varchar(128) DEFAULT NULL COMMENT '来源',
  `face_image` varchar(1024) DEFAULT NULL COMMENT '封面',
  `words` text COMMENT '富文本内容',
  `type` varchar(32) DEFAULT NULL COMMENT '类型学校、企业',
  `nav_id` bigint DEFAULT NULL COMMENT '分类ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `root_id` bigint DEFAULT NULL COMMENT '最大组织ID',
  `org_name` varchar(64) DEFAULT NULL COMMENT '组织名称',
  `web_url` varchar(256) DEFAULT NULL COMMENT '页面URL',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0表示审核中、1表示审核成功2、表示审核失败',
  `verify_step` int DEFAULT NULL COMMENT '审核步骤',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `pc_image` varchar(1024) DEFAULT NULL COMMENT '新闻封面',
  `status` int DEFAULT NULL COMMENT '状态0有效 1无效',
  `is_draft` int DEFAULT NULL COMMENT '是否有附件0有 1没有',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `content_id` varchar(45) DEFAULT NULL COMMENT '审核id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 ROW_FORMAT=DYNAMIC COMMENT='新闻详情表';


--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `notice_title` varchar(128) DEFAULT NULL COMMENT '公告标题',
  `notice_content` text COMMENT '公告内容（纯文字）',
  `notice_image` varbinary(1024) DEFAULT NULL COMMENT '公告图片',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `org_name` varchar(64) DEFAULT NULL COMMENT '组织名称',
  `remark` varchar(512) DEFAULT NULL COMMENT '审核备注',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0中 1成功  2失败',
  `verify_step` int DEFAULT NULL COMMENT '审核步骤',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `type` varchar(32) DEFAULT NULL COMMENT '组织类型',
  `root_id` bigint DEFAULT NULL COMMENT '最大组织id',
  `words` varchar(1024) DEFAULT NULL COMMENT '内容',
  `status` int DEFAULT NULL COMMENT '是否启用  0启用 1禁用',
  `is_chat` int DEFAULT NULL COMMENT '是否同步到群聊 0是 1否',
  `url` varchar(256) DEFAULT NULL COMMENT '连接资源',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `url_type` varchar(256) DEFAULT NULL COMMENT '资源跳转类型',
  `link_text` varchar(255) DEFAULT NULL COMMENT '临时文案',
  `link_type` varchar(255) DEFAULT NULL COMMENT '前端使用连接文案',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_top` int DEFAULT NULL COMMENT '是否置顶 0是 1否',
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `novelty_info`
--

DROP TABLE IF EXISTS `novelty_info`;

CREATE TABLE `novelty_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `novelty_content` text COMMENT '新鲜事内容',
  `novelty_image` text COMMENT '新鲜事图片',
  `is_top` int DEFAULT NULL COMMENT '是否置顶0是1否',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `status` int DEFAULT NULL COMMENT '是否有效0是1否',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0表示审核中、1表示审核成功、2表示审核失败',
  `praise_number` int DEFAULT NULL COMMENT '点赞数',
  `discuss_number` int DEFAULT NULL COMMENT '评论数',
  `collection_number` int DEFAULT NULL COMMENT '收藏数',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `file_type` int DEFAULT NULL COMMENT '类型  1 图片 2 视频   3纯文字',
  `type` varchar(10) DEFAULT NULL COMMENT '类型学校、企业',
  `root_id` bigint DEFAULT NULL COMMENT '最大组织ID',
  `org_name` varchar(64) DEFAULT NULL COMMENT '组织名称',
  `view_number` int DEFAULT NULL COMMENT '流览量',
  `is_chat` int DEFAULT NULL COMMENT '是否同步群0是1否',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `frame_image` text COMMENT '第一帧图',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `verify_step` int DEFAULT NULL,
  `content_id` varchar(45) DEFAULT NULL COMMENT '审核内容ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `is_share_public` int DEFAULT '1' COMMENT '是否分享到天天资讯:0是1否',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=202 ROW_FORMAT=DYNAMIC COMMENT='新鲜事详情表';


--
-- Table structure for table `org_general_classify`
--

DROP TABLE IF EXISTS `org_general_classify`;

CREATE TABLE `org_general_classify` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `classify_name` varchar(64) DEFAULT NULL COMMENT '类型名称',
  `content_type` int DEFAULT NULL COMMENT '内容类型 0富文本 1添加人员 2查询分组织 3联系方式',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `is_edit` int DEFAULT NULL COMMENT '是否可以编辑0表示可以、1表示不可以',
  `sort` int DEFAULT NULL COMMENT '排序',
  `status` int DEFAULT NULL COMMENT '状态0启用1禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `content_id` varchar(32) DEFAULT NULL COMMENT '审核ID',
  `verify_status` tinyint DEFAULT '0' COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144 ROW_FORMAT=DYNAMIC COMMENT='企业概况分类表';


--
-- Table structure for table `org_general_content`
--

DROP TABLE IF EXISTS `org_general_content`;

CREATE TABLE `org_general_content` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classify_id` bigint DEFAULT NULL COMMENT '类型ID',
  `p_id` bigint DEFAULT NULL COMMENT '上一个内容ID',
  `title` varchar(256) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `image` varchar(256) DEFAULT NULL COMMENT '图片',
  `status` int DEFAULT NULL COMMENT '状态0启用1禁用',
  `verify_status` tinyint DEFAULT NULL COMMENT '审核状态0审核中1已审核2审核拒绝',
  `dept_name` varchar(64) DEFAULT NULL COMMENT '部门',
  `sub_dept_name` text COMMENT '下属部门,多个用,隔开',
  `contact` text COMMENT '联系方式 多个用,分隔',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `descrip` varchar(15) DEFAULT NULL,
  `verify_step` int DEFAULT NULL COMMENT '审核步骤1一级审核 2二级审核 3三级审核',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 ROW_FORMAT=DYNAMIC COMMENT='企业概况内容表';


--
-- Table structure for table `org_leader_info`
--

DROP TABLE IF EXISTS `org_leader_info`;

CREATE TABLE `org_leader_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `p_id` bigint DEFAULT NULL COMMENT '上一个成员ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `level_id` int DEFAULT NULL COMMENT '对应领导层级表ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `image` varchar(255) DEFAULT NULL COMMENT '头像',
  `position` varchar(32) DEFAULT NULL COMMENT '职务',
  `descrip` varchar(512) DEFAULT NULL COMMENT '描述',
  `sort` int DEFAULT NULL COMMENT '排序',
  `status` int DEFAULT NULL COMMENT '状态0启用1禁用',
  `verify_status` tinyint DEFAULT NULL COMMENT '审核状态0审核中1已审核2审核拒绝',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `verify_step` int DEFAULT NULL COMMENT '审核步骤',
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  `user_name_en` varchar(255) DEFAULT '' COMMENT '英文名',
  `position_en` varchar(32) DEFAULT '' COMMENT '英文职务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 ROW_FORMAT=DYNAMIC COMMENT='组织领导表';


--
-- Table structure for table `org_leader_level`
--

DROP TABLE IF EXISTS `org_leader_level`;

CREATE TABLE `org_leader_level` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classify_id` bigint DEFAULT NULL COMMENT '分类ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `leader_level` varchar(32) DEFAULT NULL COMMENT '领导层级',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `descrip` varchar(150) DEFAULT NULL COMMENT '说明',
  `status` int DEFAULT NULL COMMENT '状态0启用1禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 ROW_FORMAT=DYNAMIC COMMENT='组织领导层级表';


--
-- Table structure for table `org_survey_contact`
--

DROP TABLE IF EXISTS `org_survey_contact`;

CREATE TABLE `org_survey_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classify_id` bigint DEFAULT NULL COMMENT '分类ID',
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `contact` varchar(2048) DEFAULT NULL COMMENT '联系方式',
  `image_path` varchar(256) DEFAULT NULL COMMENT '领导类别',
  `sort` smallint DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `entity_status` tinyint DEFAULT NULL COMMENT '状态0启用1禁用',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_survey_contact_classify_id_IDX` (`classify_id`) USING BTREE,
  KEY `org_survey_contact_user_id_IDX` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 COMMENT='企业概况联系方式表';


--
-- Table structure for table `org_survey_dept`
--

DROP TABLE IF EXISTS `org_survey_dept`;

CREATE TABLE `org_survey_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint DEFAULT NULL COMMENT '上级ID',
  `classify_id` bigint DEFAULT NULL COMMENT '类型ID',
  `dept_name` varchar(64) DEFAULT NULL COMMENT '部门',
  `entity_status` tinyint DEFAULT NULL COMMENT '状态0启用1禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `descrip` varchar(2048) DEFAULT NULL COMMENT '说明',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_survey_dept_classify_id_IDX` (`classify_id`) USING BTREE,
  KEY `org_survey_dept_user_id_IDX` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 COMMENT='企业概况企业部门表';


--
-- Table structure for table `org_survey_person`
--

DROP TABLE IF EXISTS `org_survey_person`;

CREATE TABLE `org_survey_person` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classify_id` bigint DEFAULT NULL COMMENT '类型ID',
  `level_id` bigint DEFAULT NULL COMMENT '领导类别',
  `person_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `person_name_en` varchar(50) DEFAULT NULL COMMENT '英文名',
  `image_path` varchar(255) DEFAULT NULL COMMENT '头像',
  `person_position` varchar(32) DEFAULT NULL COMMENT '职务',
  `person_position_en` varchar(32) DEFAULT NULL COMMENT '英文职务',
  `descrip` varchar(2048) DEFAULT NULL COMMENT '描述',
  `sort` smallint DEFAULT NULL COMMENT '排序',
  `entity_status` tinyint DEFAULT NULL COMMENT '状态0启用1禁用',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_survey_person_classify_id_IDX` (`classify_id`) USING BTREE,
  KEY `org_survey_person_user_id_IDX` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 COMMENT='企业概况组织人员表';


--
-- Table structure for table `org_survey_person_level`
--

DROP TABLE IF EXISTS `org_survey_person_level`;

CREATE TABLE `org_survey_person_level` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `level_name` varchar(32) DEFAULT NULL COMMENT '人员层级',
  `sort` smallint DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `descrip` varchar(200) DEFAULT NULL COMMENT '说明',
  `entity_status` tinyint DEFAULT NULL COMMENT '状态0启用1禁用',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_survey_person_level_user_id_IDX` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 COMMENT='企业概况组织人员层级表';


--
-- Table structure for table `org_survey_richtext`
--

DROP TABLE IF EXISTS `org_survey_richtext`;

CREATE TABLE `org_survey_richtext` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classify_id` bigint DEFAULT NULL COMMENT '类型ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` varchar(2048) DEFAULT NULL COMMENT '内容',
  `image_path` varchar(256) DEFAULT NULL COMMENT '图片',
  `entity_status` tinyint DEFAULT NULL COMMENT '状态0启用1禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_survey_richtext_classify_id_IDX` (`classify_id`) USING BTREE,
  KEY `org_survey_richtext_user_id_IDX` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 COMMENT='企业概况内容表';


--
-- Table structure for table `organization_default_config`
--

DROP TABLE IF EXISTS `organization_default_config`;

CREATE TABLE `organization_default_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `default_img` varchar(256) DEFAULT NULL COMMENT '默认图片',
  `type` varchar(32) DEFAULT NULL COMMENT '类型校友、企业',
  `ports_type` int DEFAULT NULL COMMENT '端口类型0表示App默认logo、1App端默认banner、2表示pc端默认Logo3、表示pc端默认banner4、表示直播默认banner',
  `status` int DEFAULT NULL COMMENT '状态0有效1无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='默认配置表';


--
-- Table structure for table `sensitiveword`
--

DROP TABLE IF EXISTS `sensitiveword`;

CREATE TABLE `sensitiveword` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `word` text COMMENT '敏感词',
  `status` int DEFAULT NULL COMMENT '状态0使用1不使用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='敏感词表';


--
-- Table structure for table `t_sensitiveword`
--

DROP TABLE IF EXISTS `t_sensitiveword`;

CREATE TABLE `t_sensitiveword` (
  `id` int NOT NULL AUTO_INCREMENT,
  `word` text COMMENT '敏感词',
  `user_name` varchar(30) DEFAULT NULL COMMENT '更新用户',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4069 ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `type_config`
--

DROP TABLE IF EXISTS `type_config`;

CREATE TABLE `type_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_type` int DEFAULT NULL COMMENT '分类:0新闻 1资讯 2学校概况',
  `sort` int DEFAULT NULL COMMENT '排序',
  `menu_type` int DEFAULT NULL COMMENT '金刚区菜单类型',
  `text_type` int DEFAULT NULL COMMENT '结构类型0富文本 1列表 2树形',
  `nick_name` varchar(64) DEFAULT NULL COMMENT '昵称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `type` varchar(32) DEFAULT NULL COMMENT '组织类型:学校、企业',
  `state` int DEFAULT NULL COMMENT '是否启用：0是1否',
  `type_name` varchar(32) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='类型配置表';


--
-- Table structure for table `user_collection`
--

DROP TABLE IF EXISTS `user_collection`;

CREATE TABLE `user_collection` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `content_id` bigint DEFAULT NULL COMMENT '资源ID',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `image` varchar(256) DEFAULT NULL COMMENT '缩略图',
  `content_type` int DEFAULT NULL COMMENT '资源类型1人员 2直播 3活动 4公告 5主页 6新闻 7时尚分享 8精彩回顾 9视频'',',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='收藏表';


--
-- Table structure for table `user_comment`
--

DROP TABLE IF EXISTS `user_comment`;

CREATE TABLE `user_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `answer_id` bigint DEFAULT NULL COMMENT '回复ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `praise_number` int DEFAULT NULL COMMENT '点赞数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `category` int DEFAULT NULL COMMENT '分类5新鲜事 6活动 7朋友圈 8资讯  9直播',
  `discuss_number` int DEFAULT NULL COMMENT '评论数',
  `use_state` int DEFAULT NULL COMMENT '使用状态0使用1未使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=273 ROW_FORMAT=DYNAMIC COMMENT='用户评论表';


--
-- Table structure for table `user_comment_relation`
--

DROP TABLE IF EXISTS `user_comment_relation`;

CREATE TABLE `user_comment_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `is_praise` int DEFAULT NULL COMMENT '是否点赞',
  `is_discuss` int DEFAULT NULL COMMENT '回复条数',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `category` int DEFAULT NULL COMMENT '分类5新鲜事 6活动 7朋友圈 8资讯  9直播',
  `comment_id` bigint DEFAULT NULL COMMENT '评论id',
  `type` int DEFAULT NULL COMMENT '状态0表示评论、1表示评论回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 ROW_FORMAT=DYNAMIC COMMENT='评论点赞记录表';


--
-- Table structure for table `user_comment_reply`
--

DROP TABLE IF EXISTS `user_comment_reply`;

CREATE TABLE `user_comment_reply` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comment_id` bigint DEFAULT NULL COMMENT '评论ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `replyuser_id` bigint DEFAULT NULL COMMENT '回复用户的ID',
  `content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `praise_number` int DEFAULT NULL COMMENT '点赞数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `pid` bigint DEFAULT NULL COMMENT '回复那条回复的id',
  `use_state` int DEFAULT NULL COMMENT '使用状态0使用1未使用',
  `category` int DEFAULT NULL COMMENT '分类5新鲜事 6活动 7朋友圈 8资讯 9直播',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=129 ROW_FORMAT=DYNAMIC COMMENT='用户评论回复表';


--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;

CREATE TABLE `user_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `type` varchar(32) DEFAULT NULL COMMENT '组织类型 对应 校友  企业',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `classify_id` bigint DEFAULT NULL COMMENT '类型ID',
  `description` varchar(512) DEFAULT NULL COMMENT '说明',
  `sort` int DEFAULT NULL COMMENT '排序',
  `status` int DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC COMMENT='用户职务表';


--
-- Table structure for table `video_info`
--

DROP TABLE IF EXISTS `video_info`;

CREATE TABLE `video_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '视频主题',
  `url` varchar(255) DEFAULT NULL COMMENT '视频路径',
  `duration` int NOT NULL DEFAULT '0' COMMENT '视频时长，单位秒',
  `first_pic_path` varchar(255) DEFAULT NULL COMMENT '第一帧图片',
  `remark` text COMMENT '简介',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `user_phone` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `org_id` bigint DEFAULT NULL COMMENT '企业ID',
  `org_name` varchar(64) DEFAULT NULL COMMENT '企业名称',
  `root_id` bigint DEFAULT NULL COMMENT '集团ID',
  `status` int DEFAULT '0' COMMENT '是否启用0是1否',
  `top` int DEFAULT '0' COMMENT '是否置顶0是1否',
  `pub_flag` int DEFAULT NULL COMMENT '是否公开0公开1不公开',
  `verify_status` int DEFAULT '0' COMMENT '审核状态0审核中 1审核通过 2驳回 3拒绝',
  `public_status` int DEFAULT '0' COMMENT '发布状态0未发布 1已发布',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `content_id` varchar(64) DEFAULT NULL COMMENT '审核ID',
  `total` bigint DEFAULT '0' COMMENT '观看次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `view_code`
--

DROP TABLE IF EXISTS `view_code`;

CREATE TABLE `view_code` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `root_id` bigint DEFAULT NULL COMMENT '最大组织ID',
  `org_id` bigint DEFAULT NULL COMMENT '组织ID',
  `link_type` int DEFAULT NULL COMMENT '客户端类型:1-app,2-pc',
  `link_one` varchar(32) DEFAULT NULL COMMENT '安卓 or windows',
  `link_two` varchar(32) DEFAULT NULL COMMENT '安卓 or windows',
  `org_name` varchar(64) DEFAULT NULL COMMENT '组织名称',
  `img` varchar(512) DEFAULT NULL COMMENT '图片',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型学校、企业',
  `sort` int DEFAULT NULL COMMENT '排序',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0表示审核中1表示审核成功2表示审核失败',
  `status` int DEFAULT NULL COMMENT '状态0有效1无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 ROW_FORMAT=DYNAMIC COMMENT='二维码信息表';

