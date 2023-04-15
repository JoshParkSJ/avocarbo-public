package com.ubc.avocarbo;

import android.content.Intent;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationBarView;

public class MainPage extends AppCompatActivity {

    BottomNavigationView bottomNavigationView ;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_page);

        bottomNavigationView = findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setSelectedItemId(R.id.home);

        bottomNavigationView.setOnItemSelectedListener(new NavigationBarView.OnItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {

                switch (item.getItemId()){
                    case(R.id.camera):
                        startActivity(new Intent(getApplicationContext(), Camera_page.class));
                        overridePendingTransition(0,0);
                        return true;
                    case(R.id.history):
                        startActivity(new Intent(getApplicationContext(), History_page.class));
                        overridePendingTransition(0,0);
                        return true;
                    case(R.id.recipes):
                        startActivity(new Intent(getApplicationContext(), Recipes_page.class));
                        overridePendingTransition(0,0);
                        return true;
                    case(R.id.profile):
                        startActivity(new Intent(getApplicationContext(), Profile_page.class));
                        overridePendingTransition(0,0);
                        return true;
                    case(R.id.home):
                        return true;
                }
                return false;
            }
        });

        ImageButton change = (ImageButton) findViewById(R.id.home_bread);
        change.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(MainPage.this, Bread.class);
                startActivity(i);
            }
        });

        ImageView menu = findViewById(R.id.menu);
        menu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(getApplicationContext(), Settings_page.class));
                overridePendingTransition(0,0);
            }
        });
    }
}
