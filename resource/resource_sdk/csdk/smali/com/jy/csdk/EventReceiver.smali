.class public Lcom/jy/csdk/EventReceiver;
.super Ljava/lang/Object;
.source "EventReceiver.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageEvent(Ljava/lang/String;)V
    .registers 9
    .param p1, "event"    # Ljava/lang/String;
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 13
    invoke-static {}, Lcom/jy/csdk/CSdkApi;->getInstance()Lcom/jy/csdk/CSdkApi;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jy/csdk/CSdkApi;->getLoginCallBack()Lcom/jy/csdk/LoginCallBack;

    move-result-object v0

    .line 14
    .local v0, "loginCallBack":Lcom/jy/csdk/LoginCallBack;
    const-string v2, "EventReceiver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onMessageEvent: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    if-eqz v0, :cond_42

    .line 16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 17
    const-string v2, "onMessageEvent null"

    invoke-interface {v0, v2}, Lcom/jy/csdk/LoginCallBack;->onFailed(Ljava/lang/String;)V

    .line 19
    :cond_2f
    const-string v2, ":"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 20
    .local v1, "split":[Ljava/lang/String;
    aget-object v5, v1, v3

    const/4 v2, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_64

    :cond_3f
    :goto_3f
    packed-switch v2, :pswitch_data_6e

    .line 29
    .end local v1    # "split":[Ljava/lang/String;
    :cond_42
    :goto_42
    return-void

    .line 20
    .restart local v1    # "split":[Ljava/lang/String;
    :sswitch_43
    const-string v6, "loginSuccess"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3f

    move v2, v3

    goto :goto_3f

    :sswitch_4d
    const-string v6, "LoginFailed"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3f

    move v2, v4

    goto :goto_3f

    .line 22
    :pswitch_57
    aget-object v2, v1, v4

    invoke-interface {v0, v2}, Lcom/jy/csdk/LoginCallBack;->onSuccess(Ljava/lang/String;)V

    goto :goto_42

    .line 25
    :pswitch_5d
    aget-object v2, v1, v3

    invoke-interface {v0, v2}, Lcom/jy/csdk/LoginCallBack;->onFailed(Ljava/lang/String;)V

    goto :goto_42

    .line 20
    nop

    :sswitch_data_64
    .sparse-switch
        -0x6575db1a -> :sswitch_4d
        0x7e68705a -> :sswitch_43
    .end sparse-switch

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_57
        :pswitch_5d
    .end packed-switch
.end method
