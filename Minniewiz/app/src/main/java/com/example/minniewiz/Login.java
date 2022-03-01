package com.example.minniewiz;

import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Base64;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.bottomsheet.BottomSheetDialog;
import com.mikhaellopez.circularimageview.CircularImageView;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executors;

public class Login extends AppCompatActivity implements View.OnClickListener {

    private Button btnSignUp, btnLogin, btnRegister;

    private Boolean isLoginTaskRunning;
    private LoginFunction loginFunction;

    private BottomSheetDialog bottomSheetDialog;

    private EditText etUsername, etPassword;

    private AlertDialog.Builder alertDialog;

    private CircularImageView imgProfile;
    private EditText firstname, lastname, regUsername, regPassword, regPasswordConf;
    private String imgBase64 = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        btnSignUp = findViewById(R.id.btnSignUp);
        btnLogin = findViewById(R.id.btnLogin);

        btnSignUp.setOnClickListener(this);
        btnLogin.setOnClickListener(this);

        etUsername = findViewById(R.id.username);
        etPassword = findViewById(R.id.password);

        alertDialog = new AlertDialog.Builder(this);
        alertDialog.setTitle("Warning");
        alertDialog.setIcon(R.drawable.ic_warning);
        alertDialog.setNegativeButton("OK", null);

        accountRegistration();

