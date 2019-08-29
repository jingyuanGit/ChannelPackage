.class public Lcom/jy/msdk/bridge/channel/ActivityBridge;
.super Ljava/lang/Object;
.source "ActivityBridge.java"

# interfaces
.implements Lcom/jy/msdk/bridge/core/IActivity;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V
    .registers 5

    .prologue
    .line 85
    return-void
.end method

.method public onConfigurationChanged(Landroid/app/Activity;Landroid/content/res/Configuration;)V
    .registers 3

    .prologue
    .line 90
    return-void
.end method

.method public onCreate(Landroid/app/Activity;)V
    .registers 4

    .prologue
    .line 21
    invoke-static {}, Lcom/jy/csdk/CSdkApi;->getInstance()Lcom/jy/csdk/CSdkApi;

    move-result-object v0

    new-instance v1, Lcom/jy/msdk/bridge/channel/ActivityBridge$1;

    invoke-direct {v1, p0}, Lcom/jy/msdk/bridge/channel/ActivityBridge$1;-><init>(Lcom/jy/msdk/bridge/channel/ActivityBridge;)V

    invoke-virtual {v0, v1}, Lcom/jy/csdk/CSdkApi;->setLoginCallBack(Lcom/jy/csdk/LoginCallBack;)Lcom/jy/csdk/CSdkApi;

    .line 44
    return-void
.end method

.method public onDestroy(Landroid/app/Activity;)V
    .registers 2

    .prologue
    .line 49
    return-void
.end method

.method public onNewIntent(Landroid/app/Activity;Landroid/content/Intent;)V
    .registers 3

    .prologue
    .line 79
    return-void
.end method

.method public onPause(Landroid/app/Activity;)V
    .registers 2

    .prologue
    .line 68
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 4

    .prologue
    .line 95
    return-void
.end method

.method public onRestart(Landroid/app/Activity;)V
    .registers 2

    .prologue
    .line 73
    return-void
.end method

.method public onResume(Landroid/app/Activity;)V
    .registers 2

    .prologue
    .line 63
    return-void
.end method

.method public onStart(Landroid/app/Activity;)V
    .registers 3

    .prologue
    .line 53
    invoke-static {}, Lcom/jy/csdk/CSdkApi;->getInstance()Lcom/jy/csdk/CSdkApi;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jy/csdk/CSdkApi;->onStart()V

    .line 54
    return-void
.end method

.method public onStop(Landroid/app/Activity;)V
    .registers 3

    .prologue
    .line 58
    invoke-static {}, Lcom/jy/csdk/CSdkApi;->getInstance()Lcom/jy/csdk/CSdkApi;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jy/csdk/CSdkApi;->onStop()V

    .line 59
    return-void
.end method
