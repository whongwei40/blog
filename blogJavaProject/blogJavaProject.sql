-- 数据库建表脚本
-- 适用 MySQL 8.0+

-- 创建数据库（如果不存在）
CREATE DATABASE IF NOT EXISTS blog_java_project CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE blog_java_project;

-- 用户表
CREATE TABLE IF NOT EXISTS `user` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
  `username` VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
  `password` VARCHAR(100) NOT NULL COMMENT '密码（加密存储）',
  `nickname` VARCHAR(50) NOT NULL COMMENT '昵称',
  `avatar` VARCHAR(255) COMMENT '头像URL',
  `email` VARCHAR(100) UNIQUE COMMENT '邮箱',
  `phone` VARCHAR(20) UNIQUE COMMENT '手机号',
  `role` VARCHAR(20) DEFAULT 'user' COMMENT '角色（admin/user）',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` TINYINT DEFAULT 1 COMMENT '状态（1:正常, 0:禁用）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- 博客表
CREATE TABLE IF NOT EXISTS `blog` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '博客ID',
  `title` VARCHAR(200) NOT NULL COMMENT '标题',
  `content` TEXT NOT NULL COMMENT '内容',
  `summary` VARCHAR(500) COMMENT '摘要',
  `image` VARCHAR(255) COMMENT '封面图片URL',
  `author_id` BIGINT UNSIGNED NOT NULL COMMENT '作者ID',
  `author_name` VARCHAR(50) NOT NULL COMMENT '作者名称',
  `view_count` INT DEFAULT 0 COMMENT '阅读量',
  `like_count` INT DEFAULT 0 COMMENT '点赞数',
  `comment_count` INT DEFAULT 0 COMMENT '评论数',
  `type` VARCHAR(20) DEFAULT 'blog' COMMENT '类型',
  `status` TINYINT DEFAULT 1 COMMENT '状态（1:发布, 0:草稿）',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  INDEX `idx_author_id` (`author_id`),
  INDEX `idx_created_at` (`created_at`),
  INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='博客表';

-- 书籍表
CREATE TABLE IF NOT EXISTS `book` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '书籍ID',
  `title` VARCHAR(200) NOT NULL COMMENT '书名',
  `author` VARCHAR(100) NOT NULL COMMENT '作者',
  `cover` VARCHAR(255) COMMENT '封面图片URL',
  `description` TEXT COMMENT '简介',
  `category` VARCHAR(50) NOT NULL COMMENT '分类',
  `status` VARCHAR(20) NOT NULL COMMENT '状态（连载/完结）',
  `view_count` INT DEFAULT 0 COMMENT '阅读量',
  `like_count` INT DEFAULT 0 COMMENT '点赞数',
  `comment_count` INT DEFAULT 0 COMMENT '评论数',
  `chapter_count` INT DEFAULT 0 COMMENT '章节数',
  `word_count` INT DEFAULT 0 COMMENT '字数',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  INDEX `idx_category` (`category`),
  INDEX `idx_status` (`status`),
  INDEX `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='书籍表';

