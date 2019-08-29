package com.jy.msdk.bridge.channel;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;

import com.jy.csdk.CSdkApi;
import com.jy.csdk.LoginCallBack;
import com.jy.msdk.bean.UserInfo;
import com.jy.msdk.bridge.core.IActivity;
import com.jy.msdk.listeners.LoginListener;
import com.jy.msdk.model.login.LoginState;
import com.jy.msdk.open.ListenerCache;
import com.jy.msdk.open.UserFuns;


public class ActivityBridge implements IActivity {

    @Override
    public void onCreate(Activity activity) {
        CSdkApi.getInstance().setLoginCallBack(new LoginCallBack() {

            @Override
            public void onSuccess(String uid) {
                //TODO 这里只是简单地将渠道的sdk的uid回调了回去，正常流程应该是传到后台再进行处理，然后统一发放用户Id
                UserInfo userInfo = new UserInfo();
                userInfo.setUserId(uid);
                UserFuns.getInstance().setUserInfo(userInfo);
                UserFuns.getInstance().setLoginState(LoginState.LOGINED);
                LoginListener loginListener = ListenerCache.getInstance().getLoginListener();
                //回调登录成功
                if (loginListener != null)
                    loginListener.onSuccess(userInfo.getUserId());
            }

            @Override
            public void onFailed(String s) {
                LoginListener loginListener = ListenerCache.getInstance().getLoginListener();
                //回调登录成功
                if (loginListener != null)
                    loginListener.onFailed(101, s);
            }
        });
    }

    @Override
    public void onDestroy(Activity activity) {

    }

    @Override
    public void onStart(Activity activity) {
        CSdkApi.getInstance().onStart();
    }

    @Override
    public void onStop(Activity activity) {
        CSdkApi.getInstance().onStop();
    }

    @Override
    public void onResume(Activity activity) {
    }

    @Override
    public void onPause(Activity activity) {

    }

    @Override
    public void onRestart(Activity activity) {

    }


    @Override
    public void onNewIntent(Activity activity, Intent intent) {

    }

    @Override
    public void onActivityResult(Activity activity, int requestCode,
                                 int resultCode, Intent data) {

    }

    @Override
    public void onConfigurationChanged(Activity activity, Configuration paramConfiguration) {

    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {

    }

}
