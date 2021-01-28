name := "enterprise_tags"

version := "0.1"

scalaVersion := "2.13.1"

libraryDependencies ++= Seq(
  "org.apache.spark" % "spark-core_2.11" % "2.4.0" % "provided",
  "org.apache.spark" % "spark-sql_2.11" % "2.4.0" % "provided",
  "org.apache.spark" % "spark-mllib_2.11" % "2.4.0" % "provided",
  "org.apache.spark" % "spark-hive_2.11" % "2.4.0" % "provided",
  "org.apache.hbase" % "hbase-server" % "2.1.4" % "provided",
  "org.apache.hbase" % "hbase-mapreduce" % "2.1.4" % "provided"


)

assemblyMergeStrategy in assembly := {
  case PathList("META-INF", xs @ _*) => MergeStrategy.discard
  case x => MergeStrategy.first
}