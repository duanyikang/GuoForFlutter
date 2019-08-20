package com.yichuizi.flutter_app;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;

import com.yichuizi.flutter_app.plugin.WechatLoginPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterMain;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.yichuizi.flutter_app/wechat";
    private static final String CHANNEL2 = "com.yichuizi.flutter_app/wechat_state";

    private static BasicMessageChannel<Object> runTimeSender;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        System.out.println("走到我了？嘎嘎1111111");
        FlutterMain.startInitialization(this);

        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        System.out.println("走到我了？嘎嘎22222");

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    //打开新的Activity
                    System.out.println("走到我了？嘎嘎333333");

                    Intent intent=new Intent(MainActivity.this, WechatActivity.class);
                    startActivityForResult(intent,999);
                });



        runTimeSender = new BasicMessageChannel<>(getFlutterView(), "com.yichuizi.flutter_app/wechat_state", new StandardMessageCodec());

    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        System.out.println("走到我了？？？");
        runTimeSender.send("666666666");
    }
}