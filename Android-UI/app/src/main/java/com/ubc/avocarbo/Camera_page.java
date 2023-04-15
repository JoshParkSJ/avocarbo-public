package com.ubc.avocarbo;

import android.content.Intent;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationBarView;

public class Camera_page extends AppCompatActivity {

    BottomNavigationView bottomNavigationView;

    public void launch_camera(View v)
    {
        Log.d("Launching camera", "before");
        Intent i = new Intent(Camera_page.this, FoodCamera.class);
        startActivity(i);
        Log.d("Launching camera", "after");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.camera_page);

        bottomNavigationView = findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setSelectedItemId(R.id.camera);

        bottomNavigationView.setOnItemSelectedListener(new NavigationBarView.OnItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {

                switch (item.getItemId()){
                    case(R.id.camera):
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
                        startActivity(new Intent(getApplicationContext(), MainPage.class));
                        overridePendingTransition(0,0);
                        return true;
                }
                return false;
            }
        });

    }

}
