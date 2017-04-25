package com.hiveview.util;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * Created by huxunqiang on 17/3/25.
 */
public class Test {

    public static void main(String[] args) {
//        List<Integer> a = Arrays.asList(1,2);
        List<Integer> a = null;
//        a.stream().forEach(b -> System.out.println(b));

        Optional.ofNullable(a).ifPresent(as ->
                as.stream().forEach(b -> {
                    System.out.println(b);
                })
        );

    }
    private  static void chage(Long a){
        a = 8888888888888888888L;
    }
}

