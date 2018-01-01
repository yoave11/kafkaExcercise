package yoav.producer;

import akka.Done;
import akka.actor.ActorSystem;
import akka.kafka.ProducerSettings;
import akka.kafka.javadsl.Producer;
import akka.stream.ActorMaterializer;
import akka.stream.Materializer;
import akka.stream.javadsl.Source;
import org.apache.kafka.common.serialization.ByteArraySerializer;
import org.apache.kafka.common.serialization.StringSerializer;
import org.apache.kafka.clients.producer.ProducerRecord;

import java.util.concurrent.CompletionStage;

public class Main {

    public static void main(String[] args) throws InterruptedException {
        System.out.println("Producer Main!");

        final ActorSystem system = ActorSystem.create("Yoav");
        final Materializer materializer = ActorMaterializer.create(system);

        final ProducerSettings<byte[], String> producerSettings = ProducerSettings
                .create(system, new ByteArraySerializer(), new StringSerializer())
                .withBootstrapServers("192.168.0.66:9092");
        while (true){
            System.out.println("New Stream");
            CompletionStage<Done> result = Source.range(1, 100)
                    .map(n -> n.toString()).map(elem -> new ProducerRecord<byte[], String>("yoav", elem))
                    .runWith(Producer.plainSink(producerSettings), materializer);
            Thread.sleep(10000);
        }

    }
}

