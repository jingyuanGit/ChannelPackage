.class public Lcom/csdk/plugin/other/PluginPackage;
.super Ljava/lang/Object;
.source "PluginPackage.java"


# instance fields
.field public assetManager:Landroid/content/res/AssetManager;

.field public classLoader:Ldalvik/system/DexClassLoader;

.field public defaultActivity:Ljava/lang/String;

.field public packageInfo:Landroid/content/pm/PackageInfo;

.field public packageName:Ljava/lang/String;

.field public resources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Ldalvik/system/DexClassLoader;Landroid/content/res/Resources;Landroid/content/pm/PackageInfo;)V
    .registers 5
    .param p1, "loader"    # Ldalvik/system/DexClassLoader;
    .param p2, "resources"    # Landroid/content/res/Resources;
    .param p3, "packageInfo"    # Landroid/content/pm/PackageInfo;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iget-object v0, p3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    iput-object v0, p0, Lcom/csdk/plugin/other/PluginPackage;->packageName:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/csdk/plugin/other/PluginPackage;->classLoader:Ldalvik/system/DexClassLoader;

    .line 22
    invoke-virtual {p2}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    iput-object v0, p0, Lcom/csdk/plugin/other/PluginPackage;->assetManager:Landroid/content/res/AssetManager;

    .line 23
    iput-object p2, p0, Lcom/csdk/plugin/other/PluginPackage;->resources:Landroid/content/res/Resources;

    .line 24
    iput-object p3, p0, Lcom/csdk/plugin/other/PluginPackage;->packageInfo:Landroid/content/pm/PackageInfo;

    .line 26
    invoke-direct {p0}, Lcom/csdk/plugin/other/PluginPackage;->parseDefaultActivityName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/csdk/plugin/other/PluginPackage;->defaultActivity:Ljava/lang/String;

    .line 27
    return-void
.end method

.method private final parseDefaultActivityName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 30
    iget-object v0, p0, Lcom/csdk/plugin/other/PluginPackage;->packageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/csdk/plugin/other/PluginPackage;->packageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    array-length v0, v0

    if-lez v0, :cond_17

    .line 31
    iget-object v0, p0, Lcom/csdk/plugin/other/PluginPackage;->packageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 33
    :goto_16
    return-object v0

    :cond_17
    const-string v0, ""

    goto :goto_16
.end method
