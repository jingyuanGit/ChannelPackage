.class public Lorg/greenrobot/eventbus/SubscriberMethod;
.super Ljava/lang/Object;
.source "SubscriberMethod.java"


# instance fields
.field final eventType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field final method:Ljava/lang/reflect/Method;

.field methodString:Ljava/lang/String;

.field final priority:I

.field final sticky:Z

.field final threadMode:Lorg/greenrobot/eventbus/ThreadMode;


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/Class;Lorg/greenrobot/eventbus/ThreadMode;IZ)V
    .registers 6
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p3, "threadMode"    # Lorg/greenrobot/eventbus/ThreadMode;
    .param p4, "priority"    # I
    .param p5, "sticky"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/greenrobot/eventbus/ThreadMode;",
            "IZ)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p2, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->method:Ljava/lang/reflect/Method;

    .line 32
    iput-object p3, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->threadMode:Lorg/greenrobot/eventbus/ThreadMode;

    .line 33
    iput-object p2, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->eventType:Ljava/lang/Class;

    .line 34
    iput p4, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->priority:I

    .line 35
    iput-boolean p5, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->sticky:Z

    .line 36
    return-void
.end method

.method private declared-synchronized checkMethodString()V
    .registers 4

    .prologue
    .line 54
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->methodString:Ljava/lang/String;

    if-nez v1, :cond_3d

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 57
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->eventType:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->methodString:Ljava/lang/String;
    :try_end_3d
    .catchall {:try_start_1 .. :try_end_3d} :catchall_3f

    .line 62
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_3d
    monitor-exit p0

    return-void

    .line 54
    :catchall_3f
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 40
    if-ne p1, p0, :cond_4

    .line 41
    const/4 v1, 0x1

    .line 49
    :goto_3
    return v1

    .line 42
    :cond_4
    instance-of v1, p1, Lorg/greenrobot/eventbus/SubscriberMethod;

    if-eqz v1, :cond_1a

    .line 43
    invoke-direct {p0}, Lorg/greenrobot/eventbus/SubscriberMethod;->checkMethodString()V

    move-object v0, p1

    .line 44
    check-cast v0, Lorg/greenrobot/eventbus/SubscriberMethod;

    .line 45
    .local v0, "otherSubscriberMethod":Lorg/greenrobot/eventbus/SubscriberMethod;
    invoke-direct {v0}, Lorg/greenrobot/eventbus/SubscriberMethod;->checkMethodString()V

    .line 47
    iget-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->methodString:Ljava/lang/String;

    iget-object v2, v0, Lorg/greenrobot/eventbus/SubscriberMethod;->methodString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3

    .line 49
    .end local v0    # "otherSubscriberMethod":Lorg/greenrobot/eventbus/SubscriberMethod;
    :cond_1a
    const/4 v1, 0x0

    goto :goto_3
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lorg/greenrobot/eventbus/SubscriberMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->hashCode()I

    move-result v0

    return v0
.end method
