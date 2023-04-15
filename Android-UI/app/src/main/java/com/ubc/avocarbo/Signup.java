package com.ubc.avocarbo;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.ubc.common.apis.AvocarboAPIs;

import org.json.JSONException;
import org.json.JSONObject;

public class Signup extends AppCompatActivity {

    private static Toast signupFailed;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.signup_page);

        signupFailed = Toast.makeText(this, getString(R.string.signup_error), Toast.LENGTH_SHORT);
    }

    public void signup(View view) {
        EditText email = (EditText) findViewById(R.id.usernameInput);
        EditText password = (EditText) findViewById(R.id.passwordInput);

        AvocarboAPIs.signup(this.getApplicationContext(), email.getText().toString(), password.getText().toString(), new AvocarboAPIs.VolleyResponseListener() {
            @Override
            public void onResponse(JSONObject response) throws JSONException {
                String authToken = response.getString("authToken");
                SharedPreferences sharedPreferences = getSharedPreferences("AuthToken", MODE_PRIVATE);
                SharedPreferences.Editor myEdit = sharedPreferences.edit();
                myEdit.putString("authToken", authToken);
                myEdit.apply();

                Intent i = new Intent(Signup.this, Policy_page.class);
                startActivity(i);
            }

            @Override
            public void onError(String message) {
                Log.e("Signup error", message);
                signupFailed.show();
            }
        });
    }
}