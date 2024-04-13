1. 创建材料收货单
```sql
CREATE TABLE `material_receipt`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '材料收货单编号',
  `project_id` bigint NOT NULL COMMENT '项目部ID',
  `sku_id` bigint NOT NULL COMMENT 'SKU ID',
  `quantity` bigint NOT NULL COMMENT '数量',
  `price` bigint NOT NULL COMMENT '单价',
  `amount` bigint NOT NULL COMMENT '总价',
  `tax` bigint NOT NULL DEFAULT 0 COMMENT '税率',
  `tax_amount` bigint NOT NULL COMMENT '含税总价',
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
```

2. 修改菜单
2.1 创建一级目录`成本目标`
2.2 移动材料预算到`成本目标`, 并改名;
2.3 添加菜单权限;

3. 添加收货单菜单
```sql
-- 菜单 SQL
INSERT INTO system_menu(
    name, permission, type, sort, parent_id,
    path, icon, component, status, component_name
)
VALUES (
    '材料收货单', '', 2, 0, 这里改成上级菜单ID,
    'receipt', '', 'material/receipt/index', 0, 'MaterialReceipt'
);

-- 按钮父菜单ID
-- 暂时只支持 MySQL。如果你是 Oracle、PostgreSQL、SQLServer 的话，需要手动修改 @parentId 的部分的代码
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
INSERT INTO system_menu(
    name, permission, type, sort, parent_id,
    path, icon, component, status
)
VALUES (
    '材料收货单查询', 'material:receipt:query', 3, 1, @parentId,
    '', '', '', 0
);
INSERT INTO system_menu(
    name, permission, type, sort, parent_id,
    path, icon, component, status
)
VALUES (
    '材料收货单创建', 'material:receipt:create', 3, 2, @parentId,
    '', '', '', 0
);
INSERT INTO system_menu(
    name, permission, type, sort, parent_id,
    path, icon, component, status
)
VALUES (
    '材料收货单更新', 'material:receipt:update', 3, 3, @parentId,
    '', '', '', 0
);
INSERT INTO system_menu(
    name, permission, type, sort, parent_id,
    path, icon, component, status
)
VALUES (
    '材料收货单删除', 'material:receipt:delete', 3, 4, @parentId,
    '', '', '', 0
);
INSERT INTO system_menu(
    name, permission, type, sort, parent_id,
    path, icon, component, status
)
VALUES (
    '材料收货单导出', 'material:receipt:export', 3, 5, @parentId,
    '', '', '', 0
);
```