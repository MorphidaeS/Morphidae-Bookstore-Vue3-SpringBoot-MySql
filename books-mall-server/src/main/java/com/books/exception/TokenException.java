package com.books.exception;

import org.springframework.http.HttpStatus;


public class TokenException extends BaseException {
    public TokenException(String msg, HttpStatus code) {
        super(msg, code);
    }
}
