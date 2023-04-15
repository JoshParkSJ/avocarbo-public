package com.ubc.avocarbo;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.util.Base64;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationBarView;

import org.json.JSONException;
import org.json.JSONObject;

public class History_page extends AppCompatActivity {

    BottomNavigationView bottomNavigationView ;

    String JSON_STRING = "{\"mealID\":{\"email\":\"test\",\"mealId\":d3f, \"portion_amount\":\"15.929097\", " +
            "\"carb_amount\":\"0\", \"date_taken\":\"2023-01-12T13:23:36.303+00:00\", \"food_name\":\"dining_table\"}}";

    String food_name, date_taken, portion_amount, carb_amount;
    TextView foodName, dateTaken, carbAmount, portionAmount;




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.history);

        bottomNavigationView = findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setSelectedItemId(R.id.history);

        bottomNavigationView.setOnItemSelectedListener(new NavigationBarView.OnItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {

                switch (item.getItemId()){
                    case(R.id.camera):
                        startActivity(new Intent(getApplicationContext(), Camera_page.class));
                        overridePendingTransition(0,0);
                        return true;
                    case(R.id.history):
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
        ImageView menu = findViewById(R.id.menu);
        menu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(getApplicationContext(), Settings_page.class));
                overridePendingTransition(0,0);
            }
        });


        //getting information of meal from backend

        // get the reference of TextView's
        //foodName = (TextView) findViewById(R.id.food_name);
        //dateTaken = (TextView) findViewById(R.id.date_taken);
        //carbAmount = (TextView) findViewById(R.id.carb_amount);
        //portionAmount = (TextView) findViewById(R.id.portion_amount);

        //try {
            // get JSONObject from JSON file
        //    JSONObject obj = new JSONObject(JSON_STRING);
            // fetch JSONObject
        //    JSONObject mealID = obj.getJSONObject("mealID");

            //get food name, etc.
        //    food_name = mealID.getString("food_name");
        //    date_taken = mealID.getString("date_taken");
        //    carb_amount = mealID.getString("carb_amount");
        //    portion_amount = mealID.getString("portion_amount");

            // set food name, etc. in TextView's
        //    foodName.setText("Food: "+ food_name);
        //    dateTaken.setText("Date: "+ date_taken);
        //    carbAmount.setText("Carb: "+ carb_amount);
        //   portionAmount.setText("Portion: "+ portion_amount);


        //} catch (JSONException e) {
        //    e.printStackTrace();
        //}

        //display images


        /*byte[] decodedScreenshot = Base64.decode(screenshot, 0);
        Bitmap bitmapScreenshot = BitmapFactory.decodeByteArray(decodedScreenshot, 0, decodedScreenshot.length);
        ImageView screenshotView = (ImageView) findViewById(R.id.screenshot);
        screenshotView.setImageBitmap(bitmapScreenshot); */
    }

}
