elasticsearch kopf
=======================

kopf is a simple web administration tool for [ElasticSearch](http://elasticsearch.org) written in JavaScript + AngularJS + jQuery + Twitter bootstrap.

it offers an easy way of performing common tasks on an elasticsearch cluster. not every single API is covered by this plugin, but it does offer a rest client which allows you to explore the full potential of the ElasticSearch API.

Versions
------------

| elasticsearch version | kopf version |
| --------------------- | ------------ |
| 0.90.X                | 0.90         |
| 1.0.X                 | 1.0          |
| 1.1.X                 | 1.1          |
| 1.2.X                 | 1.2          |

Installation
------------

Run locally:

    git clone git://github.com/lmenezes/elasticsearch-kopf.git
    git checkout {version}
    cd elasticsearch-kopf
    open index.html
    
ps: local execution doesn't work with Chrome(and maybe other browsers). See more [here](http://docs.angularjs.org/api/ng.directive:ngInclude).


Install on a ElasticSearch instance:

    ./elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf/{version}
    open http://localhost:9200/_plugin/kopf
    

Try the most recent version online at http://lmenezes.com/elasticsearch-kopf/?location=http://localhost:9200

Basic HTTP Auth is also supported, so http://lmenezes.com/elasticsearch-kopf/?location=http://user:pwd@localhost:9200 should also work.

Screenshots
------------
####Cluster overview
![cluster overview](imgs/cluster_view.png)

####Header reflects cluster state
![cluster state](imgs/cluster_state.png)

####Rest Client
![rest client](imgs/rest_client.png)

####Aliases management
![aliases management](imgs/aliases.png)
