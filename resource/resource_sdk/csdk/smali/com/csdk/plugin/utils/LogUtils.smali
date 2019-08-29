.class public Lcom/csdk/plugin/utils/LogUtils;
.super Ljava/lang/Object;
.source "LogUtils.java"


# static fields
.field public static TAG:Ljava/lang/String;

.field public static sDebug:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 12
    const-string v0, "PluginLog"

    sput-object v0, Lcom/csdk/plugin/utils/LogUtils;->TAG:Ljava/lang/String;

    .line 14
    const/4 v0, 0x1

    sput-boolean v0, Lcom/csdk/plugin/utils/LogUtils;->sDebug:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method public static error(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "var0"    # Ljava/lang/String;
    .param p1, "var1"    # Ljava/lang/String;

    .prologue
    .line 38
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Throwable;

    invoke-static {p0, p1, v0}, Lcom/csdk/plugin/utils/LogUtils;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 39
    return-void
.end method

.method public static error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6
    .param p0, "var0"    # Ljava/lang/String;
    .param p1, "var1"    # Ljava/lang/String;
    .param p2, "var2"    # Ljava/lang/Throwable;

    .prologue
    .line 42
    sget-boolean v0, Lcom/csdk/plugin/utils/LogUtils;->sDebug:Z

    if-eqz v0, :cond_20

    .line 43
    sget-object v0, Lcom/csdk/plugin/utils/LogUtils;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 45
    :cond_20
    return-void
.end method

.method public static log(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "var0"    # Ljava/lang/String;
    .param p1, "var1"    # Ljava/lang/String;

    .prologue
    .line 28
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Throwable;

    invoke-static {p0, p1, v0}, Lcom/csdk/plugin/utils/LogUtils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    return-void
.end method

.method public static log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6
    .param p0, "var0"    # Ljava/lang/String;
    .param p1, "var1"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 32
    sget-boolean v0, Lcom/csdk/plugin/utils/LogUtils;->sDebug:Z

    if-eqz v0, :cond_20

    .line 33
    sget-object v0, Lcom/csdk/plugin/utils/LogUtils;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 35
    :cond_20
    return-void
.end method

.method public static logInit(ZLjava/lang/String;)V
    .registers 3
    .param p0, "logSwitch"    # Z
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 21
    sput-boolean p0, Lcom/csdk/plugin/utils/LogUtils;->sDebug:Z

    .line 22
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 23
    sput-object p1, Lcom/csdk/plugin/utils/LogUtils;->TAG:Ljava/lang/String;

    .line 25
    :cond_a
    return-void
.end method
