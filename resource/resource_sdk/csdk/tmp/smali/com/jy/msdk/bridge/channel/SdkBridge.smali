.class public Lcom/jy/msdk/bridge/channel/SdkBridge;
.super Ljava/lang/Object;
.source "SdkBridge.java"

# interfaces
.implements Lcom/jy/msdk/bridge/core/ISdk;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public exit(Landroid/content/Context;)V
    .registers 2

    .prologue
    .line 28
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .registers 4

    .prologue
    .line 15
    invoke-static {}, Lcom/jy/msdk/model/config/SdkConfig;->getInstance()Lcom/jy/msdk/model/config/SdkConfig;

    move-result-object v0

    const-string v1, "channelGameId"

    invoke-virtual {v0, v1}, Lcom/jy/msdk/model/config/SdkConfig;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 17
    invoke-static {}, Lcom/jy/csdk/CSdkApi;->getInstance()Lcom/jy/csdk/CSdkApi;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/jy/csdk/CSdkApi;->init(Landroid/content/Context;Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method public isHaveExitDialog()Z
    .registers 2

    .prologue
    .line 22
    const/4 v0, 0x0

    return v0
.end method

.method public isSupportSplash()Z
    .registers 2

    .prologue
    .line 32
    const/4 v0, 0x0

    return v0
.end method

.method public startSplash(Landroid/content/Context;Landroid/widget/ImageView;)V
    .registers 3

    .prologue
    .line 38
    return-void
.end method
