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