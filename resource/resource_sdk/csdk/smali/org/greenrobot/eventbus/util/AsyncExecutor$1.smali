.class Lorg/greenrobot/eventbus/util/AsyncExecutor$1;
.super Ljava/lang/Object;
.source "AsyncExecutor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/greenrobot/eventbus/util/AsyncExecutor;->execute(Lorg/greenrobot/eventbus/util/AsyncExecutor$RunnableEx;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/greenrobot/eventbus/util/AsyncExecutor;

.field final synthetic val$runnable:Lorg/greenrobot/eventbus/util/AsyncExecutor$RunnableEx;


# direct methods
.method constructor <init>(Lorg/greenrobot/eventbus/util/AsyncExecutor;Lorg/greenrobot/eventbus/util/AsyncExecutor$RunnableEx;)V
    .registers 3
    .param p1, "this$0"    # Lorg/greenrobot/eventbus/util/AsyncExecutor;

    .prologue
    .line 106
    iput-object p1, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$1;->this$0:Lorg/greenrobot/eventbus/util/AsyncExecutor;

    iput-object p2, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$1;->val$runnable:Lorg/greenrobot/eventbus/util/AsyncExecutor$RunnableEx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 110
    :try_start_0
    iget-object v3, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$1;->val$runnable:Lorg/greenrobot/eventbus/util/AsyncExecutor$RunnableEx;

    invoke-interface {v3}, Lorg/greenrobot/eventbus/util/AsyncExecutor$RunnableEx;->run()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    .line 124
    :goto_5
    return-void

    .line 111
    :catch_6
    move-exception v0

    .line 114
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    iget-object v3, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$1;->this$0:Lorg/greenrobot/eventbus/util/AsyncExecutor;

    # getter for: Lorg/greenrobot/eventbus/util/AsyncExecutor;->failureEventConstructor:Ljava/lang/reflect/Constructor;
    invoke-static {v3}, Lorg/greenrobot/eventbus/util/AsyncExecutor;->access$200(Lorg/greenrobot/eventbus/util/AsyncExecutor;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_16} :catch_31

    move-result-object v2

    .line 119
    .local v2, "event":Ljava/lang/Object;
    instance-of v3, v2, Lorg/greenrobot/eventbus/util/HasExecutionScope;

    if-eqz v3, :cond_27

    move-object v3, v2

    .line 120
    check-cast v3, Lorg/greenrobot/eventbus/util/HasExecutionScope;

    iget-object v4, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$1;->this$0:Lorg/greenrobot/eventbus/util/AsyncExecutor;

    # getter for: Lorg/greenrobot/eventbus/util/AsyncExecutor;->scope:Ljava/lang/Object;
    invoke-static {v4}, Lorg/greenrobot/eventbus/util/AsyncExecutor;->access$400(Lorg/greenrobot/eventbus/util/AsyncExecutor;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/greenrobot/eventbus/util/HasExecutionScope;->setExecutionScope(Ljava/lang/Object;)V

    .line 122
    :cond_27
    iget-object v3, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$1;->this$0:Lorg/greenrobot/eventbus/util/AsyncExecutor;

    # getter for: Lorg/greenrobot/eventbus/util/AsyncExecutor;->eventBus:Lorg/greenrobot/eventbus/EventBus;
    invoke-static {v3}, Lorg/greenrobot/eventbus/util/AsyncExecutor;->access$300(Lorg/greenrobot/eventbus/util/AsyncExecutor;)Lorg/greenrobot/eventbus/EventBus;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    goto :goto_5

    .line 115
    .end local v2    # "event":Ljava/lang/Object;
    :catch_31
    move-exception v1

    .line 116
    .local v1, "e1":Ljava/lang/Exception;
    iget-object v3, p0, Lorg/greenrobot/eventbus/util/AsyncExecutor$1;->this$0:Lorg/greenrobot/eventbus/util/AsyncExecutor;

    # getter for: Lorg/greenrobot/eventbus/util/AsyncExecutor;->eventBus:Lorg/greenrobot/eventbus/EventBus;
    invoke-static {v3}, Lorg/greenrobot/eventbus/util/AsyncExecutor;->access$300(Lorg/greenrobot/eventbus/util/AsyncExecutor;)Lorg/greenrobot/eventbus/EventBus;

    move-result-object v3

    invoke-virtual {v3}, Lorg/greenrobot/eventbus/EventBus;->getLogger()Lorg/greenrobot/eventbus/Logger;

    move-result-object v3

    sget-object v4, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v5, "Original exception:"

    invoke-interface {v3, v4, v5, v0}, Lorg/greenrobot/eventbus/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 117
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Could not create failure event"

    invoke-direct {v3, v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method
