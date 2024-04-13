-- ----------------------------
-- Table structure for material_budget
-- ----------------------------
CREATE TABLE `material_budget`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '材料预算编号，自增',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '预算流水号,MB-8位日期-6位时分秒',
  `category_id` bigint NOT NULL COMMENT '成本顶级分类编号',
  `project_id` bigint NOT NULL COMMENT '项目id',
  `sub_type` tinyint NOT NULL COMMENT '分项类型:土建,装饰,机电,市政,其他',
  `task_status` tinyint NOT NULL COMMENT '状态:草稿, 执行, 完成, 中止',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '预算说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料预算';

-- ----------------------------
-- Table structure for material_budget_item
-- ----------------------------
CREATE TABLE `material_budget_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '材料预算明细编号，自增',
  `budget_id` bigint NOT NULL COMMENT '预算id',
  `sku_id` bigint NOT NULL COMMENT '材料SKU id',
  `quantity` bigint NOT NULL COMMENT '数量',
  `price` bigint NOT NULL COMMENT '单价,单位分',
  `amount` bigint NOT NULL COMMENT '总价,单位分',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '预算明细说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料预算明细';