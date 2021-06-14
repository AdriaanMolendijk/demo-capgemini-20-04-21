package com.fusionhs.backend.config;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.context.annotation.Configuration;

@OpenAPIDefinition(
        info = @Info(
                title = "Backend Service",
                version = "1.0.0"
        )
)
@Configuration
public class OpenApiConfig {
}
