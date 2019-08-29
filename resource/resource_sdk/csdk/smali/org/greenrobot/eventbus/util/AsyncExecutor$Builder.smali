.class public Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;
.super Ljava/lang/Object;
.source "AsyncExecutor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/greenrobot/eventbus/util/AsyncExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private eventBus:Lorg/greenrobot/eventbus/EventBus;

.field private failureEventType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private threadPool:Ljava/util/concurrent/Executor;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method synthetic constructor <init>(Lorg/greenrobot/eventbus/util/AsyncExecutor$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/greenrobot/eventbus/util/AsyncExecutor$1;

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lorg/greenrobot/eventbus/util/AsyncExecutor;
    .registers 2

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->buildForScope(Ljava/lang/Object;)Lorg/greenrobot/eventbus/util/AsyncExecutor;

    move-result-object v0

    return-object v0
.end method

.method public buildForScope(Ljava/lang/Object;)Lorg/greenrobot/eventbus/util/AsyncExecutor;
    .registers 8
    .param p1, "executionContext"    # Ljava/lang/Object;

    .prologue
    .line 61
    iget-object v0, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->eventBus:Lorg/greenrobot/eventbus/EventBus;

    if-nez v0, :cond_a

    .line 62
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    iput-object v0, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->eventBus:Lorg/greenrobot/eventbus/EventBus;

    .line 64
    :cond_a
    iget-object v0, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->threadPool:Ljava/util/concurrent/Executor;

    if-nez v0, :cond_14

    .line 65
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->threadPool:Ljava/util/concurrent/Executor;

    .line 67
    :cond_14
    iget-object v0, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->failureEventType:Ljava/lang/Class;

    if-nez v0, :cond_1c

    .line 68
    const-class v0, Lorg/greenrobot/eventbus/util/ThrowableFailureEvent;

    iput-object v0, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->failureEventType:Ljava/lang/Class;

    .line 70
    :cond_1c
    new-instance v0, Lorg/greenrobot/eventbus/util/AsyncExecutor;

    iget-object v1, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->threadPool:Ljava/util/concurrent/Executor;

    iget-object v2, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->eventBus:Lorg/greenrobot/eventbus/EventBus;

    iget-object v3, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->failureEventType:Ljava/lang/Class;

    const/4 v5, 0x0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lorg/greenrobot/eventbus/util/AsyncExecutor;-><init>(Ljava/util/concurrent/Executor;Lorg/greenrobot/eventbus/EventBus;Ljava/lang/Class;Ljava/lang/Object;Lorg/greenrobot/eventbus/util/AsyncExecutor$1;)V

    return-object v0
.end method

.method public eventBus(Lorg/greenrobot/eventbus/EventBus;)Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;
    .registers 2
    .param p1, "eventBus"    # Lorg/greenrobot/eventbus/EventBus;

    .prologue
    .line 52
    iput-object p1, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->eventBus:Lorg/greenrobot/eventbus/EventBus;

    .line 53
    return-object p0
.end method

.method public failureEventType(Ljava/lang/Class;)Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "failureEventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iput-object p1, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->failureEventType:Ljava/lang/Class;

    .line 48
    return-object p0
.end method

.method public threadPool(Ljava/util/concurrent/Executor;)Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;
    .registers 2
    .param p1, "threadPool"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$Builder;->threadPool:Ljava/util/concurrent/Executor;

    .line 43
    return-object p0
.end method
