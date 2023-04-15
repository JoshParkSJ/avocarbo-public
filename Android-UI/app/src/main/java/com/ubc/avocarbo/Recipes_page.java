package com.ubc.avocarbo;

import android.content.Intent;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationBarView;

public class Recipes_page extends AppCompatActivity {

    BottomNavigationView bottomNavigationView ;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.recipes);

        bottomNavigationView = findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setSelectedItemId(R.id.recipes);

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
                        return true;
                    case(R.id.profile):
                        startActivity(new Intent(getApplicationContext(), Profile_page.class));
                        overridePendingTransition(0,0);
                        return true;
                    case(R.id.home):
                        startActivity(new Intent(getApplicationContext(), MainPage.class));
                        overridePendingTransition(0,0);
                        return true;
                }
                return false;
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

        Button recipe = (Button) findViewById(R.id.recipe1);
        recipe.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(Recipes_page.this, Recipe_example.class);
                startActivity(i);
            }
        });
    }

}
