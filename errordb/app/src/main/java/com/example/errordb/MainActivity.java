package com.example.errordb;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;


public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setContentView(R.layout.activity_main);
        super.onCreate(savedInstanceState);
        EditText et=(EditText)findViewById(R.id.et);
        Button insb=(Button)findViewById(R.id.insb);
        Button viewb=(Button)findViewById(R.id.viewb);
        EditText erno=(EditText)findViewById(R.id.etrno);
        SQLiteDatabase db;
        db=openOrCreateDatabase("mydb", Context.MODE_PRIVATE,null);
        db.execSQL("CREATE TABLE IF NOT EXISTS stud(rno VARCHAR,stname VARCHAR);");

        insb.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String s=et.getText().toString();
                String r=erno.getText().toString();
                if(s.length()!=0 && r.length()!=0) {
                    db.execSQL("insert into stud values('"+r+"','"+s+"');");
                }
            }
        });


        viewb.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String s=et.getText().toString();
                String r=erno.getText().toString();
                if(r.length()!=0)
                {
                    Cursor c=db.rawQuery("SELECT * FROM stud WHERE rno='"+r+"';",null);

                    if(c.moveToFirst())
                    {
                        et.setText(c.getString(0));
                        Log.d("main", "onclick" + c.getString(1));
                    }
                }


            }
        });




    }}