.class public final Lcom/google/gson/internal/JavaVersion;
.super Ljava/lang/Object;
.source "JavaVersion.java"


# static fields
.field private static final majorJavaVersion:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    invoke-static {}, Lcom/google/gson/internal/JavaVersion;->determineMajorJavaVersion()I

    move-result v0

    sput v0, Lcom/google/gson/internal/JavaVersion;->majorJavaVersion:I

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static determineMajorJavaVersion()I
    .registers 2

    .prologue
    .line 29
    const-string v1, "java.version"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 30
    .local v0, "javaVersion":Ljava/lang/String;
    invoke-static {v0}, Lcom/google/gson/internal/JavaVersion;->getMajorJavaVersion(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method private static extractBeginningInt(Ljava/lang/String;)I
    .registers 6
    .param p0, "javaVersion"    # Ljava/lang/String;

    .prologue
    .line 62
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .local v3, "num":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_1c

    .line 64
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 65
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 66
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 71
    .end local v0    # "c":C
    :cond_1c
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_23
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_23} :catch_25

    move-result v4

    .line 73
    .end local v2    # "i":I
    .end local v3    # "num":Ljava/lang/StringBuilder;
    :goto_24
    return v4

    .line 72
    :catch_25
    move-exception v1

    .line 73
    .local v1, "e":Ljava/lang/NumberFormatException;
    const/4 v4, -0x1

    goto :goto_24
.end method

.method public static getMajorJavaVersion()I
    .registers 1

    .prologue
    .line 81
    sget v0, Lcom/google/gson/internal/JavaVersion;->majorJavaVersion:I

    return v0
.end method

.method static getMajorJavaVersion(Ljava/lang/String;)I
    .registers 3
    .param p0, "javaVersion"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 35
    invoke-static {p0}, Lcom/google/gson/internal/JavaVersion;->parseDotted(Ljava/lang/String;)I

    move-result v0

    .line 36
    .local v0, "version":I
    if-ne v0, v1, :cond_b

    .line 37
    invoke-static {p0}, Lcom/google/gson/internal/JavaVersion;->extractBeginningInt(Ljava/lang/String;)I

    move-result v0

    .line 39
    :cond_b
    if-ne v0, v1, :cond_e

    .line 40
    const/4 v0, 0x6

    .line 42
    .end local v0    # "version":I
    :cond_e
    return v0
.end method

.method public static isJava9OrLater()Z
    .registers 2

    .prologue
    .line 88
    sget v0, Lcom/google/gson/internal/JavaVersion;->majorJavaVersion:I

    const/16 v1, 0x9

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private static parseDotted(Ljava/lang/String;)I
    .registers 6
    .param p0, "javaVersion"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 48
    :try_start_1
    const-string v3, "[._]"

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 49
    .local v2, "parts":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v2, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 50
    .local v1, "firstVer":I
    if-ne v1, v4, :cond_1a

    array-length v3, v2

    if-le v3, v4, :cond_1a

    .line 51
    const/4 v3, 0x1

    aget-object v3, v2, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_19
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_19} :catch_1b

    move-result v1

    .line 56
    .end local v1    # "firstVer":I
    .end local v2    # "parts":[Ljava/lang/String;
    :cond_1a
    :goto_1a
    return v1

    .line 55
    :catch_1b
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/NumberFormatException;
    const/4 v1, -0x1

    goto :goto_1a
.end method
