.class public Lorg/greenrobot/eventbus/Logger$AndroidLogger;
.super Ljava/lang/Object;
.source "Logger.java"

# interfaces
.implements Lorg/greenrobot/eventbus/Logger;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/greenrobot/eventbus/Logger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AndroidLogger"
.end annotation


# static fields
.field static final ANDROID_LOG_AVAILABLE:Z


# instance fields
.field private final tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 32
    const/4 v0, 0x0

    .line 34
    .local v0, "android":Z
    :try_start_1
    const-string v1, "android.util.Log"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_6
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_6} :catch_f

    move-result-object v1

    if-eqz v1, :cond_d

    const/4 v0, 0x1

    .line 38
    :goto_a
    sput-boolean v0, Lorg/greenrobot/eventbus/Logger$AndroidLogger;->ANDROID_LOG_AVAILABLE:Z

    .line 39
    return-void

    .line 34
    :cond_d
    const/4 v0, 0x0

    goto :goto_a

    .line 35
    :catch_f
    move-exception v1

    goto :goto_a
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/greenrobot/eventbus/Logger$AndroidLogger;->tag:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public static isAndroidLogAvailable()Z
    .registers 1

    .prologue
    .line 42
    sget-boolean v0, Lorg/greenrobot/eventbus/Logger$AndroidLogger;->ANDROID_LOG_AVAILABLE:Z

    return v0
.end method


# virtual methods
.method public log(Ljava/util/logging/Level;Ljava/lang/String;)V
    .registers 5
    .param p1, "level"    # Ljava/util/logging/Level;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 53
    sget-object v0, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    if-eq p1, v0, :cond_d

    .line 54
    invoke-virtual {p0, p1}, Lorg/greenrobot/eventbus/Logger$AndroidLogger;->mapLevel(Ljava/util/logging/Level;)I

    move-result v0

    iget-object v1, p0, Lorg/greenrobot/eventbus/Logger$AndroidLogger;->tag:Ljava/lang/String;

    invoke-static {v0, v1, p2}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 56
    :cond_d
    return-void
.end method

.method public log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 8
    .param p1, "level"    # Ljava/util/logging/Level;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "th"    # Ljava/lang/Throwable;

    .prologue
    .line 59
    sget-object v0, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    if-eq p1, v0, :cond_28

    .line 61
    invoke-virtual {p0, p1}, Lorg/greenrobot/eventbus/Logger$AndroidLogger;->mapLevel(Ljava/util/logging/Level;)I

    move-result v0

    iget-object v1, p0, Lorg/greenrobot/eventbus/Logger$AndroidLogger;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 63
    :cond_28
    return-void
.end method

.method protected mapLevel(Ljava/util/logging/Level;)I
    .registers 4
    .param p1, "level"    # Ljava/util/logging/Level;

    .prologue
    .line 66
    invoke-virtual {p1}, Ljava/util/logging/Level;->intValue()I

    move-result v0

    .line 67
    .local v0, "value":I
    const/16 v1, 0x320

    if-ge v0, v1, :cond_10

    .line 68
    const/16 v1, 0x1f4

    if-ge v0, v1, :cond_e

    .line 69
    const/4 v1, 0x2

    .line 78
    :goto_d
    return v1

    .line 71
    :cond_e
    const/4 v1, 0x3

    goto :goto_d

    .line 73
    :cond_10
    const/16 v1, 0x384

    if-ge v0, v1, :cond_16

    .line 74
    const/4 v1, 0x4

    goto :goto_d

    .line 75
    :cond_16
    const/16 v1, 0x3e8

    if-ge v0, v1, :cond_1c

    .line 76
    const/4 v1, 0x5

    goto :goto_d

    .line 78
    :cond_1c
    const/4 v1, 0x6

    goto :goto_d
.end method
