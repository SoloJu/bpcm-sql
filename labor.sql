-- ----------------------------
-- Table structure for labor_wages
-- ----------------------------
CREATE TABLE `labor_wages`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `logged_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `team` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班组',
  `amount` decimal(24, 6) NOT NULL COMMENT '金额',
  `tax` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '税率',
  `tax_amount` decimal(24, 6) NOT NULL COMMENT '含税金额',
  `type` tinyint NOT NULL DEFAULT 1 COMMENT '工资类型,实名制-1, 非实名制-2, 点工转账-3, 临设-4',
  `project_id` bigint NOT NULL COMMENT '项目部ID',
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
-- Table structure for labor_wages_import
-- ----------------------------
CREATE TABLE `labor_wages_import`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `logged_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `team` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班组',
  `amount` decimal(24, 6) NOT NULL COMMENT '金额',
  `tax` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '税率',
  `tax_amount` decimal(24, 6) NOT NULL COMMENT '含税金额',
  `type` tinyint NOT NULL DEFAULT 1 COMMENT '工资类型,实名制-1, 非实名制-2, 点工转账-3, 临设-4',
  `project_id` bigint NOT NULL COMMENT '项目部ID',
  `project_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '项目部名称',
  `supplier_id` bigint NOT NULL COMMENT '供应商ID',
  `supplier_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '供应商名称',
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
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '材料收货导入单';