#!/bin/bash
curl -s -XDELETE http://localhost:9200/_all >> /dev/null

curl -s -XPOST http://localhost:9200/foobar -d '{"index":{"number_of_shards":2,"number_of_replicas":0,"analysis":{"analyzer":{"index_inc_search":{"tokenizer":"whitespace","filter":["lowercase"]}}}}}' >> /dev/null 
curl -s -XPUT http://localhost:9200/foobar/bar/_mapping -d '{"bar":{"properties":{"id":{"type":"long"},"content":{"type":"string","fields":{"content.raw":{"type":"string"}}}}}}' >> /dev/null
curl -s -XPUT http://localhost:9200/foobar/baz/_mapping -d '{"baz":{"properties":{"id":{"type":"long"},"content":{"path":"just_name","type":"string","fields":{"content.raw":{"type":"string"}}}}}}' >> /dev/null

curl -s -XPOST http://localhost:9200/foobaz -d '{"index":{"number_of_shards":1,"number_of_replicas":2,"analysis":{"analyzer":{"index_inc_search":{"tokenizer":"whitespace","filter":["lowercase"]}}}}}' >> /dev/null
curl -s -XPUT http://localhost:9200/foobaz/bar/_mapping -d '{"bar":{"properties":{"id":{"type":"long"},"content":{"type":"string","fields":{"content.raw":{"type":"string"}}}}}}' >> /dev/null
curl -s -XPUT http://localhost:9200/foobaz/baz/_mapping -d '{"baz":{"properties":{"id":{"type":"long"},"content":{"path":"just_name","type":"string","fields":{"content.raw":{"type":"string"}}}}}}' >> /dev/null

curl -s -XPOST http://localhost:9200/qux -d '{"index":{"number_of_shards":1,"number_of_replicas":2,"analysis":{"analyzer":{"index_inc_search":{"tokenizer":"whitespace","filter":["lowercase"]}}}}}' >> /dev/null
curl -s -XPUT http://localhost:9200/qux/baz/_mapping -d '{"baz":{"properties":{"id":{"type":"long"},"content":{"path":"just_name","type":"string","fields":{"content.raw":{"type":"string"}}}}}}' >> /dev/null
curl -s -XPUT http://localhost:9200/qux/bar/_mapping -d '{"bar":{"properties":{"id":{"type":"long"},"content":{"type":"string","fields":{"content.raw":{"type":"string"}}}}}}' >> /dev/null
curl -s -XPOST http://localhost:9200/qux/_close >> /dev/null

curl -s -XPUT http://localhost:9200/foobar/bar/1 -d '{"id":1, "content":"foobar bar 1"}' >> /dev/null
curl -s -XPUT http://localhost:9200/foobar/bar/2 -d '{"id":2, "content":"foobar bar 2"}' >> /dev/null
curl -s -XPUT http://localhost:9200/foobar/bar/3 -d '{"id":3, "content":"foobar bar 3"}' >> /dev/null
curl -s -XPUT http://localhost:9200/foobar/bar/4 -d '{"id":4, "content":"foobar bar 4"}' >> /dev/null

curl -s -XPUT http://localhost:9200/foobar/baz/1 -d '{"id":1, "content":"foobar baz 1"}' >> /dev/null
curl -s -XPUT http://localhost:9200/foobar/baz/2 -d '{"id":2, "content":"foobar baz 2"}' >> /dev/null
curl -s -XPUT http://localhost:9200/foobar/baz/3 -d '{"id":3, "content":"foobar baz 3"}' >> /dev/null
curl -s -XPUT http://localhost:9200/foobar/baz/4 -d '{"id":4, "content":"foobar baz 4"}' >> /dev/null

curl -s XGET http://localhost:9200/_refresh >> /dev/null

sleep 1

echo -n "var state = JSON.parse('";
curl -XGET http://localhost:9200/_cluster/state
echo -ne "');\n"
echo -n "var status = JSON.parse('";
curl -XGET http://localhost:9200/_status
echo -ne "');\n"
echo -n "var stats = JSON.parse('";
curl -XGET http://localhost:9200/_nodes/stats
echo -ne "');\n"
echo -n "var settings = JSON.parse('";
curl -XGET http://localhost:9200/_status
echo -ne "');\n"