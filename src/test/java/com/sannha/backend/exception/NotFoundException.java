package com.sannha.backend.exception;

import org.springframework.http.HttpStatus;

public class NotFoundException extends BusinessException {

    public NotFoundException(String resource, Object id) {
        super("Không tìm thấy " + resource + " với id = " + id, HttpStatus.NOT_FOUND);
    }
}