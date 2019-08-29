.class public Lcom/csdk/plugin/activity/ProxyFragmentActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "ProxyFragmentActivity.java"

# interfaces
.implements Lcom/csdk/plugin/IAttach;


# static fields
.field private static final TAG:Ljava/lang/String; = "ProxyActivity"


# instance fields
.field private mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

.field private mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 25
    new-instance v0, Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-direct {v0, p0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    return-void
.end method


# virtual methods
.method public attachPlugin(Lcom/csdk/plugin/IPlugin;)V
    .registers 4
    .param p1, "iPlugin"    # Lcom/csdk/plugin/IPlugin;

    .prologue
    .line 29
    check-cast p1, Lcom/csdk/plugin/activity/IPluginActivity;

    .end local p1    # "iPlugin":Lcom/csdk/plugin/IPlugin;
    iput-object p1, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    .line 30
    const-string v0, "ProxyActivity"

    const-string v1, "attach"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    return-void
.end method

.method public getApplicationInfo()Landroid/content/pm/ApplicationInfo;
    .registers 2

    .prologue
    .line 217
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    return-object v0
.end method

.method public getAssets()Landroid/content/res/AssetManager;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    goto :goto_c
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    goto :goto_c
.end method

.method public getTheme()Landroid/content/res/Resources$Theme;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    goto :goto_c
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 111
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1, p2, p3}, Lcom/csdk/plugin/activity/IPluginActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 112
    :cond_9
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 113
    const-string v0, "ProxyActivity"

    const-string v1, "onActivityResult"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    return-void
.end method

.method public onBackPressed()V
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 141
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onBackPressed()V

    .line 142
    :cond_9
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onBackPressed()V

    .line 143
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 205
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 206
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 207
    :cond_9
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 208
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 35
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {p0}, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->onCreate(Landroid/content/Intent;)V

    .line 37
    const-string v0, "ProxyActivity"

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 185
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 186
    :cond_9
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onDestroy()V
    .registers 3

    .prologue
    .line 82
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 83
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onDestroy()V

    .line 84
    :cond_9
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    .line 85
    const-string v0, "ProxyActivity"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 163
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 164
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1, p2}, Lcom/csdk/plugin/activity/IPluginActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 165
    :cond_9
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 155
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 156
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1, p2}, Lcom/csdk/plugin/activity/IPluginActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    .line 157
    :cond_9
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 132
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 133
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 134
    :cond_9
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 135
    const-string v0, "ProxyActivity"

    const-string v1, "onRestart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 191
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 192
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    .line 193
    :cond_9
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method protected onPause()V
    .registers 3

    .prologue
    .line 66
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 67
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onPause()V

    .line 68
    :cond_9
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onPause()V

    .line 69
    const-string v0, "ProxyActivity"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 5
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    .line 198
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 199
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1, p2, p3}, Lcom/csdk/plugin/activity/IPluginActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 200
    :cond_9
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/FragmentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 201
    return-void
.end method

.method protected onRestart()V
    .registers 3

    .prologue
    .line 50
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 51
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onRestart()V

    .line 52
    :cond_9
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onRestart()V

    .line 53
    const-string v0, "ProxyActivity"

    const-string v1, "onRestart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 126
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 127
    :cond_9
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 128
    return-void
.end method

.method protected onResume()V
    .registers 3

    .prologue
    .line 58
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 59
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onResume()V

    .line 60
    :cond_9
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onResume()V

    .line 61
    const-string v0, "ProxyActivity"

    const-string v1, "onResume"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 119
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 120
    :cond_9
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 121
    return-void
.end method

.method protected onStart()V
    .registers 3

    .prologue
    .line 42
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 43
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onStart()V

    .line 44
    :cond_9
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStart()V

    .line 45
    const-string v0, "ProxyActivity"

    const-string v1, "onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    return-void
.end method

.method protected onStop()V
    .registers 3

    .prologue
    .line 74
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 75
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onStop()V

    .line 76
    :cond_9
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStop()V

    .line 77
    const-string v0, "ProxyActivity"

    const-string v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 148
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 149
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 150
    :cond_9
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .registers 3
    .param p1, "params"    # Landroid/view/WindowManager$LayoutParams;

    .prologue
    .line 170
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 171
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 172
    :cond_9
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 173
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .registers 3
    .param p1, "hasFocus"    # Z

    .prologue
    .line 177
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 178
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyFragmentActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onWindowFocusChanged(Z)V

    .line 179
    :cond_9
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onWindowFocusChanged(Z)V

    .line 180
    return-void
.end method

.method public startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 3
    .param p1, "service"    # Landroid/content/Intent;

    .prologue
    .line 212
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method
