---
title: Hexo+Github静态网页博客搭建
date: 2018-10-12 22:00:47
---

# 前置环境

>1.[Git](https://git-scm.com/)
>2.[node.js](https://nodejs.org/en/download/)

# 安装hexo并初始化

创建一个文件夹hexo，在其中右键进入 `Git Bash`

```bash
 $ npm install hexo-cli -g
 $ hexo init hexo
 $ cd hexo
 $ npm install
 $ hexo server
```

hexo文件夹是本地网站开发环境文件夹

此时hexo文件夹目录如下

```
.
├── _config.yml
├── package.json
├── scaffolds
├── source
|   ├── _drafts
|   └── _posts
└── themes
```
## scaffolds

模版文件夹。当您新建文章时，Hexo 会根据 `scaffold` 来建立文件。

Hexo的模板是指在新建的`markdown`文件中默认填充的内容。例如，如果您修改`scaffold/post.md`中的Front-matter内容，那么每次新建一篇文章时都会包含这个修改。

## source

资源文件夹是存放用户资源的地方。除 `_posts` 文件夹之外，开头命名为 _ (下划线)的文件 / 文件夹和隐藏的文件将会被忽略。Markdown 和 HTML 文件会被解析并放到 `public` 文件夹，而其他文件会被拷贝过去。

## themes

主题 文件夹。Hexo 会根据主题来生成静态页面。

# 修改网站配置

`hexo/_config.yml` 是我们的网站配置文件

> 您可以在 `_config.yml` 中修改大部份的配置。
>
>  网站
>
> | 参数          | 描述                                                         |
> | ------------- | ------------------------------------------------------------ |
> | `title`       | 网站标题                                                     |
> | `subtitle`    | 网站副标题                                                   |
> | `description` | 网站描述                                                     |
> | `author`      | 您的名字                                                     |
> | `language`    | 网站使用的语言，简体汉字使用 `zh-Hans`                       |
> | `timezone`    | 网站时区。Hexo 默认使用您电脑的时区。[时区列表](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)。比如说：`America/New_York`, `Japan`, 和 `UTC` 。 |
>
> 其中，`description`主要用于SEO，告诉搜索引擎一个关于您站点的简单描述，通常建议在其中包含您网站的关键词。`author`参数用于主题显示文章的作者。
>
>  网址
>
> | 参数                 | 描述                                                         | 默认值                      |
> | -------------------- | ------------------------------------------------------------ | --------------------------- |
> | `url`                | 网址                                                         |                             |
> | `root`               | 网站根目录                                                   |                             |
> | `permalink`          | 文章的 [永久链接](https://hexo.io/zh-cn/docs/permalinks) 格式 | `:year/:month/:day/:title/` |
> | `permalink_defaults` | 永久链接中各部分的默认值                                     |                             |
>
> > 网站存放在子目录
> >
> > 如果您的网站存放在子目录中，例如 `http://yoursite.com/blog`，则请将您的 `url` 设为 `http://yoursite.com/blog` 并把 `root` 设为 `/blog/`。
>
> 扩展
>
> | 参数     | 描述                                |
> | -------- | ----------------------------------- |
> | `theme`  | 当前主题名称。值为`false`时禁用主题 |
> | `deploy` | 部署部分的设置                      |

>详细内容请参考[`hexo文档`](https://hexo.io/zh-cn/docs/)

# 安装主题

本博客选择的是[`next`](https://github.com/theme-next/hexo-theme-next)主题

你可以在[`hexo主题页面`](https://hexo.io/themes/)找到更多主题，设置主题的方法大同小异

```bash
$ cd hexo
$ git clone https://github.com/theme-next/hexo-theme-next themes/next
```

此时打开hexo/themes,可以发现除了hexo默认的[landscape](https://github.com/hexojs/hexo-theme-landscape)主题以外，还多了一个主题文件夹[next](https://github.com/theme-next/hexo-theme-next),打开这个文件夹，有一个文件_config.yml，这是next主题配置文件，

修改hexo/_config.yml文件，找到 `theme` 标签，将其值修改为 `next`

```_config.yml
theme: next
```

现在可以删除landscape文件夹了

# 本地试运行网站

在hexo文件夹下进入 `Git Bash`

```bash
$ hexo s --debug
```

运行完成后打开[`http://localhost:4000/`](http://localhost:4000/)

# 配置主题

编辑 `hexo/themes/next/_config.yml`

## 主题样式 `Scheme` 标签

Scheme 是 next 提供的一种特性，借助于 Scheme，next 为你提供多种不同的外观。同时，几乎所有的配置都可以 在 Scheme 之间共用。目前 next 支持三种 Scheme，他们是：

    Muse - 默认 Scheme，这是 NexT 最初的版本，黑白主调，大量留白
    Mist - Muse 的紧凑版本，整洁有序的单栏外观
    Pisces - 双栏 Scheme，小家碧玉似的清新
    Gemini - 左侧网站信息及目录，块+片段结构布局 
Scheme 的切换通过更改主题配置文件，搜索 scheme 关键字。 你会看到有四行 scheme 的配置，将你需用启用的 scheme 前面注释 # 去除即可。

## 菜单 `Menu`标签

```
menu:   
	home: / || home                  //首页   
	archives: /archives/ || archive          //归档   
	categories: /categories/ || th           //分类  
	tags: /tags/ || tags                     //标签   
	about: /about/ || user                   //关于   
	#schedule: /schedule/ || calendar        //日程表  
	#sitemap: /sitemap.xml || sitemap        //站点地图   		#commonweal: /404/ || heartbeat          //公益404
```

看看你需要哪个菜单就把哪个取消注释打开就行了

`||`之后的`archive`表示图标，Next主题所有的图标都来自Font Awesome图标库。

## 侧栏`sidebar`标签

sidebar:
```
#Sidebar Position - 侧栏位置（只对Pisces | Gemini两种风格有效）

  position: left        //靠左放置
  #position: right      //靠右放置

#Sidebar Display - 侧栏显示时机（只对Muse | Mist两种风格有效）
  #display: post        //默认行为，在文章页面（拥有目录列表）时显示
  display: always       //在所有页面中都显示
  #display: hide        //在所有页面中都隐藏（可以手动展开）
  #display: remove      //完全移除
  
  offset: 12            //文章间距（只对Pisces | Gemini两种风格有效）
  b2t: false            //返回顶部按钮（只对Pisces | Gemini两种风格有效）
  scrollpercent: true   //返回顶部按钮的百分比

```

## 头像 `avatar`标签

```
# Sidebar Avatar
avatar: /images/avatar.jpg
```

将你的头像命名为`avatar.jpg`放入`themes/next/source/images`（没有请创建）中

> 更多配置请参考[ `next官方文档` ](https://theme-next.org/)
>
> 以及万能的[`百度`](https://www.baidu.com/)

# 生成及部署

进入hexo文件夹并打开`Git Bash`

```bash
$ cd hexo
$ hexo generate
```

或者简写为

```bash
$ hexo g
```

此时将生成静态文件夹 `hexo/public` 

将这个文件夹 `git push` 到你的[Github](https://github.com/)下的 `username.github.io` repo（没有请新建），其中 `username` 是你的Github用户名

然后打开网址[`username.github.io`](https://username.github.io/)

即可看到你的博客

> 或者使用git进行部署
>
> 修改`hexo/_config.yml` 中的`deploy`标签
>
> ```
> deploy:
>   type: git
>   repo: git@github.com:username/username.github.io.git
>   branch: master
> ```
>
> 安装 `hexo-deployer-git` 
>
> ```bash
> $ npm install hexo-deployer-git --save
> ```
>
> 生成
>
> ```bash
> $ hexo generate
> ```
>
> 部署
>
> ```bash
> $ hexo deploy
> ```
>
> 或者
>
> 您可执行下列的其中一个命令，让 Hexo 在生成完毕后自动部署网站，两个命令的作用是相同的。
>
> ```bash
> $ hexo generate --deploy
> $ hexo deploy --generate
> ```
>
> 简写
>
> 上面两个命令可以简写为
>
> ```bash
> $ hexo g -d
> $ hexo d -g
> ```
# 写作

hexo写作使用`Markdown`格式（本文也是）



`Markdown`格式文件后缀一般为`.md`



> [Markdown](https://link.jianshu.com?t=http://zh.wikipedia.org/wiki/Markdown) 是一种轻量级的**「标记语言」**，它的优点很多，目前也被越来越多的写作爱好者，撰稿者广泛使用。看到这里请不要被**「标记」**、**「语言」**所迷惑，Markdown 的语法十分简单。常用的标记符号也不超过十个，这种相对于更为复杂的 HTML 标记语言来说，Markdown 可谓是十分轻量的，学习成本也不需要太多，且一旦熟悉这种语法规则，会有一劳永逸的效果。

> 这里推荐一个非常好用的markdown编辑器 [`typora`](https://www.typora.io/)

请在每个 `.md`文件开头加入标题格式
```
---
title: yourtitle
---
```
将写好的 `.md` 文件放入`/hexo/source/_posts`重新生成部署即可

> 注意：`_posts`文件夹是博文存储目录







>  **==呼，写完了==**
>
> 以后可能还会更新更多新东西

