.class Lcom/jy/csdk/CSdkApi$Holder;
.super Ljava/lang/Object;
.source "CSdkApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jy/csdk/CSdkApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Holder"
.end annotation


# static fields
.field static instance:Lcom/jy/csdk/CSdkApi;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 71
    new-instance v0, Lcom/jy/csdk/CSdkApi;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/jy/csdk/CSdkApi;-><init>(Lcom/jy/csdk/CSdkApi$1;)V

    sput-object v0, Lcom/jy/csdk/CSdkApi$Holder;->instance:Lcom/jy/csdk/CSdkApi;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
