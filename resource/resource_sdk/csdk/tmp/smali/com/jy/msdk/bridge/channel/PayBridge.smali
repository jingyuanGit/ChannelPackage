.class public Lcom/jy/msdk/bridge/channel/PayBridge;
.super Ljava/lang/Object;
.source "PayBridge.java"

# interfaces
.implements Lcom/jy/msdk/bridge/core/IPay;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public pay(Landroid/content/Context;Lcom/jy/msdk/bean/OrderInfo;Lcom/jy/msdk/bean/RoleInfo;Lcom/jy/msdk/bean/UserInfo;)V
    .registers 8

    .prologue
    .line 17
    invoke-static {}, Lcom/jy/csdk/CSdkApi;->getInstance()Lcom/jy/csdk/CSdkApi;

    move-result-object v0

    invoke-virtual {p2}, Lcom/jy/msdk/bean/OrderInfo;->getProductName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/jy/msdk/bean/OrderInfo;->getAmount()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Lcom/jy/csdk/CSdkApi;->pay(Landroid/content/Context;Ljava/lang/String;I)V

    .line 18
    return-void
.end method
