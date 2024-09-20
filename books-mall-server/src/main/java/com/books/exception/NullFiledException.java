package com.books.exception;

import org.springframework.http.HttpStatus;


public class NullFiledException extends BaseException {
    public NullFiledException(String msg) {
        super(msg, HttpStatus.BAD_REQUEST);
    }
}
