.class public Lcom/csdk/plugin/service/ProxyServiceBridge;
.super Ljava/lang/Object;
.source "ProxyServiceBridge.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ProxyServiceBridge"


# instance fields
.field private mAssetManager:Landroid/content/res/AssetManager;

.field private mPluginManager:Lcom/csdk/plugin/PluginManager;

.field private mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

.field private mPluginService:Lcom/csdk/plugin/service/IPluginService;

.field private mProxyService:Landroid/app/Service;

.field private mResources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Lcom/csdk/plugin/service/ProxyService;)V
    .registers 2
    .param p1, "proxyService"    # Lcom/csdk/plugin/service/ProxyService;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mProxyService:Landroid/app/Service;

    .line 34
    return-void
.end method

.method private createPluginService(Ljava/lang/String;)Lcom/csdk/plugin/service/IPluginService;
    .registers 9
    .param p1, "clazz"    # Ljava/lang/String;

    .prologue
    .line 57
    :try_start_0
    iget-object v4, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    iget-object v4, v4, Lcom/csdk/plugin/other/PluginPackage;->classLoader:Ldalvik/system/DexClassLoader;

    invoke-virtual {v4, p1}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 58
    .local v2, "localClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 59
    .local v3, "localConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 60
    .local v1, "instance":Ljava/lang/Object;
    check-cast v1, Lcom/csdk/plugin/service/IPluginService;

    .end local v1    # "instance":Ljava/lang/Object;
    iput-object v1, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginService:Lcom/csdk/plugin/service/IPluginService;

    .line 61
    iget-object v4, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mProxyService:Landroid/app/Service;

    check-cast v4, Lcom/csdk/plugin/IAttach;

    iget-object v5, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginService:Lcom/csdk/plugin/service/IPluginService;

    invoke-interface {v4, v5}, Lcom/csdk/plugin/IAttach;->attachPlugin(Lcom/csdk/plugin/IPlugin;)V

    .line 62
    iget-object v4, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginService:Lcom/csdk/plugin/service/IPluginService;

    iget-object v5, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mProxyService:Landroid/app/Service;

    iget-object v6, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    invoke-interface {v4, v5, v6}, Lcom/csdk/plugin/service/IPluginService;->attach(Landroid/app/Service;Lcom/csdk/plugin/other/PluginPackage;)V

    .line 63
    iget-object v4, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginService:Lcom/csdk/plugin/service/IPluginService;
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2e} :catch_2f

    .line 67
    .end local v2    # "localClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "localConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :goto_2e
    return-object v4

    .line 64
    :catch_2f
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 66
    const-string v4, "ProxyServiceBridge"

    const-string v5, "createPluginService: exception"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    const/4 v4, 0x0

    goto :goto_2e
.end method


# virtual methods
.method public getAssets()Landroid/content/res/AssetManager;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mAssetManager:Landroid/content/res/AssetManager;

    return-object v0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    iget-object v0, v0, Lcom/csdk/plugin/other/PluginPackage;->classLoader:Ldalvik/system/DexClassLoader;

    return-object v0
.end method

.method public getPluginManager()Lcom/csdk/plugin/PluginManager;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    return-object v0
.end method

.method public getPluginPackage()Lcom/csdk/plugin/other/PluginPackage;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method

.method public init(Landroid/content/Intent;)Lcom/csdk/plugin/service/IPluginService;
    .registers 8
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 37
    const-class v3, Lcom/csdk/plugin/other/PluginConstants;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    .line 38
    const-string v3, "extra_package"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 39
    .local v1, "packageName":Ljava/lang/String;
    const-string v3, "extra_class"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "clazz":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_22

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 41
    :cond_22
    const-string v3, "ProxyServiceBridge"

    const-string v4, "extra_package \u6216\u8005 extra_class \u4e3a\u7a7a\uff0c\u8bf7\u68c0\u67e5\u542f\u52a8intent!"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    :goto_29
    return-object v2

    .line 44
    :cond_2a
    iget-object v3, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mProxyService:Landroid/app/Service;

    invoke-static {v3}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v3

    iput-object v3, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    .line 45
    iget-object v3, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    invoke-virtual {v3, v1}, Lcom/csdk/plugin/PluginManager;->getPackage(Ljava/lang/String;)Lcom/csdk/plugin/other/PluginPackage;

    move-result-object v3

    iput-object v3, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    .line 46
    iget-object v3, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    if-nez v3, :cond_5d

    .line 47
    const-string v3, "ProxyServiceBridge"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u65e0\u6cd5\u542f\u52a8:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " \u63d2\u4ef6\u662f\u5426\u5df2\u7ecf\u52a0\u8f7d\uff1f"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_29

    .line 50
    :cond_5d
    iget-object v2, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    iget-object v2, v2, Lcom/csdk/plugin/other/PluginPackage;->assetManager:Landroid/content/res/AssetManager;

    iput-object v2, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mAssetManager:Landroid/content/res/AssetManager;

    .line 51
    iget-object v2, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    iget-object v2, v2, Lcom/csdk/plugin/other/PluginPackage;->resources:Landroid/content/res/Resources;

    iput-object v2, p0, Lcom/csdk/plugin/service/ProxyServiceBridge;->mResources:Landroid/content/res/Resources;

    .line 52
    invoke-direct {p0, v0}, Lcom/csdk/plugin/service/ProxyServiceBridge;->createPluginService(Ljava/lang/String;)Lcom/csdk/plugin/service/IPluginService;

    move-result-object v2

    goto :goto_29
.end method
