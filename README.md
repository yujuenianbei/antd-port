# Antd-Port 项目说明

这是一个基于 Node.js, Express, 和 MySQL 构建的 Web 应用程序。

## 技术栈

- **后端框架**: Express.js
- **模板引擎**: EJS
- **数据库**: MySQL
- **数据库连接**: mysql (npm package)
- **其他**: cookie-parser, morgan

## 快速开始

### 环境准备

在开始之前，请确保您的本地环境中已安装以下软件：

- Node.js (>= 14.x)
- npm 或 yarn
- MySQL Server

### 安装

1.  **克隆项目**:
    ```bash
    git clone <项目仓库地址>
    cd antd-port
    ```

2.  **安装依赖**:
    ```bash
    npm install
    ```


### 配置数据库

1.  在 `config` 目录下创建 `dbConfig.js` 文件，并根据你的 MySQL 环境填写以下内容:
    ```javascript
    // config/dbConfig.js
    module.exports = {
      serverName: 'your_mysql_host', // 例如 'localhost' 或 '127.0.0.1'
      port: 3306,                   // MySQL 端口
      user: 'your_mysql_user',      // MySQL 用户名
      password: 'your_password',    // MySQL 密码
      dbName: 'your_database_name'  // 数据库名
    };
    ```

### 启动应用

```bash
npm start
```
或者直接运行
```bash
node ./bin/www
```
应用默认将在 `http://localhost:3000` 启动。

## 数据库初始化

应用启动时会自动执行 `sql/init.sql` 中的脚本，创建所需的表结构。

## 主要功能

- 应用启动时自动连接 MySQL 数据库。
- 访问根路径 `/` 将渲染 `views/index.ejs` 模板。
- 访问 `/users` 路径将由 `routes/users.js` 处理 (当前路由文件为空)。

## 使用说明

[在此处添加项目的具体使用方法。例如，如何使用您开发的组件，或者项目的具体功能如何操作。可以添加代码示例。]

```bash
# 示例命令或代码
```

## 项目结构

```bash
.
├── app.js                  # Express 应用入口文件
├── bin
│   └── www                 # 应用启动脚本
├── config
│   └── dbConfig.js         # 数据库配置文件 (需要手动创建)
├── package.json            # 项目依赖和脚本
├── public                  # 静态资源目录
│   └── stylesheets
├── routes                  # 路由定义
│   ├── index.js
│   └── users.js
├── sql                     # 数据库相关文件
│   ├── init.js             # 数据库连接和初始化逻辑
│   ├── init.sql            # 数据库表结构定义
│   └── search.js           # 数据库查询逻辑
├── views                   # 视图模板 (使用 EJS)
│   ├── error.ejs
│   └── index.ejs
└── README.md               # 项目说明文档
```

## 许可证

本项目采用 MIT 许可证。更多信息请查看 [LICENSE](LICENSE) 文件。

