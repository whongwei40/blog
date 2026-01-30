-- 数据库初始化脚本
-- 为所有表填充测试数据
-- 适用 MySQL 8.0+

USE blog_java_project;

-- 清空现有数据（可选）
-- TRUNCATE TABLE `like`;
-- TRUNCATE TABLE comment;
-- TRUNCATE TABLE chapter;
-- TRUNCATE TABLE book_tag;
-- TRUNCATE TABLE blog_tag;
-- TRUNCATE TABLE tag;
-- TRUNCATE TABLE book;
-- TRUNCATE TABLE blog;
-- TRUNCATE TABLE user;

-- 插入用户数据
INSERT INTO `user` (`username`, `password`, `nickname`, `avatar`, `email`, `phone`, `role`, `status`, `created_at`, `updated_at`) VALUES 
('admin', '123456', '管理员', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=admin%20avatar%20professional%20portrait&image_size=square', 'admin@example.com', '13800138000', 'admin', 1, NOW(), NOW()),
('user1', '123456', '用户1', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=user%20avatar%20casual%20portrait&image_size=square', 'user1@example.com', '13800138001', 'user', 1, NOW(), NOW()),
('user2', '123456', '用户2', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=user%20avatar%20friendly%20portrait&image_size=square', 'user2@example.com', '13800138002', 'user', 1, NOW(), NOW()),
('author1', '123456', '作者1', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=author%20avatar%20creative%20portrait&image_size=square', 'author1@example.com', '13800138003', 'user', 1, NOW(), NOW()),
('author2', '123456', '作者2', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=author%20avatar%20intellectual%20portrait&image_size=square', 'author2@example.com', '13800138004', 'user', 1, NOW(), NOW());

-- 插入标签数据
INSERT INTO `tag` (`name`, `color`, `created_at`, `updated_at`) VALUES 
('前端', '#1890ff', NOW(), NOW()),
('后端', '#52c41a', NOW(), NOW()),
('算法', '#faad14', NOW(), NOW()),
('数据库', '#f5222d', NOW(), NOW()),
('Java', '#722ed1', NOW(), NOW()),
('Vue', '#3fb27f', NOW(), NOW()),
('Spring Boot', '#61dafb', NOW(), NOW()),
('MySQL', '#00758f', NOW(), NOW()),
('玄幻', '#ff4d4f', NOW(), NOW()),
('都市', '#ffa940', NOW(), NOW()),
('科幻', '#1890ff', NOW(), NOW()),
('历史', '#52c41a', NOW(), NOW()),
('仙侠', '#eb2f96', NOW(), NOW()),
('悬疑', '#fa541c', NOW(), NOW()),
('青春', '#722ed1', NOW(), NOW());

-- 插入博客数据
INSERT INTO `blog` (`title`, `content`, `summary`, `image`, `author_id`, `author_name`, `view_count`, `like_count`, `comment_count`, `type`, `status`, `created_at`, `updated_at`) VALUES 
('Vue 3 学习心得', 'Vue 3 带来了很多新特性，如 Composition API、Teleport、Suspense 等，这些特性让我们的开发更加高效和灵活。在本文中，我将详细介绍这些新特性的使用方法和最佳实践。\n\n## Composition API\nComposition API 是 Vue 3 中最重大的变化之一，它允许我们以函数式的方式组织组件逻辑，解决了 Options API 中逻辑分散的问题。\n\n## Teleport\nTeleport 允许我们将组件的内容渲染到 DOM 中的任何位置，非常适合模态框、通知等场景。\n\n## Suspense\nSuspense 提供了一种优雅的方式来处理异步组件的加载状态。\n\n通过学习这些新特性，我们可以构建更加现代化、高效的 Vue 应用。', 'Vue 3 新特性详解', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=Vue%203%20tutorial%20blog%20post%20cover%20image&image_size=landscape_16_9', 1, '管理员', 120, 15, 5, 'blog', 1, NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 7 DAY),
('Spring Boot 3.0 新特性', 'Spring Boot 3.0 基于 Spring Framework 6.0，带来了很多令人兴奋的新特性。本文将介绍这些新特性及其使用方法。\n\n## Java 17 支持\nSpring Boot 3.0 要求 Java 17 或更高版本，充分利用了 Java 17 的新特性。\n\n## GraalVM 支持\nSpring Boot 3.0 对 GraalVM 原生镜像提供了更好的支持，可以构建更小、启动更快的应用。\n\n## 简化的配置\nSpring Boot 3.0 简化了很多配置，使开发更加便捷。\n\n## 性能改进\nSpring Boot 3.0 在性能方面也有显著提升，特别是在启动时间和内存使用方面。', 'Spring Boot 3.0 特性介绍', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=Spring%20Boot%203.0%20tutorial%20blog%20post%20cover%20image&image_size=landscape_16_9', 1, '管理员', 95, 12, 3, 'blog', 1, NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 6 DAY),
('MySQL 性能优化技巧', 'MySQL 是最流行的关系型数据库之一，但在处理大量数据时，性能优化变得尤为重要。本文将分享一些实用的 MySQL 性能优化技巧。\n\n## 索引优化\n合理的索引设计是提高查询性能的关键。\n\n## 查询优化\n编写高效的 SQL 查询语句，避免全表扫描。\n\n## 服务器配置优化\n根据服务器硬件配置调整 MySQL 参数。\n\n## 分区表\n对于大表，使用分区可以显著提高查询性能。\n\n通过这些优化技巧，我们可以让 MySQL 数据库在高负载下依然保持良好的性能。', 'MySQL 性能调优指南', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=MySQL%20database%20performance%20optimization%20blog%20cover&image_size=landscape_16_9', 4, '作者1', 150, 20, 8, 'blog', 1, NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 5 DAY),
('前端开发未来趋势', '随着技术的不断发展，前端开发也在经历着快速的变化。本文将探讨前端开发的未来趋势。\n\n## WebAssembly\nWebAssembly 将允许我们在浏览器中运行高性能代码，为前端带来更多可能性。\n\n## 人工智能集成\nAI 工具正在改变前端开发方式，从代码生成到用户体验优化。\n\n## 无代码/低代码\n无代码和低代码平台正在兴起，让更多人能够参与到开发中来。\n\n## 响应式设计进化\n响应式设计将更加智能，能够根据设备和用户行为自动调整。\n\n作为前端开发者，我们需要保持学习的态度，跟上技术发展的步伐。', '前端技术发展趋势分析', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=frontend%20development%20future%20trends%20blog%20cover&image_size=landscape_16_9', 5, '作者2', 180, 25, 10, 'blog', 1, NOW() - INTERVAL 4 DAY, NOW() - INTERVAL 4 DAY),
('算法学习方法', '算法是编程的基础，但对于很多开发者来说，算法学习是一个挑战。本文将分享一些有效的算法学习方法。\n\n## 理解基本概念\n掌握算法的基本概念和原理是学习的第一步。\n\n## 分类学习\n将算法按照类型进行分类学习，如排序、搜索、动态规划等。\n\n## 刻意练习\n通过大量的练习来巩固所学知识。\n\n## 分析与优化\n学会分析算法的时间复杂度和空间复杂度，并进行优化。\n\n通过科学的学习方法，我们可以更有效地掌握算法知识，提高编程能力。', '算法学习指南', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=algorithm%20learning%20methods%20blog%20cover&image_size=landscape_16_9', 4, '作者1', 120, 18, 6, 'blog', 1, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 3 DAY),
('微服务架构设计', '微服务架构已经成为现代应用开发的主流架构模式。本文将介绍微服务架构的设计原则和最佳实践。\n\n## 服务拆分\n合理的服务拆分是微服务架构成功的关键。\n\n## 服务通信\n选择合适的服务通信方式，如 REST、gRPC 等。\n\n## 服务发现\n实现服务之间的自动发现机制。\n\n## 容错设计\n设计容错机制，提高系统的可靠性。\n\n## 监控与日志\n建立完善的监控和日志系统，及时发现和解决问题。\n\n通过遵循这些设计原则和最佳实践，我们可以构建更加可靠、可扩展的微服务系统。', '微服务架构实践', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=microservices%20architecture%20design%20blog%20cover&image_size=landscape_16_9', 5, '作者2', 100, 15, 4, 'blog', 1, NOW() - INTERVAL 2 DAY, NOW() - INTERVAL 2 DAY),
('Docker 容器化实践', 'Docker 已经成为容器化的标准工具，本文将介绍 Docker 的基本概念和实践技巧。\n\n## Docker 基础\n了解 Docker 的基本概念，如镜像、容器、仓库等。\n\n## Dockerfile 编写\n编写高效的 Dockerfile，构建优化的容器镜像。\n\n## Docker Compose\n使用 Docker Compose 管理多容器应用。\n\n## 容器编排\n了解 Kubernetes 等容器编排工具。\n\n通过容器化，我们可以实现应用的快速部署、扩展和管理，提高开发和运维效率。', 'Docker 容器技术指南', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=Docker%20containerization%20practice%20blog%20cover&image_size=landscape_16_9', 1, '管理员', 85, 10, 3, 'blog', 1, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY);

-- 插入书籍数据
INSERT INTO `book` (`title`, `author`, `cover`, `description`, `category`, `status`, `view_count`, `like_count`, `comment_count`, `chapter_count`, `word_count`, `created_at`, `updated_at`) VALUES 
('星辰变', '我吃西红柿', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=fantasy%20novel%20cover%20stars%20galaxy%20martial%20arts&image_size=portrait_3_4', '一名孩童无法修炼内功。为了得到父亲的重视证明自己，独自踏上历练之路。在这条路上，他遇到了各种挑战和机遇，逐渐成长为一名强大的武者。\n\n本书讲述了秦羽从一个平凡的孩童成长为宇宙掌控者的传奇故事，情节跌宕起伏，充满想象力。', '玄幻', '完结', 1250000, 12500, 3500, 320, 450000, NOW() - INTERVAL 30 DAY, NOW() - INTERVAL 30 DAY),
('庆余年', '猫腻', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=historical%20novel%20cover%20ancient%20chinese%20palace%20intrigue&image_size=portrait_3_4', '一个年轻的病人，因为一次意外，来到了冰与火的世界，开始了一段传奇之旅。他在这个世界中遇到了各种人物，经历了各种事件，逐渐成长为一名影响时代的人物。\n\n本书融合了历史、武侠、科幻等元素，情节紧凑，人物形象鲜明。', '历史', '完结', 2100000, 21000, 5800, 450, 550000, NOW() - INTERVAL 28 DAY, NOW() - INTERVAL 28 DAY),
('全职高手', '蝴蝶蓝', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=esports%20novel%20cover%20gaming%20competitive%20team&image_size=portrait_3_4', '网游荣耀中被誉为教科书级别的顶尖高手叶修，因为种种原因遭到俱乐部的驱逐。离开职业圈的他，寄身于一家网吧成了一个小小的网管。但是，拥有十年游戏经验的他，在荣耀新开的第十区重新投入了游戏。\n\n本书讲述了叶修重返职业赛场的故事，充满了青春、热血和梦想。', '都市', '完结', 3500000, 35000, 9200, 535, 650000, NOW() - INTERVAL 26 DAY, NOW() - INTERVAL 26 DAY),
('三体', '刘慈欣', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=science%20fiction%20novel%20cover%20space%20galaxy%20alien%20civilization&image_size=portrait_3_4', '文化大革命期间，天文学家叶文洁被发送到红岸基地，偶然发现了来自外星文明的信号。这个发现改变了人类的命运，引发了一系列重大事件。\n\n本书是中国科幻文学的代表作，探讨了人类文明与外星文明的关系，以及宇宙的终极真理。', '科幻', '完结', 1800000, 18000, 4800, 280, 350000, NOW() - INTERVAL 24 DAY, NOW() - INTERVAL 24 DAY),
('完美世界', '辰东', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=xianxia%20novel%20cover%20immortal%20warrior%20mythical%20creatures&image_size=portrait_3_4', '一粒尘可填海，一株草斩尽日月星辰，弹指间天翻地覆。群雄并起，万族林立，诸圣争霸，乱天动地。问苍茫大地，谁主沉浮？\n\n本书讲述了石昊从一个石村的孩子成长为荒天帝的传奇故事，充满了热血和豪情。', '玄幻', '连载', 4200000, 42000, 10500, 680, 800000, NOW() - INTERVAL 22 DAY, NOW() - INTERVAL 22 DAY),
('大王饶命', '会说话的肘子', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=urban%20novel%20cover%20supernatural%20powers%20modern%20city&image_size=portrait_3_4', '灵气复苏的时代，吕小树捡到了一本毒鸡汤，从此开启了不一样的人生。他在这个充满危险和机遇的世界中，依靠自己的智慧和努力，逐渐成长为一名强者。\n\n本书风格轻松幽默，情节紧凑，深受年轻读者喜爱。', '都市', '完结', 2800000, 28000, 7200, 420, 500000, NOW() - INTERVAL 20 DAY, NOW() - INTERVAL 20 DAY),
('雪中悍刀行', '烽火戏诸侯', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=wuxia%20novel%20cover%20snow%20warrior%20ancient%20china&image_size=portrait_3_4', '北凉王世子徐凤年，为逃避做隋珠公主的驸马，在父亲徐骁的安排下，进江湖历练。在这个过程中，他遇到了各种人物，经历了各种事件，逐渐成长为一名真正的强者。\n\n本书融合了武侠、历史、玄幻等元素，文笔优美，情节跌宕起伏。', '仙侠', '完结', 1900000, 19000, 5100, 480, 580000, NOW() - INTERVAL 18 DAY, NOW() - INTERVAL 18 DAY),
('盗墓笔记', '南派三叔', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=mystery%20novel%20cover%20tomb%20raiding%20adventure&image_size=portrait_3_4', '吴邪，一个普通的古董店老板，因为一本笔记，卷入了一个充满谜团的世界。他与张起灵、王胖子等人一起，经历了一系列惊险的盗墓之旅。\n\n本书情节紧凑，充满悬念，是中国悬疑小说的代表作。', '悬疑', '完结', 2300000, 23000, 6300, 360, 420000, NOW() - INTERVAL 16 DAY, NOW() - INTERVAL 16 DAY),
('致我们终将逝去的青春', '辛夷坞', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=youth%20novel%20cover%20college%20romance%20memories&image_size=portrait_3_4', '郑微，一个活泼开朗的女孩，在大学期间遇到了陈孝正，开始了一段刻骨铭心的爱情。但是，现实的压力和个人的选择，让他们的爱情面临着各种挑战。\n\n本书以细腻的笔触描绘了青春的美好与无奈，引起了很多读者的共鸣。', '青春', '完结', 980000, 9800, 2600, 220, 280000, NOW() - INTERVAL 14 DAY, NOW() - INTERVAL 14 DAY),
('球状闪电', '刘慈欣', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=science%20fiction%20novel%20cover%20ball%20lightning%20scientific%20mystery&image_size=portrait_3_4', '陈博士，一个致力于研究球状闪电的科学家，在研究过程中遇到了各种奇怪的现象和挑战。他与林云少校一起，逐渐揭开了球状闪电的神秘面纱。\n\n本书融合了科学与幻想，探讨了物理学的奥秘和人类的命运。', '科幻', '完结', 1100000, 11000, 3000, 180, 250000, NOW() - INTERVAL 12 DAY, NOW() - INTERVAL 12 DAY);

-- 插入章节数据
-- 星辰变章节
INSERT INTO `chapter` (`book_id`, `title`, `content`, `chapter_number`, `word_count`, `view_count`, `created_at`, `updated_at`) VALUES 
(1, '第一章 秦羽', '秦羽，一个无法修炼内功的孩童，为了得到父亲的重视，开始了艰苦的修炼之路。他每天天不亮就起床，坚持锻炼自己的身体，希望能够突破先天不足的限制。\n\n在这个过程中，他遇到了各种困难和挑战，但他从未放弃。他相信，只要努力，就一定能够实现自己的目标。', 1, 1500, 5000, NOW() - INTERVAL 29 DAY, NOW() - INTERVAL 29 DAY),
(1, '第二章 决心', '秦羽下定决心，一定要成为强者，保护自己所爱的人。他开始尝试各种修炼方法，希望能够找到适合自己的道路。\n\n在一次偶然的机会中，他发现了一种特殊的修炼方法，这种方法不需要修炼内功，而是通过锻炼身体来增强实力。', 2, 1600, 4800, NOW() - INTERVAL 29 DAY, NOW() - INTERVAL 29 DAY),
(1, '第三章 修炼', '秦羽开始按照新的方法修炼，他的身体逐渐变得强壮起来。他的父亲看到了他的努力，开始对他刮目相看。\n\n在修炼的过程中，他遇到了一些志同道合的朋友，他们一起努力，共同进步。', 3, 1400, 4500, NOW() - INTERVAL 28 DAY, NOW() - INTERVAL 28 DAY),
(1, '第四章 测试', '秦羽参加了家族的测试，他的表现让所有人都大吃一惊。他的实力已经超过了很多同龄人，甚至一些成年人。\n\n他的父亲为他感到骄傲，开始重视他的培养。秦羽知道，这只是他修炼之路的开始，他还有很长的路要走。', 4, 1500, 4200, NOW() - INTERVAL 28 DAY, NOW() - INTERVAL 28 DAY),
(1, '第五章 机遇', '秦羽在一次探险中，发现了一个神秘的洞穴。在洞穴中，他遇到了一位神秘的老人，这位老人教会了他一些特殊的技能。\n\n这些技能让秦羽的实力得到了质的提升，他开始在家族中崭露头角。', 5, 1600, 4000, NOW() - INTERVAL 27 DAY, NOW() - INTERVAL 27 DAY);

-- 庆余年章节
INSERT INTO `chapter` (`book_id`, `title`, `content`, `chapter_number`, `word_count`, `view_count`, `created_at`, `updated_at`) VALUES 
(2, '第一章 楔子', '一个年轻的病人，在医院中醒来，发现自己穿越到了一个陌生的世界。这个世界充满了危险和机遇，他必须学会适应这个新的环境。\n\n他发现自己变成了一个婴儿，被一个叫做范建的人收养。范建给他取名为范闲，希望他能够平平安安地度过一生。', 1, 1700, 6000, NOW() - INTERVAL 27 DAY, NOW() - INTERVAL 27 DAY),
(2, '第二章 范建', '范闲逐渐长大，他发现范建并不是一个普通的人。范建是庆国的重臣，拥有很高的地位和权力。\n\n范建对范闲非常严厉，但也非常关心他。他希望范闲能够成为一个有用的人，为国家做出贡献。', 2, 1500, 5800, NOW() - INTERVAL 27 DAY, NOW() - INTERVAL 27 DAY),
(2, '第三章 范闲', '范闲开始展现出非凡的智慧和才能，他的学习能力让所有人都感到惊讶。他不仅精通文学，还擅长武术和谋略。\n\n在范建的教导下，范闲逐渐成长为一个全面发展的人才。他开始对这个世界有了更深刻的认识。', 3, 1600, 5500, NOW() - INTERVAL 26 DAY, NOW() - INTERVAL 26 DAY),
(2, '第四章 京都', '范闲被送到京都，开始了他的新生活。在京都，他遇到了各种人物，经历了各种事件。\n\n他发现这个世界充满了尔虞我诈和权力斗争，他必须小心谨慎，才能在这个复杂的环境中生存下去。', 4, 1700, 5200, NOW() - INTERVAL 26 DAY, NOW() - INTERVAL 26 DAY),
(2, '第五章 宫中', '范闲进入宫中，见到了庆帝。庆帝对他非常赏识，开始重用他。\n\n在宫中，范闲遇到了各种挑战和机遇，他的才能得到了充分的展现。他开始逐渐掌握权力，成为庆国的重要人物。', 5, 1600, 5000, NOW() - INTERVAL 25 DAY, NOW() - INTERVAL 25 DAY);

-- 全职高手章节
INSERT INTO `chapter` (`book_id`, `title`, `content`, `chapter_number`, `word_count`, `view_count`, `created_at`, `updated_at`) VALUES 
(3, '第一章 被驱逐', '叶修，荣耀游戏的顶尖高手，因为种种原因遭到俱乐部的驱逐。他离开了职业圈，寄身于一家网吧成了一个小小的网管。\n\n虽然遭遇了挫折，但叶修并没有放弃，他依然热爱着这个游戏，希望有一天能够重返职业赛场。', 1, 1800, 8000, NOW() - INTERVAL 25 DAY, NOW() - INTERVAL 25 DAY),
(3, '第二章 兴欣网吧', '叶修在兴欣网吧开始了他的新生活。他利用空闲时间，在荣耀新开的第十区重新投入了游戏。\n\n在游戏中，他遇到了一些新的玩家，他们一起组队，开始了新的冒险。', 2, 1600, 7800, NOW() - INTERVAL 25 DAY, NOW() - INTERVAL 25 DAY),
(3, '第三章 全新的开始', '叶修开始在第十区建立自己的 reputation。他的技术依然顶尖，很快就在游戏中崭露头角。\n\n他遇到了苏沐橙，一个曾经的队友，现在是其他战队的选手。他们依然保持着联系，互相支持。', 3, 1700, 7500, NOW() - INTERVAL 24 DAY, NOW() - INTERVAL 24 DAY),
(3, '第四章 君莫笑', '叶修创建了一个新的角色，取名为"君莫笑"。这个角色很快就在第十区引起了轰动，因为他的技术实在是太厉害了。\n\n他开始组建自己的公会，希望能够培养一些新的人才，为重返职业赛场做准备。', 4, 1600, 7200, NOW() - INTERVAL 24 DAY, NOW() - INTERVAL 24 DAY),
(3, '第五章 千机伞', '叶修使用了一把特殊的武器——千机伞。这把伞是他和苏沐秋一起设计的，可以变换成各种形态，非常适合他的战斗风格。\n\n千机伞的出现，让叶修在游戏中更加如鱼得水，他的实力得到了充分的展现。', 5, 1700, 7000, NOW() - INTERVAL 23 DAY, NOW() - INTERVAL 23 DAY);

-- 三体章节
INSERT INTO `chapter` (`book_id`, `title`, `content`, `chapter_number`, `word_count`, `view_count`, `created_at`, `updated_at`) VALUES 
(4, '第一章 科学的边界', '叶文洁，一个天文学家，在文化大革命期间遭受了迫害。她被送到红岸基地，开始了她的科研工作。\n\n在基地中，她遇到了一些志同道合的科学家，他们一起致力于探索宇宙的奥秘。', 1, 1900, 6500, NOW() - INTERVAL 23 DAY, NOW() - INTERVAL 23 DAY),
(4, '第二章 红岸基地', '叶文洁在红岸基地的工作非常艰苦，但她从未放弃。她相信，通过自己的努力，一定能够找到外星文明的信号。\n\n在一次偶然的机会中，她发现了一个来自宇宙深处的信号。这个信号改变了她的一生，也改变了人类的命运。', 2, 1700, 6300, NOW() - INTERVAL 23 DAY, NOW() - INTERVAL 23 DAY),
(4, '第三章 地球往事', '叶文洁开始回忆自己的过去，她的家庭在文化大革命中遭受了迫害，她的父亲被批斗致死。这些经历让她对人类文明失去了信心。\n\n她希望通过外星文明的帮助，来改变人类的命运，让人类变得更加理性和和平。', 3, 1800, 6000, NOW() - INTERVAL 22 DAY, NOW() - INTERVAL 22 DAY),
(4, '第四章 黑暗森林', '叶文洁向宇宙发送了一条信息，希望能够联系到外星文明。她不知道，这个决定将会给人类带来怎样的后果。\n\n在等待的过程中，她开始思考宇宙的本质。她意识到，宇宙可能是一个黑暗森林，每个文明都是一个带枪的猎人。', 4, 1700, 5800, NOW() - INTERVAL 22 DAY, NOW() - INTERVAL 22 DAY),
(4, '第五章 死神永生', '叶文洁终于收到了外星文明的回应。这个回应让她既兴奋又害怕，因为她知道，外星文明的到来可能会给人类带来灾难。\n\n她开始组织一个秘密组织，希望能够为人类的未来做准备。她的努力，将在未来的岁月中逐渐显现出来。', 5, 1900, 5500, NOW() - INTERVAL 21 DAY, NOW() - INTERVAL 21 DAY);

-- 插入博客标签关联
INSERT INTO `blog_tag` (`blog_id`, `tag_id`) VALUES 
(1, 6),  -- Vue 3 学习心得 -> Vue
(1, 1),  -- Vue 3 学习心得 -> 前端
(1, 2),  -- Vue 3 学习心得 -> 后端
(2, 7),  -- Spring Boot 3.0 新特性 -> Spring Boot
(2, 2),  -- Spring Boot 3.0 新特性 -> 后端
(2, 5),  -- Spring Boot 3.0 新特性 -> Java
(3, 8),  -- MySQL 性能优化技巧 -> MySQL
(3, 4),  -- MySQL 性能优化技巧 -> 数据库
(3, 3),  -- MySQL 性能优化技巧 -> 算法
(4, 1),  -- 前端开发未来趋势 -> 前端
(4, 6),  -- 前端开发未来趋势 -> Vue
(4, 2),  -- 前端开发未来趋势 -> 后端
(5, 3),  -- 算法学习方法 -> 算法
(5, 2),  -- 算法学习方法 -> 后端
(5, 1),  -- 算法学习方法 -> 前端
(6, 7),  -- 微服务架构设计 -> Spring Boot
(6, 2),  -- 微服务架构设计 -> 后端
(6, 5),  -- 微服务架构设计 -> Java
(7, 2),  -- Docker 容器化实践 -> 后端
(7, 5),  -- Docker 容器化实践 -> Java
(7, 4);  -- Docker 容器化实践 -> 数据库

-- 插入书籍标签关联
INSERT INTO `book_tag` (`book_id`, `tag_id`) VALUES 
(1, 9),   -- 星辰变 -> 玄幻
(1, 12),  -- 星辰变 -> 历史
(2, 12),  -- 庆余年 -> 历史
(2, 14),  -- 庆余年 -> 悬疑
(3, 10),  -- 全职高手 -> 都市
(3, 15),  -- 全职高手 -> 青春
(4, 11),  -- 三体 -> 科幻
(4, 14),  -- 三体 -> 悬疑
(5, 9),   -- 完美世界 -> 玄幻
(5, 13),  -- 完美世界 -> 仙侠
(6, 10),  -- 大王饶命 -> 都市
(6, 15),  -- 大王饶命 -> 青春
(7, 13),  -- 雪中悍刀行 -> 仙侠
(7, 12),  -- 雪中悍刀行 -> 历史
(8, 14),  -- 盗墓笔记 -> 悬疑
(8, 10),  -- 盗墓笔记 -> 都市
(9, 15),  -- 致我们终将逝去的青春 -> 青春
(9, 10),  -- 致我们终将逝去的青春 -> 都市
(10, 11), -- 球状闪电 -> 科幻
(10, 14); -- 球状闪电 -> 悬疑

-- 插入评论数据
INSERT INTO `comment` (`target_type`, `target_id`, `user_id`, `user_name`, `content`, `parent_id`, `status`, `created_at`, `updated_at`) VALUES 
('blog', 1, 2, '用户1', '这篇文章写得真好，学到了很多关于 Vue 3 的知识！', NULL, 1, NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 6 DAY),
('blog', 1, 3, '用户2', '感谢分享，期待更多优质内容！', NULL, 1, NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 6 DAY),
('blog', 1, 4, '作者1', 'Vue 3 的 Composition API 确实是一个很大的进步，让代码组织更加清晰。', 1, 1, NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 5 DAY),
('blog', 2, 2, '用户1', 'Spring Boot 3.0 的新特性很吸引人，准备尝试一下！', NULL, 1, NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 5 DAY),
('blog', 3, 3, '用户2', 'MySQL 性能优化确实很重要，这篇文章的建议很实用。', NULL, 1, NOW() - INTERVAL 4 DAY, NOW() - INTERVAL 4 DAY),
('blog', 4, 1, '管理员', '前端开发的未来趋势分析得很到位，WebAssembly 确实是一个重要方向。', NULL, 1, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 3 DAY),
('book', 1, 2, '用户1', '《星辰变》是我最喜欢的玄幻小说之一，情节非常精彩！', NULL, 1, NOW() - INTERVAL 29 DAY, NOW() - INTERVAL 29 DAY),
('book', 1, 3, '用户2', '秦羽的成长历程很感人，作者的想象力非常丰富。', NULL, 1, NOW() - INTERVAL 28 DAY, NOW() - INTERVAL 28 DAY),
('book', 4, 4, '作者1', '刘慈欣的作品总是那么引人深思，《三体》是中国科幻的巅峰之作。', NULL, 1, NOW() - INTERVAL 23 DAY, NOW() - INTERVAL 23 DAY),
('book', 4, 5, '作者2', '《三体》的黑暗森林理论非常有创意，让人对宇宙产生了新的认识。', 9, 1, NOW() - INTERVAL 22 DAY, NOW() - INTERVAL 22 DAY),
('book', 3, 2, '用户1', '《全职高手》让我想起了自己玩游戏的青春岁月，非常怀念。', NULL, 1, NOW() - INTERVAL 24 DAY, NOW() - INTERVAL 24 DAY),
('book', 7, 3, '用户2', '《雪中悍刀行》的文笔非常优美，人物形象鲜明，值得一读。', NULL, 1, NOW() - INTERVAL 17 DAY, NOW() - INTERVAL 17 DAY);

-- 插入点赞数据
INSERT INTO `like` (`target_type`, `target_id`, `user_id`, `created_at`) VALUES 
('blog', 1, 2, NOW() - INTERVAL 6 DAY),
('blog', 1, 3, NOW() - INTERVAL 6 DAY),
('blog', 1, 4, NOW() - INTERVAL 5 DAY),
('blog', 2, 2, NOW() - INTERVAL 5 DAY),
('blog', 2, 5, NOW() - INTERVAL 5 DAY),
('blog', 3, 3, NOW() - INTERVAL 4 DAY),
('blog', 3, 4, NOW() - INTERVAL 4 DAY),
('blog', 4, 1, NOW() - INTERVAL 3 DAY),
('blog', 4, 2, NOW() - INTERVAL 3 DAY),
('blog', 4, 3, NOW() - INTERVAL 3 DAY),
('blog', 5, 4, NOW() - INTERVAL 2 DAY),
('blog', 5, 5, NOW() - INTERVAL 2 DAY),
('blog', 6, 1, NOW() - INTERVAL 2 DAY),
('blog', 6, 2, NOW() - INTERVAL 2 DAY),
('blog', 7, 3, NOW() - INTERVAL 1 DAY),
('book', 1, 2, NOW() - INTERVAL 29 DAY),
('book', 1, 3, NOW() - INTERVAL 28 DAY),
('book', 1, 4, NOW() - INTERVAL 27 DAY),
('book', 2, 2, NOW() - INTERVAL 27 DAY),
('book', 2, 5, NOW() - INTERVAL 26 DAY),
('book', 3, 2, NOW() - INTERVAL 25 DAY),
('book', 3, 3, NOW() - INTERVAL 24 DAY),
('book', 3, 4, NOW() - INTERVAL 23 DAY),
('book', 4, 2, NOW() - INTERVAL 24 DAY),
('book', 4, 3, NOW() - INTERVAL 23 DAY),
('book', 4, 4, NOW() - INTERVAL 22 DAY),
('book', 4, 5, NOW() - INTERVAL 21 DAY),
('book', 5, 2, NOW() - INTERVAL 22 DAY),
('book', 5, 3, NOW() - INTERVAL 21 DAY),
('book', 6, 4, NOW() - INTERVAL 20 DAY),
('book', 7, 2, NOW() - INTERVAL 18 DAY),
('book', 8, 3, NOW() - INTERVAL 16 DAY),
('book', 9, 4, NOW() - INTERVAL 14 DAY),
('book', 10, 5, NOW() - INTERVAL 12 DAY),
('comment', 1, 3, NOW() - INTERVAL 6 DAY),
('comment', 3, 2, NOW() - INTERVAL 5 DAY),
('comment', 7, 4, NOW() - INTERVAL 28 DAY),
('comment', 9, 2, NOW() - INTERVAL 22 DAY);

-- 更新博客统计数据
UPDATE `blog` SET 
`like_count` = (SELECT COUNT(*) FROM `like` WHERE `target_type` = 'blog' AND `target_id` = `blog`.`id`), 
`comment_count` = (SELECT COUNT(*) FROM `comment` WHERE `target_type` = 'blog' AND `target_id` = `blog`.`id`) 
WHERE 1;

-- 更新书籍统计数据
UPDATE `book` SET 
`like_count` = (SELECT COUNT(*) FROM `like` WHERE `target_type` = 'book' AND `target_id` = `book`.`id`), 
`comment_count` = (SELECT COUNT(*) FROM `comment` WHERE `target_type` = 'book' AND `target_id` = `book`.`id`) 
WHERE 1;

-- 查看数据插入结果
SELECT 'User Count:' AS Info, COUNT(*) FROM `user` UNION ALL
SELECT 'Blog Count:', COUNT(*) FROM `blog` UNION ALL
SELECT 'Book Count:', COUNT(*) FROM `book` UNION ALL
SELECT 'Chapter Count:', COUNT(*) FROM `chapter` UNION ALL
SELECT 'Comment Count:', COUNT(*) FROM `comment` UNION ALL
SELECT 'Like Count:', COUNT(*) FROM `like` UNION ALL
SELECT 'Tag Count:', COUNT(*) FROM `tag` UNION ALL
SELECT 'Blog-Tag Relations:', COUNT(*) FROM `blog_tag` UNION ALL
SELECT 'Book-Tag Relations:', COUNT(*) FROM `book_tag`;

COMMIT;
