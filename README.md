# enterprise_tags

## 项目简介：

用户画像学习实践项目

------

## 环境准备：

//TODO

------

## 开发步骤：

### 步骤一：

通过Sql脚本数据导入Mysql。

### 步骤二：

执行File/import.sh，通过Sqoop将Mysql中的数据导入Hive。

### 步骤三：

编写Spark程序(com.zhcg.model.tools.hbase.Hive2HBase)，从Hive中读取数据后生成HFile落入HDFS，然后通过bulkload的方式将数据批量加载进HBase。从而完成原始数据的首次全量导入。

spark-submit命令如下：

```shell
spark-submit --class com.zhcg.model.tools.hbase.Hive2HBase --master yarn --deploy-mode client --executor-memory 500m --executor-cores 1 --driver-memory 600m --num-executors 1 /vagrant/enterprise_tags_2.11-0.1.jar tags_data tbl_users id
```

------

## 开发过程中碰到的问题&总结：

1.起初使用cloudera-quickstart-vm-5.13.0-0-vmware作为测试环境(单节点，12G内存)，在Oozie中调度执行import.sh失败，本地执行该脚本则成功。日志中没有太多信息。后续将环境更换为CDH6.13.2集群(3节点，共11G内存)，执行正常。

2.bulkload适用的场景:HBase表中原本没有没有数据，如有有数据则会触发split操作。表进行预分区，才能扩大reduce任务个数，从而获得更快的导入速度。