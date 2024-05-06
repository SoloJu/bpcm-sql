alter table material_rfq_item
    modify quantity decimal(24, 6) not null comment '数量';

alter table material_rfq_quote
    modify price decimal(24, 6) not null comment '单价';

alter table material_rfq_quote
    modify amount decimal(24, 6) not null comment '总价';

alter table material_rfq_quote
    modify tax decimal(24, 6) default 0.000000 not null comment '税率';

alter table material_rfq_quote
    modify tax_amount decimal(24, 6) not null comment '含税总价';


alter table material_order_item
    modify quantity decimal(24, 6) not null comment '数量';

alter table material_order_item
    modify price decimal(24, 6) not null comment '单价';

alter table material_order_item
    modify amount decimal(24, 6) not null comment '总价';

alter table material_order_item
    modify tax decimal(24, 6) default 0.000000 not null comment '税率';

alter table material_order_item
    modify tax_amount decimal(24, 6) not null comment '含税总价';


alter table material_delivery
    modify quantity decimal(24, 6) not null comment '数量';

alter table material_delivery_item
    modify quantity decimal(24, 6) not null comment '数量';


alter table material_budget_item
    modify quantity decimal(24, 6) not null comment '数量';

alter table material_budget_item
    modify price decimal(24, 6) not null comment '单价';

alter table material_budget_item
    modify amount decimal(24, 6) not null comment '总价';