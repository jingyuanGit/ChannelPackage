.class public final Lcom/google/gson/internal/Excluder;
.super Ljava/lang/Object;
.source "Excluder.java"

# interfaces
.implements Lcom/google/gson/TypeAdapterFactory;
.implements Ljava/lang/Cloneable;


# static fields
.field public static final DEFAULT:Lcom/google/gson/internal/Excluder;

.field private static final IGNORE_VERSIONS:D = -1.0


# instance fields
.field private deserializationStrategies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/gson/ExclusionStrategy;",
            ">;"
        }
    .end annotation
.end field

.field private modifiers:I

.field private requireExpose:Z

.field private serializationStrategies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/gson/ExclusionStrategy;",
            ">;"
        }
    .end annotation
.end field

.field private serializeInnerClasses:Z

.field private version:D


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 52
    new-instance v0, Lcom/google/gson/internal/Excluder;

    invoke-direct {v0}, Lcom/google/gson/internal/Excluder;-><init>()V

    sput-object v0, Lcom/google/gson/internal/Excluder;->DEFAULT:Lcom/google/gson/internal/Excluder;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/google/gson/internal/Excluder;->version:D

    .line 55
    const/16 v0, 0x88

    iput v0, p0, Lcom/google/gson/internal/Excluder;->modifiers:I

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/gson/internal/Excluder;->serializeInnerClasses:Z

    .line 58
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/gson/internal/Excluder;->serializationStrategies:Ljava/util/List;

    .line 59
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/gson/internal/Excluder;->deserializationStrategies:Ljava/util/List;

    return-void
.end method

