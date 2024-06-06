alter table infra_api_access_log
    modify request_params text null comment '请求参数';

alter table infra_api_access_log
    add response_body text null comment '响应结果' after request_params;

alter table infra_api_access_log
    add operate_module varchar(50) null comment '操作模块' after user_agent;

alter table infra_api_access_log
    add operate_name varchar(50) null comment '操作名' after operate_module;

alter table infra_api_access_log
    add operate_type tinyint default 0 null comment '操作分类' after operate_name;