.class public Lorg/greenrobot/eventbus/MainThreadSupport$AndroidHandlerMainThreadSupport;
.super Ljava/lang/Object;
.source "MainThreadSupport.java"

# interfaces
.implements Lorg/greenrobot/eventbus/MainThreadSupport;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/greenrobot/eventbus/MainThreadSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AndroidHandlerMainThreadSupport"
.end annotation


# instance fields
.field private final looper:Landroid/os/Looper;


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .registers 2
    .param p1, "looper"    # Landroid/os/Looper;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lorg/greenrobot/eventbus/MainThreadSupport$AndroidHandlerMainThreadSupport;->looper:Landroid/os/Looper;

    .line 35
    return-void
.end method


# virtual methods
.method public createPoster(Lorg/greenrobot/eventbus/EventBus;)Lorg/greenrobot/eventbus/Poster;
    .registers 5
    .param p1, "eventBus"    # Lorg/greenrobot/eventbus/EventBus;

    .prologue
    .line 44
    new-instance v0, Lorg/greenrobot/eventbus/HandlerPoster;

    iget-object v1, p0, Lorg/greenrobot/eventbus/MainThreadSupport$AndroidHandlerMainThreadSupport;->looper:Landroid/os/Looper;

    const/16 v2, 0xa

    invoke-direct {v0, p1, v1, v2}, Lorg/greenrobot/eventbus/HandlerPoster;-><init>(Lorg/greenrobot/eventbus/EventBus;Landroid/os/Looper;I)V

    return-object v0
.end method

.method public isMainThread()Z
    .registers 3

    .prologue
    .line 39
    iget-object v0, p0, Lorg/greenrobot/eventbus/MainThreadSupport$AndroidHandlerMainThreadSupport;->looper:Landroid/os/Looper;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
