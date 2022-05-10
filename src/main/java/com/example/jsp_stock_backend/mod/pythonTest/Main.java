package com.example.jsp_stock_backend.mod.pythonTest;

import lombok.*;


public class Main {

    public Main(){
        runn();
    }

    @SneakyThrows
    public void runn(){
        Runtime rt = Runtime.getRuntime();

        String file = "\"C:\\Users\\Taewoo\\Desktop\\pythonProject\\dist\\main\\main.exe\"";
        Process pro;

        pro = rt.exec(file);
        pro.waitFor();
    }

    public static void main(String[] args) {
        new Main();
    }

}
