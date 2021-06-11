**Avro**
=============

# Table of contents

* [Avro serder](#avro-serder)

<a name="avro-serder"></a>
# Avro serder

### Kafka default serder

![image](https://user-images.githubusercontent.com/37034642/116643045-c895f900-a9a2-11eb-882e-cdfc4f1d7c71.png)

### Confluent avro serder(schema registry required)
https://docs.confluent.io/platform/current/schema-registry/serdes-develop/index.html  
https://docs.confluent.io/platform/current/schema-registry/serdes-develop/serdes-avro.html

KafkaAvroSerializer(developed by confluent)
KafkaAvroDeserializer(developed by confluent), returns Object
GenericAvroSerializer wraps KafkaAvroSerializer(developed by confluent), returns GenericRecord instead of Object, have to use it with schema registry  
GenericAvroDeserializer wraps KafkaAvroDeserializer(developed by confluent), have to use it with schema registry  

ksqlDB uses only the default TopicNameStrategy, and does not currently support multiple schemas in a single topic.  

### Kafka stream serder
GenericAvroSerder  
SpecificAvroSerder  
ReflectionAvroSerde  
![image](https://user-images.githubusercontent.com/37034642/116643045-c895f900-a9a2-11eb-882e-cdfc4f1d7c71.png)

KafkaAvroSerializer validate the schema when serializing, throw SerializationExeception when it is invalid

# Kafka

### How to choose number of partitions
https://www.confluent.io/blog/how-choose-number-topics-partitions-kafka-cluster/
https://www.confluent.io/blog/kafka-streams-tables-part-2-topics-partitions-and-storage-fundamentals/
Tip: if in doubt, use 30 partitions per topic. This is a good number because (a) it is high enough to cover some really high-throughput requirements, (b) it is low enough that you will not hit the limit anytime soon of how many partitions a single broker can handle, even if you create many topics in your Kafka cluster, and (c) it is a highly composite number as it is evenly divisible by 1, 2, 3, 5, 6, 10, 15, and 30. This benefits the processing layer because it results in a more even workload distribution across application instances when horizontally scaling out (adding app instances) and scaling in (removing instances). Since Kafka supports hundreds of thousands of partitions in a cluster, this over-partitioning strategy is a safe approach for most users.

# Kafka connect

### build and extend docker image
https://docs.confluent.io/platform/current/installation/docker/development.html#extending-images

# Kafka community version vs confluent version
https://docs.confluent.io/platform/current/installation/versions-interoperability.html
