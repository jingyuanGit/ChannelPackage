.class public Lorg/greenrobot/eventbus/util/ThrowableFailureEvent;
.super Ljava/lang/Object;
.source "ThrowableFailureEvent.java"

# interfaces
.implements Lorg/greenrobot/eventbus/util/HasExecutionScope;


# instance fields
.field private executionContext:Ljava/lang/Object;

.field protected final suppressErrorUi:Z

.field protected final throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lorg/greenrobot/eventbus/util/ThrowableFailureEvent;->throwable:Ljava/lang/Throwable;

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/greenrobot/eventbus/util/ThrowableFailureEvent;->suppressErrorUi:Z

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Z)V
    .registers 3
    .param p1, "throwable"    # Ljava/lang/Throwable;
    .param p2, "suppressErrorUi"    # Z

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/greenrobot/eventbus/util/ThrowableFailureEvent;->throwable:Ljava/lang/Throwable;

    .line 38
    iput-boolean p2, p0, Lorg/greenrobot/eventbus/util/ThrowableFailureEvent;->suppressErrorUi:Z

    .line 39
    return-void
.end method


# virtual methods
.method public getExecutionScope()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lorg/greenrobot/eventbus/util/ThrowableFailureEvent;->executionContext:Ljava/lang/Object;

    return-object v0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lorg/greenrobot/eventbus/util/ThrowableFailureEvent;->throwable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public isSuppressErrorUi()Z
    .registers 2

    .prologue
    .line 46
    iget-boolean v0, p0, Lorg/greenrobot/eventbus/util/ThrowableFailureEvent;->suppressErrorUi:Z

    return v0
.end method

.method public setExecutionScope(Ljava/lang/Object;)V
    .registers 2
    .param p1, "executionContext"    # Ljava/lang/Object;

    .prologue
    .line 54
    iput-object p1, p0, Lorg/greenrobot/eventbus/util/ThrowableFailureEvent;->executionContext:Ljava/lang/Object;

    .line 55
    return-void
.end method
