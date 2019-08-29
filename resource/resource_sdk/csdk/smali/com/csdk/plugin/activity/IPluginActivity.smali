.class public interface abstract Lcom/csdk/plugin/activity/IPluginActivity;
.super Ljava/lang/Object;
.source "IPluginActivity.java"

# interfaces
.implements Lcom/csdk/plugin/IPlugin;


# virtual methods
.method public abstract attach(Landroid/app/Activity;Lcom/csdk/plugin/other/PluginPackage;)V
.end method

.method public abstract onActivityResult(IILandroid/content/Intent;)V
.end method

.method public abstract onBackPressed()V
.end method

.method public abstract onConfigurationChanged(Landroid/content/res/Configuration;)V
.end method

.method public abstract onCreate(Landroid/os/Bundle;)V
.end method

.method public abstract onCreateOptionsMenu(Landroid/view/Menu;)Z
.end method

.method public abstract onDestroy()V
.end method

.method public abstract onKeyDown(ILandroid/view/KeyEvent;)Z
.end method

.method public abstract onKeyUp(ILandroid/view/KeyEvent;)Z
.end method

.method public abstract onNewIntent(Landroid/content/Intent;)V
.end method

.method public abstract onOptionsItemSelected(Landroid/view/MenuItem;)Z
.end method

.method public abstract onPause()V
.end method

.method public abstract onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation
.end method

.method public abstract onRestart()V
.end method

.method public abstract onRestoreInstanceState(Landroid/os/Bundle;)V
.end method

.method public abstract onResume()V
.end method

.method public abstract onSaveInstanceState(Landroid/os/Bundle;)V
.end method

.method public abstract onStart()V
.end method

.method public abstract onStop()V
.end method

.method public abstract onTouchEvent(Landroid/view/MotionEvent;)Z
.end method

.method public abstract onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
.end method

.method public abstract onWindowFocusChanged(Z)V
.end method
