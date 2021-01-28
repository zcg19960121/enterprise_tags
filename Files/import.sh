#!/bin/sh

sqoop import \
--hive-import \
--create-hive-table \
--hive-table tags_data.tbl_goods \
--connect "jdbc:mysql://master01:3306/tags_dat" \
--username root \
--password itcastmysqlroot \
--query "SELECT * FROM tags_dat.tbl_goods WHERE \$CONDITIONS" \
--split-by id \
--direct \
--target-dir /user/admin/data_exchange/tags_data \
--m 2

sqoop import \
--hive-import \
--create-hive-table \
--hive-table tags_data.tbl_goods_new \
--connect "jdbc:mysql://master01:3306/tags_dat" \
--username root \
--password itcastmysqlroot \
--query "SELECT * FROM tags_dat.tbl_goods_new WHERE \$CONDITIONS" \
--split-by id \
--direct \
--target-dir /user/admin/data_exchange/tags_data \
--m 2

sqoop import \
--hive-import \
--create-hive-table \
--hive-table tags_data.tbl_logs \
--connect "jdbc:mysql://master01:3306/tags_dat" \
--username root \
--password itcastmysqlroot \
--query "SELECT * FROM tags_dat.tbl_logs WHERE \$CONDITIONS" \
--split-by id \
--direct \
--target-dir /user/admin/data_exchange/tags_data \
--m 2

sqoop import \
--hive-import \
--create-hive-table \
--hive-table tags_data.tbl_orders \
--connect "jdbc:mysql://master01:3306/tags_dat" \
--username root \
--password itcastmysqlroot \
--query "SELECT * FROM tags_dat.tbl_orders WHERE \$CONDITIONS" \
--split-by id \
--direct \
--target-dir /user/admin/data_exchange/tags_data \
--m 2

sqoop import \
--hive-import \
--create-hive-table \
--hive-table tags_data.tbl_users \
--connect "jdbc:mysql://master01:3306/tags_dat" \
--username root \
--password itcastmysqlroot \
--query "SELECT * FROM tags_dat.tbl_users WHERE \$CONDITIONS" \
--split-by id \
--direct \
--target-dir /user/admin/data_exchange/tags_data \
--m 2