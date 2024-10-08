package com.books.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;


@Configuration
public class SecurityArgumentResolversWebMvcConfig implements WebMvcConfigurer {
    private final SecurityHandlerMethodArgumentResolver securityHandlerMethodArgumentResolver;

    @Autowired
    public SecurityArgumentResolversWebMvcConfig(SecurityHandlerMethodArgumentResolver securityHandlerMethodArgumentResolver) {
        this.securityHandlerMethodArgumentResolver = securityHandlerMethodArgumentResolver;
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(securityHandlerMethodArgumentResolver);
    }
}
