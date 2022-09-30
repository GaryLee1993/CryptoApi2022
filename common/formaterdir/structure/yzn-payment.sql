use `yzn-payment`;

--
-- Table structure for table `pay_config`
--

DROP TABLE IF EXISTS `pay_config`;

CREATE TABLE `pay_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pay_channel` int NOT NULL COMMENT '支付渠道1-微信 2-支付宝',
  `pay_type` int NOT NULL COMMENT '支付类型1-手机支付 2-网页支付',
  `currency` varchar(8) DEFAULT '' COMMENT '结算币种：CNY,eCNY,USD',
  `domain_whitelist` text COMMENT 'array类型（逗号分隔）  域名白名单列表',
  `wx_app_id` varchar(64) DEFAULT '' COMMENT '微信APPID',
  `wx_mch_id` varchar(64) DEFAULT '' COMMENT '微信商户号',
  `wx_key` text COMMENT '微信商户支付密钥',
  `wx_pay_notify_url` varchar(64) DEFAULT '' COMMENT '微信支付异步通知域名',
  `alipay_pubkey` text COMMENT '支付宝公钥',
  `alipay_privatekey` text COMMENT '支付宝私钥',
  `alipay_app_id` varchar(64) DEFAULT '' COMMENT '支付宝appId',
  `alipay_notify_url` varchar(64) DEFAULT '' COMMENT '支付宝异步通知域名',
  `fee_rate` decimal(4,2) DEFAULT NULL COMMENT '费率（‰）',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0-审核中，1-审核通过，2-审核不通过',
  `state` int DEFAULT NULL COMMENT '状态开关0-关闭，1-开启',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(32) DEFAULT '' COMMENT '用户名称',
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_add` int DEFAULT '0' COMMENT '状态0-更新，1-新增',
  `referer` varchar(64) DEFAULT '' COMMENT '微信授权域名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 ROW_FORMAT=DYNAMIC COMMENT='支付参数配置表';


--
-- Table structure for table `pay_config_copy1`
--

DROP TABLE IF EXISTS `pay_config_copy1`;

CREATE TABLE `pay_config_copy1` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `org_name` varchar(128) DEFAULT '' COMMENT '组织名称',
  `pay_channel` int NOT NULL COMMENT '支付渠道1-微信 2-支付宝',
  `pay_type` int NOT NULL COMMENT '支付类型1-手机支付 2-网页支付',
  `currency` varchar(8) DEFAULT '' COMMENT '结算币种：CNY,eCNY,USD',
  `domain_whitelist` varchar(128) DEFAULT '' COMMENT 'array类型（逗号分隔）  域名白名单列表',
  `wx_app_id` varchar(32) DEFAULT '' COMMENT '微信APPID',
  `wx_mch_id` varchar(32) DEFAULT '' COMMENT '微信商户号',
  `wx_key` varchar(32) DEFAULT '' COMMENT '微信商户支付密钥',
  `wx_app_secret` varchar(32) DEFAULT '' COMMENT '微信APP SECRET',
  `alipay_pubkey` varchar(32) DEFAULT '' COMMENT '支付宝公钥',
  `alipay_pid` varchar(32) DEFAULT '' COMMENT '支付宝合作者身份PID',
  `fee_rate` decimal(4,2) DEFAULT NULL COMMENT '费率（‰）',
  `alipay_mch_id` varchar(32) DEFAULT '' COMMENT '支付宝商户号',
  `verify_state` int DEFAULT NULL COMMENT '审核状态0-审核中，1-审核通过，2-审核不通过',
  `state` int DEFAULT NULL COMMENT '状态开关0-关闭，1-开启',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(32) DEFAULT '' COMMENT '用户名称',
  `content_id` varchar(32) DEFAULT '' COMMENT '审核ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB COMMENT='支付参数配置表';


--
-- Table structure for table `pay_order`
--

DROP TABLE IF EXISTS `pay_order`;

CREATE TABLE `pay_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pay_id` varchar(32) DEFAULT '' COMMENT '支付编号id',
  `mch_id` varchar(32) DEFAULT '' COMMENT '商户ID',
  `mch_order_no` varchar(32) DEFAULT '' COMMENT '订单号',
  `channel` int NOT NULL COMMENT '支付渠道：1 = 微信（WX） ，2 = 支付宝(ALIPAY)',
  `type` int NOT NULL COMMENT '支付类型：1 = APP支付（APP），2 = 扫码支付（QR）',
  `currency` varchar(8) DEFAULT 'CNY' COMMENT '结算币种：CNY,eCNY,USD，默认为CNY',
  `amount` int NOT NULL COMMENT '支付金额（单位分）',
  `open_id` varchar(32) DEFAULT '' COMMENT '客户端微信openid',
  `client_ip` varchar(32) DEFAULT '' COMMENT '客户端IP',
  `device` int NOT NULL COMMENT '客户端设备类型：1=ios，2=android，3=pc',
  `redirect_url` text COMMENT 'web客户端支付结果跳转页面URL',
  `product_name` varchar(32) DEFAULT '' COMMENT '商品名称',
  `product_description` varchar(32) DEFAULT '' COMMENT '商品描述信息',
  `org_name` varchar(32) DEFAULT '' COMMENT '企业名称',
  `brand_name` varchar(32) DEFAULT '' COMMENT '品牌名称',
  `store_name` varchar(32) DEFAULT '' COMMENT '门店名称',
  `expire_time` datetime DEFAULT NULL COMMENT '支付过期时间',
  `out_trade_no` varchar(32) DEFAULT '' COMMENT '交易流水号',
  `pay_state` int DEFAULT NULL COMMENT '支付订单状态：1=待支付，2=支付成功，3=支付失败，4=已关闭，5=未支付，6=已撤销（付款码支付），7=用户支付中（付款码支付），8=转入退款，9=未知异常',
  `pay_time` datetime DEFAULT NULL COMMENT '支付回调的支付时间',
  `transaction_id` varchar(32) DEFAULT NULL COMMENT '交易流水号',
  `pay_account` varchar(32) DEFAULT '' COMMENT '支付回调的支付账号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=423 ROW_FORMAT=DYNAMIC COMMENT='支付订单表';
