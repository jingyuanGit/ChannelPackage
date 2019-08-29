.class public Lcom/csdk/plugin/other/PluginConstants;
.super Ljava/lang/Object;
.source "PluginConstants.java"


# static fields
.field public static final EXTRA_BIND_SERVICE:I = 0x3

.field public static final EXTRA_CLASS:Ljava/lang/String; = "extra_class"

.field public static final EXTRA_PACKAGE:Ljava/lang/String; = "extra_package"

.field public static final EXTRA_SERVER_COMMAND:Ljava/lang/String; = "extra_server_command"

.field public static final EXTRA_START_SERVICE:I = 0x1

.field public static final EXTRA_STOP_SERVICE:I = 0x2

.field public static final EXTRA_UNBIND_SERVICE:I = 0x4

.field public static final PLUGIN_APK_NAME:Ljava/lang/String; = "plugin_sdk-release.apk"

.field public static final PLUGIN_ASSETS_PATH:Ljava/lang/String; = "plugin_sdk-release.apk"

.field public static final PLUGIN_SAVE_DIR:Ljava/lang/String; = "plugins"

.field public static final PROXY_ACTIVITY_CLASS:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final PROXY_SERVICE_CLASS:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static isDebug:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    const-class v0, Lcom/csdk/plugin/activity/ProxyActivity;

    sput-object v0, Lcom/csdk/plugin/other/PluginConstants;->PROXY_ACTIVITY_CLASS:Ljava/lang/Class;

    .line 21
    const-class v0, Lcom/csdk/plugin/service/ProxyService;

    sput-object v0, Lcom/csdk/plugin/other/PluginConstants;->PROXY_SERVICE_CLASS:Ljava/lang/Class;

    .line 30
    const/4 v0, 0x1

    sput-boolean v0, Lcom/csdk/plugin/other/PluginConstants;->isDebug:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
