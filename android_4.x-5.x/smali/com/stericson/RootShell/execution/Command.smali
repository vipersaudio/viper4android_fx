.class public Lcom/stericson/RootShell/execution/Command;
.super Ljava/lang/Object;
.source "Command.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/stericson/RootShell/execution/Command$1;,
        Lcom/stericson/RootShell/execution/Command$CommandHandler;,
        Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;
    }
.end annotation


# instance fields
.field command:[Ljava/lang/String;

.field protected context:Landroid/content/Context;

.field executing:Z

.field executionMonitor:Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;

.field exitCode:I

.field finished:Z

.field handlerEnabled:Z

.field id:I

.field protected javaCommand:Z

.field mHandler:Landroid/os/Handler;

.field terminated:Z

.field timeout:I

.field public totalOutput:I

.field public totalOutputProcessed:I


# direct methods
.method public varargs constructor <init>(II[Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "timeout"    # I
    .param p3, "command"    # [Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->javaCommand:Z

    .line 39
    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->context:Landroid/content/Context;

    .line 41
    iput v1, p0, Lcom/stericson/RootShell/execution/Command;->totalOutput:I

    .line 43
    iput v1, p0, Lcom/stericson/RootShell/execution/Command;->totalOutputProcessed:I

    .line 45
    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->executionMonitor:Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;

    .line 47
    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    .line 49
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->executing:Z

    .line 51
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->command:[Ljava/lang/String;

    .line 53
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->finished:Z

    .line 55
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->terminated:Z

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->handlerEnabled:Z

    .line 59
    const/4 v0, -0x1

    iput v0, p0, Lcom/stericson/RootShell/execution/Command;->exitCode:I

    .line 61
    iput v1, p0, Lcom/stericson/RootShell/execution/Command;->id:I

    .line 63
    sget v0, Lcom/stericson/RootShell/RootShell;->defaultCommandTimeout:I

    iput v0, p0, Lcom/stericson/RootShell/execution/Command;->timeout:I

    .line 102
    iput-object p3, p0, Lcom/stericson/RootShell/execution/Command;->command:[Ljava/lang/String;

    .line 103
    iput p1, p0, Lcom/stericson/RootShell/execution/Command;->id:I

    .line 104
    iput p2, p0, Lcom/stericson/RootShell/execution/Command;->timeout:I

    .line 106
    sget-boolean v0, Lcom/stericson/RootShell/RootShell;->handlerEnabled:Z

    invoke-direct {p0, v0}, Lcom/stericson/RootShell/execution/Command;->createHandler(Z)V

    .line 107
    return-void
.end method

.method public varargs constructor <init>(IZ[Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "handlerEnabled"    # Z
    .param p3, "command"    # [Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->javaCommand:Z

    .line 39
    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->context:Landroid/content/Context;

    .line 41
    iput v1, p0, Lcom/stericson/RootShell/execution/Command;->totalOutput:I

    .line 43
    iput v1, p0, Lcom/stericson/RootShell/execution/Command;->totalOutputProcessed:I

    .line 45
    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->executionMonitor:Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;

    .line 47
    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    .line 49
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->executing:Z

    .line 51
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->command:[Ljava/lang/String;

    .line 53
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->finished:Z

    .line 55
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->terminated:Z

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->handlerEnabled:Z

    .line 59
    const/4 v0, -0x1

    iput v0, p0, Lcom/stericson/RootShell/execution/Command;->exitCode:I

    .line 61
    iput v1, p0, Lcom/stericson/RootShell/execution/Command;->id:I

    .line 63
    sget v0, Lcom/stericson/RootShell/RootShell;->defaultCommandTimeout:I

    iput v0, p0, Lcom/stericson/RootShell/execution/Command;->timeout:I

    .line 87
    iput-object p3, p0, Lcom/stericson/RootShell/execution/Command;->command:[Ljava/lang/String;

    .line 88
    iput p1, p0, Lcom/stericson/RootShell/execution/Command;->id:I

    .line 90
    invoke-direct {p0, p2}, Lcom/stericson/RootShell/execution/Command;->createHandler(Z)V

    .line 91
    return-void
.end method

.method public varargs constructor <init>(I[Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "command"    # [Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->javaCommand:Z

    .line 39
    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->context:Landroid/content/Context;

    .line 41
    iput v1, p0, Lcom/stericson/RootShell/execution/Command;->totalOutput:I

    .line 43
    iput v1, p0, Lcom/stericson/RootShell/execution/Command;->totalOutputProcessed:I

    .line 45
    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->executionMonitor:Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;

    .line 47
    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    .line 49
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->executing:Z

    .line 51
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->command:[Ljava/lang/String;

    .line 53
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->finished:Z

    .line 55
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Command;->terminated:Z

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->handlerEnabled:Z

    .line 59
    const/4 v0, -0x1

    iput v0, p0, Lcom/stericson/RootShell/execution/Command;->exitCode:I

    .line 61
    iput v1, p0, Lcom/stericson/RootShell/execution/Command;->id:I

    .line 63
    sget v0, Lcom/stericson/RootShell/RootShell;->defaultCommandTimeout:I

    iput v0, p0, Lcom/stericson/RootShell/execution/Command;->timeout:I

    .line 72
    iput-object p2, p0, Lcom/stericson/RootShell/execution/Command;->command:[Ljava/lang/String;

    .line 73
    iput p1, p0, Lcom/stericson/RootShell/execution/Command;->id:I

    .line 75
    sget-boolean v0, Lcom/stericson/RootShell/RootShell;->handlerEnabled:Z

    invoke-direct {p0, v0}, Lcom/stericson/RootShell/execution/Command;->createHandler(Z)V

    .line 76
    return-void
.end method

.method private createHandler(Z)V
    .locals 2
    .param p1, "handlerEnabled"    # Z

    .prologue
    .line 145
    iput-boolean p1, p0, Lcom/stericson/RootShell/execution/Command;->handlerEnabled:Z

    .line 147
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 148
    const-string v0, "CommandHandler created"

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 149
    new-instance v0, Lcom/stericson/RootShell/execution/Command$CommandHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/stericson/RootShell/execution/Command$CommandHandler;-><init>(Lcom/stericson/RootShell/execution/Command;Lcom/stericson/RootShell/execution/Command$1;)V

    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    .line 153
    :goto_0
    return-void

    .line 151
    :cond_0
    const-string v0, "CommandHandler not created"

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public commandCompleted(II)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "exitcode"    # I

    .prologue
    .line 122
    return-void
.end method

.method protected final commandFinished()V
    .locals 4

    .prologue
    .line 125
    iget-boolean v2, p0, Lcom/stericson/RootShell/execution/Command;->terminated:Z

    if-nez v2, :cond_0

    .line 126
    monitor-enter p0

    .line 127
    :try_start_0
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/stericson/RootShell/execution/Command;->handlerEnabled:Z

    if-eqz v2, :cond_1

    .line 128
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 129
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 130
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "action"

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 131
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 132
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 137
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "msg":Landroid/os/Message;
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Command "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/stericson/RootShell/execution/Command;->id:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " finished."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 138
    invoke-virtual {p0}, Lcom/stericson/RootShell/execution/Command;->finishCommand()V

    .line 139
    monitor-exit p0

    .line 141
    :cond_0
    return-void

    .line 134
    :cond_1
    iget v2, p0, Lcom/stericson/RootShell/execution/Command;->id:I

    iget v3, p0, Lcom/stericson/RootShell/execution/Command;->exitCode:I

    invoke-virtual {p0, v2, v3}, Lcom/stericson/RootShell/execution/Command;->commandCompleted(II)V

    goto :goto_0

    .line 139
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public commandOutput(ILjava/lang/String;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 112
    const-string v0, "Command"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    iget v0, p0, Lcom/stericson/RootShell/execution/Command;->totalOutputProcessed:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/stericson/RootShell/execution/Command;->totalOutputProcessed:I

    .line 114
    return-void
.end method

.method public commandTerminated(ILjava/lang/String;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 118
    return-void
.end method

.method public final finish()V
    .locals 1

    .prologue
    .line 157
    const-string v0, "Command finished at users request!"

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 158
    invoke-virtual {p0}, Lcom/stericson/RootShell/execution/Command;->commandFinished()V

    .line 159
    return-void
.end method

.method protected final finishCommand()V
    .locals 1

    .prologue
    .line 162
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->executing:Z

    .line 163
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->finished:Z

    .line 164
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 165
    return-void
.end method

.method public final getCommand()Ljava/lang/String;
    .locals 3

    .prologue
    .line 169
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->command:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 172
    if-lez v0, :cond_0

    .line 173
    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 176
    :cond_0
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->command:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 179
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public final getExitCode()I
    .locals 1

    .prologue
    .line 195
    iget v0, p0, Lcom/stericson/RootShell/execution/Command;->exitCode:I

    return v0
.end method

.method public final isExecuting()Z
    .locals 1

    .prologue
    .line 183
    iget-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->executing:Z

    return v0
.end method

.method public final isFinished()Z
    .locals 1

    .prologue
    .line 191
    iget-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->finished:Z

    return v0
.end method

.method public final isHandlerEnabled()Z
    .locals 1

    .prologue
    .line 187
    iget-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->handlerEnabled:Z

    return v0
.end method

.method protected final output(ILjava/lang/String;)V
    .locals 4
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 248
    iget v2, p0, Lcom/stericson/RootShell/execution/Command;->totalOutput:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/stericson/RootShell/execution/Command;->totalOutput:I

    .line 250
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/stericson/RootShell/execution/Command;->handlerEnabled:Z

    if-eqz v2, :cond_0

    .line 251
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 252
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 253
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "action"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 254
    const-string v2, "text"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 256
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 260
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "msg":Landroid/os/Message;
    :goto_0
    return-void

    .line 258
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/stericson/RootShell/execution/Command;->commandOutput(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public final resetCommand()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 264
    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->finished:Z

    .line 265
    iput v0, p0, Lcom/stericson/RootShell/execution/Command;->totalOutput:I

    .line 266
    iput v0, p0, Lcom/stericson/RootShell/execution/Command;->totalOutputProcessed:I

    .line 267
    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->executing:Z

    .line 268
    iput-boolean v0, p0, Lcom/stericson/RootShell/execution/Command;->terminated:Z

    .line 269
    const/4 v0, -0x1

    iput v0, p0, Lcom/stericson/RootShell/execution/Command;->exitCode:I

    .line 270
    return-void
.end method

.method protected final setExitCode(I)V
    .locals 1
    .param p1, "code"    # I

    .prologue
    .line 199
    monitor-enter p0

    .line 200
    :try_start_0
    iput p1, p0, Lcom/stericson/RootShell/execution/Command;->exitCode:I

    .line 201
    monitor-exit p0

    .line 202
    return-void

    .line 201
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected final startExecution()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 205
    new-instance v0, Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;-><init>(Lcom/stericson/RootShell/execution/Command;Lcom/stericson/RootShell/execution/Command$1;)V

    iput-object v0, p0, Lcom/stericson/RootShell/execution/Command;->executionMonitor:Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;

    .line 206
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Command;->executionMonitor:Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;

    invoke-virtual {v0, v2}, Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;->setPriority(I)V

    .line 207
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Command;->executionMonitor:Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;

    invoke-virtual {v0}, Lcom/stericson/RootShell/execution/Command$ExecutionMonitor;->start()V

    .line 208
    iput-boolean v2, p0, Lcom/stericson/RootShell/execution/Command;->executing:Z

    .line 209
    return-void
.end method

.method public final terminate()V
    .locals 1

    .prologue
    .line 213
    const-string v0, "Terminating command at users request!"

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 214
    const-string v0, "Terminated at users request!"

    invoke-virtual {p0, v0}, Lcom/stericson/RootShell/execution/Command;->terminated(Ljava/lang/String;)V

    .line 215
    return-void
.end method

.method protected final terminate(Ljava/lang/String;)V
    .locals 1
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 219
    :try_start_0
    invoke-static {}, Lcom/stericson/RootShell/execution/Shell;->closeAll()V

    .line 220
    const-string v0, "Terminating all shells."

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 221
    invoke-virtual {p0, p1}, Lcom/stericson/RootShell/execution/Command;->terminated(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    :goto_0
    return-void

    .line 222
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected final terminated(Ljava/lang/String;)V
    .locals 4
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 227
    monitor-enter p0

    .line 229
    :try_start_0
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/stericson/RootShell/execution/Command;->handlerEnabled:Z

    if-eqz v2, :cond_0

    .line 230
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 231
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 232
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "action"

    const/4 v3, 0x3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 233
    const-string v2, "text"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 235
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 240
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "msg":Landroid/os/Message;
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Command "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/stericson/RootShell/execution/Command;->id:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " did not finish because it was terminated. Termination reason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 241
    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lcom/stericson/RootShell/execution/Command;->setExitCode(I)V

    .line 242
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/stericson/RootShell/execution/Command;->terminated:Z

    .line 243
    invoke-virtual {p0}, Lcom/stericson/RootShell/execution/Command;->finishCommand()V

    .line 244
    monitor-exit p0

    .line 245
    return-void

    .line 237
    :cond_0
    iget v2, p0, Lcom/stericson/RootShell/execution/Command;->id:I

    invoke-virtual {p0, v2, p1}, Lcom/stericson/RootShell/execution/Command;->commandTerminated(ILjava/lang/String;)V

    goto :goto_0

    .line 244
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
