--------------------主体-------------------------
CREATE TABLE `t_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_name` varchar(64)  DEFAULT NULL COMMENT '名称',
  `user_avatar_url` varchar(256)  DEFAULT NULL COMMENT '头像url',
  `user_gender` int(2) DEFAULT 0 COMMENT '性别 0-未知，1-男性，2-女性';
  `user_age` int(3) DEFAULT 0 COMMENT '年龄';
  `user_sign`varchar(256)  DEFAULT NULL COMMENT '签名',
  `user_class` int(2) DEFAULT 0 COMMENT '等级';
  `user_region`varchar(64)  DEFAULT NULL COMMENT '所在地区',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

CREATE TABLE `t_pet` (
  `pet_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '宠物编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `pet_name` varchar(64)  DEFAULT NULL COMMENT '名称',
  `pet_variety` varchar(64)  DEFAULT NULL COMMENT '品种',
  `pet_avatar_url` varchar(256)  DEFAULT NULL COMMENT '头像url',
  `pet_gender` int(2) DEFAULT 0 COMMENT '性别 0-未知，1-公，2-母';
  `pet_age` int(3) DEFAULT 0 COMMENT '年龄';
  `pet_desc`varchar(256)  DEFAULT NULL COMMENT '描述',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='宠物信息表';

CREATE TABLE `t_user_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `login_way` int(2)  DEFAULT NULL COMMENT '用户登录方式 0-手机号，1-邮箱，2-微信',
  `login_number` varchar(64)  DEFAULT NULL COMMENT '用户登录账号',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录表';
--------------------关系-------------------------
CREATE TABLE `t_follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `follow_id` bigint(20) NOT NULL COMMENT '跟随者编号',
  `follow_name` varchar(64)  DEFAULT NULL COMMENT '跟随者名称',
  `follow_avatar_url` varchar(256)  DEFAULT NULL COMMENT '跟随者头像url',
  `relation_status` int(2) DEFAULT 0 COMMENT '状态 0-关注，1-取关';
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注表';

CREATE TABLE `t_user_view` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `diary_id` bigint(20) NOT NULL COMMENT '日记编号',
  `view_status` int(2) DEFAULT 0 COMMENT '状态 0-已看，1-未看';
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户查看表';

CREATE TABLE `t_user_collect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `diary_id` bigint(20) NOT NULL COMMENT '日记编号',
  `collect_status` int(2) DEFAULT 0 COMMENT '状态 0-已收藏，1-未收藏';
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

CREATE TABLE `t_user_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `diary_id` bigint(20) NOT NULL COMMENT '日记编号',
  `like_status` int(2) DEFAULT 0 COMMENT '状态 0-喜欢，1-不喜欢';
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户喜欢表';

CREATE TABLE `t_user_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `diary_id` bigint(20) NOT NULL COMMENT '日记编号',
  `share_status` int(2) DEFAULT 0 COMMENT '状态 0-已分享，1-未分享';
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户分享表';

CREATE TABLE `t_user_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `diary_id` bigint(20) NOT NULL COMMENT '日记编号',
  `report_type` int(2)  DEFAULT 0 COMMENT '举报类型 0-其他，1-抄袭侵权，2-违反法律法规，3-内容不健康',
  `report_cause` varchar(256)  DEFAULT NULL COMMENT '举报原因',
  `share_status` int(2) DEFAULT 0 COMMENT '状态 0-已举报，1-未举报';
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户举报表';

--------------------日记-------------------------
CREATE TABLE `t_diary` (
  `diary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日记编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物编号',
  `diary_header` varchar(64)  DEFAULT NULL COMMENT '标题',
  `diary_body` varchar(512)  DEFAULT NULL COMMENT '正文',
  `diary_media_url` varchar(512)  DEFAULT NULL COMMENT '媒体url',
  `diary_status` int(2) DEFAULT 0 COMMENT '状态 0-正常，1-删除';
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`diary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日记信息表';

CREATE TABLE `t_diary_comment` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `diary_id` bigint(20) NOT NULL COMMENT '日记编号',
  `comment_body` varchar(256)  DEFAULT NULL COMMENT '评论正文',
  `commenter_id` bigint(20) NOT NULL COMMENT '评论者编号',
  `commenter_avatar` varchar(256)  DEFAULT NULL COMMENT '评论者头像url',
  `comment_status` int(2) DEFAULT 0 COMMENT '状态 0-正常，1-删除';
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日记评论表';

CREATE TABLE `cf_diary_count` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `diary_id` bigint(20) NOT NULL COMMENT '日记编号',
  `comment_count` bigint(20) DEFAULT '0' COMMENT '评论次数',
  `view_count` bigint(20) DEFAULT '0' COMMENT '浏览次数',
  `like_count` bigint(20) DEFAULT '0' COMMENT '点赞次数',
  `collect_count` bigint(20) DEFAULT '0' COMMENT '收藏次数',
  `share_count` bigint(20) DEFAULT '0' COMMENT '分享次数',
  `reward_count` bigint(20) DEFAULT '0' COMMENT '打赏次数',
  `report_count` bigint(20) DEFAULT '0' COMMENT '举报次数',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_name` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日记统计表';


