alter table system_operate_log
    drop column module;

alter table system_operate_log
    drop column name;

alter table system_operate_log
    drop column exts;

alter table system_operate_log
    drop column java_method;

alter table system_operate_log
    drop column java_method_args;

alter table system_operate_log
    drop column start_time;

alter table system_operate_log
    drop column duration;

alter table system_operate_log
    drop column result_code;

alter table system_operate_log
    drop column result_msg;

alter table system_operate_log
    drop column result_data;

alter table system_operate_log
    drop column content;

alter table system_operate_log
    add sub_type varchar(50) not null comment '操作名' after type;

alter table system_operate_log
    add biz_id bigint not null comment '操作数据模块编号' after sub_type;

alter table system_operate_log
    modify type varchar(50) not null comment '操作模块类型';

alter table system_operate_log
    add action varchar(2000) default '' not null comment '操作内容' after biz_id;

alter table system_operate_log
    add extra varchar(2000) default '' not null comment '拓展字段' after action;


