package com.ubc.common.apis;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ubc.avocarbo.MainActivity;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public final class AvocarboAPIs {

    // need this callback to handle async response
    public interface VolleyResponseListener {
        void onError(String message);
        void onResponse(JSONObject message) throws JSONException;
    }

    public static void getCarbsCount(Context context, float portion, String file, VolleyResponseListener volleyResponseListener) {
        JSONObject jsonBody = new JSONObject();
        try {
            jsonBody.put("portion", portion);
            jsonBody.put("file", file);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        final String requestBody = jsonBody.toString();
        StringRequest mStringRequest = new StringRequest(Request.Method.POST, URLs.calculateCarbs,
            response -> {
                JSONObject jsonRes = null;
                try {
                    jsonRes = new JSONObject(response);
                    volleyResponseListener.onResponse(jsonRes);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            },
            error -> volleyResponseListener.onError(error.toString()))
            {
                @Override
                public String getBodyContentType() {
                    return "application/json; charset=utf-8";
                }
                @Override
                public byte[] getBody() {
                    try {
                        return requestBody.getBytes("utf-8");
                    } catch (UnsupportedEncodingException uee) {
                        VolleyLog.wtf("Unsupported Encoding while trying to get the bytes of %s using %s", requestBody, "utf-8");
                        return null;
                    }
                }
                @Override
                public Map<String, String> getHeaders() throws AuthFailureError {
                    SharedPreferences sh = context.getSharedPreferences("AuthToken", Context.MODE_PRIVATE);
                    String authToken = sh.getString("authToken", "");

                    Map<String, String>  params = new HashMap<String, String>();
                    params.put("Authorization", "Bearer " + authToken);
                    return params;
                }
            };
        RequestQueue requestQueue = Volley.newRequestQueue(context);
        requestQueue.add(mStringRequest);
    }


    public static void login(Context context, String email, String password, VolleyResponseListener volleyResponseListener) {
        JSONObject payload = new JSONObject();
        try {
            payload.put("email", email);
            payload.put("password", password);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        JsonObjectRequest mStringRequest = new JsonObjectRequest(Request.Method.POST, URLs.login, payload,
                response -> {
                    try {
                        volleyResponseListener.onResponse(response);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                },
                error -> volleyResponseListener.onError(error.toString()));
        RequestQueue requestQueue = Volley.newRequestQueue(context);
        requestQueue.add(mStringRequest);
    }

    public static void signup(Context context, String email, String password, VolleyResponseListener volleyResponseListener) {
        JSONObject payload = new JSONObject();
        try {
            payload.put("email", email);
            payload.put("password", password);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        JsonObjectRequest mStringRequest = new JsonObjectRequest(Request.Method.POST, URLs.signup, payload,
                response -> {
                    try {
                        volleyResponseListener.onResponse(response);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                },
                error -> volleyResponseListener.onError(error.toString()));
        RequestQueue requestQueue = Volley.newRequestQueue(context);
        requestQueue.add(mStringRequest);
    }
}