        isLoginTaskRunning = false;
    }

    private void accountRegistration(){
        View view = getLayoutInflater().inflate(R.layout.account_registration_sheet, null, false);
        bottomSheetDialog = new BottomSheetDialog(this, R.style.BottomSheetDialog);

        imgProfile = view.findViewById(R.id.imgProfile);
        firstname = view.findViewById(R.id.firstname);
        lastname = view.findViewById(R.id.lastname);
        regUsername = view.findViewById(R.id.regUsername);
        regPassword = view.findViewById(R.id.regPassword);
        regPasswordConf = view.findViewById(R.id.regPasswordConf);
        btnRegister = view.findViewById(R.id.btnRegister);

        imgProfile.setOnClickListener(v -> {
            Intent getIntent = new Intent(Intent.ACTION_GET_CONTENT);
            getIntent.setType("image/*");
            activityResultLauncher.launch(getIntent);
        });

        btnRegister.setOnClickListener(v -> {
            String fName = firstname.getText().toString();
            String lName = lastname.getText().toString();
            String username = regUsername.getText().toString();
            String password = regPassword.getText().toString();
            String passConf = regPasswordConf.getText().toString();

            if(fName.isEmpty() || lName.isEmpty() || username.isEmpty() || password.isEmpty() || passConf.isEmpty() || imgBase64.isEmpty()){
                Toast.makeText(Login.this, "Please complete the input fields including the image", Toast.LENGTH_SHORT).show();
            }
            else if(password.length() < 8){
                Toast.makeText(Login.this, "Password should be at least 8 characters long", Toast.LENGTH_SHORT).show();
            }
            else if(!password.equals(passConf)){
                Toast.makeText(Login.this, "Password don't match", Toast.LENGTH_SHORT).show();
            }
            else{
                register();
            }
        });

        bottomSheetDialog.setContentView(view);
    }

    public void register(){
        ProgressDialog progress = new ProgressDialog(this);
        progress.setMessage("Loading...");
        progress.setCancelable(false);
        progress.show();

        Handler handler = new Handler(Looper.getMainLooper());
        Volley.newRequestQueue(this).add(
            new StringRequest(
                Request.Method.POST, MainActivity.APP_URL + "android/set-user.php",
                res -> {
                    handler.post(() -> {
                        int outputCode = Integer.parseInt(res);
                        if(outputCode == 100){
                            Toast.makeText(this, "Username already exists", Toast.LENGTH_SHORT).show();
                        } else if(outputCode == 101){
                            Toast.makeText(this, "Can't register image to the server", Toast.LENGTH_SHORT).show();
                        } else if(outputCode == 102){
                            Toast.makeText(this, "Failed to register account please try again later", Toast.LENGTH_SHORT).show();
                        } else {
                            Toast.makeText(this, "Account has been successfully registered", Toast.LENGTH_SHORT).show();
                            bottomSheetDialog.dismiss();
                            firstname.setText("");
                            lastname.setText("");
                            regUsername.setText("");
                            regPassword.setText("");
                            regPasswordConf.setText("");
                            imgProfile.setImageDrawable(getResources().getDrawable(R.drawable.profile_placeholder, null));
                            imgBase64 = "";
                        }
                        progress.dismiss();
                    });
                },
                error -> {
                    handler.post(() -> {
                        Toast.makeText(this, error.getMessage(), Toast.LENGTH_SHORT).show();
                        progress.dismiss();
                    });
                }
            ){
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String, String> data = new HashMap<>();
                    data.put("firstname", firstname.getText().toString());
                    data.put("lastname", lastname.getText().toString());
                    data.put("username", regUsername.getText().toString());
                    data.put("password", regPassword.getText().toString());
                    data.put("img", imgBase64);
                    return data;
                }
            }
        );
    }

    ActivityResultLauncher<Intent> activityResultLauncher = registerForActivityResult(
        new ActivityResultContracts.StartActivityForResult(),
        result -> {
            if(result.getResultCode() == Activity.RESULT_OK){
                Handler handler = new Handler(Looper.getMainLooper());
                Executors.newSingleThreadExecutor().execute(() -> {
                    Uri uri = result.getData().getData();
                    try{
                        Bitmap bitmap = getThumbnail(uri);
                        handler.post(() -> {
                            imgProfile.setImageBitmap(bitmap);
                        });

                        //Convert to base64
                        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                        bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
                        byte[] byteArray = byteArrayOutputStream .toByteArray();

                        imgBase64 = Base64.encodeToString(byteArray, Base64.DEFAULT);
                    }
                    catch (Exception ex){
                        imgBase64 = "";
                        Toast.makeText(this, "Image failed to process, please select image again", Toast.LENGTH_SHORT).show();
                    }
                });
            }
        }
    );

    public Bitmap getThumbnail(Uri uri) throws Exception {
        InputStream input = this.getContentResolver().openInputStream(uri);

        BitmapFactory.Options onlyBoundsOptions = new BitmapFactory.Options();
        onlyBoundsOptions.inJustDecodeBounds = true;
        onlyBoundsOptions.inDither=true;//optional
        onlyBoundsOptions.inPreferredConfig=Bitmap.Config.ARGB_8888;//optional
        BitmapFactory.decodeStream(input, null, onlyBoundsOptions);
        input.close();

        if ((onlyBoundsOptions.outWidth == -1) || (onlyBoundsOptions.outHeight == -1)) {
            return null;
        }

        int originalSize = (onlyBoundsOptions.outHeight > onlyBoundsOptions.outWidth) ? onlyBoundsOptions.outHeight : onlyBoundsOptions.outWidth;

        double ratio = (originalSize > 130) ? (originalSize / 130) : 1.0;

        BitmapFactory.Options bitmapOptions = new BitmapFactory.Options();
        bitmapOptions.inSampleSize = getPowerOfTwoForSampleRatio(ratio);
        bitmapOptions.inPreferredConfig=Bitmap.Config.ARGB_8888;//
        input = getContentResolver().openInputStream(uri);
        Bitmap bitmap = BitmapFactory.decodeStream(input, null, bitmapOptions);
        input.close();
        return bitmap;
    }

    private int getPowerOfTwoForSampleRatio(double ratio){
        int k = Integer.highestOneBit((int)Math.floor(ratio));
        if(k==0) return 1;
        else return k;
    }

    @Override
    public void onClick(View v) {
        if(v == btnSignUp){
            //startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(MainActivity.APP_URL + "pages/register-account.php")));
            bottomSheetDialog.show();
        }
        else if(v == btnLogin){
            if(etUsername.getText().toString().isEmpty() || etPassword.getText().toString().isEmpty()){
                alertDialog.setMessage("Username or Password is empty");
                alertDialog.show().getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getResources().getColor(R.color.secondary));
            }
            else{
                if(!isLoginTaskRunning){
                    loginFunction = new LoginFunction();
                    loginFunction.execute();
                }
            }
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if(isLoginTaskRunning){
            loginFunction.cancel(true);
        }
        isLoginTaskRunning = false;
    }

    class LoginFunction extends AsyncTask<Void, String, Void> implements Response.Listener<String>, Response.ErrorListener{

        private ProgressDialog progress;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progress = new ProgressDialog(Login.this);
            progress.setMessage("Loading...");
            progress.setCancelable(false);
            progress.show();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            RequestQueue requestQueue = Volley.newRequestQueue(Login.this);
            String url = MainActivity.APP_URL + "android/login.php";

            StringRequest stringRequest = new StringRequest(Request.Method.POST, url, this, this){
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String, String> data = new HashMap<>();
                    data.put("username", etUsername.getText().toString());
                    data.put("password", etPassword.getText().toString());

                    return data;
                }
            };
            requestQueue.add(stringRequest);

            isLoginTaskRunning = true;
            return null;
        }

        @Override
        public void onResponse(String response) {
            publishProgress(response);
        }

        @Override
        public void onErrorResponse(VolleyError error) {
            Toast.makeText(Login.this, error.getMessage(), Toast.LENGTH_SHORT).show();
            publishProgress("Invalid");
        }

        @Override
        protected void onProgressUpdate(String... values){
            if(values[0].equals("Invalid")){
                alertDialog.setMessage("Wrong password or username").show();
            }
            else{
                MainActivity.USER_ID = values[0];
                getSharedPreferences("LOGIN", MODE_PRIVATE).edit().putString("USER_ID", values[0]).apply();
                startActivity(new Intent(Login.this, MainActivity.class));
            }
            progress.dismiss();
        }

        @Override
        protected void onPostExecute(Void unused) {
            super.onPostExecute(unused);
            isLoginTaskRunning = false;
        }
    }
}