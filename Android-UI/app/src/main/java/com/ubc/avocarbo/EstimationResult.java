package com.ubc.avocarbo;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ubc.common.apis.AvocarboAPIs;
import com.ubc.common.apis.AvocarboAPIs;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class EstimationResult extends AppCompatActivity {
    private static float volume;
    private static String screenshot;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.estimation_result);

        Bundle props = getIntent().getExtras();
        volume = props.getFloat("volume") * 1000;
        screenshot = props.getString("screenshot");

        displayResults();
    }

    private void displayResults() {
        TextView volumeTextView = (TextView) findViewById(R.id.portion_estimation_result);
        String volumeText = "Volume: " + volume + "cm^3";
        volumeTextView.setText(volumeText);

        //next four lines- copy and paste for picture display
        byte[] decodedScreenshot = Base64.decode(screenshot, 0);
        Bitmap bitmapScreenshot = BitmapFactory.decodeByteArray(decodedScreenshot, 0, decodedScreenshot.length);
        ImageView screenshotView = (ImageView) findViewById(R.id.screenshot);
        screenshotView.setImageBitmap(bitmapScreenshot);

        AvocarboAPIs.getCarbsCount(this.getApplicationContext(), volume, screenshot, new AvocarboAPIs.VolleyResponseListener() {
            @Override
            public void onResponse(JSONObject response) throws JSONException {
                String food_name = response.getString("food_name");
                float carb_count = Float.parseFloat(response.getString("carbs_count"));

                TextView volumeTextView = (TextView) findViewById(R.id.portion_estimation_result);
                String volumeText = "Volume: " + volume + "cm^3 of " + food_name + " has " + carb_count + "g of carbs";
                volumeTextView.setText(volumeText);
            }

            @Override
            public void onError(String message) {
                Log.e("Get carbs count error: ", message);
            }
        });
    }
}


