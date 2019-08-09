package com.yichuizi.flutter_app.plugin;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;

/**
 * 作者： duanyikang on 2019-08-01.
 * 描述：
 */
public class WechatLoginPlugin implements MethodChannel.MethodCallHandler {

    private static BasicMessageChannel<Object> runTimeSender;


    /**
     * Plugin registration.
     */
    public static void registerWith(PluginRegistry.Registrar registrar) {
        runTimeSender = new BasicMessageChannel<>(registrar.messenger(), "com.yichuizi.flutter_app/wechat_state", new StandardMessageCodec());

    }

    public static void onClick() {

        if (runTimeSender != null) {
            System.out.println("走到我了；？？？？？？？");
            runTimeSender.send("666666666");
        }

    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

    }
}
