package com.fusionhs.backend.exception;

import org.springframework.http.HttpStatus;

public class DomainException extends RuntimeException {
    HttpStatus httpStatus;

    public DomainException(HttpStatus httpStatus, String message) {
        super(message);
        this.httpStatus = httpStatus;
    }

    public DomainException(HttpStatus httpStatus, String message, Throwable cause) {
        super(message, cause);
        this.httpStatus = httpStatus;
    }

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }
}
