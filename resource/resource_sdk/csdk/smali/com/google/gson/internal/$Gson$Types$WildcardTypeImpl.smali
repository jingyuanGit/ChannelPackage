.class final Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;
.super Ljava/lang/Object;
.source "$Gson$Types.java"

# interfaces
.implements Ljava/lang/reflect/WildcardType;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/gson/internal/$Gson$Types;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "WildcardTypeImpl"
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final lowerBound:Ljava/lang/reflect/Type;

.field private final upperBound:Ljava/lang/reflect/Type;


# direct methods
.method public constructor <init>([Ljava/lang/reflect/Type;[Ljava/lang/reflect/Type;)V
    .registers 7
    .param p1, "upperBounds"    # [Ljava/lang/reflect/Type;
    .param p2, "lowerBounds"    # [Ljava/lang/reflect/Type;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 560
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 561
    array-length v0, p2

    if-gt v0, v1, :cond_36

    move v0, v1

    :goto_9
    invoke-static {v0}, Lcom/google/gson/internal/$Gson$Preconditions;->checkArgument(Z)V

    .line 562
    array-length v0, p1

    if-ne v0, v1, :cond_38

    move v0, v1

    :goto_10
    invoke-static {v0}, Lcom/google/gson/internal/$Gson$Preconditions;->checkArgument(Z)V

    .line 564
    array-length v0, p2

    if-ne v0, v1, :cond_3c

    .line 565
    aget-object v0, p2, v2

    invoke-static {v0}, Lcom/google/gson/internal/$Gson$Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 566
    aget-object v0, p2, v2

    invoke-static {v0}, Lcom/google/gson/internal/$Gson$Types;->checkNotPrimitive(Ljava/lang/reflect/Type;)V

    .line 567
    aget-object v0, p1, v2

    const-class v3, Ljava/lang/Object;

    if-ne v0, v3, :cond_3a

    :goto_26
    invoke-static {v1}, Lcom/google/gson/internal/$Gson$Preconditions;->checkArgument(Z)V

    .line 568
    aget-object v0, p2, v2

    invoke-static {v0}, Lcom/google/gson/internal/$Gson$Types;->canonicalize(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    iput-object v0, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->lowerBound:Ljava/lang/reflect/Type;

    .line 569
    const-class v0, Ljava/lang/Object;

    iput-object v0, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->upperBound:Ljava/lang/reflect/Type;

    .line 577
    :goto_35
    return-void

    :cond_36
    move v0, v2

    .line 561
    goto :goto_9

    :cond_38
    move v0, v2

    .line 562
    goto :goto_10

    :cond_3a
    move v1, v2

    .line 567
    goto :goto_26

    .line 572
    :cond_3c
    aget-object v0, p1, v2

    invoke-static {v0}, Lcom/google/gson/internal/$Gson$Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    aget-object v0, p1, v2

    invoke-static {v0}, Lcom/google/gson/internal/$Gson$Types;->checkNotPrimitive(Ljava/lang/reflect/Type;)V

    .line 574
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->lowerBound:Ljava/lang/reflect/Type;

    .line 575
    aget-object v0, p1, v2

    invoke-static {v0}, Lcom/google/gson/internal/$Gson$Types;->canonicalize(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    iput-object v0, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->upperBound:Ljava/lang/reflect/Type;

    goto :goto_35
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 588
    instance-of v0, p1, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_e

    check-cast p1, Ljava/lang/reflect/WildcardType;

    .line 589
    .end local p1    # "other":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/google/gson/internal/$Gson$Types;->equals(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    .line 588
    :goto_d
    return v0

    .line 589
    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public getLowerBounds()[Ljava/lang/reflect/Type;
    .registers 4

    .prologue
    .line 584
    iget-object v0, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->lowerBound:Ljava/lang/reflect/Type;

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/reflect/Type;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->lowerBound:Ljava/lang/reflect/Type;

    aput-object v2, v0, v1

    :goto_c
    return-object v0

    :cond_d
    sget-object v0, Lcom/google/gson/internal/$Gson$Types;->EMPTY_TYPE_ARRAY:[Ljava/lang/reflect/Type;

    goto :goto_c
.end method

.method public getUpperBounds()[Ljava/lang/reflect/Type;
    .registers 4

    .prologue
    .line 580
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/reflect/Type;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->upperBound:Ljava/lang/reflect/Type;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 594
    iget-object v0, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->lowerBound:Ljava/lang/reflect/Type;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->lowerBound:Ljava/lang/reflect/Type;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/lit8 v0, v0, 0x1f

    :goto_c
    iget-object v1, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->upperBound:Ljava/lang/reflect/Type;

    .line 595
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/lit8 v1, v1, 0x1f

    xor-int/2addr v0, v1

    .line 594
    return v0

    :cond_16
    const/4 v0, 0x1

    goto :goto_c
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 599
    iget-object v0, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->lowerBound:Ljava/lang/reflect/Type;

    if-eqz v0, :cond_1e

    .line 600
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "? super "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->lowerBound:Ljava/lang/reflect/Type;

    invoke-static {v1}, Lcom/google/gson/internal/$Gson$Types;->typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 604
    :goto_1d
    return-object v0

    .line 601
    :cond_1e
    iget-object v0, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->upperBound:Ljava/lang/reflect/Type;

    const-class v1, Ljava/lang/Object;

    if-ne v0, v1, :cond_27

    .line 602
    const-string v0, "?"

    goto :goto_1d

    .line 604
    :cond_27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "? extends "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/gson/internal/$Gson$Types$WildcardTypeImpl;->upperBound:Ljava/lang/reflect/Type;

    invoke-static {v1}, Lcom/google/gson/internal/$Gson$Types;->typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1d
.end method
