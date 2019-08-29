.class public Lcom/csdk/plugin/activity/PluginFragmentActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "PluginFragmentActivity.java"

# interfaces
.implements Lcom/csdk/plugin/activity/IPluginActivity;


# instance fields
.field protected mPluginManager:Lcom/csdk/plugin/PluginManager;

.field protected mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

.field protected that:Landroid/support/v4/app/FragmentActivity;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    return-void
.end method

.method public attach(Landroid/app/Activity;Lcom/csdk/plugin/other/PluginPackage;)V
    .registers 4
    .param p1, "proxyActivity"    # Landroid/app/Activity;
    .param p2, "pluginPackage"    # Lcom/csdk/plugin/other/PluginPackage;

    .prologue
    .line 243
    check-cast p1, Landroid/support/v4/app/FragmentActivity;

    .end local p1    # "proxyActivity":Landroid/app/Activity;
    iput-object p1, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    .line 244
    iput-object p2, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    .line 245
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-static {v0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    iput-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    .line 246
    return-void
.end method

.method public bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    .registers 6
    .param p1, "service"    # Landroid/content/Intent;
    .param p2, "conn"    # Landroid/content/ServiceConnection;
    .param p3, "flags"    # I

    .prologue
    .line 166
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/csdk/plugin/PluginManager;->bindService(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    return v0
.end method

.method public findView(I)Landroid/view/View;
    .registers 3
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 76
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public findViewById(I)Landroid/view/View;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 72
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public finish()V
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 228
    return-void
.end method

.method public getApplicationContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getAssets()Landroid/content/res/AssetManager;
    .registers 2

    .prologue
    .line 232
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    return-object v0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public getFragmentManager()Landroid/app/FragmentManager;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    return-object v0
.end method

.method public getIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getLayoutInflater()Landroid/view/LayoutInflater;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    return-object v0
.end method

.method public getMenuInflater()Landroid/view/MenuInflater;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "mode"    # I

    .prologue
    .line 106
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    return-object v0
.end method

.method public getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 126
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getWindow()Landroid/view/Window;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    return-object v0
.end method

.method public getWindowManager()Landroid/view/WindowManager;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    return-object v0
.end method

.method public isFinishing()Z
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->isFinishing()Z

    move-result v0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 286
    return-void
.end method

.method public onBackPressed()V
    .registers 1

    .prologue
    .line 251
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 271
    return-void
.end method

.method public onDestroy()V
    .registers 1

    .prologue
    .line 309
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 265
    const/4 v0, 0x0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 260
    const/4 v0, 0x0

    return v0
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 319
    return-void
.end method

.method public onPause()V
    .registers 1

    .prologue
    .line 299
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 4
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    .line 291
    return-void
.end method

.method public onRestart()V
    .registers 1

    .prologue
    .line 281
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 324
    return-void
.end method

.method public onResume()V
    .registers 1

    .prologue
    .line 295
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 314
    return-void
.end method

.method public onStart()V
    .registers 1

    .prologue
    .line 276
    return-void
.end method

.method public onStop()V
    .registers 1

    .prologue
    .line 304
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 255
    const/4 v0, 0x0

    return v0
.end method

.method public registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    .registers 4
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p2, "filter"    # Landroid/content/IntentFilter;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
    .registers 5
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p2, "filter"    # Landroid/content/IntentFilter;
    .param p3, "flags"    # I

    .prologue
    .line 207
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/FragmentActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;
    .registers 6
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p2, "filter"    # Landroid/content/IntentFilter;
    .param p3, "broadcastPermission"    # Ljava/lang/String;
    .param p4, "scheduler"    # Landroid/os/Handler;

    .prologue
    .line 212
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/app/FragmentActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;
    .registers 12
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p2, "filter"    # Landroid/content/IntentFilter;
    .param p3, "broadcastPermission"    # Ljava/lang/String;
    .param p4, "scheduler"    # Landroid/os/Handler;
    .param p5, "flags"    # I

    .prologue
    .line 217
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/app/FragmentActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public sendBroadcast(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 176
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/FragmentActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 177
    return-void
.end method

.method public sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "receiverPermission"    # Ljava/lang/String;

    .prologue
    .line 181
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 182
    return-void
.end method

.method public sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "user"    # Landroid/os/UserHandle;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 187
    return-void
.end method

.method public sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "user"    # Landroid/os/UserHandle;
    .param p3, "receiverPermission"    # Ljava/lang/String;

    .prologue
    .line 191
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/FragmentActivity;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 192
    return-void
.end method

.method public sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "receiverPermission"    # Ljava/lang/String;

    .prologue
    .line 196
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public setContentView(I)V
    .registers 3
    .param p1, "layoutResID"    # I

    .prologue
    .line 62
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/FragmentActivity;->setContentView(I)V

    .line 63
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/FragmentActivity;->setContentView(Landroid/view/View;)V

    .line 42
    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    return-void
.end method

.method public setRequestedOrientation(I)V
    .registers 3
    .param p1, "requestedOrientation"    # I

    .prologue
    .line 131
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/FragmentActivity;->setRequestedOrientation(I)V

    .line 132
    return-void
.end method

.method public startActivity(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, v1, p1}, Lcom/csdk/plugin/PluginManager;->startActivity(Landroid/content/Context;Landroid/content/Intent;)I

    .line 147
    return-void
.end method

.method public startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, v1, p1, p2}, Lcom/csdk/plugin/PluginManager;->startActivity(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)I

    .line 152
    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    .line 136
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, v1, p1, p2}, Lcom/csdk/plugin/PluginManager;->startActivityForResult(Landroid/content/Context;Landroid/content/Intent;I)I

    .line 137
    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .registers 6
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I
    .param p3, "options"    # Landroid/os/Bundle;

    .prologue
    .line 141
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/csdk/plugin/PluginManager;->startActivityForResult(Landroid/content/Context;Landroid/content/Intent;ILandroid/os/Bundle;)I

    .line 142
    return-void
.end method

.method public startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 4
    .param p1, "service"    # Landroid/content/Intent;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, v1, p1}, Lcom/csdk/plugin/PluginManager;->startService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method

.method public stopService(Landroid/content/Intent;)Z
    .registers 4
    .param p1, "name"    # Landroid/content/Intent;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, v1, p1}, Lcom/csdk/plugin/PluginManager;->stopService(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public unbindService(Landroid/content/ServiceConnection;)V
    .registers 4
    .param p1, "conn"    # Landroid/content/ServiceConnection;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, v1, p1}, Lcom/csdk/plugin/PluginManager;->unbindService(Landroid/content/Context;Landroid/content/ServiceConnection;)V

    .line 172
    return-void
.end method

.method public unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    .registers 3
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginFragmentActivity;->that:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/FragmentActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 223
    return-void
.end method
