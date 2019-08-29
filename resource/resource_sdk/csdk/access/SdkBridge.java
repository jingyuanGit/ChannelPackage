package com.jy.msdk.bridge.channel;

import android.content.Context;
import android.widget.ImageView;

import com.jy.csdk.CSdkApi;
import com.jy.csdk.LoginCallBack;
import com.jy.msdk.bridge.core.ISdk;
import com.jy.msdk.model.config.SdkConfig;

public class SdkBridge implements ISdk {

    @Override
    public void init(Context context) {
        String gameId = SdkConfig.getInstance().get("channelGameId");

        CSdkApi.getInstance().init(context, gameId);
    }

    @Override
    public boolean isHaveExitDialog() {
        return false;
    }

    @Override
    public void exit(Context context) {

    }

    @Override
    public boolean isSupportSplash() {
        return false;
    }

    @Override
    public void startSplash(Context context, ImageView imageView) {

    }
}
