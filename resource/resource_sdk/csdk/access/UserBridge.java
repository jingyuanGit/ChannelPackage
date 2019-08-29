package com.jy.msdk.bridge.channel;

import android.content.Context;

import com.jy.csdk.CSdkApi;
import com.jy.msdk.bean.RoleInfo;
import com.jy.msdk.bean.UserInfo;
import com.jy.msdk.bridge.core.IUser;
import com.jy.msdk.listeners.LoginListener;
import com.jy.msdk.listeners.LogoutListener;
import com.jy.msdk.model.login.LoginState;
import com.jy.msdk.open.ListenerCache;
import com.jy.msdk.open.UserFuns;

public class UserBridge implements IUser {

    @Override
    public void login(Context context) {
        UserInfo userInfo = UserFuns.getInstance().getUserInfo();
        LoginState state = UserFuns.getInstance().getState();
        //如果已经登录，不在拉取登录框
        if (state == LoginState.LOGINED) {
            LoginListener loginListener = ListenerCache.getInstance().getLoginListener();
            if (loginListener != null) {
                loginListener.onSuccess(userInfo.getUserId());
            }
            return;
        }
        CSdkApi.getInstance().login(context);
    }

    @Override
    public void logout(Context context) {
        LogoutListener logoutListener = ListenerCache.getInstance().getLogoutListener();
        //回调登录成功
        if (logoutListener != null)
            logoutListener.onSuccess();
    }

    @Override
    public void submitRoleInfo(Context context, RoleInfo roleInfo) {

    }
}
