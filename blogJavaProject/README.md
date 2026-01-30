# Blog Java Project

Spring Boot 后端项目，为博客和书架应用提供 RESTful API 接口。

## 项目结构

```
src/
├── main/
│   ├── java/com/example/blog/
│   │   ├── controller/      # 控制器
│   │   ├── model/           # 数据模型
│   │   ├── repository/      # 数据仓库
│   │   ├── service/         # 业务逻辑
│   │   └── BlogJavaProjectApplication.java  # 应用主类
│   └── resources/
│       └── application.properties  # 配置文件
└── test/                    # 测试代码
```

## 技术栈

- Spring Boot 3.2.0
- Spring Data JPA
- MySQL 8.0+
- Java 17
- Maven

## 数据库配置

1. 创建数据库：
   ```sql
   CREATE DATABASE blog_java_project CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

2. 修改 `application.properties` 中的数据库连接信息：
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/blog_java_project?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC
   spring.datasource.username=root
   spring.datasource.password=123456
   ```

3. 运行数据库初始化脚本（如果需要）：
   ```bash
   mysql -u root -p blog_java_project < blogJavaProject.sql
   ```

## API 接口

### 博客相关

| 接口 | 方法 | 描述 |
|------|------|------|
| `/api/blogs` | GET | 获取所有博客 |
| `/api/blogs/latest` | GET | 获取最新博客 |
| `/api/blogs/{id}` | GET | 获取博客详情 |
| `/api/blogs` | POST | 创建博客 |
| `/api/blogs/{id}` | PUT | 更新博客 |
| `/api/blogs/{id}` | DELETE | 删除博客 |
| `/api/blogs/author/{authorId}` | GET | 获取作者的博客 |
| `/api/blogs/type/{type}` | GET | 获取指定类型的博客 |

### 书籍相关

| 接口 | 方法 | 描述 |
|------|------|------|
| `/api/books` | GET | 获取所有书籍 |
| `/api/books?category=玄幻` | GET | 获取指定分类的书籍 |
| `/api/books/{id}` | GET | 获取书籍详情 |
| `/api/books` | POST | 创建书籍 |
| `/api/books/{id}` | PUT | 更新书籍 |
| `/api/books/{id}` | DELETE | 删除书籍 |
| `/api/books/search?keyword=三体` | GET | 搜索书籍 |
| `/api/books/author/{author}` | GET | 获取作者的书籍 |

### 章节相关

| 接口 | 方法 | 描述 |
|------|------|------|
| `/api/chapters/book/{bookId}` | GET | 获取书籍的章节列表 |
| `/api/chapters/{id}` | GET | 获取章节详情 |
| `/api/chapters/book/{bookId}/chapter/{chapterNumber}` | GET | 获取指定书籍的指定章节 |
| `/api/chapters` | POST | 创建章节 |
| `/api/chapters/{id}` | PUT | 更新章节 |
| `/api/chapters/{id}` | DELETE | 删除章节 |
| `/api/chapters/book/{bookId}/count` | GET | 获取书籍的章节数量 |

### 评论相关

| 接口 | 方法 | 描述 |
|------|------|------|
| `/api/comments?targetType=blog&targetId=1` | GET | 获取指定目标的评论 |
| `/api/comments/replies/{parentId}` | GET | 获取评论的回复 |
| `/api/comments` | POST | 创建评论 |
| `/api/comments/{id}` | DELETE | 删除评论 |
| `/api/comments/count?targetType=blog&targetId=1` | GET | 获取指定目标的评论数量 |

### 点赞相关

| 接口 | 方法 | 描述 |
|------|------|------|
| `/api/likes/toggle?userId=1&targetType=blog&targetId=1` | POST | 切换点赞状态 |
| `/api/likes/status?userId=1&targetType=blog&targetId=1` | GET | 获取点赞状态 |
| `/api/likes/count?targetType=blog&targetId=1` | GET | 获取点赞数量 |

### 标签相关

| 接口 | 方法 | 描述 |
|------|------|------|
| `/api/tags` | GET | 获取所有标签 |
| `/api/tags/{id}` | GET | 获取标签详情 |
| `/api/tags` | POST | 创建标签 |
| `/api/tags/{id}` | PUT | 更新标签 |
| `/api/tags/{id}` | DELETE | 删除标签 |

## 运行项目

1. 安装依赖：
   ```bash
   mvn clean install
   ```

2. 运行应用：
   ```bash
   mvn spring-boot:run
   ```

3. 访问 API 文档：
   ```
   http://localhost:8080/api
   ```

## 前端集成

前端 Vue 项目可以通过以下方式集成：

1. 安装 axios：
   ```bash
   npm install axios
   ```

2. 创建 API 服务：
   ```javascript
   import axios from 'axios';

   const api = axios.create({
     baseURL: 'http://localhost:8080/api',
     timeout: 10000
   });

   export default api;
   ```

3. 调用 API 接口：
   ```javascript
   // 获取博客列表
   api.get('/blogs').then(response => {
     console.log(response.data);
   });

   // 获取书籍详情
   api.get('/books/1').then(response => {
     console.log(response.data);
   });
   ```

## 注意事项

1. 项目使用 Java 17，请确保本地环境已安装 Java 17 或更高版本。
2. 数据库连接信息需要根据本地环境进行修改。
3. 项目已配置 CORS 跨域支持，可以直接与前端项目集成。
4. 生产环境部署时，请修改 `application.properties` 中的数据库密码等敏感信息。

## 许可证

MIT
