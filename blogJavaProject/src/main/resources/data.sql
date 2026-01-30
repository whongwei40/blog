-- 创建book表
CREATE TABLE IF NOT EXISTS book (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    cover VARCHAR(255),
    description TEXT,
    category VARCHAR(100),
    status VARCHAR(50),
    view_count INT DEFAULT 0,
    like_count INT DEFAULT 0,
    comment_count INT DEFAULT 0,
    chapter_count INT DEFAULT 0,
    word_count INT DEFAULT 0,
    created_at DATETIME,
    updated_at DATETIME
);

-- 创建chapter表
CREATE TABLE IF NOT EXISTS chapter (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    book_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    chapter_number INT,
    word_count INT DEFAULT 0,
    view_count INT DEFAULT 0,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE
);

-- 插入示例书籍数据
INSERT INTO book (title, author, cover, description, category, status, view_count, like_count, comment_count, chapter_count, word_count, created_at, updated_at)
VALUES
('星辰变', '我吃西红柿', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=fantasy%20novel%20cover%20stars%20galaxy&image_size=portrait_3_4', '一名孩童无法修炼内功。为了得到父亲的重视证明自己，独自踏上历练之路……', '玄幻', '完结', 1250000, 125000, 5000, 320, 2000000, NOW() - INTERVAL 365 DAY, NOW() - INTERVAL 365 DAY),
('庆余年', '猫腻', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=historical%20novel%20cover%20ancient%20chinese%20palace&image_size=portrait_3_4', '一个年轻的病人，因为一次意外，来到了冰与火的世界，开始了一段传奇之旅……', '历史', '完结', 2100000, 210000, 8000, 450, 3000000, NOW() - INTERVAL 300 DAY, NOW() - INTERVAL 300 DAY),
('全职高手', '蝴蝶蓝', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=esports%20novel%20cover%20gaming&image_size=portrait_3_4', '网游荣耀中被誉为教科书级别的顶尖高手叶修，因为种种原因遭到俱乐部的驱逐……', '都市', '完结', 3500000, 350000, 12000, 535, 4000000, NOW() - INTERVAL 240 DAY, NOW() - INTERVAL 240 DAY),
('三体', '刘慈欣', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=science%20fiction%20novel%20cover%20space%20galaxy&image_size=portrait_3_4', '文化大革命期间，天文学家叶文洁被发送到红岸基地，偶然发现了来自外星文明的信号……', '科幻', '完结', 1800000, 180000, 6000, 280, 1500000, NOW() - INTERVAL 180 DAY, NOW() - INTERVAL 180 DAY),
('完美世界', '辰东', 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=xianxia%20novel%20cover%20immortal%20warrior&image_size=portrait_3_4', '一粒尘可填海，一株草斩尽日月星辰，弹指间天翻地覆。群雄并起，万族林立……', '玄幻', '连载', 4200000, 420000, 15000, 680, 5000000, NOW() - INTERVAL 120 DAY, NOW() - INTERVAL 120 DAY);

-- 插入示例章节数据（星辰变）
INSERT INTO chapter (book_id, title, content, chapter_number, word_count, view_count, created_at, updated_at)
VALUES
(1, '第一章 秦羽', '天昏地暗，大雨倾盆。\n\n镇东王秦德看着面前的儿子秦羽，心中五味杂陈。\n\n"羽儿，你已经八岁了，可是体内还是无法聚集内力，这..."秦德的声音有些沙哑。\n\n秦羽抬起头，眼神坚定："父亲，我会证明给你看，即使无法修炼内功，我也能成为强者！"\n\n大雨中，一个幼小的身影在练武场上挥汗如雨...', 1, 2000, 50000, NOW() - INTERVAL 365 DAY, NOW() - INTERVAL 365 DAY),
(1, '第二章 决心', '清晨的阳光透过窗户洒进房间，秦羽已经在练武场上练了三个时辰。\n\n"少爷，该吃饭了。"仆人福伯轻声提醒。\n\n秦羽擦了擦脸上的汗水："福伯，我再练一会儿。"\n\n他的心中只有一个信念：我要变强！\n\n这一天，秦羽开始了他的修炼之路...', 2, 1800, 45000, NOW() - INTERVAL 364 DAY, NOW() - INTERVAL 364 DAY),
(1, '第三章 父子', '深夜，秦德来到秦羽的房间，看到儿子已经累得趴在桌子上睡着了。\n\n他轻轻为儿子盖上被子，心中感慨万千。\n\n"羽儿，无论你能否修炼内功，你都是我秦德的儿子。"\n\n月光透过窗户，照在秦羽稚嫩的脸上...', 3, 1900, 42000, NOW() - INTERVAL 363 DAY, NOW() - INTERVAL 363 DAY),
(1, '第四章 特殊事件', '这一天，镇东王的府邸来了一位神秘的客人。\n\n"秦德，你的儿子秦羽，我可以收他为徒。"神秘人说道。\n\n秦德惊讶地看着眼前的人："你是..."\n\n"我是外功大师，雷卫。"\n\n秦羽的命运，从此改变...', 4, 2100, 48000, NOW() - INTERVAL 362 DAY, NOW() - INTERVAL 362 DAY),
(1, '第五章 修炼', '雷卫开始教导秦羽修炼外功。\n\n"外功修炼，讲究的是炼体，炼骨，炼心。"\n\n秦羽咬着牙，承受着常人难以想象的痛苦。\n\n"我能坚持！"\n\n每一天，秦羽都在突破自己的极限...', 5, 2200, 52000, NOW() - INTERVAL 361 DAY, NOW() - INTERVAL 361 DAY);

-- 插入示例章节数据（庆余年）
INSERT INTO chapter (book_id, title, content, chapter_number, word_count, view_count, created_at, updated_at)
VALUES
(2, '第一章 楔子', '现代医院的病床上，一个年轻人缓缓睁开眼睛。\n\n"我...我还活着？"\n\n突然，一股记忆涌入他的脑海。\n\n"我叫范闲，是户部侍郎范建的私生子。"\n\n穿越者范闲，开始了他在异世界的旅程...', 1, 2300, 60000, NOW() - INTERVAL 300 DAY, NOW() - INTERVAL 300 DAY),
(2, '第二章 范建', '范闲看着面前的中年人，心中百感交集。\n\n"闲儿，你终于醒了。"范建的声音中带着关切。\n\n"父亲。"范闲轻声叫道。\n\n范建点了点头："你大病初愈，要好好休息。"\n\n范闲知道，他的新生活，正式开始了...', 2, 2000, 55000, NOW() - INTERVAL 299 DAY, NOW() - INTERVAL 299 DAY),
(2, '第三章 范闲', '范闲开始适应这个陌生的世界。\n\n他发现自己拥有过目不忘的能力，以及前世的知识。\n\n"这或许是穿越者的福利吧。"\n\n范闲开始规划自己的未来...', 3, 2100, 52000, NOW() - INTERVAL 298 DAY, NOW() - INTERVAL 298 DAY),
(2, '第四章 京都', '范闲接到了前往京都的命令。\n\n"京都，那是权力的中心，也是危险的漩涡。"\n\n范闲收拾行装，准备出发。\n\n他知道，京都之行，将会改变他的一生...', 4, 2200, 58000, NOW() - INTERVAL 297 DAY, NOW() - INTERVAL 297 DAY),
(2, '第五章 宫中', '范闲第一次进入皇宫，心中难免紧张。\n\n"果然是金銮殿，气势恢宏。"\n\n他见到了当今圣上，心中暗叹："这就是庆帝吗？"\n\n范闲的京都之旅，正式开始...', 5, 2400, 62000, NOW() - INTERVAL 296 DAY, NOW() - INTERVAL 296 DAY);

-- 插入示例章节数据（全职高手）
INSERT INTO chapter (book_id, title, content, chapter_number, word_count, view_count, created_at, updated_at)
VALUES
(3, '第一章 被驱逐', '深夜，嘉世战队的训练基地。\n\n叶修坐在电脑前，面无表情。\n\n"叶队，俱乐部决定与你解约。"经理的声音传来。\n\n叶修点了点头："我知道了。"\n\n一代传奇，就这样离开了他奋斗多年的地方...', 1, 2200, 70000, NOW() - INTERVAL 240 DAY, NOW() - INTERVAL 240 DAY),
(3, '第二章 兴欣网吧', '叶修来到了兴欣网吧，成为了一名网管。\n\n"网管，开机！"\n\n叶修微笑着为客人服务，心中却在规划着未来。\n\n"我，还会回来的。"\n\n叶修的新旅程，开始了...', 2, 2000, 65000, NOW() - INTERVAL 239 DAY, NOW() - INTERVAL 239 DAY),
(3, '第三章 全新的开始', '叶修创建了新的账号：君莫笑。\n\n"君莫笑，笑尽英雄。"\n\n他开始在荣耀的世界中重新崛起。\n\n"我会用实力证明，我还是那个叶修。"\n\n叶修的传奇，继续书写...', 3, 2100, 68000, NOW() - INTERVAL 238 DAY, NOW() - INTERVAL 238 DAY),
(3, '第四章 君莫笑', '君莫笑在荣耀中声名鹊起。\n\n"这个君莫笑，好强！"\n\n叶修的操作，让所有人惊叹。\n\n"我回来了。"\n\n叶修的归来，震动了整个荣耀圈...', 4, 2300, 72000, NOW() - INTERVAL 237 DAY, NOW() - INTERVAL 237 DAY),
(3, '第五章 千机伞', '叶修展示了他的得意之作：千机伞。\n\n"这把武器，是我的心血。"\n\n千机伞的强大，让所有人震惊。\n\n"这就是我的底牌。"\n\n叶修的计划，正在一步步实现...', 5, 2400, 75000, NOW() - INTERVAL 236 DAY, NOW() - INTERVAL 236 DAY);

-- 更新书籍的章节数和字数
UPDATE book SET chapter_count = (SELECT COUNT(*) FROM chapter WHERE book_id = book.id),
word_count = (SELECT SUM(word_count) FROM chapter WHERE book_id = book.id)
WHERE id IN (1, 2, 3, 4, 5);
