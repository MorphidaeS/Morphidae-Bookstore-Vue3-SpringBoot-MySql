package com.books.exception;

import org.springframework.http.HttpStatus;


public class SecurityServerException extends BaseException {
    public SecurityServerException(String msg, HttpStatus code) {
        super(msg, code);
    }
}
