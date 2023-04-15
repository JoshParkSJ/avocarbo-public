package com.ubc.common.apis;

class URLs {
    // android studio reroutes http://10.0.2.2:8000 to http://127.0.0.1:8000
    // https://developer.android.com/studio/run/emulator-networking
    private static String avocarboUrl = "cloud_url"; // hiding cloud url from github for security reasons

    // routes
    public static String calculateCarbs = avocarboUrl + "/calculate_carbs";
    public static String login = avocarboUrl + "/login";
    public static String signup = avocarboUrl + "/register";
}
