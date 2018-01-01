package yoav.consumer;

import akka.Done;
import akka.NotUsed;
import akka.actor.ActorSystem;
import akka.kafka.ConsumerSettings;
import akka.kafka.Subscriptions;
import akka.kafka.javadsl.Consumer;
import akka.stream.ActorMaterializer;
import akka.stream.Materializer;
import akka.stream.javadsl.Sink;
import akka.stream.javadsl.Source;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.TopicPartition;
import org.apache.kafka.common.serialization.ByteArrayDeserializer;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;


public class Main {

    public static void main(String[] args) {
        System.out.println("Consumer Main");

        final Source<Integer, NotUsed> source = Source.range(1, 100);
        final ActorSystem system = ActorSystem.create("Yoav");
        final Materializer materializer = ActorMaterializer.create(system);


        final ConsumerSettings<byte[], String> consumerSettings =
                ConsumerSettings.create(system, new ByteArrayDeserializer(), new StringDeserializer())
                        .withBootstrapServers("192.168.0.66:9092")
                        .withGroupId("yoav")
                        .withProperty(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "true");

        CompletionStage<Done> result = Consumer.committableSource(
                consumerSettings,
                Subscriptions.topics("yoav")
        ).mapAsync(1, record -> {
            System.out.println(record.record().value());
            return CompletableFuture.completedFuture(Done.getInstance());
        })
                .runWith(Sink.ignore(), materializer);

        result.exceptionally(e -> {
            system.log().error(e, e.getMessage());
            return Done.getInstance();
        }).thenAccept(d -> system.terminate());
    }
}
