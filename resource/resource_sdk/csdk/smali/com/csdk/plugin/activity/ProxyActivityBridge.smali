.class public Lcom/csdk/plugin/activity/ProxyActivityBridge;
.super Ljava/lang/Object;
.source "ProxyActivityBridge.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ProxyActivityBridge"


# instance fields
.field private mActivityInfo:Landroid/content/pm/ActivityInfo;

.field private mAssetManager:Landroid/content/res/AssetManager;

.field private mClass:Ljava/lang/String;

.field private mPackageName:Ljava/lang/String;

.field protected mPluginActivity:Lcom/csdk/plugin/activity/IPluginActivity;

.field public mPluginClassLoader:Ljava/lang/ClassLoader;

.field private mPluginManager:Lcom/csdk/plugin/PluginManager;

.field private mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

.field private mProxyActivity:Landroid/app/Activity;

.field private mResources:Landroid/content/res/Resources;

.field private mTheme:Landroid/content/res/Resources$Theme;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mProxyActivity:Landroid/app/Activity;

    .line 40
    return-void
.end method

.method private createPluginActivity()V
    .registers 8

    .prologue
    .line 113
    :try_start_0
    invoke-virtual {p0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    iget-object v5, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mClass:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 114
    .local v2, "localClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 115
    .local v3, "localConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 117
    .local v1, "instance":Ljava/lang/Object;
    check-cast v1, Lcom/csdk/plugin/activity/IPluginActivity;

    .end local v1    # "instance":Ljava/lang/Object;
    iput-object v1, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginActivity:Lcom/csdk/plugin/activity/IPluginActivity;

    .line 118
    iget-object v4, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mProxyActivity:Landroid/app/Activity;

    check-cast v4, Lcom/csdk/plugin/IAttach;

    iget-object v5, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginActivity:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v4, v5}, Lcom/csdk/plugin/IAttach;->attachPlugin(Lcom/csdk/plugin/IPlugin;)V

    .line 120
    iget-object v4, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginActivity:Lcom/csdk/plugin/activity/IPluginActivity;

    iget-object v5, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mProxyActivity:Landroid/app/Activity;

    iget-object v6, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    invoke-interface {v4, v5, v6}, Lcom/csdk/plugin/activity/IPluginActivity;->attach(Landroid/app/Activity;Lcom/csdk/plugin/other/PluginPackage;)V

    .line 122
    iget-object v4, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginActivity:Lcom/csdk/plugin/activity/IPluginActivity;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Lcom/csdk/plugin/activity/IPluginActivity;->onCreate(Landroid/os/Bundle;)V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_34} :catch_35

    .line 126
    .end local v2    # "localClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "localConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :goto_34
    return-void

    .line 123
    :catch_35
    move-exception v0

    .line 124
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_34
.end method

.method private setUpDefaultTheme()V
    .registers 9
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 66
    iget-object v4, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    iget-object v2, v4, Lcom/csdk/plugin/other/PluginPackage;->packageInfo:Landroid/content/pm/PackageInfo;

    .line 67
    .local v2, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    if-eqz v4, :cond_56

    iget-object v4, v2, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    array-length v4, v4

    if-lez v4, :cond_56

    .line 68
    iget-object v4, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mClass:Ljava/lang/String;

    if-nez v4, :cond_1a

    .line 69
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    aget-object v4, v4, v3

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    iput-object v4, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mClass:Ljava/lang/String;

    .line 72
    :cond_1a
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v4, Landroid/content/pm/ApplicationInfo;->theme:I

    .line 73
    .local v1, "defaultTheme":I
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    array-length v5, v4

    :goto_21
    if-ge v3, v5, :cond_56

    aget-object v0, v4, v3

    .line 74
    .local v0, "a":Landroid/content/pm/ActivityInfo;
    iget-object v6, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    iget-object v7, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mClass:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3d

    .line 75
    iput-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    .line 77
    iget-object v6, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    iget v6, v6, Landroid/content/pm/ActivityInfo;->theme:I

    if-nez v6, :cond_3d

    .line 78
    if-eqz v1, :cond_40

    .line 79
    iget-object v6, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    iput v1, v6, Landroid/content/pm/ActivityInfo;->theme:I

    .line 73
    :cond_3d
    :goto_3d
    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    .line 81
    :cond_40
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0xe

    if-lt v6, v7, :cond_4e

    .line 82
    iget-object v6, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    const v7, 0x1030128

    iput v7, v6, Landroid/content/pm/ActivityInfo;->theme:I

    goto :goto_3d

    .line 84
    :cond_4e
    iget-object v6, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    const v7, 0x1030005

    iput v7, v6, Landroid/content/pm/ActivityInfo;->theme:I

    goto :goto_3d

    .line 92
    .end local v0    # "a":Landroid/content/pm/ActivityInfo;
    .end local v1    # "defaultTheme":I
    :cond_56
    return-void
