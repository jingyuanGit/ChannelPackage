package com.jy.msdk.bridge.channel;

import android.content.Context;
import android.widget.Toast;

import com.jy.csdk.CSdkApi;
import com.jy.msdk.bean.OrderInfo;
import com.jy.msdk.bean.RoleInfo;
import com.jy.msdk.bean.UserInfo;
import com.jy.msdk.bridge.core.IPay;


public class PayBridge implements IPay {

    @Override
    public void pay(Context context, OrderInfo orderInfo, RoleInfo gameRoleInfo, UserInfo userInfo) {
        CSdkApi.getInstance().pay(context, orderInfo.getProductName(), orderInfo.getAmount());
    }

}