-- 章节表
CREATE TABLE IF NOT EXISTS `chapter` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '章节ID',
  `book_id` BIGINT UNSIGNED NOT NULL COMMENT '书籍ID',
  `title` VARCHAR(200) NOT NULL COMMENT '章节标题',
  `content` TEXT NOT NULL COMMENT '章节内容',
  `chapter_number` INT NOT NULL COMMENT '章节序号',
  `word_count` INT DEFAULT 0 COMMENT '字数',
  `view_count` INT DEFAULT 0 COMMENT '阅读量',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  INDEX `idx_book_id` (`book_id`),
  INDEX `idx_chapter_number` (`chapter_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='章节表';

-- 评论表
CREATE TABLE IF NOT EXISTS `comment` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '评论ID',
  `target_type` VARCHAR(20) NOT NULL COMMENT '目标类型（blog/book）',
  `target_id` BIGINT UNSIGNED NOT NULL COMMENT '目标ID（博客ID/书籍ID）',
  `user_id` BIGINT UNSIGNED NOT NULL COMMENT '用户ID',
  `user_name` VARCHAR(50) NOT NULL COMMENT '用户名',
  `content` TEXT NOT NULL COMMENT '评论内容',
  `parent_id` BIGINT UNSIGNED COMMENT '父评论ID（用于回复）',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` TINYINT DEFAULT 1 COMMENT '状态（1:正常, 0:禁用）',
  INDEX `idx_target_type_target_id` (`target_type`, `target_id`),
  INDEX `idx_user_id` (`user_id`),
  INDEX `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论表';

-- 点赞表
CREATE TABLE IF NOT EXISTS `like` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '点赞ID',
  `target_type` VARCHAR(20) NOT NULL COMMENT '目标类型（blog/book/comment）',
  `target_id` BIGINT UNSIGNED NOT NULL COMMENT '目标ID',
  `user_id` BIGINT UNSIGNED NOT NULL COMMENT '用户ID',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  UNIQUE INDEX `uk_user_target` (`user_id`, `target_type`, `target_id`),
  INDEX `idx_target_type_target_id` (`target_type`, `target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='点赞表';

-- 标签表
CREATE TABLE IF NOT EXISTS `tag` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '标签ID',
  `name` VARCHAR(50) NOT NULL UNIQUE COMMENT '标签名称',
  `color` VARCHAR(20) DEFAULT '#42b983' COMMENT '标签颜色',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='标签表';

-- 博客标签关联表
CREATE TABLE IF NOT EXISTS `blog_tag` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'ID',
  `blog_id` BIGINT UNSIGNED NOT NULL COMMENT '博客ID',
  `tag_id` BIGINT UNSIGNED NOT NULL COMMENT '标签ID',
  UNIQUE INDEX `uk_blog_tag` (`blog_id`, `tag_id`),
  INDEX `idx_blog_id` (`blog_id`),
  INDEX `idx_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='博客标签关联表';

-- 书籍标签关联表
CREATE TABLE IF NOT EXISTS `book_tag` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'ID',
  `book_id` BIGINT UNSIGNED NOT NULL COMMENT '书籍ID',
  `tag_id` BIGINT UNSIGNED NOT NULL COMMENT '标签ID',
  UNIQUE INDEX `uk_book_tag` (`book_id`, `tag_id`),
  INDEX `idx_book_id` (`book_id`),
  INDEX `idx_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='书籍标签关联表';

-- 初始化数据
-- 插入默认用户
INSERT INTO `user` (`username`, `password`, `nickname`, `role`) VALUES 
('admin', '123456', '管理员', 'admin'),
('user1', '123456', '用户1', 'user'),
('user2', '123456', '用户2', 'user');

-- 插入默认标签
INSERT INTO `tag` (`name`, `color`) VALUES 
('前端', '#1890ff'),
('后端', '#52c41a'),
('算法', '#faad14'),
('数据库', '#f5222d'),
('Java', '#722ed1'),
('Vue', '#3fb27f'),
('Spring Boot', '#61dafb'),
('MySQL', '#00758f'),
('玄幻', '#ff4d4f'),
('都市', '#ffa940'),
('科幻', '#1890ff'),
('历史', '#52c41a'),
('仙侠', '#eb2f96');

-- 插入默认博客
INSERT INTO `blog` (`title`, `content`, `summary`, `image`, `author_id`, `author_name`, `type`) VALUES 
('Vue 3 学习心得', 'Vue 3 带来了很多新特性，如 Composition API、Teleport、Suspense 等，这些特性让我们的开发更加高效和灵活。在本文中，我将详细介绍这些新特性的使用方法和最佳实践。', 'Vue 3 新特性详解', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=Vue%203%20tutorial%20blog%20post%20cover%20image&image_size=landscape_16_9', 1, '管理员', 'blog'),
('推荐几本技术书籍', '推荐几本最近读的技术书籍，涵盖前端和后端开发。这些书籍内容深入浅出，非常适合不同水平的开发者阅读。', '技术书籍推荐', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=programming%20books%20stack&image_size=landscape_16_9', 2, '用户1', 'blog'),
('前端开发未来趋势', '讨论一下前端开发的未来趋势，大家有什么看法？随着人工智能和WebAssembly的发展，前端开发的技术栈和工具链正在发生深刻的变化。', '前端技术趋势分析', NULL, 3, '用户2', 'blog'),
('开发效率工具分享', '分享一个自己开发的小工具，提高开发效率。这个工具可以帮助我们自动生成代码模板，减少重复工作，让我们专注于核心业务逻辑的开发。', '开发工具推荐', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=developer%20tool%20interface&image_size=landscape_16_9', 1, '管理员', 'blog');

-- 插入默认书籍
INSERT INTO `book` (`title`, `author`, `cover`, `description`, `category`, `status`, `chapter_count`) VALUES 
('星辰变', '我吃西红柿', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=fantasy%20novel%20cover%20stars%20galaxy&image_size=portrait_3_4', '一名孩童无法修炼内功。为了得到父亲的重视证明自己，独自踏上历练之路……', '玄幻', '完结', 320),
('庆余年', '猫腻', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=historical%20novel%20cover%20ancient%20chinese%20palace&image_size=portrait_3_4', '一个年轻的病人，因为一次意外，来到了冰与火的世界，开始了一段传奇之旅……', '历史', '完结', 450),
('全职高手', '蝴蝶蓝', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=esports%20novel%20cover%20gaming&image_size=portrait_3_4', '网游荣耀中被誉为教科书级别的顶尖高手叶修，因为种种原因遭到俱乐部的驱逐……', '都市', '完结', 535),
('三体', '刘慈欣', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=science%20fiction%20novel%20cover%20space%20galaxy&image_size=portrait_3_4', '文化大革命期间，天文学家叶文洁被发送到红岸基地，偶然发现了来自外星文明的信号……', '科幻', '完结', 280),
('完美世界', '辰东', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=xianxia%20novel%20cover%20immortal%20warrior&image_size=portrait_3_4', '一粒尘可填海，一株草斩尽日月星辰，弹指间天翻地覆。群雄并起，万族林立……', '玄幻', '连载', 680),
('大王饶命', '会说话的肘子', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=urban%20novel%20cover%20supernatural%20powers&image_size=portrait_3_4', '灵气复苏的时代，吕小树捡到了一本毒鸡汤，从此开启了不一样的人生……', '都市', '完结', 420);

-- 插入默认章节
INSERT INTO `chapter` (`book_id`, `title`, `content`, `chapter_number`) VALUES 
(1, '第一章 秦羽', '秦羽，一个无法修炼内功的孩童，为了得到父亲的重视，开始了艰苦的修炼之路。', 1),
(1, '第二章 决心', '秦羽下定决心，一定要成为强者，保护自己所爱的人。', 2),
(2, '第一章 楔子', '一个年轻的病人，在医院中醒来，发现自己穿越到了一个陌生的世界。', 1),
(2, '第二章 范建', '主角遇到了范建，开始了解这个世界的规则。', 2),
(3, '第一章 被驱逐', '叶修被俱乐部驱逐，开始了新的职业生涯。', 1),
(3, '第二章 兴欣网吧', '叶修来到兴欣网吧，开始了新的挑战。', 2),
(4, '第一章 科学的边界', '叶文洁在红岸基地的工作开始了。', 1),
(4, '第二章 红岸基地', '叶文洁偶然发现了来自外星文明的信号。', 2),
(5, '第一章 雨夜', '石昊在雨夜中出生，开始了他的传奇人生。', 1),
(5, '第二章 石村', '石昊被石村的人收养，开始了新的生活。', 2),
(6, '第一章 毒鸡汤', '吕小树捡到了一本毒鸡汤，从此开启了不一样的人生。', 1),
(6, '第二章 吕小树', '吕小树开始了他的修炼之路。', 2);

-- 插入博客标签关联
INSERT INTO `blog_tag` (`blog_id`, `tag_id`) VALUES 
(1, 6),
(1, 1),
(2, 8),
(2, 2),
(3, 1),
(3, 4),
(4, 2),
(4, 5);

-- 插入书籍标签关联
INSERT INTO `book_tag` (`book_id`, `tag_id`) VALUES 
(1, 9),
(1, 12),
(2, 12),
(3, 10),
(4, 11),
(5, 9),
(6, 10);

-- 插入评论
INSERT INTO `comment` (`target_type`, `target_id`, `user_id`, `user_name`, `content`) VALUES 
('blog', 1, 2, '用户1', '这篇文章写得真好，学到了很多！'),
('blog', 1, 3, '用户2', '感谢分享，期待更多优质内容！'),
('book', 1, 2, '用户1', '这本书非常好看，推荐给大家！'),
('book', 4, 3, '用户2', '刘慈欣的作品总是那么引人深思。');

-- 插入点赞
INSERT INTO `like` (`target_type`, `target_id`, `user_id`) VALUES 
('blog', 1, 2),
('blog', 1, 3),
('book', 1, 2),
('book', 4, 3),
('comment', 1, 3),
('comment', 3, 2);

-- 更新统计数据
UPDATE `blog` SET `like_count` = (SELECT COUNT(*) FROM `like` WHERE `target_type` = 'blog' AND `target_id` = `blog`.`id`), 
`comment_count` = (SELECT COUNT(*) FROM `comment` WHERE `target_type` = 'blog' AND `target_id` = `blog`.`id`) WHERE 1;

UPDATE `book` SET `like_count` = (SELECT COUNT(*) FROM `like` WHERE `target_type` = 'book' AND `target_id` = `book`.`id`), 
`comment_count` = (SELECT COUNT(*) FROM `comment` WHERE `target_type` = 'book' AND `target_id` = `book`.`id`) WHERE 1;

COMMIT;

-- 查看表结构
SHOW TABLES;

-- 查看表数据
SELECT 'User Count:' AS Info, COUNT(*) FROM `user` UNION ALL
SELECT 'Blog Count:', COUNT(*) FROM `blog` UNION ALL
SELECT 'Book Count:', COUNT(*) FROM `book` UNION ALL
SELECT 'Chapter Count:', COUNT(*) FROM `chapter` UNION ALL
SELECT 'Comment Count:', COUNT(*) FROM `comment` UNION ALL
SELECT 'Like Count:', COUNT(*) FROM `like` UNION ALL
SELECT 'Tag Count:', COUNT(*) FROM `tag`;