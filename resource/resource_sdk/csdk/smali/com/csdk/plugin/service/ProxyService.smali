.class public Lcom/csdk/plugin/service/ProxyService;
.super Landroid/app/Service;
.source "ProxyService.java"

# interfaces
.implements Lcom/csdk/plugin/IAttach;


# static fields
.field private static final TAG:Ljava/lang/String; = "ProxyService"


# instance fields
.field private mBridge:Lcom/csdk/plugin/service/ProxyServiceBridge;

.field private mPluginManager:Lcom/csdk/plugin/PluginManager;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 33
    new-instance v0, Lcom/csdk/plugin/service/ProxyServiceBridge;

    invoke-direct {v0, p0}, Lcom/csdk/plugin/service/ProxyServiceBridge;-><init>(Lcom/csdk/plugin/service/ProxyService;)V

    iput-object v0, p0, Lcom/csdk/plugin/service/ProxyService;->mBridge:Lcom/csdk/plugin/service/ProxyServiceBridge;

    return-void
.end method


# virtual methods
.method public attachPlugin(Lcom/csdk/plugin/IPlugin;)V
    .registers 2
    .param p1, "iPlugin"    # Lcom/csdk/plugin/IPlugin;

    .prologue
    .line 46
    return-void
.end method

.method public bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    .registers 5
    .param p1, "service"    # Landroid/content/Intent;
    .param p2, "conn"    # Landroid/content/ServiceConnection;
    .param p3, "flags"    # I

    .prologue
    .line 243
    invoke-static {p0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/csdk/plugin/PluginManager;->bindService(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    return v0
.end method

.method public getAssets()Landroid/content/res/AssetManager;
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lcom/csdk/plugin/service/ProxyService;->mBridge:Lcom/csdk/plugin/service/ProxyServiceBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/service/ProxyServiceBridge;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/app/Service;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/csdk/plugin/service/ProxyService;->mBridge:Lcom/csdk/plugin/service/ProxyServiceBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/service/ProxyServiceBridge;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    goto :goto_c
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lcom/csdk/plugin/service/ProxyService;->mBridge:Lcom/csdk/plugin/service/ProxyServiceBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/service/ProxyServiceBridge;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/app/Service;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/csdk/plugin/service/ProxyService;->mBridge:Lcom/csdk/plugin/service/ProxyServiceBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/service/ProxyServiceBridge;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    goto :goto_c
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 147
    new-instance v0, Landroid/os/Binder;

    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 11
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 152
    invoke-super {p0, p1}, Landroid/app/Service;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 153
    const-string v6, "ProxyService"

    const-string v7, "ProxyService onConfigurationChanged"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    iget-object v6, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v6}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v5

    .line 155
    .local v5, "services":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 156
    .local v1, "entries":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;>;"
    :cond_18
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_56

    .line 157
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 158
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 159
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/csdk/plugin/service/IPluginService;

    .line 160
    .local v4, "pluginService":Lcom/csdk/plugin/service/IPluginService;
    if-eqz v4, :cond_18

    .line 162
    :try_start_32
    invoke-interface {v4, p1}, Lcom/csdk/plugin/service/IPluginService;->onConfigurationChanged(Landroid/content/res/Configuration;)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_35} :catch_36

    goto :goto_18

    .line 163
    :catch_36
    move-exception v0

    .line 164
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "ProxyService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "service:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " onConfigurationChanged error"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_18

    .line 168
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "pluginService":Lcom/csdk/plugin/service/IPluginService;
    :cond_56
    return-void
.end method

