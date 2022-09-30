USE `yzn-settlement`;

-- ----------------------------
-- Table structure for brand_statistics_day
-- ----------------------------
DROP TABLE IF EXISTS `brand_statistics_day`;
CREATE TABLE `brand_statistics_day`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `settle_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算编号',
  `settle_date` date NULL DEFAULT NULL COMMENT '结算日期',
  `total_amount` bigint NULL DEFAULT 0 COMMENT '商品总金额',
  `discount_amount` bigint NULL DEFAULT 0 COMMENT '优惠金额',
  `actual_amount` bigint NULL DEFAULT 0 COMMENT '实付金额',
  `status` int NULL DEFAULT 1 COMMENT '状态记账中1,待确认2,已确认3',
  `brand_id` bigint NULL DEFAULT NULL COMMENT '品牌编号',
  `brand_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `confirm_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认者编号',
  `confirm_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认者名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `extra` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备用字段',
  `settle_type` int NULL DEFAULT 1 COMMENT '平台收款：1，商家收款：2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '品牌日对账单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brand_statistics_day
-- ----------------------------

-- ----------------------------
-- Table structure for brand_statistics_month
-- ----------------------------
DROP TABLE IF EXISTS `brand_statistics_month`;
CREATE TABLE `brand_statistics_month`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `settle_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算编号',
  `settle_month` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算月份',
  `total_amount` bigint NULL DEFAULT 0 COMMENT '商品总金额',
  `discount_amount` bigint NULL DEFAULT 0 COMMENT '优惠金额',
  `actual_amount` bigint NULL DEFAULT 0 COMMENT '实付金额',
  `status` int NULL DEFAULT 0 COMMENT '状态 记账中1,待确认2,已确认3',
  `brand_id` bigint NULL DEFAULT NULL COMMENT '品牌编号',
  `brand_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `extra` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备用字段',
  `settle_type` int NULL DEFAULT 1 COMMENT '平台收款：1，商家收款：2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '品牌月对账单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brand_statistics_month
-- ----------------------------

-- ----------------------------
-- Table structure for org_statistics_day
-- ----------------------------
DROP TABLE IF EXISTS `org_statistics_day`;
CREATE TABLE `org_statistics_day`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `settle_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算编号',
  `settle_date` date NULL DEFAULT NULL COMMENT '结算日期',
  `total_amount` bigint NULL DEFAULT 0 COMMENT '商品总金额',
  `discount_amount` bigint NULL DEFAULT 0 COMMENT '优惠金额',
  `actual_amount` bigint NULL DEFAULT 0 COMMENT '实付金额',
  `service_charge` bigint NULL DEFAULT 0 COMMENT '服务费',
  `settle_amount` bigint NULL DEFAULT 0 COMMENT '结算金额',
  `status` int NULL DEFAULT 1 COMMENT '状态 记账中1,待确认2,已确认3,结算中4,对账完成5,现金结算0',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `apply_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人编号',
  `apply_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人编号',
  `settle_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `confirm_time` datetime NULL DEFAULT NULL COMMENT '确认时间',
  `confirm_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认者编号',
  `confirm_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认者名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `extra` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备用字段',
  `settle_type` int NULL DEFAULT 1 COMMENT '平台收款：1，商家收款：2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '企业日对账单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of org_statistics_day
-- ----------------------------

-- ----------------------------
-- Table structure for org_statistics_month
-- ----------------------------
DROP TABLE IF EXISTS `org_statistics_month`;
CREATE TABLE `org_statistics_month`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `settle_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算编号',
  `settle_month` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算月份',
  `total_amount` bigint NULL DEFAULT 0 COMMENT '商品总金额',
  `discount_amount` bigint NULL DEFAULT 0 COMMENT '优惠金额',
  `actual_amount` bigint NULL DEFAULT 0 COMMENT '实付金额',
  `status` int NULL DEFAULT NULL COMMENT '状态 记账中1,待确认2,已确认3',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `extra` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备用字段',
  `settle_type` int NULL DEFAULT 1 COMMENT '平台收款：1，商家收款：2',
  `settle_amount` bigint NULL DEFAULT NULL COMMENT '结算金额',
  `service_charge` bigint NULL DEFAULT NULL COMMENT '服务费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '企业月对账单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of org_statistics_month
-- ----------------------------

-- ----------------------------
-- Table structure for pay_order_bill
-- ----------------------------
DROP TABLE IF EXISTS `pay_order_bill`;
CREATE TABLE `pay_order_bill`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mch_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户订单号',
  `user_phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户账户',
  `total_amount` bigint NULL DEFAULT 0 COMMENT '商品总金额',
  `discount_amount` bigint NULL DEFAULT 0 COMMENT '优惠金额',
  `actual_amount` bigint NULL DEFAULT 0 COMMENT '实付金额',
  `store_id` bigint NULL DEFAULT NULL COMMENT '门店编号',
  `store_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '门店名称',
  `brand_id` bigint NULL DEFAULT NULL COMMENT '品牌编号',
  `brand_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `pay_finish_time` datetime NULL DEFAULT NULL COMMENT '支付完成时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `extra` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备用字段',
  `settle_type` int NULL DEFAULT 1 COMMENT '平台收款：1，商家收款：2',
  `pay_type` int NULL DEFAULT NULL COMMENT '支付方式',
  `channel_order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道订单号',
  `platform_order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '平台订单号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '产品支付订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pay_order_bill
-- ----------------------------

-- ----------------------------
-- Table structure for store_statistics_day
-- ----------------------------
DROP TABLE IF EXISTS `store_statistics_day`;
CREATE TABLE `store_statistics_day`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `settle_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算编号',
  `settle_date` date NULL DEFAULT NULL COMMENT '结算日期',
  `total_amount` bigint NULL DEFAULT 0 COMMENT '商品总金额',
  `discount_amount` bigint NULL DEFAULT 0 COMMENT '优惠金额',
  `actual_amount` bigint NULL DEFAULT 0 COMMENT '实付金额',
  `status` int NULL DEFAULT 1 COMMENT '状态 记账中1,待确认2,已确认3',
  `brand_id` bigint NULL DEFAULT NULL COMMENT '品牌编号',
  `brand_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `store_id` bigint NULL DEFAULT NULL COMMENT '门店编号',
  `store_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '门店名称',
  `confirm_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认者编号',
  `confirm_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认者名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `extra` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备用字段',
  `settle_type` int NULL DEFAULT 1 COMMENT '平台收款：1，商家收款：2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '门店日对账单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store_statistics_day
-- ----------------------------

-- ----------------------------
-- Table structure for store_statistics_month
-- ----------------------------
DROP TABLE IF EXISTS `store_statistics_month`;
CREATE TABLE `store_statistics_month`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `settle_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算编号',
  `settle_month` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算月份',
  `total_amount` bigint NULL DEFAULT 0 COMMENT '商品总金额',
  `discount_amount` bigint NULL DEFAULT 0 COMMENT '优惠金额',
  `actual_amount` bigint NULL DEFAULT 0 COMMENT '实付金额',
  `status` int NULL DEFAULT 1 COMMENT '状态 记账中1,待确认2,已确认3',
  `brand_id` bigint NULL DEFAULT NULL COMMENT '品牌编号',
  `brand_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `store_id` bigint NULL DEFAULT NULL COMMENT '门店编号',
  `store_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '门店名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `extra` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备用字段',
  `settle_type` int NULL DEFAULT 1 COMMENT '平台收款：1，商家收款：2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '门店月对账单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store_statistics_month
-- ----------------------------

