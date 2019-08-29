.class final Lorg/greenrobot/eventbus/PendingPostQueue;
.super Ljava/lang/Object;
.source "PendingPostQueue.java"


# instance fields
.field private head:Lorg/greenrobot/eventbus/PendingPost;

.field private tail:Lorg/greenrobot/eventbus/PendingPost;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method declared-synchronized enqueue(Lorg/greenrobot/eventbus/PendingPost;)V
    .registers 4
    .param p1, "pendingPost"    # Lorg/greenrobot/eventbus/PendingPost;

    .prologue
    .line 24
    monitor-enter p0

    if-nez p1, :cond_e

    .line 25
    :try_start_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "null cannot be enqueued"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 24
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 27
    :cond_e
    :try_start_e
    iget-object v0, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->tail:Lorg/greenrobot/eventbus/PendingPost;

    if-eqz v0, :cond_1d

    .line 28
    iget-object v0, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->tail:Lorg/greenrobot/eventbus/PendingPost;

    iput-object p1, v0, Lorg/greenrobot/eventbus/PendingPost;->next:Lorg/greenrobot/eventbus/PendingPost;

    .line 29
    iput-object p1, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->tail:Lorg/greenrobot/eventbus/PendingPost;

    .line 35
    :goto_18
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1b
    .catchall {:try_start_e .. :try_end_1b} :catchall_b

    .line 36
    monitor-exit p0

    return-void

    .line 30
    :cond_1d
    :try_start_1d
    iget-object v0, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->head:Lorg/greenrobot/eventbus/PendingPost;

    if-nez v0, :cond_26

    .line 31
    iput-object p1, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->tail:Lorg/greenrobot/eventbus/PendingPost;

    iput-object p1, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->head:Lorg/greenrobot/eventbus/PendingPost;

    goto :goto_18

    .line 33
    :cond_26
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Head present, but no tail"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2e
    .catchall {:try_start_1d .. :try_end_2e} :catchall_b
.end method

.method declared-synchronized poll()Lorg/greenrobot/eventbus/PendingPost;
    .registers 3

    .prologue
    .line 39
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->head:Lorg/greenrobot/eventbus/PendingPost;

    .line 40
    .local v0, "pendingPost":Lorg/greenrobot/eventbus/PendingPost;
    iget-object v1, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->head:Lorg/greenrobot/eventbus/PendingPost;

    if-eqz v1, :cond_14

    .line 41
    iget-object v1, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->head:Lorg/greenrobot/eventbus/PendingPost;

    iget-object v1, v1, Lorg/greenrobot/eventbus/PendingPost;->next:Lorg/greenrobot/eventbus/PendingPost;

    iput-object v1, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->head:Lorg/greenrobot/eventbus/PendingPost;

    .line 42
    iget-object v1, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->head:Lorg/greenrobot/eventbus/PendingPost;

    if-nez v1, :cond_14

    .line 43
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->tail:Lorg/greenrobot/eventbus/PendingPost;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 46
    :cond_14
    monitor-exit p0

    return-object v0

    .line 39
    .end local v0    # "pendingPost":Lorg/greenrobot/eventbus/PendingPost;
    :catchall_16
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized poll(I)Lorg/greenrobot/eventbus/PendingPost;
    .registers 4
    .param p1, "maxMillisToWait"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 50
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/greenrobot/eventbus/PendingPostQueue;->head:Lorg/greenrobot/eventbus/PendingPost;

    if-nez v0, :cond_9

    .line 51
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 53
    :cond_9
    invoke-virtual {p0}, Lorg/greenrobot/eventbus/PendingPostQueue;->poll()Lorg/greenrobot/eventbus/PendingPost;
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_f

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 50
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method
