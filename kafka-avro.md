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

# Kafka community version vs confluent version
https://docs.confluent.io/platform/current/installation/versions-interoperability.html
