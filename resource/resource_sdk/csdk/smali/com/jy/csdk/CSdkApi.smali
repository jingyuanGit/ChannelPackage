.class public Lcom/jy/csdk/CSdkApi;
.super Ljava/lang/Object;
.source "CSdkApi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jy/csdk/CSdkApi$Holder;
    }
.end annotation


# instance fields
.field private mLoginCallBack:Lcom/jy/csdk/LoginCallBack;

.field receiver:Lcom/jy/csdk/EventReceiver;


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Lcom/jy/csdk/EventReceiver;

    invoke-direct {v0}, Lcom/jy/csdk/EventReceiver;-><init>()V

    iput-object v0, p0, Lcom/jy/csdk/CSdkApi;->receiver:Lcom/jy/csdk/EventReceiver;

    .line 18
    return-void
.end method

.method synthetic constructor <init>(Lcom/jy/csdk/CSdkApi$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/jy/csdk/CSdkApi$1;

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/jy/csdk/CSdkApi;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/jy/csdk/CSdkApi;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/jy/csdk/CSdkApi$Holder;->instance:Lcom/jy/csdk/CSdkApi;

    return-object v0
.end method


# virtual methods
.method public getLoginCallBack()Lcom/jy/csdk/LoginCallBack;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/jy/csdk/CSdkApi;->mLoginCallBack:Lcom/jy/csdk/LoginCallBack;

    return-object v0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "gameId"    # Ljava/lang/String;

    .prologue
    .line 28
    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/jy/csdk/CSdkApi$1;

    invoke-direct {v1, p0, p1}, Lcom/jy/csdk/CSdkApi$1;-><init>(Lcom/jy/csdk/CSdkApi;Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 34
    return-void
.end method

.method public login(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 38
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "extra_class"

    const-string v2, "com.jy.core.route.RouteActivity"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    const-string v1, "extra_package"

    const-string v2, "com.jy.core"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    invoke-static {p1}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/csdk/plugin/PluginManager;->startActivity(Landroid/content/Context;Landroid/content/Intent;)I

    .line 41
    return-void
.end method

.method public onStart()V
    .registers 3

    .prologue
    .line 54
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    iget-object v1, p0, Lcom/jy/csdk/CSdkApi;->receiver:Lcom/jy/csdk/EventReceiver;

    invoke-virtual {v0, v1}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

    .line 55
    return-void
.end method

.method public onStop()V
    .registers 3

    .prologue
    .line 58
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    iget-object v1, p0, Lcom/jy/csdk/CSdkApi;->receiver:Lcom/jy/csdk/EventReceiver;

    invoke-virtual {v0, v1}, Lorg/greenrobot/eventbus/EventBus;->unregister(Ljava/lang/Object;)V

    .line 59
    return-void
.end method

.method public pay(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "produceName"    # Ljava/lang/String;
    .param p3, "amount"    # I

    .prologue
    .line 44
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 45
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "extra_class"

    const-string v2, "com.jy.core.route.RouteActivity"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 46
    const-string v1, "extra_package"

    const-string v2, "com.jy.core"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    const-string v1, "business"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 48
    const-string v1, "produceName"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    const-string v1, "amount"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 50
    invoke-static {p1}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/csdk/plugin/PluginManager;->startActivity(Landroid/content/Context;Landroid/content/Intent;)I

    .line 51
    return-void
.end method

.method public setLoginCallBack(Lcom/jy/csdk/LoginCallBack;)Lcom/jy/csdk/CSdkApi;
    .registers 2
    .param p1, "loginCallBack"    # Lcom/jy/csdk/LoginCallBack;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/jy/csdk/CSdkApi;->mLoginCallBack:Lcom/jy/csdk/LoginCallBack;

    .line 67
    return-object p0
.end method
