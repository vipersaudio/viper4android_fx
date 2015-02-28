.class public Lcom/stericson/RootTools/internal/InternalVariables;
.super Ljava/lang/Object;
.source "InternalVariables.java"


# static fields
.field protected static final PS_REGEX:Ljava/lang/String; = "^\\S+\\s+([0-9]+).*$"

.field protected static busyboxVersion:Ljava/lang/String;

.field protected static found:Z

.field protected static getSpaceFor:Ljava/lang/String;

.field protected static inode:Ljava/lang/String;

.field protected static mounts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/stericson/RootTools/containers/Mount;",
            ">;"
        }
    .end annotation
.end field

.field protected static nativeToolsReady:Z

.field protected static permissions:Lcom/stericson/RootTools/containers/Permissions;

.field protected static pid_list:Ljava/lang/String;

.field protected static processRunning:Z

.field protected static psPattern:Ljava/util/regex/Pattern;

.field protected static space:[Ljava/lang/String;

.field protected static symlinks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/stericson/RootTools/containers/Symlink;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 42
    sput-boolean v0, Lcom/stericson/RootTools/internal/InternalVariables;->nativeToolsReady:Z

    .line 43
    sput-boolean v0, Lcom/stericson/RootTools/internal/InternalVariables;->found:Z

    .line 44
    sput-boolean v0, Lcom/stericson/RootTools/internal/InternalVariables;->processRunning:Z

    .line 49
    const-string v0, ""

    sput-object v0, Lcom/stericson/RootTools/internal/InternalVariables;->pid_list:Ljava/lang/String;

    .line 52
    const-string v0, ""

    sput-object v0, Lcom/stericson/RootTools/internal/InternalVariables;->inode:Ljava/lang/String;

    .line 62
    const-string v0, "^\\S+\\s+([0-9]+).*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/stericson/RootTools/internal/InternalVariables;->psPattern:Ljava/util/regex/Pattern;

    .line 63
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
