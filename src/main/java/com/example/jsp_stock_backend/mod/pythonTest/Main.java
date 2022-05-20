package com.example.jsp_stock_backend.mod.pythonTest;

import lombok.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class Main {

    public Main() {
        runn();
    }


    @SneakyThrows
    public void runn() {

        System.out.println("runn() 메서드 실행.");

        String cmd = "start C:\\projects\\jsp_stock\\jsp_stock_backend\\src\\main\\java\\com\\example\\jsp_stock_backend\\start.bat\"\n";
        Process p = Runtime.getRuntime().exec("cmd /c " + cmd);

        BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String l = null;

        StringBuffer sb = new StringBuffer();
        sb.append(cmd);

        while ((l = r.readLine()) != null) {
            sb.append(l);
            sb.append("\n");
        }


        System.out.println(sb.toString());

    }

    public static void main(String[] args) {
        new Main();
    }

}
