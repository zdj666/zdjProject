package com.hzyc.registerSystem.tools;


import java.lang.annotation.*;

/**
 * @author lvgang
 */

@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemLog {
    String module()  default "";
    String methods()  default "";
}