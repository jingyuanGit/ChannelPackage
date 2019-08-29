.class public Lcom/csdk/plugin/activity/ProxyActivity;
.super Landroid/app/Activity;
.source "ProxyActivity.java"

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
    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 26
    new-instance v0, Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-direct {v0, p0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    return-void
.end method


# virtual methods
.method public attachPlugin(Lcom/csdk/plugin/IPlugin;)V
    .registers 4
    .param p1, "iPlugin"    # Lcom/csdk/plugin/IPlugin;

    .prologue
    .line 30
    check-cast p1, Lcom/csdk/plugin/activity/IPluginActivity;

    .end local p1    # "iPlugin":Lcom/csdk/plugin/IPlugin;
    iput-object p1, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    .line 31
    const-string v0, "ProxyActivity"

    const-string v1, "attach"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    return-void
.end method

.method public getApplicationInfo()Landroid/content/pm/ApplicationInfo;
    .registers 2

    .prologue
    .line 219
    invoke-super {p0}, Landroid/app/Activity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    return-object v0
.end method

.method public getAssets()Landroid/content/res/AssetManager;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    goto :goto_c
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    goto :goto_c
.end method

.method public getTheme()Landroid/content/res/Resources$Theme;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {v0}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

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
    .line 111
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 112
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1, p2, p3}, Lcom/csdk/plugin/activity/IPluginActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 113
    :cond_9
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 114
    const-string v0, "ProxyActivity"

    const-string v1, "onActivityResult"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    return-void
.end method

.method public onBackPressed()V
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 143
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onBackPressed()V

    .line 144
    :cond_9
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 145
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 208
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 209
    :cond_9
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 210
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mBridge:Lcom/csdk/plugin/activity/ProxyActivityBridge;

    invoke-virtual {p0}, Lcom/csdk/plugin/activity/ProxyActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/csdk/plugin/activity/ProxyActivityBridge;->onCreate(Landroid/content/Intent;)V

    .line 38
    const-string v0, "ProxyActivity"

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 187
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 188
    :cond_9
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onDestroy()V
    .registers 3

    .prologue
    .line 83
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 84
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onDestroy()V

    .line 85
    :cond_9
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 86
    const-string v0, "ProxyActivity"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 166
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1, p2}, Lcom/csdk/plugin/activity/IPluginActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 167
    :cond_9
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 158
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1, p2}, Lcom/csdk/plugin/activity/IPluginActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    .line 159
    :cond_9
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 134
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 135
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 136
    :cond_9
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 137
    const-string v0, "ProxyActivity"

    const-string v1, "onRestart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 194
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    .line 195
    :cond_9
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method protected onPause()V
    .registers 3

    .prologue
    .line 67
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 68
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onPause()V

    .line 69
    :cond_9
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 70
    const-string v0, "ProxyActivity"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 5
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    .line 200
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 201
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1, p2, p3}, Lcom/csdk/plugin/activity/IPluginActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 202
    :cond_9
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 203
    return-void
.end method

.method protected onRestart()V
    .registers 3

    .prologue
    .line 51
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 52
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onRestart()V

    .line 53
    :cond_9
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 54
    const-string v0, "ProxyActivity"

    const-string v1, "onRestart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 128
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 129
    :cond_9
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 130
    return-void
.end method

.method protected onResume()V
    .registers 3

    .prologue
    .line 59
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 60
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onResume()V

    .line 61
    :cond_9
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 62
    const-string v0, "ProxyActivity"

    const-string v1, "onResume"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 121
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 122
    :cond_9
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 123
    return-void
.end method

.method protected onStart()V
    .registers 3

    .prologue
    .line 43
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 44
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onStart()V

    .line 45
    :cond_9
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 46
    const-string v0, "ProxyActivity"

    const-string v1, "onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-void
.end method

.method protected onStop()V
    .registers 3

    .prologue
    .line 75
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 76
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0}, Lcom/csdk/plugin/activity/IPluginActivity;->onStop()V

    .line 77
    :cond_9
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 78
    const-string v0, "ProxyActivity"

    const-string v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 151
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 152
    :cond_9
    invoke-super {p0, p1}, Landroid/app/Activity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .registers 3
    .param p1, "params"    # Landroid/view/WindowManager$LayoutParams;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 173
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 174
    :cond_9
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 175
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .registers 3
    .param p1, "hasFocus"    # Z

    .prologue
    .line 179
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    if-eqz v0, :cond_9

    .line 180
    iget-object v0, p0, Lcom/csdk/plugin/activity/ProxyActivity;->mPlugin:Lcom/csdk/plugin/activity/IPluginActivity;

    invoke-interface {v0, p1}, Lcom/csdk/plugin/activity/IPluginActivity;->onWindowFocusChanged(Z)V

    .line 181
    :cond_9
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 182
    return-void
.end method

.method public startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 3
    .param p1, "service"    # Landroid/content/Intent;

    .prologue
    .line 214
    invoke-super {p0, p1}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method
