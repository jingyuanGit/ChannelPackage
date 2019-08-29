.class final Lorg/greenrobot/eventbus/BackgroundPoster;
.super Ljava/lang/Object;
.source "BackgroundPoster.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lorg/greenrobot/eventbus/Poster;


# instance fields
.field private final eventBus:Lorg/greenrobot/eventbus/EventBus;

.field private volatile executorRunning:Z

.field private final queue:Lorg/greenrobot/eventbus/PendingPostQueue;


# direct methods
.method constructor <init>(Lorg/greenrobot/eventbus/EventBus;)V
    .registers 3
    .param p1, "eventBus"    # Lorg/greenrobot/eventbus/EventBus;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->eventBus:Lorg/greenrobot/eventbus/EventBus;

    .line 34
    new-instance v0, Lorg/greenrobot/eventbus/PendingPostQueue;

    invoke-direct {v0}, Lorg/greenrobot/eventbus/PendingPostQueue;-><init>()V

    iput-object v0, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->queue:Lorg/greenrobot/eventbus/PendingPostQueue;

    .line 35
    return-void
.end method


# virtual methods
.method public enqueue(Lorg/greenrobot/eventbus/Subscription;Ljava/lang/Object;)V
    .registers 5
    .param p1, "subscription"    # Lorg/greenrobot/eventbus/Subscription;
    .param p2, "event"    # Ljava/lang/Object;

    .prologue
    .line 38
    invoke-static {p1, p2}, Lorg/greenrobot/eventbus/PendingPost;->obtainPendingPost(Lorg/greenrobot/eventbus/Subscription;Ljava/lang/Object;)Lorg/greenrobot/eventbus/PendingPost;

    move-result-object v0

    .line 39
    .local v0, "pendingPost":Lorg/greenrobot/eventbus/PendingPost;
    monitor-enter p0

    .line 40
    :try_start_5
    iget-object v1, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->queue:Lorg/greenrobot/eventbus/PendingPostQueue;

    invoke-virtual {v1, v0}, Lorg/greenrobot/eventbus/PendingPostQueue;->enqueue(Lorg/greenrobot/eventbus/PendingPost;)V

    .line 41
    iget-boolean v1, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->executorRunning:Z

    if-nez v1, :cond_1a

    .line 42
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->executorRunning:Z

    .line 43
    iget-object v1, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->eventBus:Lorg/greenrobot/eventbus/EventBus;

    invoke-virtual {v1}, Lorg/greenrobot/eventbus/EventBus;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 45
    :cond_1a
    monitor-exit p0

    .line 46
    return-void

    .line 45
    :catchall_1c
    move-exception v1

    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_5 .. :try_end_1e} :catchall_1c

    throw v1
.end method

.method public run()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 53
    :goto_1
    :try_start_1
    iget-object v2, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->queue:Lorg/greenrobot/eventbus/PendingPostQueue;

    const/16 v3, 0x3e8

    invoke-virtual {v2, v3}, Lorg/greenrobot/eventbus/PendingPostQueue;->poll(I)Lorg/greenrobot/eventbus/PendingPost;

    move-result-object v1

    .line 54
    .local v1, "pendingPost":Lorg/greenrobot/eventbus/PendingPost;
    if-nez v1, :cond_1c

    .line 55
    monitor-enter p0
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_c} :catch_22
    .catchall {:try_start_1 .. :try_end_c} :catchall_4f

    .line 57
    :try_start_c
    iget-object v2, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->queue:Lorg/greenrobot/eventbus/PendingPostQueue;

    invoke-virtual {v2}, Lorg/greenrobot/eventbus/PendingPostQueue;->poll()Lorg/greenrobot/eventbus/PendingPost;

    move-result-object v1

    .line 58
    if-nez v1, :cond_1b

    .line 59
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->executorRunning:Z

    .line 60
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_c .. :try_end_18} :catchall_4c

    .line 70
    iput-boolean v6, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->executorRunning:Z

    .line 72
    .end local v1    # "pendingPost":Lorg/greenrobot/eventbus/PendingPost;
    :goto_1a
    return-void

    .line 62
    .restart local v1    # "pendingPost":Lorg/greenrobot/eventbus/PendingPost;
    :cond_1b
    :try_start_1b
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_4c

    .line 64
    :cond_1c
    :try_start_1c
    iget-object v2, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->eventBus:Lorg/greenrobot/eventbus/EventBus;

    invoke-virtual {v2, v1}, Lorg/greenrobot/eventbus/EventBus;->invokeSubscriber(Lorg/greenrobot/eventbus/PendingPost;)V
    :try_end_21
    .catch Ljava/lang/InterruptedException; {:try_start_1c .. :try_end_21} :catch_22
    .catchall {:try_start_1c .. :try_end_21} :catchall_4f

    goto :goto_1

    .line 66
    .end local v1    # "pendingPost":Lorg/greenrobot/eventbus/PendingPost;
    :catch_22
    move-exception v0

    .line 67
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_23
    iget-object v2, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->eventBus:Lorg/greenrobot/eventbus/EventBus;

    invoke-virtual {v2}, Lorg/greenrobot/eventbus/EventBus;->getLogger()Lorg/greenrobot/eventbus/Logger;

    move-result-object v2

    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " was interruppted"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4, v0}, Lorg/greenrobot/eventbus/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_49
    .catchall {:try_start_23 .. :try_end_49} :catchall_4f

    .line 70
    iput-boolean v6, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->executorRunning:Z

    goto :goto_1a

    .line 62
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .restart local v1    # "pendingPost":Lorg/greenrobot/eventbus/PendingPost;
    :catchall_4c
    move-exception v2

    :try_start_4d
    monitor-exit p0
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_4c

    :try_start_4e
    throw v2
    :try_end_4f
    .catch Ljava/lang/InterruptedException; {:try_start_4e .. :try_end_4f} :catch_22
    .catchall {:try_start_4e .. :try_end_4f} :catchall_4f

    .line 70
    .end local v1    # "pendingPost":Lorg/greenrobot/eventbus/PendingPost;
    :catchall_4f
    move-exception v2

    iput-boolean v6, p0, Lorg/greenrobot/eventbus/BackgroundPoster;->executorRunning:Z

    throw v2
.end method
