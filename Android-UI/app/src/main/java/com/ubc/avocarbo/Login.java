package com.ubc.avocarbo;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ubc.common.apis.AvocarboAPIs;

import org.json.JSONException;
import org.json.JSONObject;

public class Login extends AppCompatActivity {

    private static Toast loginFailed;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login_page);

        Button change = (Button) findViewById(R.id.button_first);
        change.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(Login.this, Policy_page.class);
                startActivity(i);
            }
        });


//        loginFailed = Toast.makeText(this, getString(R.string.login_error), Toast.LENGTH_SHORT);
    }

//    public void login(View view) {
//        EditText email = (EditText) findViewById(R.id.usernameInput);
//        EditText password = (EditText) findViewById(R.id.passwordInput);
//
//        AvocarboAPIs.login(this.getApplicationContext(), email.getText().toString(), password.getText().toString(), new AvocarboAPIs.VolleyResponseListener() {
//            @Override
//            public void onResponse(JSONObject response) throws JSONException {
//                String authToken = response.getString("authToken");
//                SharedPreferences sharedPreferences = getSharedPreferences("AuthToken", MODE_PRIVATE);
//                SharedPreferences.Editor myEdit = sharedPreferences.edit();
//                myEdit.putString("authToken", authToken);
//                myEdit.apply();
//
//                Intent i = new Intent(Login.this, Policy_page.class);
//                startActivity(i);
//            }
//
//            @Override
//            public void onError(String message) {
//                Log.e("Login error", message);
//                loginFailed.show();
//            }
//        });
//    }
}