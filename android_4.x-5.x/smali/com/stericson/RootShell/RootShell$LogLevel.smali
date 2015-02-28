.class public final enum Lcom/stericson/RootShell/RootShell$LogLevel;
.super Ljava/lang/Enum;
.source "RootShell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootShell/RootShell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LogLevel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/stericson/RootShell/RootShell$LogLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/stericson/RootShell/RootShell$LogLevel;

.field public static final enum DEBUG:Lcom/stericson/RootShell/RootShell$LogLevel;

.field public static final enum ERROR:Lcom/stericson/RootShell/RootShell$LogLevel;

.field public static final enum VERBOSE:Lcom/stericson/RootShell/RootShell$LogLevel;

.field public static final enum WARN:Lcom/stericson/RootShell/RootShell$LogLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 68
    new-instance v0, Lcom/stericson/RootShell/RootShell$LogLevel;

    const-string v1, "VERBOSE"

    invoke-direct {v0, v1, v2}, Lcom/stericson/RootShell/RootShell$LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/stericson/RootShell/RootShell$LogLevel;->VERBOSE:Lcom/stericson/RootShell/RootShell$LogLevel;

    .line 69
    new-instance v0, Lcom/stericson/RootShell/RootShell$LogLevel;

    const-string v1, "ERROR"

    invoke-direct {v0, v1, v3}, Lcom/stericson/RootShell/RootShell$LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/stericson/RootShell/RootShell$LogLevel;->ERROR:Lcom/stericson/RootShell/RootShell$LogLevel;

    .line 70
    new-instance v0, Lcom/stericson/RootShell/RootShell$LogLevel;

    const-string v1, "DEBUG"

    invoke-direct {v0, v1, v4}, Lcom/stericson/RootShell/RootShell$LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/stericson/RootShell/RootShell$LogLevel;->DEBUG:Lcom/stericson/RootShell/RootShell$LogLevel;

    .line 71
    new-instance v0, Lcom/stericson/RootShell/RootShell$LogLevel;

    const-string v1, "WARN"

    invoke-direct {v0, v1, v5}, Lcom/stericson/RootShell/RootShell$LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/stericson/RootShell/RootShell$LogLevel;->WARN:Lcom/stericson/RootShell/RootShell$LogLevel;

    .line 67
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/stericson/RootShell/RootShell$LogLevel;

    sget-object v1, Lcom/stericson/RootShell/RootShell$LogLevel;->VERBOSE:Lcom/stericson/RootShell/RootShell$LogLevel;

    aput-object v1, v0, v2

    sget-object v1, Lcom/stericson/RootShell/RootShell$LogLevel;->ERROR:Lcom/stericson/RootShell/RootShell$LogLevel;

    aput-object v1, v0, v3

    sget-object v1, Lcom/stericson/RootShell/RootShell$LogLevel;->DEBUG:Lcom/stericson/RootShell/RootShell$LogLevel;

    aput-object v1, v0, v4

    sget-object v1, Lcom/stericson/RootShell/RootShell$LogLevel;->WARN:Lcom/stericson/RootShell/RootShell$LogLevel;

    aput-object v1, v0, v5

    sput-object v0, Lcom/stericson/RootShell/RootShell$LogLevel;->$VALUES:[Lcom/stericson/RootShell/RootShell$LogLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/stericson/RootShell/RootShell$LogLevel;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 67
    const-class v0, Lcom/stericson/RootShell/RootShell$LogLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/stericson/RootShell/RootShell$LogLevel;

    return-object v0
.end method

.method public static values()[Lcom/stericson/RootShell/RootShell$LogLevel;
    .locals 1

    .prologue
    .line 67
    sget-object v0, Lcom/stericson/RootShell/RootShell$LogLevel;->$VALUES:[Lcom/stericson/RootShell/RootShell$LogLevel;

    invoke-virtual {v0}, [Lcom/stericson/RootShell/RootShell$LogLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/stericson/RootShell/RootShell$LogLevel;

    return-object v0
.end method
