package com.fusionhs.backend.service;

import com.fusionhs.backend.config.ExampleConfig;
import com.fusionhs.backend.model.ExampleResponse;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;

@Log4j2
@Service
@AllArgsConstructor
public class ExampleService {

    private final ExampleConfig config;

    public Flux<ExampleResponse> getList() {
        log.info("Got request");
        return Flux.just(
                new ExampleResponse(config.getPrefix()+" item1"),
                new ExampleResponse(config.getPrefix()+" item2"),
                new ExampleResponse(config.getPrefix()+" item3")
        );
    }
}
