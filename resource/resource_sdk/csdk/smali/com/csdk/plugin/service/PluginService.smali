.class public Lcom/csdk/plugin/service/PluginService;
.super Landroid/app/Service;
.source "PluginService.java"

# interfaces
.implements Lcom/csdk/plugin/service/IPluginService;
.implements Lcom/csdk/plugin/IPlugin;


# static fields
.field private static final TAG:Ljava/lang/String; = "PluginService"


# instance fields
.field private mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

.field protected that:Landroid/app/Service;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public attach(Landroid/app/Service;Lcom/csdk/plugin/other/PluginPackage;)V
    .registers 3
    .param p1, "proxyService"    # Landroid/app/Service;
    .param p2, "pluginPackage"    # Lcom/csdk/plugin/other/PluginPackage;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    .line 36
    iput-object p2, p0, Lcom/csdk/plugin/service/PluginService;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    .line 37
    return-void
.end method

.method public bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    .registers 5
    .param p1, "service"    # Landroid/content/Intent;
    .param p2, "conn"    # Landroid/content/ServiceConnection;
    .param p3, "flags"    # I

    .prologue
    .line 139
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, p1, p2, p3}, Landroid/app/Service;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    return v0
.end method

.method public getApplicationInfo()Landroid/content/pm/ApplicationInfo;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0}, Landroid/app/Service;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    return-object v0
.end method

.method public getAssets()Landroid/content/res/AssetManager;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0}, Landroid/app/Service;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0}, Landroid/app/Service;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0}, Landroid/app/Service;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, p1}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 41
    const-string v0, "PluginService"

    const-string v1, "PluginService onBind"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    const/4 v0, 0x0

    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 63
    const-string v0, "PluginService"

    const-string v1, "PluginService onConfigurationChanged"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    return-void
.end method

.method public onCreate()V
    .registers 3

    .prologue
    .line 47
    const-string v0, "PluginService"

    const-string v1, "PluginService onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    return-void
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 58
    const-string v0, "PluginService"

    const-string v1, "PluginService onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    return-void
.end method

.method public onLowMemory()V
    .registers 3

    .prologue
    .line 68
    const-string v0, "PluginService"

    const-string v1, "PluginService onLowMemory"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    return-void
.end method

.method public onRebind(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 84
    const-string v0, "PluginService"

    const-string v1, "PluginService onRebind"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 6
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 52
    const-string v0, "PluginService"

    const-string v1, "PluginService onStartCommand"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    const/4 v0, 0x0

    return v0
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .registers 4
    .param p1, "rootIntent"    # Landroid/content/Intent;

    .prologue
    .line 89
    const-string v0, "PluginService"

    const-string v1, "PluginService onTaskRemoved"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    return-void
.end method

.method public onTrimMemory(I)V
    .registers 4
    .param p1, "level"    # I

    .prologue
    .line 73
    const-string v0, "PluginService"

    const-string v1, "PluginService onTrimMemory"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    return-void
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 78
    const-string v0, "PluginService"

    const-string v1, "PluginService onUnbind"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    const/4 v0, 0x0

    return v0
.end method

.method public sendBroadcast(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, p1}, Landroid/app/Service;->sendBroadcast(Landroid/content/Intent;)V

    .line 150
    return-void
.end method

.method public sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "receiverPermission"    # Ljava/lang/String;

    .prologue
    .line 154
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, p1, p2}, Landroid/app/Service;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 155
    return-void
.end method

.method public sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "user"    # Landroid/os/UserHandle;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, p1, p2}, Landroid/app/Service;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 160
    return-void
.end method

.method public sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "user"    # Landroid/os/UserHandle;
    .param p3, "receiverPermission"    # Ljava/lang/String;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, p1, p2, p3}, Landroid/app/Service;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public startActivity(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-static {v0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    iget-object v1, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, v1, p1}, Lcom/csdk/plugin/PluginManager;->startActivity(Landroid/content/Context;Landroid/content/Intent;)I

    .line 95
    return-void
.end method

.method public startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-static {v0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    iget-object v1, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, v1, p1, p2}, Lcom/csdk/plugin/PluginManager;->startActivity(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)I

    .line 100
    return-void
.end method

.method public startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 3
    .param p1, "service"    # Landroid/content/Intent;

    .prologue
    .line 129
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, p1}, Landroid/app/Service;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method

.method public stopService(Landroid/content/Intent;)Z
    .registers 3
    .param p1, "name"    # Landroid/content/Intent;

    .prologue
    .line 134
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, p1}, Landroid/app/Service;->stopService(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public unbindService(Landroid/content/ServiceConnection;)V
    .registers 3
    .param p1, "conn"    # Landroid/content/ServiceConnection;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/csdk/plugin/service/PluginService;->that:Landroid/app/Service;

    invoke-virtual {v0, p1}, Landroid/app/Service;->unbindService(Landroid/content/ServiceConnection;)V

    .line 145
    return-void
.end method
