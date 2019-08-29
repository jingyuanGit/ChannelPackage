.class public Lcom/csdk/plugin/activity/PluginActivity;
.super Landroid/app/Activity;
.source "PluginActivity.java"

# interfaces
.implements Lcom/csdk/plugin/activity/IPluginActivity;


# instance fields
.field protected mPluginManager:Lcom/csdk/plugin/PluginManager;

.field protected mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

.field protected that:Landroid/app/Activity;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    return-void
.end method

.method public attach(Landroid/app/Activity;Lcom/csdk/plugin/other/PluginPackage;)V
    .registers 4
    .param p1, "proxyActivity"    # Landroid/app/Activity;
    .param p2, "pluginPackage"    # Lcom/csdk/plugin/other/PluginPackage;

    .prologue
    .line 229
    iput-object p1, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    .line 230
    iput-object p2, p0, Lcom/csdk/plugin/activity/PluginActivity;->mPluginPackage:Lcom/csdk/plugin/other/PluginPackage;

    .line 231
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-static {v0}, Lcom/csdk/plugin/PluginManager;->getInstance(Landroid/content/Context;)Lcom/csdk/plugin/PluginManager;

    move-result-object v0

    iput-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    .line 232
    return-void
.end method

.method public bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    .registers 6
    .param p1, "service"    # Landroid/content/Intent;
    .param p2, "conn"    # Landroid/content/ServiceConnection;
    .param p3, "flags"    # I

    .prologue
    .line 152
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

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
    .line 62
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public findViewById(I)Landroid/view/View;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 58
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public finish()V
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 214
    return-void
.end method

.method public getApplicationContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getAssets()Landroid/content/res/AssetManager;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    return-object v0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public getIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getLayoutInflater()Landroid/view/LayoutInflater;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    return-object v0
.end method

.method public getMenuInflater()Landroid/view/MenuInflater;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "mode"    # I

    .prologue
    .line 92
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getWindow()Landroid/view/Window;
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    return-object v0
.end method

.method public getWindowManager()Landroid/view/WindowManager;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    return-object v0
.end method

.method public isFinishing()Z
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 271
    return-void
.end method

.method public onBackPressed()V
    .registers 1

    .prologue
    .line 237
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 257
    return-void
.end method

.method public onDestroy()V
    .registers 1

    .prologue
    .line 289
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 251
    const/4 v0, 0x0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 246
    const/4 v0, 0x0

    return v0
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 299
    return-void
.end method

.method public onPause()V
    .registers 1

    .prologue
    .line 279
    return-void
.end method

.method public onRestart()V
    .registers 1

    .prologue
    .line 266
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 304
    return-void
.end method

.method public onResume()V
    .registers 1

    .prologue
    .line 275
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 294
    return-void
.end method

.method public onStart()V
    .registers 1

    .prologue
    .line 262
    return-void
.end method

.method public onStop()V
    .registers 1

    .prologue
    .line 284
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 241
    const/4 v0, 0x0

    return v0
.end method

.method public registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    .registers 4
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p2, "filter"    # Landroid/content/IntentFilter;

    .prologue
    .line 188
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
    .registers 5
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p2, "filter"    # Landroid/content/IntentFilter;
    .param p3, "flags"    # I

    .prologue
    .line 193
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2, p3}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

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
    .line 198
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

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
    .line 203
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public sendBroadcast(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 163
    return-void
.end method

.method public sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "receiverPermission"    # Ljava/lang/String;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 168
    return-void
.end method

.method public sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "user"    # Landroid/os/UserHandle;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 173
    return-void
.end method

.method public sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "user"    # Landroid/os/UserHandle;
    .param p3, "receiverPermission"    # Ljava/lang/String;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2, p3}, Landroid/app/Activity;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 178
    return-void
.end method

.method public sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "receiverPermission"    # Ljava/lang/String;

    .prologue
    .line 182
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 183
    return-void
.end method

.method public setContentView(I)V
    .registers 3
    .param p1, "layoutResID"    # I

    .prologue
    .line 48
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->setContentView(I)V

    .line 49
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 39
    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    return-void
.end method

.method public setRequestedOrientation(I)V
    .registers 3
    .param p1, "requestedOrientation"    # I

    .prologue
    .line 117
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 118
    return-void
.end method

.method public startActivity(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 132
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1}, Lcom/csdk/plugin/PluginManager;->startActivity(Landroid/content/Context;Landroid/content/Intent;)I

    .line 133
    return-void
.end method

.method public startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1, p2}, Lcom/csdk/plugin/PluginManager;->startActivity(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)I

    .line 138
    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    .line 122
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1, p2}, Lcom/csdk/plugin/PluginManager;->startActivityForResult(Landroid/content/Context;Landroid/content/Intent;I)I

    .line 123
    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .registers 6
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I
    .param p3, "options"    # Landroid/os/Bundle;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/csdk/plugin/PluginManager;->startActivityForResult(Landroid/content/Context;Landroid/content/Intent;ILandroid/os/Bundle;)I

    .line 128
    return-void
.end method

.method public startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 4
    .param p1, "service"    # Landroid/content/Intent;

    .prologue
    .line 142
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1}, Lcom/csdk/plugin/PluginManager;->startService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method

.method public stopService(Landroid/content/Intent;)Z
    .registers 4
    .param p1, "name"    # Landroid/content/Intent;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1}, Lcom/csdk/plugin/PluginManager;->stopService(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public unbindService(Landroid/content/ServiceConnection;)V
    .registers 4
    .param p1, "conn"    # Landroid/content/ServiceConnection;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->mPluginManager:Lcom/csdk/plugin/PluginManager;

    iget-object v1, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1}, Lcom/csdk/plugin/PluginManager;->unbindService(Landroid/content/Context;Landroid/content/ServiceConnection;)V

    .line 158
    return-void
.end method

.method public unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    .registers 3
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;

    .prologue
    .line 208
    iget-object v0, p0, Lcom/csdk/plugin/activity/PluginActivity;->that:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 209
    return-void
.end method
