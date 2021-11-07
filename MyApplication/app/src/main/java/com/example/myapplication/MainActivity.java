package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("my");
    }
    public void fun(View v)
    {
        TextView tv=(TextView)findViewById(R.id.t);
        EditText ett=(EditText)findViewById(R.id.et);
        Button bt=(Button)findViewById(R.id.b);
        tv.setText("hello"+ett.getText().toString());






    }
    public void nextpage(View v)
    {
        EditText ett=(EditText)findViewById(R.id.et);
        Intent i=new Intent(this,MainActivity2.class);
        i.putExtra("t1",ett.getText().toString());
        startActivity(i);
    }
}