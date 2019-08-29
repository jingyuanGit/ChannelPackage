.class Lcom/jy/csdk/CSdkApi$1;
.super Ljava/lang/Object;
.source "CSdkApi.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jy/csdk/CSdkApi;->init(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jy/csdk/CSdkApi;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/jy/csdk/CSdkApi;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/jy/csdk/CSdkApi;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/jy/csdk/CSdkApi$1;->this$0:Lcom/jy/csdk/CSdkApi;

    iput-object p2, p0, Lcom/jy/csdk/CSdkApi$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 31
    iget-object v0, p0, Lcom/jy/csdk/CSdkApi$1;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    const-string v1, "csdk_plugin.apk"

    invoke-virtual {v0, v1}, Lcom/csdk/plugin/PluginManager;->loadAssetsPlugin(Ljava/lang/String;)Lcom/csdk/plugin/other/PluginPackage;

    .line 32
    return-void
.end method