.method public onCreate()V
    .registers 2

    .prologue
    .line 39
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 40
    invoke-static {p0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    iput-object v0, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    .line 41
    return-void
.end method

.method public onDestroy()V
    .registers 1

    .prologue
    .line 142
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 143
    return-void
.end method

.method public onLowMemory()V
    .registers 10

    .prologue
    .line 172
    invoke-super {p0}, Landroid/app/Service;->onLowMemory()V

    .line 173
    const-string v6, "ProxyService"

    const-string v7, "ProxyService onLowMemory"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    iget-object v6, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v6}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v5

    .line 175
    .local v5, "services":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 176
    .local v1, "entries":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;>;"
    :cond_18
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_56

    .line 177
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 178
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 179
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/csdk/plugin/service/IPluginService;

    .line 180
    .local v4, "pluginService":Lcom/csdk/plugin/service/IPluginService;
    if-eqz v4, :cond_18

    .line 182
    :try_start_32
    invoke-interface {v4}, Lcom/csdk/plugin/service/IPluginService;->onLowMemory()V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_35} :catch_36

    goto :goto_18

    .line 183
    :catch_36
    move-exception v0

    .line 184
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "ProxyService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "service:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " onLowMemory error"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_18

    .line 189
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "pluginService":Lcom/csdk/plugin/service/IPluginService;
    :cond_56
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I

    .prologue
    .line 51
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 16
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v11, 0x1

    .line 57
    const-string v8, "extra_class"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 58
    .local v7, "serviceName":Ljava/lang/String;
    const-string v8, "ProxyService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "\u670d\u52a1\u540d\uff1a"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_26

    .line 137
    :cond_25
    :goto_25
    return v11

    .line 62
    :cond_26
    const-string v8, "extra_server_command"

    const/4 v9, 0x0

    invoke-virtual {p1, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 63
    .local v1, "command":I
    if-lez v1, :cond_25

    .line 66
    packed-switch v1, :pswitch_data_17c

    goto :goto_25

    .line 68
    :pswitch_33
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v8}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/csdk/plugin/service/IPluginService;

    .line 69
    .local v6, "service":Lcom/csdk/plugin/service/IPluginService;
    if-nez v6, :cond_6e

    .line 70
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mBridge:Lcom/csdk/plugin/service/ProxyServiceBridge;

    invoke-virtual {v8, p1}, Lcom/csdk/plugin/service/ProxyServiceBridge;->init(Landroid/content/Intent;)Lcom/csdk/plugin/service/IPluginService;

    move-result-object v4

    .line 71
    .local v4, "createServer":Lcom/csdk/plugin/service/IPluginService;
    if-eqz v4, :cond_6e

    .line 72
    move-object v6, v4

    .line 73
    invoke-interface {v6}, Lcom/csdk/plugin/service/IPluginService;->onCreate()V

    .line 74
    const-string v8, "ProxyService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "\u521b\u5efa\u670d\u52a1\uff1a"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v8}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .end local v4    # "createServer":Lcom/csdk/plugin/service/IPluginService;
    :cond_6e
    invoke-interface {v6, p1, p2, p3}, Lcom/csdk/plugin/service/IPluginService;->onStartCommand(Landroid/content/Intent;II)I

    goto :goto_25

    .line 83
    .end local v6    # "service":Lcom/csdk/plugin/service/IPluginService;
    :pswitch_72
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v8}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/csdk/plugin/service/IPluginService;

    .line 84
    .restart local v6    # "service":Lcom/csdk/plugin/service/IPluginService;
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v8}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    if-eqz v6, :cond_ce

    .line 87
    :try_start_89
    invoke-interface {v6}, Lcom/csdk/plugin/service/IPluginService;->onDestroy()V

    .line 88
    const-string v8, "ProxyService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "\u9500\u6bc1\u670d\u52a1\uff1a"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a4
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_a4} :catch_a5

    goto :goto_25

    .line 89
    :catch_a5
    move-exception v5

    .line 90
    .local v5, "e":Ljava/lang/Exception;
    const-string v8, "ProxyService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unable to stop service "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ": "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 93
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_ce
    const-string v8, "ProxyService"

    const-string v9, " service not found"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 98
    .end local v6    # "service":Lcom/csdk/plugin/service/IPluginService;
    :pswitch_d7
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v8}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/csdk/plugin/service/IPluginService;

    .line 99
    .restart local v6    # "service":Lcom/csdk/plugin/service/IPluginService;
    if-nez v6, :cond_fa

    .line 100
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mBridge:Lcom/csdk/plugin/service/ProxyServiceBridge;

    invoke-virtual {v8, p1}, Lcom/csdk/plugin/service/ProxyServiceBridge;->init(Landroid/content/Intent;)Lcom/csdk/plugin/service/IPluginService;

    move-result-object v4

    .line 101
    .restart local v4    # "createServer":Lcom/csdk/plugin/service/IPluginService;
    if-eqz v4, :cond_fa

    .line 102
    move-object v6, v4

    .line 103
    invoke-interface {v6}, Lcom/csdk/plugin/service/IPluginService;->onCreate()V

    .line 104
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v8}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .end local v4    # "createServer":Lcom/csdk/plugin/service/IPluginService;
    :cond_fa
    invoke-interface {v6, p1}, Lcom/csdk/plugin/service/IPluginService;->onBind(Landroid/content/Intent;)Landroid/os/IBinder;

    move-result-object v0

    .line 108
    .local v0, "binder":Landroid/os/IBinder;
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    .line 109
    .local v2, "component":Landroid/content/ComponentName;
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v8}, Lcom/csdk/plugin/PluginManager;->getServiceConns()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ServiceConnection;

    .line 111
    .local v3, "conn":Landroid/content/ServiceConnection;
    if-eqz v3, :cond_25

    .line 112
    invoke-interface {v3, v2, v0}, Landroid/content/ServiceConnection;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V

    goto/16 :goto_25

    .line 117
    .end local v0    # "binder":Landroid/os/IBinder;
    .end local v2    # "component":Landroid/content/ComponentName;
    .end local v3    # "conn":Landroid/content/ServiceConnection;
    .end local v6    # "service":Lcom/csdk/plugin/service/IPluginService;
    :pswitch_115
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v8}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/csdk/plugin/service/IPluginService;

    .line 118
    .restart local v6    # "service":Lcom/csdk/plugin/service/IPluginService;
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v8}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    iget-object v8, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v8}, Lcom/csdk/plugin/PluginManager;->getServiceConns()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ServiceConnection;

    .line 120
    .restart local v3    # "conn":Landroid/content/ServiceConnection;
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    .line 121
    .restart local v2    # "component":Landroid/content/ComponentName;
    if-eqz v3, :cond_13f

    .line 122
    invoke-interface {v3, v2}, Landroid/content/ServiceConnection;->onServiceDisconnected(Landroid/content/ComponentName;)V

    .line 124
    :cond_13f
    if-eqz v6, :cond_172

    .line 126
    :try_start_141
    invoke-interface {v6, p1}, Lcom/csdk/plugin/service/IPluginService;->onUnbind(Landroid/content/Intent;)Z

    .line 127
    invoke-interface {v6}, Lcom/csdk/plugin/service/IPluginService;->onDestroy()V
    :try_end_147
    .catch Ljava/lang/Exception; {:try_start_141 .. :try_end_147} :catch_149

    goto/16 :goto_25

    .line 128
    :catch_149
    move-exception v5

    .line 129
    .restart local v5    # "e":Ljava/lang/Exception;
    const-string v8, "ProxyService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unable to unbind service "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ": "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 132
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_172
    const-string v8, "ProxyService"

    const-string v9, "Unable to unbind service not found"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 66
    nop

    :pswitch_data_17c
    .packed-switch 0x1
        :pswitch_33
        :pswitch_72
        :pswitch_d7
        :pswitch_115
    .end packed-switch
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .registers 11
    .param p1, "rootIntent"    # Landroid/content/Intent;

    .prologue
    .line 213
    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    .line 214
    const-string v6, "ProxyService"

    const-string v7, "ProxyService onTaskRemoved"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    iget-object v6, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v6}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v5

    .line 216
    .local v5, "services":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 217
    .local v1, "entries":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;>;"
    :cond_18
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_56

    .line 218
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 219
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 220
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/csdk/plugin/service/IPluginService;

    .line 221
    .local v4, "pluginService":Lcom/csdk/plugin/service/IPluginService;
    if-eqz v4, :cond_18

    .line 223
    :try_start_32
    invoke-interface {v4, p1}, Lcom/csdk/plugin/service/IPluginService;->onTaskRemoved(Landroid/content/Intent;)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_35} :catch_36

    goto :goto_18

    .line 224
    :catch_36
    move-exception v0

    .line 225
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "ProxyService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "service:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " onTaskRemoved error"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_18

    .line 229
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "pluginService":Lcom/csdk/plugin/service/IPluginService;
    :cond_56
    return-void
