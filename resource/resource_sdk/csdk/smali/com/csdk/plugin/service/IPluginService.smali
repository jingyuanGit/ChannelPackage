.class public interface abstract Lcom/csdk/plugin/service/IPluginService;
.super Ljava/lang/Object;
.source "IPluginService.java"

# interfaces
.implements Lcom/csdk/plugin/IPlugin;


# virtual methods
.method public abstract attach(Landroid/app/Service;Lcom/csdk/plugin/other/PluginPackage;)V
.end method

.method public abstract onBind(Landroid/content/Intent;)Landroid/os/IBinder;
.end method

.method public abstract onConfigurationChanged(Landroid/content/res/Configuration;)V
.end method

.method public abstract onCreate()V
.end method

.method public abstract onDestroy()V
.end method

.method public abstract onLowMemory()V
.end method

.method public abstract onRebind(Landroid/content/Intent;)V
.end method

.method public abstract onStart(Landroid/content/Intent;I)V
.end method

.method public abstract onStartCommand(Landroid/content/Intent;II)I
.end method

.method public abstract onTaskRemoved(Landroid/content/Intent;)V
.end method

.method public abstract onTrimMemory(I)V
.end method

.method public abstract onUnbind(Landroid/content/Intent;)Z
.end method
