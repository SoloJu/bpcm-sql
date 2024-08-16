# bpcm-sql

20240505, v2.1.0 源码版本的数据库表有变动如下,
```sql
alter table system_oauth2_access_token
    add user_info varchar(512) not null comment '用户信息' after user_type;
```

```sql
alter table infra_api_access_log
    add operate_module varchar(512) not null comment '用户信息' after user_type;
```

菜单导入,
/Users/soloju/workbench/bpcm/bpcm-sql/menuMaterialReceiptImport.sql


20240606, v2.1.0,
源码版本的数据库表有变动, 运行 infra_codegen_column_modify.sql
新增 labor 表两张, 运行 labor.sql
修改material_receipt_import表, 运行 material_receipt_import_modify.sql
新建 劳务成本 菜单目录;
创建 劳务付款方式 字典;
创建 劳务工资 菜单, /Users/soloju/workbench/bpcm/bpcm-sql/menuLaborWages.sql
创建 劳务工资导入 菜单, /Users/soloju/workbench/bpcm/bpcm-sql/menuLaborWagesImport.sql
创建 劳务工资导入, 按钮

---
20240626，材料预算

原material_budget，material_budget_item两张表删除；
新建material_budget，material_budget_import表

运行 `rsync -avz --exclude=.DS_Store /Users/soloju/workbench/bpcm/bpcm-sql/material_budget_modify.sql mep:/app/bpcm-system/mysql-dump/`

新建 材料预算导入 菜单目录; rsync -avz --exclude=.DS_Store /Users/soloju/workbench/bpcm/bpcm-sql/menuMaterialBudgetImport.sql mep:/app/bpcm-system/mysql-dump/


docker cp /app/bpcm-system/mysql-dump/material_budget_modify.sql bpcm-mysql8:/tmp/
docker cp /app/bpcm-system/mysql-dump/menuMaterialBudgetImport.sql bpcm-mysql8:/tmp/

docker exec bpcm-mysql8 bash -c "exec mysql -uroot -psMe0hCwPjx8YD6UEvqnK9cid --default-character-set=utf8mb4 bpcm_boot < /tmp/material_budget_modify.sql"
docker exec bpcm-mysql8 bash -c "exec mysql -uroot -psMe0hCwPjx8YD6UEvqnK9cid --default-character-set=utf8mb4 bpcm_boot < /tmp/menuMaterialBudgetImport.sql"