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
源码版本的数据库表有变动, 运行infra_codegen_column_modify.sql
新增 labor 表两张, 运行 labor.sql
修改material_receipt_import表, 运行material_receipt_import_modify.sql
新建 劳务成本 菜单目录;
创建 劳务付款方式 字典;
创建 劳务工资 菜单, /Users/soloju/workbench/bpcm/bpcm-sql/menuLaborWages.sql
创建 劳务工资导入 菜单, /Users/soloju/workbench/bpcm/bpcm-sql/menuLaborWagesImport.sql
创建 劳务工资导入, 按钮