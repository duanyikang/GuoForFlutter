package com.yichuizi.flutter_app;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;


/**
 * 作者： duanyikang on 2019-07-25.
 * 描述：
 */
public class WechatActivity extends Activity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_wechat_layout);

    }

    @Override
    public void onClick(View view) {
        System.out.println("走到我了：Android click");
        setResult(RESULT_OK);
        finish();
    }
}