.end method

.method public onTrimMemory(I)V
    .registers 11
    .param p1, "level"    # I

    .prologue
    .line 193
    invoke-super {p0, p1}, Landroid/app/Service;->onTrimMemory(I)V

    .line 194
    const-string v6, "ProxyService"

    const-string v7, "ProxyService onTrimMemory"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    iget-object v6, p0, Lcom/csdk/plugin/service/ProxyService;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v6}, Lcom/csdk/plugin/PluginManager;->getServices()Ljava/util/Map;

    move-result-object v5

    .line 196
    .local v5, "services":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 197
    .local v1, "entries":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;>;"
    :cond_18
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_56

    .line 198
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 199
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 200
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/csdk/plugin/service/IPluginService;

    .line 201
    .local v4, "pluginService":Lcom/csdk/plugin/service/IPluginService;
    if-eqz v4, :cond_18

    .line 203
    :try_start_32
    invoke-interface {v4, p1}, Lcom/csdk/plugin/service/IPluginService;->onTrimMemory(I)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_35} :catch_36

    goto :goto_18

    .line 204
    :catch_36
    move-exception v0

    .line 205
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "ProxyService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "service:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " onTrimMemory error"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_18

    .line 209
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/csdk/plugin/service/IPluginService;>;"
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "pluginService":Lcom/csdk/plugin/service/IPluginService;
    :cond_56
    return-void
.end method

.method public startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 3
    .param p1, "service"    # Landroid/content/Intent;

    .prologue
    .line 233
    invoke-static {p0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/csdk/plugin/PluginManager;->startService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method

.method public stopService(Landroid/content/Intent;)Z
    .registers 3
    .param p1, "name"    # Landroid/content/Intent;

    .prologue
    .line 238
    invoke-static {p0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/csdk/plugin/PluginManager;->stopService(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public unbindService(Landroid/content/ServiceConnection;)V
    .registers 3
    .param p1, "conn"    # Landroid/content/ServiceConnection;

    .prologue
    .line 248
    invoke-static {p0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/csdk/plugin/PluginManager;->unbindService(Landroid/content/Context;Landroid/content/ServiceConnection;)V

    .line 249
    return-void
.end method
