elk-rtf
=======

elk(Elasticsearch, Logstash and Kibana) ready to fly

这是一个带有简单配置的elk仓库，已经为elasticsearch安装了一些需要用到的插件，并带有一个以redis为input的logstash配置，可用于快速创建、测试、部署elk。


各组件版本
--------
elasticsearch: 1.4.4

logstash: 1.4.2

kibana: 4.0.1

下载
---
	git clone https://github.com/baozoumanhua/elk-rtf.git


运行elastichsearch
-----------------
**Important**: 在es中集成了[elasticsearch-servicewrapper](https://github.com/elasticsearch/elasticsearch-servicewrapper)组件，可以通过service模式运行elasticsearch，并在`elasticsearch/bin/service／elasticsearch.conf`中配置jvm参数。

本地开启console：

	cd elasticsearch
	./bin/service/elasticsearch console

运行logstash以及kibana3
----------------------
现在logstash集成了kibana3，提供了很方便的命令行工具，具体可参考[logstash-10-minute-walkthrough](http://logstash.net/docs/1.4.2/tutorials/10-minute-walkthrough/)。

命令：

	cd logstash
	./bin/logstash agent -f ../configs/logstash-indexer.conf
	
同时启动kibana3：
	
	./bin/logstash agent -f ../configs/logstash-indexer.conf web
	
运行kibana4
--------------
kibana4是基于node.js的全新的web客户端，作为web service独立运行。

环境中的2个kibana4，kibana-4-darwin-x64 是macosx的版本，kibana-4-linux-x64 是linux的版本。

运行命令：`./bin/kibana`

在linux下，以后台方式静默运行：`./bin/kibana -q &`

配置文件
------
按需修改`./configs/logstash-indexer.conf`。

功能脚本
-------
在scripts目录下，提供了一些额外的功能脚本。

`logstash-indexer`: logstash service化脚本，该脚本在ubuntu 14.04下测试通过，其他环境请自行测试。
使用方法：放入/etc/init.d/下，执行`update-rc.d logstash-indexer defaults`。

作者
====
Copyright (c) 2014-2014 暴走漫画.  All Rights Reserved.
Released under the [Artistic License](http://www.opensource.org/licenses/artistic-license-2.0.php).
