package com.books.exception;

import org.springframework.http.HttpStatus;


public class IdNotFoundException extends BaseException {
    public IdNotFoundException(String msg) {
        super(msg, HttpStatus.NOT_FOUND);
    }
}
