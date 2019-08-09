package com.yichuizi.flutter_app;

import android.os.Bundle;
import android.view.View;

import com.yichuizi.flutter_app.plugin.WechatLoginPlugin;

import io.flutter.app.FlutterActivity;


/**
 * 作者： duanyikang on 2019-07-25.
 * 描述：
 */
public class WechatActivity extends FlutterActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_wechat_layout);

        WechatLoginPlugin.registerWith(registrarFor("com.yichuizi.flutter_app/wechat_state"));
    }

    @Override
    public void onClick(View view) {
        WechatLoginPlugin.onClick();

       // finish();
    }
}
