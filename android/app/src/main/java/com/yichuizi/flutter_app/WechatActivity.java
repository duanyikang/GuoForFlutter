package com.yichuizi.flutter_app;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;


/**
 * 作者： duanyikang on 2019-07-25.
 * 描述：
 */
public class WechatActivity extends Activity implements View.OnClickListener {
    private static final String CHANNEL = "com.yichuizi.flutter_app/wechat";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_wechat_layout);
//        new EventChannel(getFlutterView(), CHANNEL).setStreamHandler(
//                new EventChannel.StreamHandler() {
//                    @Override
//                    public void onListen(Object o, EventChannel.EventSink eventSink) {
//                        this.eventSink = eventSink;
//
//                        handler.sendEmptyMessageDelayed(1, 1000);
//                    }
//
//                    @Override
//                    public void onCancel(Object o) {
//
//                    }
//
//                    private EventChannel.EventSink eventSink;
//                    private int count = 0;
//                    private Handler handler = new Handler() {
//                        @Override
//                        public void handleMessage(Message msg) {
//                            super.handleMessage(msg);
//                            eventSink.success((count++) + "主动发送消息给flutter");
//                        }
//                    };
//
//                }
//        );
    }

    @Override
    public void onClick(View view) {
        System.out.println("走到我了：Android click");
        setResult(RESULT_OK);
        finish();
        //WechatLoginPlugin.onClick();

        // finish();
    }
}