.method private excludeClassChecks(Ljava/lang/Class;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    .line 194
    iget-wide v0, p0, Lcom/google/gson/internal/Excluder;->version:D

    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpl-double v0, v0, v4

    if-eqz v0, :cond_21

    const-class v0, Lcom/google/gson/annotations/Since;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/google/gson/annotations/Since;

    const-class v1, Lcom/google/gson/annotations/Until;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/google/gson/annotations/Until;

    invoke-direct {p0, v0, v1}, Lcom/google/gson/internal/Excluder;->isValidVersion(Lcom/google/gson/annotations/Since;Lcom/google/gson/annotations/Until;)Z

    move-result v0

    if-nez v0, :cond_21

    move v0, v2

    .line 206
    :goto_20
    return v0

    .line 198
    :cond_21
    iget-boolean v0, p0, Lcom/google/gson/internal/Excluder;->serializeInnerClasses:Z

    if-nez v0, :cond_2d

    invoke-direct {p0, p1}, Lcom/google/gson/internal/Excluder;->isInnerClass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2d

    move v0, v2

    .line 199
    goto :goto_20

    .line 202
    :cond_2d
    invoke-direct {p0, p1}, Lcom/google/gson/internal/Excluder;->isAnonymousOrLocal(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_35

    move v0, v2

    .line 203
    goto :goto_20

    .line 206
    :cond_35
    const/4 v0, 0x0

    goto :goto_20
.end method

.method private excludeClassInStrategy(Ljava/lang/Class;Z)Z
    .registers 7
    .param p2, "serialize"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)Z"
        }
    .end annotation

    .prologue
    .line 215
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p2, :cond_1c

    iget-object v1, p0, Lcom/google/gson/internal/Excluder;->serializationStrategies:Ljava/util/List;

    .line 216
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/google/gson/ExclusionStrategy;>;"
    :goto_4
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/ExclusionStrategy;

    .line 217
    .local v0, "exclusionStrategy":Lcom/google/gson/ExclusionStrategy;
    invoke-interface {v0, p1}, Lcom/google/gson/ExclusionStrategy;->shouldSkipClass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 218
    const/4 v2, 0x1

    .line 221
    .end local v0    # "exclusionStrategy":Lcom/google/gson/ExclusionStrategy;
    :goto_1b
    return v2

    .line 215
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/google/gson/ExclusionStrategy;>;"
    :cond_1c
    iget-object v1, p0, Lcom/google/gson/internal/Excluder;->deserializationStrategies:Ljava/util/List;

    goto :goto_4

    .line 221
    .restart local v1    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/google/gson/ExclusionStrategy;>;"
    :cond_1f
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method private isAnonymousOrLocal(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 225
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/lang/Enum;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 226
    invoke-virtual {p1}, Ljava/lang/Class;->isAnonymousClass()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p1}, Ljava/lang/Class;->isLocalClass()Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    .line 225
    :goto_15
    return v0

    .line 226
    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private isInnerClass(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 230
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->isMemberClass()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-direct {p0, p1}, Lcom/google/gson/internal/Excluder;->isStatic(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private isStatic(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 234
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private isValidSince(Lcom/google/gson/annotations/Since;)Z
    .registers 6
    .param p1, "annotation"    # Lcom/google/gson/annotations/Since;

    .prologue
    .line 242
    if-eqz p1, :cond_e

    .line 243
    invoke-interface {p1}, Lcom/google/gson/annotations/Since;->value()D

    move-result-wide v0

    .line 244
    .local v0, "annotationVersion":D
    iget-wide v2, p0, Lcom/google/gson/internal/Excluder;->version:D

    cmpl-double v2, v0, v2

    if-lez v2, :cond_e

    .line 245
    const/4 v2, 0x0

    .line 248
    .end local v0    # "annotationVersion":D
    :goto_d
    return v2

    :cond_e
    const/4 v2, 0x1

    goto :goto_d
.end method

.method private isValidUntil(Lcom/google/gson/annotations/Until;)Z
    .registers 6
    .param p1, "annotation"    # Lcom/google/gson/annotations/Until;

    .prologue
    .line 252
    if-eqz p1, :cond_e

    .line 253
    invoke-interface {p1}, Lcom/google/gson/annotations/Until;->value()D

    move-result-wide v0

    .line 254
    .local v0, "annotationVersion":D
    iget-wide v2, p0, Lcom/google/gson/internal/Excluder;->version:D

    cmpg-double v2, v0, v2

    if-gtz v2, :cond_e

    .line 255
    const/4 v2, 0x0

    .line 258
    .end local v0    # "annotationVersion":D
    :goto_d
    return v2

    :cond_e
    const/4 v2, 0x1

    goto :goto_d
.end method

.method private isValidVersion(Lcom/google/gson/annotations/Since;Lcom/google/gson/annotations/Until;)Z
    .registers 4
    .param p1, "since"    # Lcom/google/gson/annotations/Since;
    .param p2, "until"    # Lcom/google/gson/annotations/Until;

    .prologue
    .line 238
    invoke-direct {p0, p1}, Lcom/google/gson/internal/Excluder;->isValidSince(Lcom/google/gson/annotations/Since;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-direct {p0, p2}, Lcom/google/gson/internal/Excluder;->isValidUntil(Lcom/google/gson/annotations/Until;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method


# virtual methods
.method protected clone()Lcom/google/gson/internal/Excluder;
    .registers 3

    .prologue
    .line 63
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/gson/internal/Excluder;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_7

    return-object v1

    .line 64
    :catch_7
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method protected bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-virtual {p0}, Lcom/google/gson/internal/Excluder;->clone()Lcom/google/gson/internal/Excluder;

    move-result-object v0

    return-object v0
.end method

.method public create(Lcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;)Lcom/google/gson/TypeAdapter;
    .registers 11
    .param p1, "gson"    # Lcom/google/gson/Gson;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/Gson;",
            "Lcom/google/gson/reflect/TypeToken",
            "<TT;>;)",
            "Lcom/google/gson/TypeAdapter",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p2, "type":Lcom/google/gson/reflect/TypeToken;, "Lcom/google/gson/reflect/TypeToken<TT;>;"
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 112
    invoke-virtual {p2}, Lcom/google/gson/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v7

    .line 113
    .local v7, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, v7}, Lcom/google/gson/internal/Excluder;->excludeClassChecks(Ljava/lang/Class;)Z

    move-result v6

    .line 115
    .local v6, "excludeClass":Z
    if-nez v6, :cond_12

    invoke-direct {p0, v7, v0}, Lcom/google/gson/internal/Excluder;->excludeClassInStrategy(Ljava/lang/Class;Z)Z

    move-result v1

    if-eqz v1, :cond_22

    :cond_12
    move v3, v0

    .line 116
    .local v3, "skipSerialize":Z
    :goto_13
    if-nez v6, :cond_1b

    invoke-direct {p0, v7, v2}, Lcom/google/gson/internal/Excluder;->excludeClassInStrategy(Ljava/lang/Class;Z)Z

    move-result v1

    if-eqz v1, :cond_1c

    :cond_1b
    move v2, v0

    .line 118
    .local v2, "skipDeserialize":Z
    :cond_1c
    if-nez v3, :cond_24

    if-nez v2, :cond_24

    .line 119
    const/4 v0, 0x0

    .line 122
    :goto_21
    return-object v0

    .end local v2    # "skipDeserialize":Z
    .end local v3    # "skipSerialize":Z
    :cond_22
    move v3, v2

    .line 115
    goto :goto_13

    .line 122
    .restart local v2    # "skipDeserialize":Z
    .restart local v3    # "skipSerialize":Z
    :cond_24
    new-instance v0, Lcom/google/gson/internal/Excluder$1;

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/gson/internal/Excluder$1;-><init>(Lcom/google/gson/internal/Excluder;ZZLcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;)V

    goto :goto_21
.end method

.method public disableInnerClassSerialization()Lcom/google/gson/internal/Excluder;
    .registers 3

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/google/gson/internal/Excluder;->clone()Lcom/google/gson/internal/Excluder;

    move-result-object v0

    .line 86
    .local v0, "result":Lcom/google/gson/internal/Excluder;
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/google/gson/internal/Excluder;->serializeInnerClasses:Z

    .line 87
    return-object v0
.end method

.method public excludeClass(Ljava/lang/Class;Z)Z
    .registers 4
    .param p2, "serialize"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)Z"
        }
    .end annotation

    .prologue
    .line 210
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1}, Lcom/google/gson/internal/Excluder;->excludeClassChecks(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 211
    invoke-direct {p0, p1, p2}, Lcom/google/gson/internal/Excluder;->excludeClassInStrategy(Ljava/lang/Class;Z)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    .line 210
    :goto_d
    return v0

    .line 211
    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public excludeField(Ljava/lang/reflect/Field;Z)Z
    .registers 13
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "serialize"    # Z

    .prologue
    const/4 v6, 0x1

    .line 152
    iget v4, p0, Lcom/google/gson/internal/Excluder;->modifiers:I

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v5

    and-int/2addr v4, v5

    if-eqz v4, :cond_c

    move v4, v6

    .line 190
    :goto_b
    return v4

    .line 156
    :cond_c
    iget-wide v4, p0, Lcom/google/gson/internal/Excluder;->version:D

    const-wide/high16 v8, -0x4010000000000000L    # -1.0

    cmpl-double v4, v4, v8

    if-eqz v4, :cond_2c

    const-class v4, Lcom/google/gson/annotations/Since;

    .line 157
    invoke-virtual {p1, v4}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lcom/google/gson/annotations/Since;

    const-class v5, Lcom/google/gson/annotations/Until;

    invoke-virtual {p1, v5}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lcom/google/gson/annotations/Until;

    invoke-direct {p0, v4, v5}, Lcom/google/gson/internal/Excluder;->isValidVersion(Lcom/google/gson/annotations/Since;Lcom/google/gson/annotations/Until;)Z

    move-result v4

    if-nez v4, :cond_2c

    move v4, v6

    .line 158
    goto :goto_b

    .line 161
    :cond_2c
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->isSynthetic()Z

    move-result v4

    if-eqz v4, :cond_34

    move v4, v6

    .line 162
    goto :goto_b

    .line 165
    :cond_34
    iget-boolean v4, p0, Lcom/google/gson/internal/Excluder;->requireExpose:Z

    if-eqz v4, :cond_52

    .line 166
    const-class v4, Lcom/google/gson/annotations/Expose;

    invoke-virtual {p1, v4}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/google/gson/annotations/Expose;

    .line 167
    .local v0, "annotation":Lcom/google/gson/annotations/Expose;
    if-eqz v0, :cond_4a

    if-eqz p2, :cond_4c

    invoke-interface {v0}, Lcom/google/gson/annotations/Expose;->serialize()Z

    move-result v4

    if-nez v4, :cond_52

    :cond_4a
    move v4, v6

    .line 168
    goto :goto_b

    .line 167
    :cond_4c
    invoke-interface {v0}, Lcom/google/gson/annotations/Expose;->deserialize()Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 172
    .end local v0    # "annotation":Lcom/google/gson/annotations/Expose;
    :cond_52
    iget-boolean v4, p0, Lcom/google/gson/internal/Excluder;->serializeInnerClasses:Z

    if-nez v4, :cond_62

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/gson/internal/Excluder;->isInnerClass(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_62

    move v4, v6

    .line 173
    goto :goto_b

    .line 176
    :cond_62
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/gson/internal/Excluder;->isAnonymousOrLocal(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_6e

    move v4, v6

    .line 177
    goto :goto_b

    .line 180
    :cond_6e
    if-eqz p2, :cond_96

    iget-object v3, p0, Lcom/google/gson/internal/Excluder;->serializationStrategies:Ljava/util/List;

    .line 181
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/google/gson/ExclusionStrategy;>;"
    :goto_72
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_99

    .line 182
    new-instance v2, Lcom/google/gson/FieldAttributes;

    invoke-direct {v2, p1}, Lcom/google/gson/FieldAttributes;-><init>(Ljava/lang/reflect/Field;)V

    .line 183
    .local v2, "fieldAttributes":Lcom/google/gson/FieldAttributes;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_81
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_99

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/gson/ExclusionStrategy;

    .line 184
    .local v1, "exclusionStrategy":Lcom/google/gson/ExclusionStrategy;
    invoke-interface {v1, v2}, Lcom/google/gson/ExclusionStrategy;->shouldSkipField(Lcom/google/gson/FieldAttributes;)Z

    move-result v5

    if-eqz v5, :cond_81

    move v4, v6

    .line 185
    goto/16 :goto_b

    .line 180
    .end local v1    # "exclusionStrategy":Lcom/google/gson/ExclusionStrategy;
    .end local v2    # "fieldAttributes":Lcom/google/gson/FieldAttributes;
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/google/gson/ExclusionStrategy;>;"
    :cond_96
    iget-object v3, p0, Lcom/google/gson/internal/Excluder;->deserializationStrategies:Ljava/util/List;

    goto :goto_72

    .line 190
    .restart local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/google/gson/ExclusionStrategy;>;"
    :cond_99
    const/4 v4, 0x0

    goto/16 :goto_b
.end method

.method public excludeFieldsWithoutExposeAnnotation()Lcom/google/gson/internal/Excluder;
    .registers 3

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/google/gson/internal/Excluder;->clone()Lcom/google/gson/internal/Excluder;

    move-result-object v0

    .line 92
    .local v0, "result":Lcom/google/gson/internal/Excluder;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/google/gson/internal/Excluder;->requireExpose:Z

    .line 93
    return-object v0
.end method

.method public withExclusionStrategy(Lcom/google/gson/ExclusionStrategy;ZZ)Lcom/google/gson/internal/Excluder;
    .registers 7
    .param p1, "exclusionStrategy"    # Lcom/google/gson/ExclusionStrategy;
    .param p2, "serialization"    # Z
    .param p3, "deserialization"    # Z

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/google/gson/internal/Excluder;->clone()Lcom/google/gson/internal/Excluder;

    move-result-object v0

    .line 99
    .local v0, "result":Lcom/google/gson/internal/Excluder;
    if-eqz p2, :cond_14

    .line 100
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/gson/internal/Excluder;->serializationStrategies:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lcom/google/gson/internal/Excluder;->serializationStrategies:Ljava/util/List;

    .line 101
    iget-object v1, v0, Lcom/google/gson/internal/Excluder;->serializationStrategies:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    :cond_14
    if-eqz p3, :cond_24

    .line 104
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/gson/internal/Excluder;->deserializationStrategies:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lcom/google/gson/internal/Excluder;->deserializationStrategies:Ljava/util/List;

    .line 106
    iget-object v1, v0, Lcom/google/gson/internal/Excluder;->deserializationStrategies:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    :cond_24
    return-object v0
.end method

.method public varargs withModifiers([I)Lcom/google/gson/internal/Excluder;
    .registers 7
    .param p1, "modifiers"    # [I

    .prologue
    const/4 v2, 0x0

    .line 76
    invoke-virtual {p0}, Lcom/google/gson/internal/Excluder;->clone()Lcom/google/gson/internal/Excluder;

    move-result-object v1

    .line 77
    .local v1, "result":Lcom/google/gson/internal/Excluder;
    iput v2, v1, Lcom/google/gson/internal/Excluder;->modifiers:I

    .line 78
    array-length v3, p1

    :goto_8
    if-ge v2, v3, :cond_14

    aget v0, p1, v2

    .line 79
    .local v0, "modifier":I
    iget v4, v1, Lcom/google/gson/internal/Excluder;->modifiers:I

    or-int/2addr v4, v0

    iput v4, v1, Lcom/google/gson/internal/Excluder;->modifiers:I

    .line 78
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 81
    .end local v0    # "modifier":I
    :cond_14
    return-object v1
.end method

.method public withVersion(D)Lcom/google/gson/internal/Excluder;
    .registers 4
    .param p1, "ignoreVersionsAfter"    # D

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/google/gson/internal/Excluder;->clone()Lcom/google/gson/internal/Excluder;

    move-result-object v0

    .line 71
    .local v0, "result":Lcom/google/gson/internal/Excluder;
    iput-wide p1, v0, Lcom/google/gson/internal/Excluder;->version:D

    .line 72
    return-object v0
.end method
