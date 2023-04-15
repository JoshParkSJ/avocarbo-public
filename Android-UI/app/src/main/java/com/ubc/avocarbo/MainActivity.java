package com.ubc.avocarbo;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.*;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.view.View;

import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import com.google.ar.core.ArCoreApk;
import com.google.ar.core.Session;
import com.google.ar.core.exceptions.UnavailableUserDeclinedInstallationException;

import android.os.Bundle;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;


// TODO: form validation for sign up
// TODO: error messages for login/signup
// TODO: after logging/signing in, pressing the back button moves us back to login/signin page. We don't want this behaviour.
// TODO: do

public class MainActivity extends AppCompatActivity {
    private static Session mSession;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // check if ARCore is enabled
         maybeEnableArButton();


    }

    public void launch_signup_page(View v) {
        Intent i = new Intent(MainActivity.this, Signup.class);
        startActivity(i);
    }

    public void launch_login_page(View v) {
        Intent i = new Intent(MainActivity.this, Login.class);
        startActivity(i);
    }

    // check if ARCore is enabled
    void maybeEnableArButton() {
        ArCoreApk.Availability availability = ArCoreApk.getInstance().checkAvailability(this);
        if (availability.isTransient()) {
            // Continue to query availability at 5Hz while compatibility is checked in the background.
            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    maybeEnableArButton();
                }
            }, 200);
        }
        if (availability.isSupported()) {
            // avocarbo app can continue
            // TODO: re-direct user to next step
        } else {
            // The device is unsupported or unknown
            // TODO: workflow to handle unsupported device
            // mArButton.setVisibility(View.INVISIBLE);
            // mArButton.setEnabled(false);
        }
    }

    // requestInstall(Activity, true) will trigger installation of
    // Google Play Services for AR if necessary.
    @Override
    protected void onResume() {
        super.onResume();

        // TODO: check camera permission and handle workflow
        if (ContextCompat.checkSelfPermission(MainActivity.this, Manifest.permission.CAMERA) == PackageManager.PERMISSION_DENIED) {
        }

        // Ensure that Google Play Services for AR and ARCore device profile data are
        // installed and up to date.
        try {
            if (mSession == null) {

                boolean mUserRequestedInstall = true;
                switch (ArCoreApk.getInstance().requestInstall(this, mUserRequestedInstall)) {
                    case INSTALLED:
                        // Success: Safe to create the AR session.
                        mSession = new Session(this);
                        break;
                    case INSTALL_REQUESTED:
                        // When this method returns `INSTALL_REQUESTED`:
                        // 1. ARCore pauses this activity.
                        // 2. ARCore prompts the user to install or update Google Play
                        //    Services for AR (market://details?id=com.google.ar.core).
                        // 3. ARCore downloads the latest device profile data.
                        // 4. ARCore resumes this activity. The next invocation of
                        //    requestInstall() will either return `INSTALLED` or throw an
                        //    exception if the installation or update did not succeed.
                        mUserRequestedInstall = false;
                        return;
                }
            }
        } catch (UnavailableUserDeclinedInstallationException e) {
            // TODO: display an appropriate message to the user and return gracefully.
            Toast.makeText(this, "TODO: handle exception " + e, Toast.LENGTH_LONG).show();
            return;
        } catch(Exception e) {
            // TODO: workflow for when exception occurred
            return;  // mSession remains null, since session creation has failed.
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

}