alter table system_oauth2_access_token
    add user_info varchar(512) not null comment '用户信息' after user_type;