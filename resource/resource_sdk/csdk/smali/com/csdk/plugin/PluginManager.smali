.class public Lcom/csdk/plugin/PluginManager;
.super Ljava/lang/Object;
.source "PluginManager.java"


# static fields
.field public static final START_RESULT_NO_PKG:I = 0x1

.field public static final START_RESULT_SUCCESS:I = 0x0

.field public static final TAG:Ljava/lang/String; = "PluginManager"

.field private static volatile sInstance:Lcom/csdk/plugin/PluginManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mPlugins:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/csdk/plugin/other/PluginPackage;",
            ">;"
        }
    .end annotation
.end field

.field private mServiceConns:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Landroid/content/ServiceConnection;",
            ">;"
        }
    .end annotation
.end field

.field private mServices:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/csdk/plugin/service/IPluginService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 58
    const/4 v0, 0x0

    sput-object v0, Lcom/csdk/plugin/PluginManager;->sInstance:Lcom/csdk/plugin/PluginManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v1, Landroid/util/ArrayMap;

    invoke-direct {v1}, Landroid/util/ArrayMap;-><init>()V

    iput-object v1, p0, Lcom/csdk/plugin/PluginManager;->mServices:Ljava/util/Map;

    .line 64
    new-instance v1, Landroid/util/ArrayMap;

    invoke-direct {v1}, Landroid/util/ArrayMap;-><init>()V

    iput-object v1, p0, Lcom/csdk/plugin/PluginManager;->mServiceConns:Ljava/util/Map;

    .line 66
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/csdk/plugin/PluginManager;->mPlugins:Ljava/util/Map;

    .line 79
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 80
    .local v0, "app":Landroid/content/Context;
    if-nez v0, :cond_21

    .line 81
    iput-object p1, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    .line 85
    .end local v0    # "app":Landroid/content/Context;
    :goto_20
    return-void

    .line 83
    .restart local v0    # "app":Landroid/content/Context;
    :cond_21
    check-cast v0, Landroid/app/Application;

    .end local v0    # "app":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/app/Application;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    goto :goto_20
.end method

