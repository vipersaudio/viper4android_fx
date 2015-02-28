.class public Lcom/stericson/RootShell/execution/JavaCommand;
.super Lcom/stericson/RootShell/execution/Command;
.source "JavaCommand.java"


# direct methods
.method public varargs constructor <init>(IILandroid/content/Context;[Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "timeout"    # I
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "command"    # [Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p4}, Lcom/stericson/RootShell/execution/Command;-><init>(II[Ljava/lang/String;)V

    .line 36
    iput-object p3, p0, Lcom/stericson/RootShell/execution/JavaCommand;->context:Landroid/content/Context;

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/JavaCommand;->javaCommand:Z

    .line 38
    return-void
.end method

.method public varargs constructor <init>(ILandroid/content/Context;[Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "command"    # [Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0, p1, p3}, Lcom/stericson/RootShell/execution/Command;-><init>(I[Ljava/lang/String;)V

    .line 14
    iput-object p2, p0, Lcom/stericson/RootShell/execution/JavaCommand;->context:Landroid/content/Context;

    .line 15
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/JavaCommand;->javaCommand:Z

    .line 16
    return-void
.end method

.method public varargs constructor <init>(IZLandroid/content/Context;[Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "handlerEnabled"    # Z
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "command"    # [Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2, p4}, Lcom/stericson/RootShell/execution/Command;-><init>(IZ[Ljava/lang/String;)V

    .line 25
    iput-object p3, p0, Lcom/stericson/RootShell/execution/JavaCommand;->context:Landroid/content/Context;

    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/JavaCommand;->javaCommand:Z

    .line 27
    return-void
.end method


# virtual methods
.method public commandCompleted(II)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "exitCode"    # I

    .prologue
    .line 57
    return-void
.end method

.method public commandOutput(ILjava/lang/String;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-super {p0, p1, p2}, Lcom/stericson/RootShell/execution/Command;->commandOutput(ILjava/lang/String;)V

    .line 45
    return-void
.end method

.method public commandTerminated(ILjava/lang/String;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 51
    return-void
.end method
