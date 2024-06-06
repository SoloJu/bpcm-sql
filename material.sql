-- ----------------------------
-- Table structure for material_rfq
-- ----------------------------
CREATE TABLE `material_rfq`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '询价单编号，自增',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '清单流水号,RFQ-8位日期-6位时分秒',
  `category_id` bigint NOT NULL COMMENT '成本材料顶级编号',
  `delivery_date` datetime NOT NULL COMMENT '预计交付日期',
  `sub_type` tinyint NOT NULL COMMENT '分项类型:土建, 装饰,机电,市政,其他',
  `task_status` tinyint NOT NULL COMMENT '状态:草稿, 执行, 完成, 中止',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '询价单说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料询价清单';

-- ----------------------------
-- Table structure for material_rfq_item
-- ----------------------------
CREATE TABLE `material_rfq_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '询价明细编号，自增',
  `rfq_id` bigint NOT NULL COMMENT '询价单id',
  `sku_id` bigint NOT NULL COMMENT '材料SKU id',
  `quantity`  decimal(24, 6) NOT NULL COMMENT '数量',
  `delivery_date` datetime NOT NULL COMMENT '预计交付日期',
  `delivery_place` varchar(64) NOT NULL DEFAULT '本地' COMMENT '预计交付地点',
  `supplier_list` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '供应商ids [112,113]',
  `task_status` tinyint NOT NULL COMMENT '状态:草稿, 执行, 完成, 中止',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '明细说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料询价明细';

-- ----------------------------
-- Table structure for material_rfq_quote
-- ----------------------------
CREATE TABLE `material_rfq_quote`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '报价明细编号，自增',
  `rfq_item_id` bigint NOT NULL COMMENT '询价明细id',
  `price` decimal(24, 6) NOT NULL COMMENT '单价,单位分',
  `amount` decimal(24, 6) NOT NULL COMMENT '总价,单位分',
  `tax` decimal(24, 6) NOT NULL DEFAULT 0 COMMENT '税率,单位是百分之一',
  `tax_amount` decimal(24, 6) NOT NULL COMMENT '含税总价,数量*单价*(100+税率),单位是百分之一',
  `supplier_id` bigint NOT NULL COMMENT '供应商id',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '报价说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料报价明细';

-- ----------------------------
-- Table structure for material_order
-- ----------------------------
CREATE TABLE `material_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单编号，自增',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单流水号,OD-8位日期-6位时分秒',
  `type` tinyint NOT NULL DEFAULT 1 COMMENT '订单类型,招标-1, 直采-2, 补货-3',
  `category_id` bigint NOT NULL COMMENT '成本材料顶级编号',
  `supplier_id` bigint NOT NULL COMMENT '供应商id',
  `delivery_date` datetime NOT NULL COMMENT '交付日期',
  `sub_type` tinyint NOT NULL COMMENT '分项类型:土建, 装饰,机电,市政,其他',
  `task_status` tinyint NOT NULL COMMENT '状态:草稿, 执行, 完成, 中止',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料订单';

-- ----------------------------
-- Table structure for material_order_item
-- ----------------------------
CREATE TABLE `material_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单明细编号，自增',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `sku_id` bigint NOT NULL COMMENT '材料SKU id',
  `quantity` decimal(24, 6) NOT NULL COMMENT '数量',
  `price` decimal(24, 6) NOT NULL COMMENT '单价,单位分',
  `amount` decimal(24, 6) NOT NULL COMMENT '总价,单位分',
  `tax` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '税率,单位是百分之一',
  `tax_amount` decimal(24, 6) NOT NULL COMMENT '含税总价,数量*单价*(100+税率),单位是百分之一',
  `delivery_date` datetime NOT NULL COMMENT '明细交付日期',
  `delivery_place` varchar(64) NOT NULL DEFAULT '本地' COMMENT '明细交付地点',
  `task_status` tinyint NOT NULL COMMENT '状态:草稿, 执行, 完成, 中止',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单明细说明',
  `supplier_id` bigint NOT NULL COMMENT '默认所属订单的供应商id',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料订单明细';

-- ----------------------------
-- Table structure for material_delivery
-- ----------------------------
CREATE TABLE `material_delivery`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分拨单编号，自增',
  `order_item_id` bigint NOT NULL COMMENT '订单明细id',
  `quantity` decimal(24, 6) NOT NULL COMMENT '项目部分拨总量',
  `delivery_date` datetime NOT NULL COMMENT '送货日期',
  `delivery_place` varchar(64) NOT DEFAULT '项目部' COMMENT '送货地点, 默认项目部地点',
  `task_status` tinyint NOT NULL COMMENT '状态:草稿, 执行, 完成, 中止',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分拨说明',
  `project_id` bigint NOT NULL COMMENT '项目部id',
  `supplier_id` bigint NOT NULL COMMENT '默认所属订单明细的供应商id',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料分拨单';

-- ----------------------------
-- Table structure for material_delivery_item
-- ----------------------------
CREATE TABLE `material_delivery_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '入场明细编号，自增',
  `delivery_id` bigint NOT NULL COMMENT '分拨单id',
  `quantity` decimal(24, 6) NOT NULL COMMENT '单次送货数量',
  `received_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '接收日期',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入场明细说明',
  `project_id` bigint NOT NULL COMMENT '默认所属分拨单的项目部id',
  `supplier_id` bigint NOT NULL COMMENT '默认所属分拨单的供应商id',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料入场明细';

-- ----------------------------
-- Table structure for material_receipt
-- ----------------------------
CREATE TABLE `material_receipt`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '材料收货单编号',
  `project_id` bigint NOT NULL COMMENT '项目部ID',
  `sku_id` bigint NOT NULL COMMENT 'SKU ID',
  `quantity` decimal(24, 6) NOT NULL COMMENT '数量',
  `price` decimal(24, 6) NOT NULL COMMENT '单价',
  `amount` decimal(24, 6) NOT NULL COMMENT '总价',
  `tax` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '税率',
  `tax_amount` decimal(24, 6) NOT NULL COMMENT '含税总价',
  `receipt_date` datetime NOT NULL COMMENT '接收日期',
  `supplier_id` bigint NOT NULL COMMENT '供应商ID',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料收货单';

-- ----------------------------
-- Table structure for material_receipt_import
-- ----------------------------
CREATE TABLE `material_receipt_import`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '材料收货单编号',
  `project_id` bigint NOT NULL DEFAULT 0 COMMENT '项目部ID',
  `project_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '项目部名称',
  `sku_id` bigint NOT NULL DEFAULT 0 COMMENT 'SKU ID',
  `sku_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '材料名称',
  `sku_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '材料规格',
  `sku_unit` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '材料单位',
  `quantity` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '数量',
  `price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '单价',
  `amount` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '总价',
  `tax` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '税率',
  `tax_amount` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '含税总价',
  `receipt_date` datetime NOT NULL COMMENT '接收日期',
  `logged_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `supplier_id` bigint NOT NULL DEFAULT 0 COMMENT '供应商ID',
  `supplier_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '供应商名称',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `task_status` tinyint NOT NULL COMMENT '状态:草稿, 执行, 完成, 中止',
  `sheet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'sheet名称',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料收货导入单';