.method private copySo(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 10
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x2000

    const/4 v5, 0x0

    .line 290
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 291
    .local v0, "bufferedInput":Ljava/io/BufferedInputStream;
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-direct {v1, p2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 293
    .local v1, "bufferedOutput":Ljava/io/BufferedOutputStream;
    new-array v3, v6, [B

    .line 294
    .local v3, "data":[B
    :goto_f
    invoke-virtual {v0, v3, v5, v6}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v2

    .local v2, "count":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_1a

    .line 295
    invoke-virtual {v1, v3, v5, v2}, Ljava/io/BufferedOutputStream;->write([BII)V

    goto :goto_f

    .line 297
    :cond_1a
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V

    .line 298
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    .line 299
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    .line 300
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 301
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 302
    return-void
.end method

.method private createAsset(Ljava/lang/String;)Landroid/content/res/AssetManager;
    .registers 10
    .param p1, "dexPath"    # Ljava/lang/String;

    .prologue
    .line 217
    :try_start_0
    const-class v3, Landroid/content/res/AssetManager;

    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/res/AssetManager;

    .line 218
    .local v1, "assetManager":Landroid/content/res/AssetManager;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "addAssetPath"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 219
    .local v0, "addAssetPath":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_24

    .line 223
    .end local v0    # "addAssetPath":Ljava/lang/reflect/Method;
    .end local v1    # "assetManager":Landroid/content/res/AssetManager;
    :goto_23
    return-object v1

    .line 221
    :catch_24
    move-exception v2

    .line 222
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 223
    const/4 v1, 0x0

    goto :goto_23
.end method

.method private createDex(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ldalvik/system/DexClassLoader;
    .registers 8
    .param p1, "dexPath"    # Ljava/lang/String;
    .param p2, "dexOutputPath"    # Ljava/lang/String;
    .param p3, "nativeLibPath"    # Ljava/lang/String;

    .prologue
    .line 209
    const-string v1, "PluginManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dexOutputPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    const-string v1, "PluginManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "nativeLibPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    new-instance v0, Ldalvik/system/DexClassLoader;

    iget-object v1, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-direct {v0, p1, p2, p3, v1}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 212
    .local v0, "loader":Ldalvik/system/DexClassLoader;
    return-object v0
.end method

.method private createRes(Landroid/content/res/AssetManager;)Landroid/content/res/Resources;
    .registers 6
    .param p1, "assetManager"    # Landroid/content/res/AssetManager;

    .prologue
    .line 228
    iget-object v2, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 229
    .local v1, "superRes":Landroid/content/res/Resources;
    new-instance v0, Landroid/content/res/Resources;

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    invoke-direct {v0, p1, v2, v3}, Landroid/content/res/Resources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    .line 230
    .local v0, "resources":Landroid/content/res/Resources;
    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;
    .registers 3
    .param p0, "base"    # Landroid/content/Context;

    .prologue
    .line 69
    sget-object v0, Lcom/csdk/plugin/PluginManager;->sInstance:Lcom/csdk/plugin/PluginManager;

    if-nez v0, :cond_13

    .line 70
    const-class v1, Lcom/csdk/plugin/PluginManager;

    monitor-enter v1

    .line 71
    :try_start_7
    sget-object v0, Lcom/csdk/plugin/PluginManager;->sInstance:Lcom/csdk/plugin/PluginManager;

    if-nez v0, :cond_12

    .line 72
    new-instance v0, Lcom/csdk/plugin/PluginManager;

    invoke-direct {v0, p0}, Lcom/csdk/plugin/PluginManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/csdk/plugin/PluginManager;->sInstance:Lcom/csdk/plugin/PluginManager;

    .line 73
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 75
    :cond_13
    sget-object v0, Lcom/csdk/plugin/PluginManager;->sInstance:Lcom/csdk/plugin/PluginManager;

    return-object v0

    .line 73
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method private getProxyActivityClass(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 366
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 367
    .local v0, "activityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    const-class v1, Lcom/csdk/plugin/activity/PluginActivity;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 368
    const-class v0, Lcom/csdk/plugin/activity/ProxyActivity;

    .line 372
    :cond_b
    :goto_b
    return-object v0

    .line 369
    :cond_c
    const-class v1, Lcom/csdk/plugin/activity/PluginFragmentActivity;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 370
    const-class v0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;

    goto :goto_b
.end method

.method private loadPlugin(Landroid/content/pm/PackageInfo;Ljava/lang/String;)Lcom/csdk/plugin/other/PluginPackage;
    .registers 13
    .param p1, "packageInfo"    # Landroid/content/pm/PackageInfo;
    .param p2, "dexPath"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 191
    iget-object v7, p0, Lcom/csdk/plugin/PluginManager;->mPlugins:Ljava/util/Map;

    iget-object v8, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/csdk/plugin/other/PluginPackage;

    .line 192
    .local v4, "pluginPackage":Lcom/csdk/plugin/other/PluginPackage;
    if-eqz v4, :cond_2d

    .line 193
    const-string v7, "PluginManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u63d2\u4ef6:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\u5df2\u52a0\u8f7d"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v4

    .line 205
    .end local v4    # "pluginPackage":Lcom/csdk/plugin/other/PluginPackage;
    .local v5, "pluginPackage":Ljava/lang/Object;
    :goto_2c
    return-object v5

    .line 196
    .end local v5    # "pluginPackage":Ljava/lang/Object;
    .restart local v4    # "pluginPackage":Lcom/csdk/plugin/other/PluginPackage;
    :cond_2d
    iget-object v7, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    const-string v8, "dex"

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v2

    .line 197
    .local v2, "dexOutputDir":Ljava/io/File;
    iget-object v7, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    const-string v8, "lib"

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    .line 198
    .local v3, "nativeLibDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, p2, v7, v8}, Lcom/csdk/plugin/PluginManager;->createDex(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ldalvik/system/DexClassLoader;

    move-result-object v1

    .line 199
    .local v1, "dexClassLoader":Ldalvik/system/DexClassLoader;
    invoke-direct {p0, p2}, Lcom/csdk/plugin/PluginManager;->createAsset(Ljava/lang/String;)Landroid/content/res/AssetManager;

    move-result-object v0

    .line 200
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    invoke-direct {p0, v0}, Lcom/csdk/plugin/PluginManager;->createRes(Landroid/content/res/AssetManager;)Landroid/content/res/Resources;

    move-result-object v6

    .line 201
    .local v6, "resources":Landroid/content/res/Resources;
    new-instance v4, Lcom/csdk/plugin/other/PluginPackage;

    .end local v4    # "pluginPackage":Lcom/csdk/plugin/other/PluginPackage;
    invoke-direct {v4, v1, v6, p1}, Lcom/csdk/plugin/other/PluginPackage;-><init>(Ldalvik/system/DexClassLoader;Landroid/content/res/Resources;Landroid/content/pm/PackageInfo;)V

    .line 202
    .restart local v4    # "pluginPackage":Lcom/csdk/plugin/other/PluginPackage;
    iget-object v7, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    iget-object v8, v4, Lcom/csdk/plugin/other/PluginPackage;->packageInfo:Landroid/content/pm/PackageInfo;

    invoke-virtual {p0, p2, v7, v8, v3}, Lcom/csdk/plugin/PluginManager;->copyNativeLib(Ljava/lang/String;Landroid/content/Context;Landroid/content/pm/PackageInfo;Ljava/io/File;)V

    .line 203
    iget-object v7, p0, Lcom/csdk/plugin/PluginManager;->mPlugins:Ljava/util/Map;

    iget-object v8, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-interface {v7, v8, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    const-string v7, "PluginManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u63d2\u4ef6:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\u52a0\u8f7d\u5b8c\u6210"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v4

    .line 205
    .restart local v5    # "pluginPackage":Ljava/lang/Object;
    goto :goto_2c
.end method


# virtual methods
.method public bindService(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "service"    # Landroid/content/Intent;
    .param p3, "conn"    # Landroid/content/ServiceConnection;
    .param p4, "flags"    # I

    .prologue
    .line 389
    sget-object v1, Lcom/csdk/plugin/other/PluginConstants;->PROXY_SERVICE_CLASS:Ljava/lang/Class;

    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 390
    const-string v1, "extra_server_command"

    const/4 v2, 0x3

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 391
    const-string v1, "extra_class"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 392
    .local v0, "serviceName":Ljava/lang/String;
    iget-object v1, p0, Lcom/csdk/plugin/PluginManager;->mServiceConns:Ljava/util/Map;

    invoke-interface {v1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    invoke-virtual {p1, p2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 394
    const/4 v1, 0x1

    return v1
.end method

.method public copyNativeLib(Ljava/lang/String;Landroid/content/Context;Landroid/content/pm/PackageInfo;Ljava/io/File;)V
    .registers 21
    .param p1, "apkPath"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "packageInfo"    # Landroid/content/pm/PackageInfo;
    .param p4, "nativeLibDir"    # Ljava/io/File;

    .prologue
    .line 234
    new-instance v2, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 235
    .local v2, "apk":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v13

    if-nez v13, :cond_e

    .line 287
    :goto_d
    return-void

    .line 240
    :cond_e
    :try_start_e
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x15

    if-lt v13, v14, :cond_14a

    .line 241
    sget-object v13, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    const/4 v14, 0x0

    aget-object v3, v13, v14

    .line 245
    .local v3, "cpuArch":Ljava/lang/String;
    :goto_19
    const/4 v6, 0x0

    .line 247
    .local v6, "findSo":Z
    new-instance v12, Ljava/util/zip/ZipFile;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 249
    .local v12, "zipfile":Ljava/util/zip/ZipFile;
    invoke-virtual {v12}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v4

    .line 250
    .local v4, "e":Ljava/util/Enumeration;
    :cond_27
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v13

    if-eqz v13, :cond_63

    .line 251
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/zip/ZipEntry;

    .line 252
    .local v5, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v13

    if-nez v13, :cond_27

    .line 254
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v13

    const-string v14, ".so"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_27

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "lib/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_27

    .line 255
    const/4 v6, 0x1

    .line 259
    .end local v5    # "entry":Ljava/util/zip/ZipEntry;
    :cond_63
    invoke-virtual {v12}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v4

    .line 260
    :cond_67
    :goto_67
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v13

    if-eqz v13, :cond_18d

    .line 261
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/zip/ZipEntry;

    .line 262
    .restart local v5    # "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v13

    if-nez v13, :cond_67

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v13

    const-string v14, ".so"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_67

    .line 264
    if-eqz v6, :cond_a4

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "lib/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_b2

    :cond_a4
    if-nez v6, :cond_67

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v13

    const-string v14, "lib/armeabi/"

    invoke-virtual {v13, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_67

    .line 265
    :cond_b2
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v13

    const-string v14, "/"

    invoke-virtual {v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 266
    .local v11, "temp":[Ljava/lang/String;
    array-length v13, v11

    add-int/lit8 v13, v13, -0x1

    aget-object v10, v11, v13

    .line 267
    .local v10, "libName":Ljava/lang/String;
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "verify so "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 268
    new-instance v9, Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-object v14, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v9, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 269
    .local v9, "libFile":Ljava/io/File;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    iget-object v14, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "_"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 270
    .local v8, "key":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v13

    if-eqz v13, :cond_14e

    .line 271
    move-object/from16 v0, p2

    invoke-static {v0, v8}, Lcom/csdk/plugin/utils/SoSave;->getSoVersion(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    .line 272
    .local v1, "VersionCode":I
    move-object/from16 v0, p3

    iget v13, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    if-ne v1, v13, :cond_14e

    .line 273
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "skip existing so : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_142
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_142} :catch_144

    goto/16 :goto_67

    .line 284
    .end local v1    # "VersionCode":I
    .end local v3    # "cpuArch":Ljava/lang/String;
    .end local v4    # "e":Ljava/util/Enumeration;
    .end local v5    # "entry":Ljava/util/zip/ZipEntry;
    .end local v6    # "findSo":Z
    .end local v8    # "key":Ljava/lang/String;
    .end local v9    # "libFile":Ljava/io/File;
    .end local v10    # "libName":Ljava/lang/String;
    .end local v11    # "temp":[Ljava/lang/String;
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_144
    move-exception v4

    .line 285
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_d

    .line 243
    .end local v4    # "e":Ljava/io/IOException;
    :cond_14a
    :try_start_14a
    sget-object v3, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    .restart local v3    # "cpuArch":Ljava/lang/String;
    goto/16 :goto_19

    .line 277
    .local v4, "e":Ljava/util/Enumeration;
    .restart local v5    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v6    # "findSo":Z
    .restart local v8    # "key":Ljava/lang/String;
    .restart local v9    # "libFile":Ljava/io/File;
    .restart local v10    # "libName":Ljava/lang/String;
    .restart local v11    # "temp":[Ljava/lang/String;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    :cond_14e
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 278
    .local v7, "fos":Ljava/io/FileOutputStream;
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "copy so "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " of "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 279
    invoke-virtual {v12, v5}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v7}, Lcom/csdk/plugin/PluginManager;->copySo(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 280
    move-object/from16 v0, p3

    iget v13, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    move-object/from16 v0, p2

    invoke-static {v0, v8, v13}, Lcom/csdk/plugin/utils/SoSave;->setSoVersion(Landroid/content/Context;Ljava/lang/String;I)V

    goto/16 :goto_67

    .line 283
    .end local v5    # "entry":Ljava/util/zip/ZipEntry;
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "key":Ljava/lang/String;
    .end local v9    # "libFile":Ljava/io/File;
    .end local v10    # "libName":Ljava/lang/String;
    .end local v11    # "temp":[Ljava/lang/String;
    :cond_18d
    invoke-virtual {v12}, Ljava/util/zip/ZipFile;->close()V
    :try_end_190
    .catch Ljava/io/IOException; {:try_start_14a .. :try_end_190} :catch_144

    goto/16 :goto_d
.end method

.method public copyPluginFromAssets(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "pluginAssetsPath"    # Ljava/lang/String;
    .param p3, "pluginSavePath"    # Ljava/lang/String;

    .prologue
    .line 133
    const/4 v2, 0x0

    .line 134
    .local v2, "is":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 136
    .local v4, "os":Ljava/io/OutputStream;
    :try_start_2
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    invoke-virtual {v6, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 137
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_f} :catch_8f
    .catchall {:try_start_2 .. :try_end_f} :catchall_76

    .line 138
    .end local v4    # "os":Ljava/io/OutputStream;
    .local v5, "os":Ljava/io/OutputStream;
    const/4 v3, 0x0

    .line 139
    .local v3, "length":I
    const/16 v6, 0x2000

    :try_start_12
    new-array v0, v6, [B

    .line 140
    .local v0, "buffer":[B
    :goto_14
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v6, -0x1

    if-eq v3, v6, :cond_4e

    .line 141
    const/4 v6, 0x0

    invoke-virtual {v5, v0, v6, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_1f} :catch_20
    .catchall {:try_start_12 .. :try_end_1f} :catchall_8c

    goto :goto_14

    .line 144
    .end local v0    # "buffer":[B
    :catch_20
    move-exception v1

    move-object v4, v5

    .line 145
    .end local v3    # "length":I
    .end local v5    # "os":Ljava/io/OutputStream;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v4    # "os":Ljava/io/OutputStream;
    :goto_22
    :try_start_22
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 146
    const-string v6, "PluginManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u8bf7\u68c0\u67e5"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\u6587\u4ef6\u662f\u5426\u5b58\u5728"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_43
    .catchall {:try_start_22 .. :try_end_43} :catchall_76

    .line 148
    if-eqz v4, :cond_48

    .line 150
    :try_start_45
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_48} :catch_6c

    .line 155
    :cond_48
    :goto_48
    if-eqz v2, :cond_4d

    .line 157
    :try_start_4a
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4d} :catch_71

    .line 163
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4d
    :goto_4d
    return-void

    .line 143
    .end local v4    # "os":Ljava/io/OutputStream;
    .restart local v0    # "buffer":[B
    .restart local v3    # "length":I
    .restart local v5    # "os":Ljava/io/OutputStream;
    :cond_4e
    :try_start_4e
    const-string v6, "PluginManager"

    const-string v7, "copy\u63d2\u4ef6\u5b8c\u6210"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_55} :catch_20
    .catchall {:try_start_4e .. :try_end_55} :catchall_8c

    .line 148
    if-eqz v5, :cond_5a

    .line 150
    :try_start_57
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_5a} :catch_61

    .line 155
    :cond_5a
    :goto_5a
    if-eqz v2, :cond_91

    .line 157
    :try_start_5c
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_5f} :catch_66

    move-object v4, v5

    .line 160
    .end local v5    # "os":Ljava/io/OutputStream;
    .restart local v4    # "os":Ljava/io/OutputStream;
    goto :goto_4d

    .line 151
    .end local v4    # "os":Ljava/io/OutputStream;
    .restart local v5    # "os":Ljava/io/OutputStream;
    :catch_61
    move-exception v1

    .line 152
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5a

    .line 158
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_66
    move-exception v1

    .line 159
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    move-object v4, v5

    .line 160
    .end local v5    # "os":Ljava/io/OutputStream;
    .restart local v4    # "os":Ljava/io/OutputStream;
    goto :goto_4d

    .line 151
    .end local v0    # "buffer":[B
    .end local v3    # "length":I
    :catch_6c
    move-exception v1

    .line 152
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_48

    .line 158
    :catch_71
    move-exception v1

    .line 159
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4d

    .line 148
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_76
    move-exception v6

    :goto_77
    if-eqz v4, :cond_7c

    .line 150
    :try_start_79
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_79 .. :try_end_7c} :catch_82

    .line 155
    :cond_7c
    :goto_7c
    if-eqz v2, :cond_81

    .line 157
    :try_start_7e
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_81
    .catch Ljava/lang/Exception; {:try_start_7e .. :try_end_81} :catch_87

    .line 162
    :cond_81
    :goto_81
    throw v6

    .line 151
    :catch_82
    move-exception v1

    .line 152
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_7c

    .line 158
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_87
    move-exception v1

    .line 159
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_81

    .line 148
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "os":Ljava/io/OutputStream;
    .restart local v3    # "length":I
    .restart local v5    # "os":Ljava/io/OutputStream;
    :catchall_8c
    move-exception v6

    move-object v4, v5

    .end local v5    # "os":Ljava/io/OutputStream;
    .restart local v4    # "os":Ljava/io/OutputStream;
    goto :goto_77

    .line 144
    .end local v3    # "length":I
    :catch_8f
    move-exception v1

    goto :goto_22

    .end local v4    # "os":Ljava/io/OutputStream;
    .restart local v0    # "buffer":[B
    .restart local v3    # "length":I
    .restart local v5    # "os":Ljava/io/OutputStream;
    :cond_91
    move-object v4, v5

    .end local v5    # "os":Ljava/io/OutputStream;
    .restart local v4    # "os":Ljava/io/OutputStream;
    goto :goto_4d
.end method

.method public getHostContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 305
    iget-object v0, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getPackage(Ljava/lang/String;)Lcom/csdk/plugin/other/PluginPackage;
    .registers 3
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 309
    iget-object v0, p0, Lcom/csdk/plugin/PluginManager;->mPlugins:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/csdk/plugin/other/PluginPackage;

    return-object v0
.end method

.method public getServiceConns()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Landroid/content/ServiceConnection;",
            ">;"
        }
    .end annotation

    .prologue
    .line 420
    iget-object v0, p0, Lcom/csdk/plugin/PluginManager;->mServiceConns:Ljava/util/Map;

    return-object v0
.end method

.method public getServices()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/csdk/plugin/service/IPluginService;",
            ">;"
        }
    .end annotation

    .prologue
    .line 416
    iget-object v0, p0, Lcom/csdk/plugin/PluginManager;->mServices:Ljava/util/Map;

    return-object v0
.end method

.method public init()V
    .registers 1

    .prologue
    .line 89
    return-void
.end method

.method public loadAssetsPlugin(Ljava/lang/String;)Lcom/csdk/plugin/other/PluginPackage;
    .registers 11
    .param p1, "pluginAssetsPath"    # Ljava/lang/String;

    .prologue
    .line 99
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 100
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 101
    .local v3, "name":Ljava/lang/String;
    const-string v6, "PluginManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "assets\u63d2\u4ef6\u6587\u4ef6\u540d:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iget-object v6, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    const-string v7, "plugins"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 103
    .local v4, "pluginSaveDir":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 104
    .local v5, "pluginSavePath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 105
    .local v0, "apk":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_7d

    .line 106
    iget-object v6, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v6, p1, v5}, Lcom/csdk/plugin/PluginManager;->copyPluginFromAssets(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    :cond_55
    :goto_55
    iget-object v6, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    invoke-static {v6, v5}, Lcom/csdk/plugin/utils/ApkUtils;->getApkPackageInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 117
    .local v1, "apkPackageInfo":Landroid/content/pm/PackageInfo;
    if-nez v1, :cond_87

    .line 118
    const-string v6, "PluginManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u83b7\u53d6\u63d2\u4ef6:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\u4fe1\u606f\u5931\u8d25"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    const/4 v6, 0x0

    .line 121
    :goto_7c
    return-object v6

    .line 109
    .end local v1    # "apkPackageInfo":Landroid/content/pm/PackageInfo;
    :cond_7d
    sget-boolean v6, Lcom/csdk/plugin/other/PluginConstants;->isDebug:Z

    if-eqz v6, :cond_55

    .line 110
    iget-object v6, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v6, p1, v5}, Lcom/csdk/plugin/PluginManager;->copyPluginFromAssets(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_55

    .line 121
    .restart local v1    # "apkPackageInfo":Landroid/content/pm/PackageInfo;
    :cond_87
    invoke-direct {p0, v1, v5}, Lcom/csdk/plugin/PluginManager;->loadPlugin(Landroid/content/pm/PackageInfo;Ljava/lang/String;)Lcom/csdk/plugin/other/PluginPackage;

    move-result-object v6

    goto :goto_7c
.end method

.method public loadPlugin(Ljava/io/File;)Lcom/csdk/plugin/other/PluginPackage;
    .registers 7
    .param p1, "apk"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x0

    .line 175
    if-nez p1, :cond_4

    .line 187
    :cond_3
    :goto_3
    return-object v1

    .line 178
    :cond_4
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2d

    .line 179
    const-string v2, "PluginManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u63d2\u4ef6:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\u4e0d\u5b58\u5728"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 182
    :cond_2d
    iget-object v2, p0, Lcom/csdk/plugin/PluginManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 184
    .local v0, "packageInfo":Landroid/content/pm/PackageInfo;
    if-eqz v0, :cond_3

    .line 187
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/csdk/plugin/PluginManager;->loadPlugin(Landroid/content/pm/PackageInfo;Ljava/lang/String;)Lcom/csdk/plugin/other/PluginPackage;

    move-result-object v1

    goto :goto_3
.end method

.method public loadPlugin(Ljava/lang/String;)Lcom/csdk/plugin/other/PluginPackage;
    .registers 4
    .param p1, "apkPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 166
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 167
    const/4 v1, 0x0

    .line 170
    :goto_7
    return-object v1

    .line 169
    :cond_8
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 170
    .local v0, "apk":Ljava/io/File;
    invoke-virtual {p0, v0}, Lcom/csdk/plugin/PluginManager;->loadPlugin(Ljava/io/File;)Lcom/csdk/plugin/other/PluginPackage;

    move-result-object v1

    goto :goto_7
.end method

.method public startActivity(Landroid/content/Context;Landroid/content/Intent;)I
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 317
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/csdk/plugin/PluginManager;->startActivity(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)I

    move-result v0

    return v0
.end method

.method public startActivity(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)I
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "options"    # Landroid/os/Bundle;

    .prologue
    .line 321
    const/4 v0, -0x1

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/csdk/plugin/PluginManager;->startActivityForResult(Landroid/content/Context;Landroid/content/Intent;ILandroid/os/Bundle;)I

    move-result v0

    return v0
.end method

.method public startActivityForResult(Landroid/content/Context;Landroid/content/Intent;I)I
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "requestCode"    # I

    .prologue
    .line 325
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/csdk/plugin/PluginManager;->startActivityForResult(Landroid/content/Context;Landroid/content/Intent;ILandroid/os/Bundle;)I

    move-result v0

    return v0
.end method

.method public startActivityForResult(Landroid/content/Context;Landroid/content/Intent;ILandroid/os/Bundle;)I
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "requestCode"    # I
    .param p4, "options"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x1

    .line 329
    const-string v7, "extra_package"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 330
    .local v4, "packageName":Ljava/lang/String;
    const-string v7, "extra_class"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 331
    .local v0, "className":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1b

    .line 332
    const-string v7, "PluginManager"

    const-string v8, "\u8bf7\u5728intent\u4e2d\u8bbe\u7f6eextra_package"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    .end local p1    # "context":Landroid/content/Context;
    :goto_1a
    return v6

    .line 335
    .restart local p1    # "context":Landroid/content/Context;
    :cond_1b
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_29

    .line 336
    const-string v7, "PluginManager"

    const-string v8, "\u8bf7\u5728intent\u4e2d\u8bbe\u7f6eextra_class"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1a

    .line 339
    :cond_29
    iget-object v7, p0, Lcom/csdk/plugin/PluginManager;->mPlugins:Ljava/util/Map;

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/csdk/plugin/other/PluginPackage;

    .line 340
    .local v5, "pluginPackage":Lcom/csdk/plugin/other/PluginPackage;
    if-nez v5, :cond_3b

    .line 341
    const-string v7, "PluginManager"

    const-string v8, "\u8bf7\u68c0\u67e5\u63d2\u4ef6\u662f\u5426\u5df2\u7ecf\u52a0\u8f7d"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1a

    .line 345
    :cond_3b
    const/4 v1, 0x0

    .line 346
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    .line 348
    .local v3, "lunchActivityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v7, 0x1

    :try_start_3e
    iget-object v8, v5, Lcom/csdk/plugin/other/PluginPackage;->classLoader:Ldalvik/system/DexClassLoader;

    invoke-static {v0, v7, v8}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 349
    invoke-direct {p0, v1}, Lcom/csdk/plugin/PluginManager;->getProxyActivityClass(Ljava/lang/Class;)Ljava/lang/Class;
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_47} :catch_56

    move-result-object v3

    .line 355
    invoke-virtual {p2, p1, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 356
    instance-of v6, p1, Landroid/app/Activity;

    if-eqz v6, :cond_5b

    .line 357
    check-cast p1, Landroid/app/Activity;

    .end local p1    # "context":Landroid/content/Context;
    invoke-virtual {p1, p2, p3, p4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    .line 361
    :goto_54
    const/4 v6, 0x0

    goto :goto_1a

    .line 351
    .restart local p1    # "context":Landroid/content/Context;
    :catch_56
    move-exception v2

    .line 352
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1a

    .line 359
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_5b
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_54
.end method

.method public startService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "service"    # Landroid/content/Intent;

    .prologue
    .line 376
    sget-object v0, Lcom/csdk/plugin/other/PluginConstants;->PROXY_SERVICE_CLASS:Ljava/lang/Class;

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 377
    const-string v0, "extra_server_command"

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 378
    invoke-virtual {p1, p2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method

.method public stopService(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Landroid/content/Intent;

    .prologue
    .line 382
    sget-object v0, Lcom/csdk/plugin/other/PluginConstants;->PROXY_SERVICE_CLASS:Ljava/lang/Class;

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 383
    const-string v0, "extra_server_command"

    const/4 v1, 0x2

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 384
    invoke-virtual {p1, p2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 385
    const/4 v0, 0x1

    return v0
.end method

.method public unbindService(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "conn"    # Landroid/content/ServiceConnection;

    .prologue
    .line 398
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 399
    .local v2, "intent":Landroid/content/Intent;
    sget-object v5, Lcom/csdk/plugin/other/PluginConstants;->PROXY_SERVICE_CLASS:Ljava/lang/Class;

    invoke-virtual {v2, p1, v5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 400
    const-string v3, ""

    .line 401
    .local v3, "serviceName":Ljava/lang/String;
    iget-object v5, p0, Lcom/csdk/plugin/PluginManager;->mServiceConns:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 402
    .local v0, "entries":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Landroid/content/ServiceConnection;>;>;"
    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_36

    .line 403
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 404
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/content/ServiceConnection;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/ServiceConnection;

    .line 405
    .local v4, "value":Landroid/content/ServiceConnection;
    if-eqz v4, :cond_16

    invoke-virtual {v4, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 406
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "serviceName":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 410
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/content/ServiceConnection;>;"
    .end local v4    # "value":Landroid/content/ServiceConnection;
    .restart local v3    # "serviceName":Ljava/lang/String;
    :cond_36
    const-string v5, "extra_class"

    invoke-virtual {v2, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 411
    const-string v5, "extra_server_command"

    const/4 v6, 0x4

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 412
    invoke-virtual {p1, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 413
    return-void
.end method
