.class final enum Lcom/stericson/RootShell/containers/RootClass$READ_STATE;
.super Ljava/lang/Enum;
.source "RootClass.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootShell/containers/RootClass;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "READ_STATE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/stericson/RootShell/containers/RootClass$READ_STATE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

.field public static final enum FOUND_ANNOTATION:Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

.field public static final enum STARTING:Lcom/stericson/RootShell/containers/RootClass$READ_STATE;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 33
    new-instance v0, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    const-string v1, "STARTING"

    invoke-direct {v0, v1, v2}, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;->STARTING:Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    new-instance v0, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    const-string v1, "FOUND_ANNOTATION"

    invoke-direct {v0, v1, v3}, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;->FOUND_ANNOTATION:Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    .line 32
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    sget-object v1, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;->STARTING:Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;->FOUND_ANNOTATION:Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    aput-object v1, v0, v3

    sput-object v0, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;->$VALUES:[Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

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
    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/stericson/RootShell/containers/RootClass$READ_STATE;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    const-class v0, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    return-object v0
.end method

.method public static values()[Lcom/stericson/RootShell/containers/RootClass$READ_STATE;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/stericson/RootShell/containers/RootClass$READ_STATE;->$VALUES:[Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    invoke-virtual {v0}, [Lcom/stericson/RootShell/containers/RootClass$READ_STATE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/stericson/RootShell/containers/RootClass$READ_STATE;

    return-object v0
.end method
