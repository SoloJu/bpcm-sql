alter table material_receipt_import
    modify project_name varchar(256) not null comment '项目部名称';

alter table material_receipt_import
    modify sku_name varchar(256) not null comment '材料名称';

alter table material_receipt_import
    modify sku_type varchar(256) null comment '材料规格';

alter table material_receipt_import
    modify sku_unit varchar(256) not null comment '材料单位';

alter table material_receipt_import
    change logged_time logged_date datetime default CURRENT_TIMESTAMP not null comment '登记日期';

alter table material_receipt_import
    modify supplier_name varchar(256) not null comment '供应商名称';