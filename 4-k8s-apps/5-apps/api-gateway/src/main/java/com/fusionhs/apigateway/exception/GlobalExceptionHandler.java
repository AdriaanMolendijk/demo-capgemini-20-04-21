package com.fusionhs.apigateway.exception;

import java.util.Map;

import brave.Tracer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.reactive.error.DefaultErrorAttributes;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.server.ServerWebInputException;

@Slf4j
@Component
public class GlobalExceptionHandler extends DefaultErrorAttributes {
    private final Tracer tracer;
    @Value("${trace-errors:false}")
    private boolean traceErrors;

    public GlobalExceptionHandler(Tracer tracer) {
        this.tracer = tracer;
    }

    @Override
    public Map<String, Object> getErrorAttributes(ServerRequest request, ErrorAttributeOptions options) {
        final var error = getError(request);
        final var errorAttributes = super.getErrorAttributes(request, options);
        if (tracer.currentSpan() != null) {
            errorAttributes.put(ErrorAttribute.TRACE_ID.value, tracer.currentSpan().context().traceIdString());
        }
        if (error instanceof DomainException) {
            final var errorStatus = ((DomainException) error).getHttpStatus();
            if (errorStatus.is5xxServerError()) {
                log.error("Server Error: {}", error);
            } else {
                log.info("Domain Exception: {}: {}", errorStatus.value(), error.getMessage());
            }
            errorAttributes.replace(ErrorAttribute.STATUS.value, errorStatus.value());

            errorAttributes.replace(ErrorAttribute.MESSAGE.value, error.getMessage());
            errorAttributes.replace(ErrorAttribute.ERROR.value, errorStatus.getReasonPhrase());
        } else if (error instanceof ServerWebInputException) {
            errorAttributes.replace(ErrorAttribute.MESSAGE.value, ((ServerWebInputException) error).getReason());
        } else if (traceErrors) {
            errorAttributes.replace(ErrorAttribute.MESSAGE.value, error.getMessage());
        }
        return errorAttributes;
    }

    enum ErrorAttribute {
        STATUS("status"),
        MESSAGE("message"),
        ERROR("error"),
        TRACE_ID("traceId");

        private final String value;

        ErrorAttribute(String value) {
            this.value = value;
        }
    }
}
