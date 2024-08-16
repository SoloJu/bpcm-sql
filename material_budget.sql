-- ----------------------------
-- Table structure for material_budget
-- ----------------------------
CREATE TABLE `material_budget`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '材料预算编号',
  `project_id` bigint NOT NULL COMMENT '项目部ID',
  `sku_id` bigint NOT NULL COMMENT 'SKU ID',
  `quantity` decimal(24, 6) NOT NULL COMMENT '数量',
  `price` decimal(24, 6) NOT NULL COMMENT '单价',
  `amount` decimal(24, 6) NOT NULL COMMENT '总价',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料预算单';

-- ----------------------------
-- Table structure for material_budget_import
-- ----------------------------
CREATE TABLE `material_budget_import`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '材料预算导入编号',
  `project_id` bigint NOT NULL DEFAULT 0 COMMENT '项目部ID',
  `sku_id` bigint NOT NULL DEFAULT 0 COMMENT 'SKU ID',
  `sku_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '材料名称',
  `sku_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '材料规格',
  `sku_unit` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '材料单位',
  `quantity` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '数量',
  `price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '单价',
  `amount` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '总价',
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `import_notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '导入备注',
  `task_status` tinyint NOT NULL COMMENT '状态:草稿, 执行, 完成, 中止',
  `sheet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'sheet名称',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 1 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料预算导入单';