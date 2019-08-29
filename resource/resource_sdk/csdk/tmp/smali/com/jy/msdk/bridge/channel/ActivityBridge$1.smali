.class Lcom/jy/msdk/bridge/channel/ActivityBridge$1;
.super Ljava/lang/Object;
.source "ActivityBridge.java"

# interfaces
.implements Lcom/jy/csdk/LoginCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jy/msdk/bridge/channel/ActivityBridge;->onCreate(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jy/msdk/bridge/channel/ActivityBridge;


# direct methods
.method constructor <init>(Lcom/jy/msdk/bridge/channel/ActivityBridge;)V
    .registers 2

    .prologue
    .line 21
    iput-object p1, p0, Lcom/jy/msdk/bridge/channel/ActivityBridge$1;->this$0:Lcom/jy/msdk/bridge/channel/ActivityBridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 38
    invoke-static {}, Lcom/jy/msdk/open/ListenerCache;->getInstance()Lcom/jy/msdk/open/ListenerCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jy/msdk/open/ListenerCache;->getLoginListener()Lcom/jy/msdk/listeners/LoginListener;

    move-result-object v0

    .line 40
    if-eqz v0, :cond_f

    .line 41
    const/16 v1, 0x65

    invoke-interface {v0, v1, p1}, Lcom/jy/msdk/listeners/LoginListener;->onFailed(ILjava/lang/String;)V

    .line 42
    :cond_f
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .registers 5

    .prologue
    .line 26
    new-instance v0, Lcom/jy/msdk/bean/UserInfo;

    invoke-direct {v0}, Lcom/jy/msdk/bean/UserInfo;-><init>()V

    .line 27
    invoke-virtual {v0, p1}, Lcom/jy/msdk/bean/UserInfo;->setUserId(Ljava/lang/String;)Lcom/jy/msdk/bean/UserInfo;

    .line 28
    invoke-static {}, Lcom/jy/msdk/open/UserFuns;->getInstance()Lcom/jy/msdk/open/UserFuns;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/jy/msdk/open/UserFuns;->setUserInfo(Lcom/jy/msdk/bean/UserInfo;)Lcom/jy/msdk/open/UserFuns;

    .line 29
    invoke-static {}, Lcom/jy/msdk/open/UserFuns;->getInstance()Lcom/jy/msdk/open/UserFuns;

    move-result-object v1

    sget-object v2, Lcom/jy/msdk/model/login/LoginState;->LOGINED:Lcom/jy/msdk/model/login/LoginState;

    invoke-virtual {v1, v2}, Lcom/jy/msdk/open/UserFuns;->setLoginState(Lcom/jy/msdk/model/login/LoginState;)Lcom/jy/msdk/open/UserFuns;

    .line 30
    invoke-static {}, Lcom/jy/msdk/open/ListenerCache;->getInstance()Lcom/jy/msdk/open/ListenerCache;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jy/msdk/open/ListenerCache;->getLoginListener()Lcom/jy/msdk/listeners/LoginListener;

    move-result-object v1

    .line 32
    if-eqz v1, :cond_29

    .line 33
    invoke-virtual {v0}, Lcom/jy/msdk/bean/UserInfo;->getUserId()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/jy/msdk/listeners/LoginListener;->onSuccess(Ljava/lang/String;)V

    .line 34
    :cond_29
    return-void
.end method
