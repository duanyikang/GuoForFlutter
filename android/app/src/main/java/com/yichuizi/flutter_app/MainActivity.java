package com.yichuizi.flutter_app;

import android.content.Intent;
import android.os.Bundle;

import com.yichuizi.flutter_app.plugin.WechatLoginPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterMain;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.yichuizi.flutter_app/wechat";

    @Override
    public void onCreate(Bundle savedInstanceState) {
        FlutterMain.startInitialization(this);

        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    //打开新的Activity
                    startActivity(new Intent(MainActivity.this, WechatActivity.class));
                });
    }
}