elk-rtf
=======

elk(Elasticsearch, Logstash and Kibana) ready to fly

这是一个带有简单配置的elk仓库，已经为elasticsearch安装了一些需要用到的插件，并带有一个以redis为input的logstash配置，可用于快速创建、测试、部署elk。


各组件版本
--------
elasticsearch: 1.3.1

logstash: 1.4.2

kibana: 3.0.1（logstash集成）

下载
---
	git clone https://github.com/baozoumanhua/elk-rtf.git
	

运行elastichsearch
-----------------
**Important**: 在es中集成了[elasticsearch-servicewrapper](https://github.com/elasticsearch/elasticsearch-servicewrapper)组件，可以通过service模式运行elasticsearch，并在`elasticsearch/bin/service／elasticsearch.conf`中配置jvm参数。

本地开启console：

	cd elasticsearch
	./bin/service/elasticsearch console
	
运行logstash以及kibana
---------------------
现在logstash已经和kibana集成在一起了，提供了很方便的命令行工具，具体可参考[logstash-10-minute-walkthrough](http://logstash.net/docs/1.4.2/tutorials/10-minute-walkthrough/)。

命令：

	cd logstash
	./bin/logstash agent -f ../configs/logstash-indexer-web.conf web

配置文件
------
按需修改`./configs/logstash-indexer-web.conf`。

功能脚本
-------
在scripts目录下，提供了一些额外的功能脚本。

`logstash-indexer`: logstash service化脚本，该脚本在ubuntu 14.04下测试通过，其他环境请自行测试。
使用方法：放入/etc/init.d/下，执行`update-rc.d logstash-indexer defaults`。

作者
====
Copyright (c) 2014-2014 暴走漫画.  All Rights Reserved.
Released under the [Artistic License](http://www.opensource.org/licenses/artistic-license-2.0.php).