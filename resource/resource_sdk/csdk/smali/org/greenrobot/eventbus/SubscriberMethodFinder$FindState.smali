.class Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;
.super Ljava/lang/Object;
.source "SubscriberMethodFinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/greenrobot/eventbus/SubscriberMethodFinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FindState"
.end annotation


# instance fields
.field final anyMethodByEventType:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field final methodKeyBuilder:Ljava/lang/StringBuilder;

.field skipSuperClasses:Z

.field subscriberClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field final subscriberClassByMethodKey:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field subscriberInfo:Lorg/greenrobot/eventbus/meta/SubscriberInfo;

.field final subscriberMethods:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/greenrobot/eventbus/SubscriberMethod;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberMethods:Ljava/util/List;

    .line 193
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->anyMethodByEventType:Ljava/util/Map;

    .line 194
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberClassByMethodKey:Ljava/util/Map;

    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->methodKeyBuilder:Ljava/lang/StringBuilder;

    return-void
.end method

.method private checkAddWithMethodSignature(Ljava/lang/reflect/Method;Ljava/lang/Class;)Z
    .registers 9
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p2, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    .line 239
    iget-object v4, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->methodKeyBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 240
    iget-object v4, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->methodKeyBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    iget-object v4, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->methodKeyBuilder:Ljava/lang/StringBuilder;

    const/16 v5, 0x3e

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    iget-object v4, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->methodKeyBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 244
    .local v2, "methodKey":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    .line 245
    .local v0, "methodClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v4, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberClassByMethodKey:Ljava/util/Map;

    invoke-interface {v4, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 246
    .local v1, "methodClassOld":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_38

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_3a

    .line 248
    :cond_38
    const/4 v3, 0x1

    .line 252
    :goto_39
    return v3

    .line 251
    :cond_3a
    iget-object v4, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberClassByMethodKey:Ljava/util/Map;

    invoke-interface {v4, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_39
.end method


# virtual methods
.method checkAdd(Ljava/lang/reflect/Method;Ljava/lang/Class;)Z
    .registers 5
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 222
    .local p2, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->anyMethodByEventType:Ljava/util/Map;

    invoke-interface {v1, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 223
    .local v0, "existing":Ljava/lang/Object;
    if-nez v0, :cond_a

    .line 224
    const/4 v1, 0x1

    .line 234
    .end local v0    # "existing":Ljava/lang/Object;
    :goto_9
    return v1

    .line 226
    .restart local v0    # "existing":Ljava/lang/Object;
    :cond_a
    instance-of v1, v0, Ljava/lang/reflect/Method;

    if-eqz v1, :cond_21

    .line 227
    check-cast v0, Ljava/lang/reflect/Method;

    .end local v0    # "existing":Ljava/lang/Object;
    invoke-direct {p0, v0, p2}, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->checkAddWithMethodSignature(Ljava/lang/reflect/Method;Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_1c

    .line 229
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 232
    :cond_1c
    iget-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->anyMethodByEventType:Ljava/util/Map;

    invoke-interface {v1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    :cond_21
    invoke-direct {p0, p1, p2}, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->checkAddWithMethodSignature(Ljava/lang/reflect/Method;Ljava/lang/Class;)Z

    move-result v1

    goto :goto_9
.end method

.method initForSubscriber(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 203
    .local p1, "subscriberClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iput-object p1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    iput-object p1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberClass:Ljava/lang/Class;

    .line 204
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->skipSuperClasses:Z

    .line 205
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberInfo:Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    .line 206
    return-void
.end method

.method moveToSuperclass()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 257
    iget-boolean v1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->skipSuperClasses:Z

    if-eqz v1, :cond_8

    .line 258
    iput-object v2, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    .line 267
    :cond_7
    :goto_7
    return-void

    .line 260
    :cond_8
    iget-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    .line 261
    iget-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 263
    .local v0, "clazzName":Ljava/lang/String;
    const-string v1, "java."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2e

    const-string v1, "javax."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2e

    const-string v1, "android."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 264
    :cond_2e
    iput-object v2, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    goto :goto_7
.end method

.method recycle()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 209
    iget-object v0, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberMethods:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 210
    iget-object v0, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->anyMethodByEventType:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 211
    iget-object v0, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberClassByMethodKey:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 212
    iget-object v0, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->methodKeyBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 213
    iput-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberClass:Ljava/lang/Class;

    .line 214
    iput-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    .line 215
    iput-boolean v2, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->skipSuperClasses:Z

    .line 216
    iput-object v1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberInfo:Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    .line 217
    return-void
.end method
