package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main3);
        Intent i=getIntent();
        String s=i.getStringExtra("t1");
        TextView tv=(TextView)findViewById(R.id.t2);
        tv.setText(s);
        Toast.makeText(this, s, Toast.LENGTH_SHORT).show();
    }
}