.end method

.method private setupPluginTheme()V
    .registers 6

    .prologue
    .line 95
    const-string v2, "ProxyActivityBridge"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setupPluginTheme theme="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    iget v4, v4, Landroid/content/pm/ActivityInfo;->theme:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    iget-object v2, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    iget v2, v2, Landroid/content/pm/ActivityInfo;->theme:I

    if-lez v2, :cond_2b

    .line 97
    iget-object v2, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mProxyActivity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    iget v3, v3, Landroid/content/pm/ActivityInfo;->theme:I

    invoke-virtual {v2, v3}, Landroid/app/Activity;->setTheme(I)V

    .line 99
    :cond_2b
    iget-object v2, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mProxyActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    .line 100
    .local v1, "superTheme":Landroid/content/res/Resources$Theme;
    iget-object v2, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v2}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    iput-object v2, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mTheme:Landroid/content/res/Resources$Theme;

    .line 101
    iget-object v2, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mTheme:Landroid/content/res/Resources$Theme;

    invoke-virtual {v2, v1}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 104
    :try_start_3e
    iget-object v2, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mTheme:Landroid/content/res/Resources$Theme;

    iget-object v3, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    iget v3, v3, Landroid/content/pm/ActivityInfo;->theme:I

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_48} :catch_49

    .line 109
    :goto_48
    return-void

    .line 105
    :catch_49
    move-exception v0

    .line 106
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 107
    const-string v2, "ProxyActivityBridge"

    const-string v3, "createTheme-error when applyStyle()"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_48
.end method


# virtual methods
.method public getAssets()Landroid/content/res/AssetManager;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mAssetManager:Landroid/content/res/AssetManager;

    return-object v0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    iget-object v0, v0, Lcom/csdk/plugin/other/PluginPackage;->classLoader:Ldalvik/system/DexClassLoader;

    return-object v0
.end method

.method public getRemoteActivity()Lcom/csdk/plugin/activity/IPluginActivity;
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginActivity:Lcom/csdk/plugin/activity/IPluginActivity;

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method

.method public getTheme()Landroid/content/res/Resources$Theme;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mTheme:Landroid/content/res/Resources$Theme;

    return-object v0
.end method

.method public onCreate(Landroid/content/Intent;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 43
    const-class v0, Lcom/csdk/plugin/other/PluginConstants;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    .line 44
    const-string v0, "extra_package"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPackageName:Ljava/lang/String;

    .line 45
    const-string v0, "extra_class"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mClass:Ljava/lang/String;

    .line 46
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPackageName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_29

    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPackageName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 47
    :cond_29
    const-string v0, "ProxyActivityBridge"

    const-string v1, "extra_package \u6216\u8005 extra_class \u4e3a\u7a7a\uff0c\u8bf7\u68c0\u67e5\u542f\u52a8intent!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    :goto_30
    return-void

    .line 50
    :cond_31
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mProxyActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    iput-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    .line 51
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/csdk/plugin/PluginManager;->getPackage(Ljava/lang/String;)Lcom/csdk/plugin/other/PluginPackage;

    move-result-object v0

    iput-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    .line 52
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    if-nez v0, :cond_68

    .line 53
    const-string v0, "ProxyActivityBridge"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u65e0\u6cd5\u542f\u52a8:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mClass:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u63d2\u4ef6\u662f\u5426\u5df2\u7ecf\u52a0\u8f7d\uff1f"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_30

    .line 56
    :cond_68
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    iget-object v0, v0, Lcom/csdk/plugin/other/PluginPackage;->assetManager:Landroid/content/res/AssetManager;

    iput-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mAssetManager:Landroid/content/res/AssetManager;

    .line 57
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    iget-object v0, v0, Lcom/csdk/plugin/other/PluginPackage;->resources:Landroid/content/res/Resources;

    iput-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mResources:Landroid/content/res/Resources;

    .line 58
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    iget-object v0, v0, Lcom/csdk/plugin/other/PluginPackage;->classLoader:Ldalvik/system/DexClassLoader;

    iput-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivityBridge;->mPluginClassLoader:Ljava/lang/ClassLoader;

    .line 59
    invoke-direct {p0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->setUpDefaultTheme()V

    .line 60
    invoke-direct {p0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->setupPluginTheme()V

    .line 61
    invoke-direct {p0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->createPluginActivity()V

    goto :goto_30
.end method
