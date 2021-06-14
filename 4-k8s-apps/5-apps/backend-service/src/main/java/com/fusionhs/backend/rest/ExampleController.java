package com.fusionhs.backend.rest;

import com.fusionhs.backend.model.ExampleResponse;
import com.fusionhs.backend.service.ExampleService;
import lombok.AllArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

@AllArgsConstructor
@RestController
public class ExampleController {

        private final ExampleService exampleService;

        @GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_VALUE)
        public Flux<ExampleResponse> getList(){
                return exampleService.getList();
        }
}
