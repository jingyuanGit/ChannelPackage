.class Lorg/greenrobot/eventbus/SubscriberMethodFinder;
.super Ljava/lang/Object;
.source "SubscriberMethodFinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;
    }
.end annotation


# static fields
.field private static final BRIDGE:I = 0x40

.field private static final FIND_STATE_POOL:[Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

.field private static final METHOD_CACHE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/List",
            "<",
            "Lorg/greenrobot/eventbus/SubscriberMethod;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final MODIFIERS_IGNORE:I = 0x1448

.field private static final POOL_SIZE:I = 0x4

.field private static final SYNTHETIC:I = 0x1000


# instance fields
.field private final ignoreGeneratedIndex:Z

.field private final strictMethodVerification:Z

.field private subscriberInfoIndexes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/greenrobot/eventbus/meta/SubscriberInfoIndex;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->METHOD_CACHE:Ljava/util/Map;

    .line 46
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    sput-object v0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->FIND_STATE_POOL:[Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    return-void
.end method

.method constructor <init>(Ljava/util/List;ZZ)V
    .registers 4
    .param p2, "strictMethodVerification"    # Z
    .param p3, "ignoreGeneratedIndex"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/greenrobot/eventbus/meta/SubscriberInfoIndex;",
            ">;ZZ)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p1, "subscriberInfoIndexes":Ljava/util/List;, "Ljava/util/List<Lorg/greenrobot/eventbus/meta/SubscriberInfoIndex;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->subscriberInfoIndexes:Ljava/util/List;

    .line 51
    iput-boolean p2, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->strictMethodVerification:Z

    .line 52
    iput-boolean p3, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->ignoreGeneratedIndex:Z

    .line 53
    return-void
.end method

.method static clearCaches()V
    .registers 1

    .prologue
    .line 188
    sget-object v0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->METHOD_CACHE:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 189
    return-void
.end method

.method private findUsingInfo(Ljava/lang/Class;)Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/List",
            "<",
            "Lorg/greenrobot/eventbus/SubscriberMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 76
    .local p1, "subscriberClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->prepareFindState()Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    move-result-object v1

    .line 77
    .local v1, "findState":Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;
    invoke-virtual {v1, p1}, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->initForSubscriber(Ljava/lang/Class;)V

    .line 78
    :goto_7
    iget-object v3, v1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    if-eqz v3, :cond_3a

    .line 79
    invoke-direct {p0, v1}, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->getSubscriberInfo(Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;)Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    move-result-object v3

    iput-object v3, v1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberInfo:Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    .line 80
    iget-object v3, v1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberInfo:Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    if-eqz v3, :cond_33

    .line 81
    iget-object v3, v1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberInfo:Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    invoke-interface {v3}, Lorg/greenrobot/eventbus/meta/SubscriberInfo;->getSubscriberMethods()[Lorg/greenrobot/eventbus/SubscriberMethod;

    move-result-object v0

    .line 82
    .local v0, "array":[Lorg/greenrobot/eventbus/SubscriberMethod;
    array-length v4, v0

    const/4 v3, 0x0

    :goto_1d
    if-ge v3, v4, :cond_36

    aget-object v2, v0, v3

    .line 83
    .local v2, "subscriberMethod":Lorg/greenrobot/eventbus/SubscriberMethod;
    iget-object v5, v2, Lorg/greenrobot/eventbus/SubscriberMethod;->method:Ljava/lang/reflect/Method;

    iget-object v6, v2, Lorg/greenrobot/eventbus/SubscriberMethod;->eventType:Ljava/lang/Class;

    invoke-virtual {v1, v5, v6}, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->checkAdd(Ljava/lang/reflect/Method;Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_30

    .line 84
    iget-object v5, v1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberMethods:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_30
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 88
    .end local v0    # "array":[Lorg/greenrobot/eventbus/SubscriberMethod;
    .end local v2    # "subscriberMethod":Lorg/greenrobot/eventbus/SubscriberMethod;
    :cond_33
    invoke-direct {p0, v1}, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->findUsingReflectionInSingleClass(Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;)V

    .line 90
    :cond_36
    invoke-virtual {v1}, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->moveToSuperclass()V

    goto :goto_7

    .line 92
    :cond_3a
    invoke-direct {p0, v1}, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->getMethodsAndRelease(Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;)Ljava/util/List;

    move-result-object v3

    return-object v3
.end method

.method private findUsingReflection(Ljava/lang/Class;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/List",
            "<",
            "Lorg/greenrobot/eventbus/SubscriberMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    .local p1, "subscriberClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->prepareFindState()Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    move-result-object v0

    .line 142
    .local v0, "findState":Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;
    invoke-virtual {v0, p1}, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->initForSubscriber(Ljava/lang/Class;)V

    .line 143
    :goto_7
    iget-object v1, v0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    if-eqz v1, :cond_12

    .line 144
    invoke-direct {p0, v0}, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->findUsingReflectionInSingleClass(Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;)V

    .line 145
    invoke-virtual {v0}, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->moveToSuperclass()V

    goto :goto_7

    .line 147
    :cond_12
    invoke-direct {p0, v0}, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->getMethodsAndRelease(Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method private findUsingReflectionInSingleClass(Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;)V
    .registers 18
    .param p1, "findState"    # Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    .prologue
    .line 154
    :try_start_0
    move-object/from16 v0, p1

    iget-object v1, v0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_7} :catch_54

    move-result-object v8

    .line 160
    .local v8, "methods":[Ljava/lang/reflect/Method;
    :goto_8
    array-length v14, v8

    const/4 v1, 0x0

    move v13, v1

    :goto_b
    if-ge v13, v14, :cond_102

    aget-object v2, v8, v13

    .line 161
    .local v2, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v9

    .line 162
    .local v9, "modifiers":I
    and-int/lit8 v1, v9, 0x1

    if-eqz v1, :cond_b8

    and-int/lit16 v1, v9, 0x1448

    if-nez v1, :cond_b8

    .line 163
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v10

    .line 164
    .local v10, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v1, v10

    const/4 v5, 0x1

    if-ne v1, v5, :cond_63

    .line 165
    const-class v1, Lorg/greenrobot/eventbus/Subscribe;

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v11

    check-cast v11, Lorg/greenrobot/eventbus/Subscribe;

    .line 166
    .local v11, "subscribeAnnotation":Lorg/greenrobot/eventbus/Subscribe;
    if-eqz v11, :cond_50

    .line 167
    const/4 v1, 0x0

    aget-object v3, v10, v1

    .line 168
    .local v3, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->checkAdd(Ljava/lang/reflect/Method;Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_50

    .line 169
    invoke-interface {v11}, Lorg/greenrobot/eventbus/Subscribe;->threadMode()Lorg/greenrobot/eventbus/ThreadMode;

    move-result-object v4

    .line 170
    .local v4, "threadMode":Lorg/greenrobot/eventbus/ThreadMode;
    move-object/from16 v0, p1

    iget-object v15, v0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberMethods:Ljava/util/List;

    new-instance v1, Lorg/greenrobot/eventbus/SubscriberMethod;

    .line 171
    invoke-interface {v11}, Lorg/greenrobot/eventbus/Subscribe;->priority()I

    move-result v5

    invoke-interface {v11}, Lorg/greenrobot/eventbus/Subscribe;->sticky()Z

    move-result v6

    invoke-direct/range {v1 .. v6}, Lorg/greenrobot/eventbus/SubscriberMethod;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Class;Lorg/greenrobot/eventbus/ThreadMode;IZ)V

    .line 170
    invoke-interface {v15, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    .end local v3    # "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "threadMode":Lorg/greenrobot/eventbus/ThreadMode;
    .end local v10    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v11    # "subscribeAnnotation":Lorg/greenrobot/eventbus/Subscribe;
    :cond_50
    add-int/lit8 v1, v13, 0x1

    move v13, v1

    goto :goto_b

    .line 155
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v8    # "methods":[Ljava/lang/reflect/Method;
    .end local v9    # "modifiers":I
    :catch_54
    move-exception v12

    .line 157
    .local v12, "th":Ljava/lang/Throwable;
    move-object/from16 v0, p1

    iget-object v1, v0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v8

    .line 158
    .restart local v8    # "methods":[Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    move-object/from16 v0, p1

    iput-boolean v1, v0, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->skipSuperClasses:Z

    goto :goto_8

    .line 174
    .end local v12    # "th":Ljava/lang/Throwable;
    .restart local v2    # "method":Ljava/lang/reflect/Method;
    .restart local v9    # "modifiers":I
    .restart local v10    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_63
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->strictMethodVerification:Z

    if-eqz v1, :cond_50

    const-class v1, Lorg/greenrobot/eventbus/Subscribe;

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_50

    .line 175
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "."

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 176
    .local v7, "methodName":Ljava/lang/String;
    new-instance v1, Lorg/greenrobot/eventbus/EventBusException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "@Subscribe method "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "must have exactly 1 parameter but has "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    array-length v6, v10

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Lorg/greenrobot/eventbus/EventBusException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 179
    .end local v7    # "methodName":Ljava/lang/String;
    .end local v10    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_b8
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->strictMethodVerification:Z

    if-eqz v1, :cond_50

    const-class v1, Lorg/greenrobot/eventbus/Subscribe;

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_50

    .line 180
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "."

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 181
    .restart local v7    # "methodName":Ljava/lang/String;
    new-instance v1, Lorg/greenrobot/eventbus/EventBusException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is a illegal @Subscribe method: must be public, non-static, and non-abstract"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Lorg/greenrobot/eventbus/EventBusException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 185
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v7    # "methodName":Ljava/lang/String;
    .end local v9    # "modifiers":I
    :cond_102
    return-void
.end method

.method private getMethodsAndRelease(Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;)Ljava/util/List;
    .registers 6
    .param p1, "findState"    # Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/greenrobot/eventbus/SubscriberMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberMethods:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 97
    .local v1, "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lorg/greenrobot/eventbus/SubscriberMethod;>;"
    invoke-virtual {p1}, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->recycle()V

    .line 98
    sget-object v3, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->FIND_STATE_POOL:[Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    monitor-enter v3

    .line 99
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    const/4 v2, 0x4

    if-ge v0, v2, :cond_1b

    .line 100
    :try_start_11
    sget-object v2, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->FIND_STATE_POOL:[Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    aget-object v2, v2, v0

    if-nez v2, :cond_1d

    .line 101
    sget-object v2, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->FIND_STATE_POOL:[Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    aput-object p1, v2, v0

    .line 105
    :cond_1b
    monitor-exit v3

    .line 106
    return-object v1

    .line 99
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 105
    :catchall_20
    move-exception v2

    monitor-exit v3
    :try_end_22
    .catchall {:try_start_11 .. :try_end_22} :catchall_20

    throw v2
.end method

.method private getSubscriberInfo(Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;)Lorg/greenrobot/eventbus/meta/SubscriberInfo;
    .registers 7
    .param p1, "findState"    # Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    .prologue
    .line 123
    iget-object v3, p1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberInfo:Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    if-eqz v3, :cond_1b

    iget-object v3, p1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberInfo:Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    invoke-interface {v3}, Lorg/greenrobot/eventbus/meta/SubscriberInfo;->getSuperSubscriberInfo()Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    move-result-object v3

    if-eqz v3, :cond_1b

    .line 124
    iget-object v3, p1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->subscriberInfo:Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    invoke-interface {v3}, Lorg/greenrobot/eventbus/meta/SubscriberInfo;->getSuperSubscriberInfo()Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    move-result-object v2

    .line 125
    .local v2, "superclassInfo":Lorg/greenrobot/eventbus/meta/SubscriberInfo;
    iget-object v3, p1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    invoke-interface {v2}, Lorg/greenrobot/eventbus/meta/SubscriberInfo;->getSubscriberClass()Ljava/lang/Class;

    move-result-object v4

    if-ne v3, v4, :cond_1b

    .line 137
    .end local v2    # "superclassInfo":Lorg/greenrobot/eventbus/meta/SubscriberInfo;
    :goto_1a
    return-object v2

    .line 129
    :cond_1b
    iget-object v3, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->subscriberInfoIndexes:Ljava/util/List;

    if-eqz v3, :cond_3b

    .line 130
    iget-object v3, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->subscriberInfoIndexes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_25
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/greenrobot/eventbus/meta/SubscriberInfoIndex;

    .line 131
    .local v0, "index":Lorg/greenrobot/eventbus/meta/SubscriberInfoIndex;
    iget-object v4, p1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;->clazz:Ljava/lang/Class;

    invoke-interface {v0, v4}, Lorg/greenrobot/eventbus/meta/SubscriberInfoIndex;->getSubscriberInfo(Ljava/lang/Class;)Lorg/greenrobot/eventbus/meta/SubscriberInfo;

    move-result-object v1

    .line 132
    .local v1, "info":Lorg/greenrobot/eventbus/meta/SubscriberInfo;
    if-eqz v1, :cond_25

    move-object v2, v1

    .line 133
    goto :goto_1a

    .line 137
    .end local v0    # "index":Lorg/greenrobot/eventbus/meta/SubscriberInfoIndex;
    .end local v1    # "info":Lorg/greenrobot/eventbus/meta/SubscriberInfo;
    :cond_3b
    const/4 v2, 0x0

    goto :goto_1a
.end method

.method private prepareFindState()Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;
    .registers 6

    .prologue
    .line 110
    sget-object v3, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->FIND_STATE_POOL:[Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    monitor-enter v3

    .line 111
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    const/4 v2, 0x4

    if-ge v0, v2, :cond_17

    .line 112
    :try_start_7
    sget-object v2, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->FIND_STATE_POOL:[Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    aget-object v1, v2, v0

    .line 113
    .local v1, "state":Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;
    if-eqz v1, :cond_14

    .line 114
    sget-object v2, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->FIND_STATE_POOL:[Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    const/4 v4, 0x0

    aput-object v4, v2, v0

    .line 115
    monitor-exit v3

    .line 119
    .end local v1    # "state":Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;
    :goto_13
    return-object v1

    .line 111
    .restart local v1    # "state":Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 118
    .end local v1    # "state":Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;
    :cond_17
    monitor-exit v3
    :try_end_18
    .catchall {:try_start_7 .. :try_end_18} :catchall_1e

    .line 119
    new-instance v1, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;

    invoke-direct {v1}, Lorg/greenrobot/eventbus/SubscriberMethodFinder$FindState;-><init>()V

    goto :goto_13

    .line 118
    :catchall_1e
    move-exception v2

    :try_start_1f
    monitor-exit v3
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_1e

    throw v2
.end method


# virtual methods
.method findSubscriberMethods(Ljava/lang/Class;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/List",
            "<",
            "Lorg/greenrobot/eventbus/SubscriberMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "subscriberClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->METHOD_CACHE:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 57
    .local v0, "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lorg/greenrobot/eventbus/SubscriberMethod;>;"
    if-eqz v0, :cond_c

    move-object v1, v0

    .line 71
    .end local v0    # "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lorg/greenrobot/eventbus/SubscriberMethod;>;"
    .local v1, "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lorg/greenrobot/eventbus/SubscriberMethod;>;"
    :goto_b
    return-object v1

    .line 61
    .end local v1    # "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lorg/greenrobot/eventbus/SubscriberMethod;>;"
    .restart local v0    # "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lorg/greenrobot/eventbus/SubscriberMethod;>;"
    :cond_c
    iget-boolean v2, p0, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->ignoreGeneratedIndex:Z

    if-eqz v2, :cond_39

    .line 62
    invoke-direct {p0, p1}, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->findUsingReflection(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 66
    :goto_14
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 67
    new-instance v2, Lorg/greenrobot/eventbus/EventBusException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Subscriber "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " and its super classes have no public methods with the @Subscribe annotation"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/greenrobot/eventbus/EventBusException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 64
    :cond_39
    invoke-direct {p0, p1}, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->findUsingInfo(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    goto :goto_14

    .line 70
    :cond_3e
    sget-object v2, Lorg/greenrobot/eventbus/SubscriberMethodFinder;->METHOD_CACHE:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 71
    .end local v0    # "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lorg/greenrobot/eventbus/SubscriberMethod;>;"
    .restart local v1    # "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lorg/greenrobot/eventbus/SubscriberMethod;>;"
    goto :goto_b
.end method
