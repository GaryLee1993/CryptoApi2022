use `yzn-third-party`;

--
-- Table structure for table `express_code`
--

DROP TABLE IF EXISTS `express_code`;

CREATE TABLE `express_code` (
  `ec_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `express_company` varchar(255) NOT NULL COMMENT '快递公司名称',
  `code` varchar(255) NOT NULL COMMENT '快递公司编号',
  `sort` int NOT NULL DEFAULT '100' COMMENT '排序',
  `status` int DEFAULT '2' COMMENT '状态：1-启用；2-禁用',
  `telephone` varchar(64) DEFAULT NULL COMMENT '物流公司电话',
  PRIMARY KEY (`ec_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=619 ROW_FORMAT=DYNAMIC;


--
-- Table structure for table `oms_express_info_recording`
--

DROP TABLE IF EXISTS `oms_express_info_recording`;

CREATE TABLE `oms_express_info_recording` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `express_comp_code` varchar(32) NOT NULL COMMENT '物流公司编码',
  `express_no` varchar(32) NOT NULL COMMENT '运单号',
  `express_status` int NOT NULL DEFAULT '0' COMMENT '运单状态0.初始化 1.已发货 2 已签收',
  `express_detail` varchar(4096) NOT NULL COMMENT '物流详情',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态:0-正常;1-失效',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_EXPRESS_INFO_UPDATETIME` (`update_time`) USING BTREE,
  KEY `idx_express_info_express_code_and_no` (`express_comp_code`,`express_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 ROW_FORMAT=DYNAMIC COMMENT='订单-物流信息表';