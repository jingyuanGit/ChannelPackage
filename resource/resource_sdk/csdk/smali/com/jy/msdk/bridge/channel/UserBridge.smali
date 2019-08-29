.class public Lcom/jy/msdk/bridge/channel/UserBridge;
.super Ljava/lang/Object;
.source "UserBridge.java"

# interfaces
.implements Lcom/jy/msdk/bridge/core/IUser;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public login(Landroid/content/Context;)V
    .registers 5

    .prologue
    .line 19
    invoke-static {}, Lcom/jy/msdk/open/UserFuns;->getInstance()Lcom/jy/msdk/open/UserFuns;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jy/msdk/open/UserFuns;->getUserInfo()Lcom/jy/msdk/bean/UserInfo;

    move-result-object v0

    .line 20
    invoke-static {}, Lcom/jy/msdk/open/UserFuns;->getInstance()Lcom/jy/msdk/open/UserFuns;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jy/msdk/open/UserFuns;->getState()Lcom/jy/msdk/model/login/LoginState;

    move-result-object v1

    .line 22
    sget-object v2, Lcom/jy/msdk/model/login/LoginState;->LOGINED:Lcom/jy/msdk/model/login/LoginState;

    if-ne v1, v2, :cond_26

    .line 23
    invoke-static {}, Lcom/jy/msdk/open/ListenerCache;->getInstance()Lcom/jy/msdk/open/ListenerCache;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jy/msdk/open/ListenerCache;->getLoginListener()Lcom/jy/msdk/listeners/LoginListener;

    move-result-object v1

    .line 24
    if-eqz v1, :cond_25

    .line 25
    invoke-virtual {v0}, Lcom/jy/msdk/bean/UserInfo;->getUserId()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/jy/msdk/listeners/LoginListener;->onSuccess(Ljava/lang/String;)V

    .line 30
    :cond_25
    :goto_25
    return-void

    .line 29
    :cond_26
    invoke-static {}, Lcom/jy/csdk/CSdkApi;->getInstance()Lcom/jy/csdk/CSdkApi;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/jy/csdk/CSdkApi;->login(Landroid/content/Context;)V

    goto :goto_25
.end method

.method public logout(Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 34
    invoke-static {}, Lcom/jy/msdk/open/ListenerCache;->getInstance()Lcom/jy/msdk/open/ListenerCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jy/msdk/open/ListenerCache;->getLogoutListener()Lcom/jy/msdk/listeners/LogoutListener;

    move-result-object v0

    .line 36
    if-eqz v0, :cond_d

    .line 37
    invoke-interface {v0}, Lcom/jy/msdk/listeners/LogoutListener;->onSuccess()V

    .line 38
    :cond_d
    return-void
.end method

.method public submitRoleInfo(Landroid/content/Context;Lcom/jy/msdk/bean/RoleInfo;)V
    .registers 3

    .prologue
    .line 43
    return-void
.end method
