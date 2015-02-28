.class public Lcom/stericson/RootShell/execution/Shell;
.super Ljava/lang/Object;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/stericson/RootShell/execution/Shell$Worker;,
        Lcom/stericson/RootShell/execution/Shell$ShellContext;,
        Lcom/stericson/RootShell/execution/Shell$ShellType;
    }
.end annotation


# static fields
.field private static customShell:Lcom/stericson/RootShell/execution/Shell; = null

.field public static defaultContext:Lcom/stericson/RootShell/execution/Shell$ShellContext; = null

.field private static rootShell:Lcom/stericson/RootShell/execution/Shell; = null

.field private static shell:Lcom/stericson/RootShell/execution/Shell; = null

.field private static suVersion:[Ljava/lang/String; = null

.field private static final token:Ljava/lang/String; = "F*D^W@#FGF"


# instance fields
.field private close:Z

.field private final commands:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/stericson/RootShell/execution/Command;",
            ">;"
        }
    .end annotation
.end field

.field private error:Ljava/lang/String;

.field private final errorStream:Ljava/io/BufferedReader;

.field private input:Ljava/lang/Runnable;

.field private final inputStream:Ljava/io/BufferedReader;

.field private isCleaning:Z

.field public isClosed:Z

.field public isExecuting:Z

.field public isReading:Z

.field private isSELinuxEnforcing:Ljava/lang/Boolean;

.field private maxCommands:I

.field private output:Ljava/lang/Runnable;

.field private final outputStream:Ljava/io/OutputStreamWriter;

.field private final proc:Ljava/lang/Process;

.field private read:I

.field private shellContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;

.field private shellTimeout:I

.field private shellType:Lcom/stericson/RootShell/execution/Shell$ShellType;

.field private totalExecuted:I

.field private totalRead:I

.field private write:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 78
    sput-object v2, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    .line 80
    sput-object v2, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    .line 82
    sput-object v2, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    .line 84
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object v2, v0, v1

    sput-object v0, Lcom/stericson/RootShell/execution/Shell;->suVersion:[Ljava/lang/String;

    .line 89
    sget-object v0, Lcom/stericson/RootShell/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    sput-object v0, Lcom/stericson/RootShell/execution/Shell;->defaultContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Lcom/stericson/RootShell/execution/Shell$ShellType;Lcom/stericson/RootShell/execution/Shell$ShellContext;I)V
    .locals 11
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "shellType"    # Lcom/stericson/RootShell/execution/Shell$ShellType;
    .param p3, "shellContext"    # Lcom/stericson/RootShell/execution/Shell$ShellContext;
    .param p4, "shellTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootShell/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v8, 0x0

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    const/16 v6, 0x61a8

    iput v6, p0, Lcom/stericson/RootShell/execution/Shell;->shellTimeout:I

    .line 94
    iput-object v10, p0, Lcom/stericson/RootShell/execution/Shell;->shellType:Lcom/stericson/RootShell/execution/Shell$ShellType;

    .line 96
    sget-object v6, Lcom/stericson/RootShell/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    iput-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->shellContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    .line 98
    const-string v6, ""

    iput-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->error:Ljava/lang/String;

    .line 108
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;

    .line 111
    iput-boolean v8, p0, Lcom/stericson/RootShell/execution/Shell;->close:Z

    .line 113
    iput-object v10, p0, Lcom/stericson/RootShell/execution/Shell;->isSELinuxEnforcing:Ljava/lang/Boolean;

    .line 115
    iput-boolean v8, p0, Lcom/stericson/RootShell/execution/Shell;->isExecuting:Z

    .line 117
    iput-boolean v8, p0, Lcom/stericson/RootShell/execution/Shell;->isReading:Z

    .line 119
    iput-boolean v8, p0, Lcom/stericson/RootShell/execution/Shell;->isClosed:Z

    .line 121
    const/16 v6, 0x1388

    iput v6, p0, Lcom/stericson/RootShell/execution/Shell;->maxCommands:I

    .line 123
    iput v8, p0, Lcom/stericson/RootShell/execution/Shell;->read:I

    .line 125
    iput v8, p0, Lcom/stericson/RootShell/execution/Shell;->write:I

    .line 127
    iput v8, p0, Lcom/stericson/RootShell/execution/Shell;->totalExecuted:I

    .line 129
    iput v8, p0, Lcom/stericson/RootShell/execution/Shell;->totalRead:I

    .line 131
    iput-boolean v8, p0, Lcom/stericson/RootShell/execution/Shell;->isCleaning:Z

    .line 553
    new-instance v6, Lcom/stericson/RootShell/execution/Shell$1;

    invoke-direct {v6, p0}, Lcom/stericson/RootShell/execution/Shell$1;-><init>(Lcom/stericson/RootShell/execution/Shell;)V

    iput-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->input:Ljava/lang/Runnable;

    .line 642
    new-instance v6, Lcom/stericson/RootShell/execution/Shell$3;

    invoke-direct {v6, p0}, Lcom/stericson/RootShell/execution/Shell$3;-><init>(Lcom/stericson/RootShell/execution/Shell;)V

    iput-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->output:Ljava/lang/Runnable;

    .line 135
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Starting shell: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 136
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Context: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p3}, Lcom/stericson/RootShell/execution/Shell$ShellContext;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 137
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Timeout: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 139
    iput-object p2, p0, Lcom/stericson/RootShell/execution/Shell;->shellType:Lcom/stericson/RootShell/execution/Shell$ShellType;

    .line 140
    if-lez p4, :cond_0

    .end local p4    # "shellTimeout":I
    :goto_0
    iput p4, p0, Lcom/stericson/RootShell/execution/Shell;->shellTimeout:I

    .line 141
    iput-object p3, p0, Lcom/stericson/RootShell/execution/Shell;->shellContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    .line 143
    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->shellContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    sget-object v7, Lcom/stericson/RootShell/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    if-ne v6, v7, :cond_1

    .line 144
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v6

    iput-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;

    .line 168
    :goto_1
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    iget-object v8, p0, Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;

    invoke-virtual {v8}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    const-string v9, "UTF-8"

    invoke-direct {v7, v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v6, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->inputStream:Ljava/io/BufferedReader;

    .line 169
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    iget-object v8, p0, Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;

    invoke-virtual {v8}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v8

    const-string v9, "UTF-8"

    invoke-direct {v7, v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v6, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->errorStream:Ljava/io/BufferedReader;

    .line 170
    new-instance v6, Ljava/io/OutputStreamWriter;

    iget-object v7, p0, Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;

    invoke-virtual {v7}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-direct {v6, v7, v8}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    iput-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;

    .line 175
    new-instance v5, Lcom/stericson/RootShell/execution/Shell$Worker;

    invoke-direct {v5, p0, v10}, Lcom/stericson/RootShell/execution/Shell$Worker;-><init>(Lcom/stericson/RootShell/execution/Shell;Lcom/stericson/RootShell/execution/Shell$1;)V

    .line 176
    .local v5, "worker":Lcom/stericson/RootShell/execution/Shell$Worker;
    invoke-virtual {v5}, Lcom/stericson/RootShell/execution/Shell$Worker;->start()V

    .line 187
    :try_start_0
    iget v6, p0, Lcom/stericson/RootShell/execution/Shell;->shellTimeout:I

    int-to-long v6, v6

    invoke-virtual {v5, v6, v7}, Lcom/stericson/RootShell/execution/Shell$Worker;->join(J)V

    .line 192
    iget v6, v5, Lcom/stericson/RootShell/execution/Shell$Worker;->exit:I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v7, -0x38f

    if-ne v6, v7, :cond_3

    .line 195
    :try_start_1
    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;

    invoke-virtual {v6}, Ljava/lang/Process;->destroy()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 199
    :goto_2
    :try_start_2
    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->inputStream:Ljava/io/BufferedReader;

    invoke-direct {p0, v6}, Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V

    .line 200
    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->errorStream:Ljava/io/BufferedReader;

    invoke-direct {p0, v6}, Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V

    .line 201
    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;

    invoke-direct {p0, v6}, Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Writer;)V

    .line 203
    new-instance v6, Ljava/util/concurrent/TimeoutException;

    iget-object v7, p0, Lcom/stericson/RootShell/execution/Shell;->error:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 240
    :catch_0
    move-exception v1

    .line 241
    .local v1, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {v5}, Lcom/stericson/RootShell/execution/Shell$Worker;->interrupt()V

    .line 242
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->interrupt()V

    .line 243
    new-instance v6, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v6}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v6

    .line 140
    .end local v1    # "ex":Ljava/lang/InterruptedException;
    .end local v5    # "worker":Lcom/stericson/RootShell/execution/Shell$Worker;
    .restart local p4    # "shellTimeout":I
    :cond_0
    iget p4, p0, Lcom/stericson/RootShell/execution/Shell;->shellTimeout:I

    goto/16 :goto_0

    .line 146
    .end local p4    # "shellTimeout":I
    :cond_1
    invoke-direct {p0, v8}, Lcom/stericson/RootShell/execution/Shell;->getSuVersion(Z)Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, "display":Ljava/lang/String;
    const/4 v6, 0x1

    invoke-direct {p0, v6}, Lcom/stericson/RootShell/execution/Shell;->getSuVersion(Z)Ljava/lang/String;

    move-result-object v2

    .line 151
    .local v2, "internal":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/stericson/RootShell/execution/Shell;->isSELinuxEnforcing()Z

    move-result v6

    if-eqz v6, :cond_2

    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    const-string v6, "SUPERSU"

    invoke-virtual {v0, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/16 v7, 0xbe

    if-lt v6, v7, :cond_2

    .line 156
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " --context "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/stericson/RootShell/execution/Shell;->shellContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    invoke-virtual {v7}, Lcom/stericson/RootShell/execution/Shell$ShellContext;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 164
    :goto_3
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v6

    iput-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;

    goto/16 :goto_1

    .line 158
    :cond_2
    const-string v6, "Su binary --context switch not supported!"

    invoke-static {v6}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 159
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Su binary display version: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 160
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Su binary internal version: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 161
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SELinuxEnforcing: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/stericson/RootShell/execution/Shell;->isSELinuxEnforcing()Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    goto :goto_3

    .line 208
    .end local v0    # "display":Ljava/lang/String;
    .end local v2    # "internal":Ljava/lang/String;
    .restart local v5    # "worker":Lcom/stericson/RootShell/execution/Shell$Worker;
    :cond_3
    :try_start_3
    iget v6, v5, Lcom/stericson/RootShell/execution/Shell$Worker;->exit:I
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    const/16 v7, -0x2a

    if-ne v6, v7, :cond_4

    .line 211
    :try_start_4
    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;

    invoke-virtual {v6}, Ljava/lang/Process;->destroy()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0

    .line 215
    :goto_4
    :try_start_5
    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->inputStream:Ljava/io/BufferedReader;

    invoke-direct {p0, v6}, Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V

    .line 216
    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->errorStream:Ljava/io/BufferedReader;

    invoke-direct {p0, v6}, Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V

    .line 217
    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;

    invoke-direct {p0, v6}, Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Writer;)V

    .line 219
    new-instance v6, Lcom/stericson/RootShell/exceptions/RootDeniedException;

    const-string v7, "Root Access Denied"

    invoke-direct {v6, v7}, Lcom/stericson/RootShell/exceptions/RootDeniedException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 232
    :cond_4
    new-instance v3, Ljava/lang/Thread;

    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->input:Ljava/lang/Runnable;

    const-string v7, "Shell Input"

    invoke-direct {v3, v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 233
    .local v3, "si":Ljava/lang/Thread;
    const/4 v6, 0x5

    invoke-virtual {v3, v6}, Ljava/lang/Thread;->setPriority(I)V

    .line 234
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 236
    new-instance v4, Ljava/lang/Thread;

    iget-object v6, p0, Lcom/stericson/RootShell/execution/Shell;->output:Ljava/lang/Runnable;

    const-string v7, "Shell Output"

    invoke-direct {v4, v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 237
    .local v4, "so":Ljava/lang/Thread;
    const/4 v6, 0x5

    invoke-virtual {v4, v6}, Ljava/lang/Thread;->setPriority(I)V

    .line 238
    invoke-virtual {v4}, Ljava/lang/Thread;->start()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0

    .line 245
    return-void

    .line 212
    .end local v3    # "si":Ljava/lang/Thread;
    .end local v4    # "so":Ljava/lang/Thread;
    :catch_1
    move-exception v6

    goto :goto_4

    .line 196
    :catch_2
    move-exception v6

    goto/16 :goto_2
.end method

.method static synthetic access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Writer;)V
    .locals 0
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;
    .param p1, "x1"    # Ljava/io/Writer;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Writer;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Shell;->inputStream:Ljava/io/BufferedReader;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/stericson/RootShell/execution/Shell;)I
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget v0, p0, Lcom/stericson/RootShell/execution/Shell;->totalRead:I

    return v0
.end method

.method static synthetic access$1208(Lcom/stericson/RootShell/execution/Shell;)I
    .locals 2
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget v0, p0, Lcom/stericson/RootShell/execution/Shell;->totalRead:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/stericson/RootShell/execution/Shell;->totalRead:I

    return v0
.end method

.method static synthetic access$1300(Lcom/stericson/RootShell/execution/Shell;)Ljava/lang/Process;
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Shell;->errorStream:Ljava/io/BufferedReader;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Reader;)V
    .locals 0
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;
    .param p1, "x1"    # Ljava/io/Reader;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V

    return-void
.end method

.method static synthetic access$1602(Lcom/stericson/RootShell/execution/Shell;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/stericson/RootShell/execution/Shell;->error:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/stericson/RootShell/execution/Shell;)Z
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/stericson/RootShell/execution/Shell;->close:Z

    return v0
.end method

.method static synthetic access$300(Lcom/stericson/RootShell/execution/Shell;)I
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget v0, p0, Lcom/stericson/RootShell/execution/Shell;->write:I

    return v0
.end method

.method static synthetic access$302(Lcom/stericson/RootShell/execution/Shell;I)I
    .locals 0
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;
    .param p1, "x1"    # I

    .prologue
    .line 45
    iput p1, p0, Lcom/stericson/RootShell/execution/Shell;->write:I

    return p1
.end method

.method static synthetic access$308(Lcom/stericson/RootShell/execution/Shell;)I
    .locals 2
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget v0, p0, Lcom/stericson/RootShell/execution/Shell;->write:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/stericson/RootShell/execution/Shell;->write:I

    return v0
.end method

.method static synthetic access$400(Lcom/stericson/RootShell/execution/Shell;)I
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget v0, p0, Lcom/stericson/RootShell/execution/Shell;->maxCommands:I

    return v0
.end method

.method static synthetic access$500(Lcom/stericson/RootShell/execution/Shell;)I
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget v0, p0, Lcom/stericson/RootShell/execution/Shell;->read:I

    return v0
.end method

.method static synthetic access$502(Lcom/stericson/RootShell/execution/Shell;I)I
    .locals 0
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;
    .param p1, "x1"    # I

    .prologue
    .line 45
    iput p1, p0, Lcom/stericson/RootShell/execution/Shell;->read:I

    return p1
.end method

.method static synthetic access$508(Lcom/stericson/RootShell/execution/Shell;)I
    .locals 2
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget v0, p0, Lcom/stericson/RootShell/execution/Shell;->read:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/stericson/RootShell/execution/Shell;->read:I

    return v0
.end method

.method static synthetic access$600(Lcom/stericson/RootShell/execution/Shell;)V
    .locals 0
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/stericson/RootShell/execution/Shell;->cleanCommands()V

    return-void
.end method

.method static synthetic access$700(Lcom/stericson/RootShell/execution/Shell;)Lcom/stericson/RootShell/execution/Shell$ShellContext;
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Shell;->shellContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    return-object v0
.end method

.method static synthetic access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;

    return-object v0
.end method

.method static synthetic access$900(Lcom/stericson/RootShell/execution/Shell;)I
    .locals 1
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget v0, p0, Lcom/stericson/RootShell/execution/Shell;->totalExecuted:I

    return v0
.end method

.method static synthetic access$908(Lcom/stericson/RootShell/execution/Shell;)I
    .locals 2
    .param p0, "x0"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 45
    iget v0, p0, Lcom/stericson/RootShell/execution/Shell;->totalExecuted:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/stericson/RootShell/execution/Shell;->totalExecuted:I

    return v0
.end method

.method private cleanCommands()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 278
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/stericson/RootShell/execution/Shell;->isCleaning:Z

    .line 279
    iget v2, p0, Lcom/stericson/RootShell/execution/Shell;->maxCommands:I

    iget v3, p0, Lcom/stericson/RootShell/execution/Shell;->maxCommands:I

    div-int/lit8 v3, v3, 0x4

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 280
    .local v1, "toClean":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cleaning up: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 282
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 283
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 282
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 286
    :cond_0
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/stericson/RootShell/execution/Shell;->read:I

    .line 287
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/stericson/RootShell/execution/Shell;->write:I

    .line 288
    iput-boolean v4, p0, Lcom/stericson/RootShell/execution/Shell;->isCleaning:Z

    .line 289
    return-void
.end method

.method public static closeAll()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 373
    const-string v0, "Request to close all shells!"

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 375
    invoke-static {}, Lcom/stericson/RootShell/execution/Shell;->closeShell()V

    .line 376
    invoke-static {}, Lcom/stericson/RootShell/execution/Shell;->closeRootShell()V

    .line 377
    invoke-static {}, Lcom/stericson/RootShell/execution/Shell;->closeCustomShell()V

    .line 378
    return-void
.end method

.method public static closeCustomShell()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 345
    const-string v0, "Request to close custom shell!"

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 347
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v0, :cond_0

    .line 352
    :goto_0
    return-void

    .line 351
    :cond_0
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    invoke-virtual {v0}, Lcom/stericson/RootShell/execution/Shell;->close()V

    goto :goto_0
.end method

.method private closeQuietly(Ljava/io/Reader;)V
    .locals 1
    .param p1, "input"    # Ljava/io/Reader;

    .prologue
    .line 293
    if-eqz p1, :cond_0

    .line 294
    :try_start_0
    invoke-virtual {p1}, Ljava/io/Reader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    :cond_0
    :goto_0
    return-void

    .line 296
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private closeQuietly(Ljava/io/Writer;)V
    .locals 1
    .param p1, "output"    # Ljava/io/Writer;

    .prologue
    .line 302
    if-eqz p1, :cond_0

    .line 303
    :try_start_0
    invoke-virtual {p1}, Ljava/io/Writer;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 307
    :cond_0
    :goto_0
    return-void

    .line 305
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static closeRootShell()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 355
    const-string v0, "Request to close root shell!"

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 357
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v0, :cond_0

    .line 361
    :goto_0
    return-void

    .line 360
    :cond_0
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    invoke-virtual {v0}, Lcom/stericson/RootShell/execution/Shell;->close()V

    goto :goto_0
.end method

.method public static closeShell()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 364
    const-string v0, "Request to close normal shell!"

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 366
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v0, :cond_0

    .line 370
    :goto_0
    return-void

    .line 369
    :cond_0
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    invoke-virtual {v0}, Lcom/stericson/RootShell/execution/Shell;->close()V

    goto :goto_0
.end method

.method public static getOpenShell()Lcom/stericson/RootShell/execution/Shell;
    .locals 1

    .prologue
    .line 389
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    if-eqz v0, :cond_0

    .line 390
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    .line 394
    :goto_0
    return-object v0

    .line 391
    :cond_0
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    if-eqz v0, :cond_1

    .line 392
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    goto :goto_0

    .line 394
    :cond_1
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    goto :goto_0
.end method

.method private declared-synchronized getSuVersion(Z)Ljava/lang/String;
    .locals 13
    .param p1, "internal"    # Z

    .prologue
    const/4 v9, 0x0

    .line 422
    monitor-enter p0

    if-eqz p1, :cond_4

    const/4 v2, 0x0

    .line 423
    .local v2, "idx":I
    :goto_0
    :try_start_0
    sget-object v10, Lcom/stericson/RootShell/execution/Shell;->suVersion:[Ljava/lang/String;

    aget-object v10, v10, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v10, :cond_3

    .line 424
    const/4 v8, 0x0

    .line 429
    .local v8, "version":Ljava/lang/String;
    :try_start_1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v11

    if-eqz p1, :cond_5

    const-string v10, "su -V"

    :goto_1
    const/4 v12, 0x0

    invoke-virtual {v11, v10, v12}, Ljava/lang/Runtime;->exec(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    .line 430
    .local v4, "process":Ljava/lang/Process;
    invoke-virtual {v4}, Ljava/lang/Process;->waitFor()I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 440
    :try_start_2
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 442
    .local v7, "stdout":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 444
    .local v5, "reader":Ljava/io/BufferedReader;
    const/4 v3, 0x0

    .line 445
    .local v3, "line":Ljava/lang/String;
    :goto_2
    :try_start_3
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 446
    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 448
    :catch_0
    move-exception v9

    .line 452
    :cond_0
    :try_start_4
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 456
    :goto_3
    :try_start_5
    invoke-virtual {v4}, Ljava/lang/Process;->destroy()V

    .line 458
    move-object v6, v7

    .line 460
    .local v6, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v6, :cond_2

    .line 461
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "line":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 462
    .restart local v3    # "line":Ljava/lang/String;
    if-nez p1, :cond_6

    .line 463
    const-string v9, "."

    invoke-virtual {v3, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 464
    move-object v8, v3

    .line 479
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_5
    sget-object v9, Lcom/stericson/RootShell/execution/Shell;->suVersion:[Ljava/lang/String;

    aput-object v8, v9, v2

    .line 481
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "process":Ljava/lang/Process;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .end local v6    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v7    # "stdout":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "version":Ljava/lang/String;
    :cond_3
    sget-object v9, Lcom/stericson/RootShell/execution/Shell;->suVersion:[Ljava/lang/String;

    aget-object v9, v9, v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :goto_6
    monitor-exit p0

    return-object v9

    .line 422
    .end local v2    # "idx":I
    :cond_4
    const/4 v2, 0x1

    goto :goto_0

    .line 429
    .restart local v2    # "idx":I
    .restart local v8    # "version":Ljava/lang/String;
    :cond_5
    :try_start_6
    const-string v10, "su -v"
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_1

    .line 431
    :catch_1
    move-exception v0

    .line 432
    .local v0, "e":Ljava/io/IOException;
    :try_start_7
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_6

    .line 422
    .end local v0    # "e":Ljava/io/IOException;
    .end local v8    # "version":Ljava/lang/String;
    :catchall_0
    move-exception v9

    monitor-exit p0

    throw v9

    .line 434
    .restart local v8    # "version":Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 435
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_8
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_6

    .line 469
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v4    # "process":Ljava/lang/Process;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v6    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v7    # "stdout":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_6
    :try_start_9
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    move-result v9

    if-lez v9, :cond_1

    .line 470
    move-object v8, v3

    goto :goto_5

    .line 453
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v6    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_3
    move-exception v9

    goto :goto_3

    .line 473
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v6    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_4
    move-exception v9

    goto :goto_4
.end method

.method public static isAnyShellOpen()Z
    .locals 1

    .prologue
    .line 497
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v0, :cond_0

    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v0, :cond_0

    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isCustomShellOpen()Z
    .locals 1

    .prologue
    .line 489
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isRootShellOpen()Z
    .locals 1

    .prologue
    .line 493
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isShellOpen()Z
    .locals 1

    .prologue
    .line 485
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static runCommand(Lcom/stericson/RootShell/execution/Command;)V
    .locals 1
    .param p0, "command"    # Lcom/stericson/RootShell/execution/Command;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 822
    invoke-static {}, Lcom/stericson/RootShell/execution/Shell;->startShell()Lcom/stericson/RootShell/execution/Shell;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;

    .line 823
    return-void
.end method

.method public static runRootCommand(Lcom/stericson/RootShell/execution/Command;)V
    .locals 1
    .param p0, "command"    # Lcom/stericson/RootShell/execution/Command;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootShell/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 818
    invoke-static {}, Lcom/stericson/RootShell/execution/Shell;->startRootShell()Lcom/stericson/RootShell/execution/Shell;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;

    .line 819
    return-void
.end method

.method public static startCustomShell(Ljava/lang/String;)Lcom/stericson/RootShell/execution/Shell;
    .locals 1
    .param p0, "shellPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootShell/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 894
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/stericson/RootShell/execution/Shell;->startCustomShell(Ljava/lang/String;I)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static startCustomShell(Ljava/lang/String;I)Lcom/stericson/RootShell/execution/Shell;
    .locals 3
    .param p0, "shellPath"    # Ljava/lang/String;
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootShell/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 899
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v0, :cond_0

    .line 900
    const-string v0, "Starting Custom Shell!"

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 901
    new-instance v0, Lcom/stericson/RootShell/execution/Shell;

    sget-object v1, Lcom/stericson/RootShell/execution/Shell$ShellType;->CUSTOM:Lcom/stericson/RootShell/execution/Shell$ShellType;

    sget-object v2, Lcom/stericson/RootShell/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/stericson/RootShell/execution/Shell;-><init>(Ljava/lang/String;Lcom/stericson/RootShell/execution/Shell$ShellType;Lcom/stericson/RootShell/execution/Shell$ShellContext;I)V

    sput-object v0, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    .line 906
    :goto_0
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    return-object v0

    .line 903
    :cond_0
    const-string v0, "Using Existing Custom Shell!"

    invoke-static {v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static startRootShell()Lcom/stericson/RootShell/execution/Shell;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootShell/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 826
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/stericson/RootShell/execution/Shell;->startRootShell(II)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static startRootShell(I)Lcom/stericson/RootShell/execution/Shell;
    .locals 1
    .param p0, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootShell/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 830
    const/4 v0, 0x3

    invoke-static {p0, v0}, Lcom/stericson/RootShell/execution/Shell;->startRootShell(II)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static startRootShell(II)Lcom/stericson/RootShell/execution/Shell;
    .locals 1
    .param p0, "timeout"    # I
    .param p1, "retry"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootShell/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 834
    sget-object v0, Lcom/stericson/RootShell/execution/Shell;->defaultContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    invoke-static {p0, v0, p1}, Lcom/stericson/RootShell/execution/Shell;->startRootShell(ILcom/stericson/RootShell/execution/Shell$ShellContext;I)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static startRootShell(ILcom/stericson/RootShell/execution/Shell$ShellContext;I)Lcom/stericson/RootShell/execution/Shell;
    .locals 6
    .param p0, "timeout"    # I
    .param p1, "shellContext"    # Lcom/stericson/RootShell/execution/Shell$ShellContext;
    .param p2, "retry"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootShell/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 839
    const/4 v2, 0x0

    .line 841
    .local v2, "retries":I
    sget-object v4, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v4, :cond_3

    .line 843
    const-string v4, "Starting Root Shell!"

    invoke-static {v4}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 844
    const-string v0, "su"

    .line 845
    .local v0, "cmd":Ljava/lang/String;
    :goto_0
    sget-object v4, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v4, :cond_4

    .line 847
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Trying to open Root Shell, attempt #"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 848
    new-instance v4, Lcom/stericson/RootShell/execution/Shell;

    sget-object v5, Lcom/stericson/RootShell/execution/Shell$ShellType;->ROOT:Lcom/stericson/RootShell/execution/Shell$ShellType;

    invoke-direct {v4, v0, v5, p1, p0}, Lcom/stericson/RootShell/execution/Shell;-><init>(Ljava/lang/String;Lcom/stericson/RootShell/execution/Shell$ShellType;Lcom/stericson/RootShell/execution/Shell$ShellContext;I)V

    sput-object v4, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/stericson/RootShell/exceptions/RootDeniedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 849
    :catch_0
    move-exception v1

    .line 850
    .local v1, "e":Ljava/io/IOException;
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "retries":I
    .local v3, "retries":I
    if-lt v2, p2, :cond_0

    .line 851
    const-string v4, "IOException, could not start shell"

    invoke-static {v4}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 852
    throw v1

    :cond_0
    move v2, v3

    .line 864
    .end local v3    # "retries":I
    .restart local v2    # "retries":I
    goto :goto_0

    .line 854
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 855
    .local v1, "e":Lcom/stericson/RootShell/exceptions/RootDeniedException;
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "retries":I
    .restart local v3    # "retries":I
    if-lt v2, p2, :cond_1

    .line 856
    const-string v4, "RootDeniedException, could not start shell"

    invoke-static {v4}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 857
    throw v1

    :cond_1
    move v2, v3

    .line 864
    .end local v3    # "retries":I
    .restart local v2    # "retries":I
    goto :goto_0

    .line 859
    .end local v1    # "e":Lcom/stericson/RootShell/exceptions/RootDeniedException;
    :catch_2
    move-exception v1

    .line 860
    .local v1, "e":Ljava/util/concurrent/TimeoutException;
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "retries":I
    .restart local v3    # "retries":I
    if-lt v2, p2, :cond_2

    .line 861
    const-string v4, "TimeoutException, could not start shell"

    invoke-static {v4}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 862
    throw v1

    :cond_2
    move v2, v3

    .line 864
    .end local v3    # "retries":I
    .restart local v2    # "retries":I
    goto :goto_0

    .line 866
    .end local v0    # "cmd":Ljava/lang/String;
    .end local v1    # "e":Ljava/util/concurrent/TimeoutException;
    :cond_3
    sget-object v4, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    iget-object v4, v4, Lcom/stericson/RootShell/execution/Shell;->shellContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    if-eq v4, p1, :cond_8

    .line 868
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Context is different than open shell, switching context... "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    iget-object v5, v5, Lcom/stericson/RootShell/execution/Shell;->shellContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " VS "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 869
    sget-object v4, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    invoke-virtual {v4, p1}, Lcom/stericson/RootShell/execution/Shell;->switchRootShellContext(Lcom/stericson/RootShell/execution/Shell$ShellContext;)Lcom/stericson/RootShell/execution/Shell;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lcom/stericson/RootShell/exceptions/RootDeniedException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1 .. :try_end_1} :catch_5

    .line 890
    :cond_4
    :goto_1
    sget-object v4, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    return-object v4

    .line 870
    :catch_3
    move-exception v1

    .line 871
    .local v1, "e":Ljava/io/IOException;
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "retries":I
    .restart local v3    # "retries":I
    if-lt v2, p2, :cond_5

    .line 872
    const-string v4, "IOException, could not switch context!"

    invoke-static {v4}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 873
    throw v1

    :cond_5
    move v2, v3

    .line 885
    .end local v3    # "retries":I
    .restart local v2    # "retries":I
    goto :goto_1

    .line 875
    .end local v1    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v1

    .line 876
    .local v1, "e":Lcom/stericson/RootShell/exceptions/RootDeniedException;
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "retries":I
    .restart local v3    # "retries":I
    if-lt v2, p2, :cond_6

    .line 877
    const-string v4, "RootDeniedException, could not switch context!"

    invoke-static {v4}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 878
    throw v1

    :cond_6
    move v2, v3

    .line 885
    .end local v3    # "retries":I
    .restart local v2    # "retries":I
    goto :goto_1

    .line 880
    .end local v1    # "e":Lcom/stericson/RootShell/exceptions/RootDeniedException;
    :catch_5
    move-exception v1

    .line 881
    .local v1, "e":Ljava/util/concurrent/TimeoutException;
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "retries":I
    .restart local v3    # "retries":I
    if-lt v2, p2, :cond_7

    .line 882
    const-string v4, "TimeoutException, could not switch context!"

    invoke-static {v4}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 883
    throw v1

    :cond_7
    move v2, v3

    .line 885
    .end local v3    # "retries":I
    .restart local v2    # "retries":I
    goto :goto_1

    .line 887
    .end local v1    # "e":Ljava/util/concurrent/TimeoutException;
    :cond_8
    const-string v4, "Using Existing Root Shell!"

    invoke-static {v4}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static startShell()Lcom/stericson/RootShell/execution/Shell;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 910
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/stericson/RootShell/execution/Shell;->startShell(I)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static startShell(I)Lcom/stericson/RootShell/execution/Shell;
    .locals 5
    .param p0, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 916
    :try_start_0
    sget-object v1, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    if-nez v1, :cond_0

    .line 917
    const-string v1, "Starting Shell!"

    invoke-static {v1}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 918
    new-instance v1, Lcom/stericson/RootShell/execution/Shell;

    const-string v2, "/system/bin/sh"

    sget-object v3, Lcom/stericson/RootShell/execution/Shell$ShellType;->NORMAL:Lcom/stericson/RootShell/execution/Shell$ShellType;

    sget-object v4, Lcom/stericson/RootShell/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootShell/execution/Shell$ShellContext;

    invoke-direct {v1, v2, v3, v4, p0}, Lcom/stericson/RootShell/execution/Shell;-><init>(Ljava/lang/String;Lcom/stericson/RootShell/execution/Shell$ShellType;Lcom/stericson/RootShell/execution/Shell$ShellContext;I)V

    sput-object v1, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    .line 922
    :goto_0
    sget-object v1, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    return-object v1

    .line 920
    :cond_0
    const-string v1, "Using Existing Shell!"

    invoke-static {v1}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/stericson/RootShell/exceptions/RootDeniedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 923
    :catch_0
    move-exception v0

    .line 925
    .local v0, "e":Lcom/stericson/RootShell/exceptions/RootDeniedException;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1
.end method


# virtual methods
.method public add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;
    .locals 2
    .param p1, "command"    # Lcom/stericson/RootShell/execution/Command;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    iget-boolean v0, p0, Lcom/stericson/RootShell/execution/Shell;->close:Z

    if-eqz v0, :cond_0

    .line 250
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to add commands to a closed shell"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 254
    :cond_0
    iget-boolean v0, p0, Lcom/stericson/RootShell/execution/Shell;->isCleaning:Z

    if-nez v0, :cond_0

    .line 259
    invoke-virtual {p1}, Lcom/stericson/RootShell/execution/Command;->resetCommand()V

    .line 261
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    invoke-virtual {p0}, Lcom/stericson/RootShell/execution/Shell;->notifyThreads()V

    .line 265
    return-object p1
.end method

.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 310
    const-string v1, "Request to close shell!"

    invoke-static {v1}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 312
    const/4 v0, 0x0

    .line 313
    .local v0, "count":I
    :cond_0
    iget-boolean v1, p0, Lcom/stericson/RootShell/execution/Shell;->isExecuting:Z

    if-eqz v1, :cond_1

    .line 314
    const-string v1, "Waiting on shell to finish executing before closing..."

    invoke-static {v1}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 315
    add-int/lit8 v0, v0, 0x1

    .line 318
    const/16 v1, 0x2710

    if-le v0, v1, :cond_0

    .line 324
    :cond_1
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;

    monitor-enter v2

    .line 329
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/stericson/RootShell/execution/Shell;->close:Z

    .line 330
    invoke-virtual {p0}, Lcom/stericson/RootShell/execution/Shell;->notifyThreads()V

    .line 331
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 333
    const-string v1, "Shell Closed!"

    invoke-static {v1}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 335
    sget-object v1, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    if-ne p0, v1, :cond_3

    .line 336
    sput-object v3, Lcom/stericson/RootShell/execution/Shell;->rootShell:Lcom/stericson/RootShell/execution/Shell;

    .line 342
    :cond_2
    :goto_0
    return-void

    .line 331
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 337
    :cond_3
    sget-object v1, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    if-ne p0, v1, :cond_4

    .line 338
    sput-object v3, Lcom/stericson/RootShell/execution/Shell;->shell:Lcom/stericson/RootShell/execution/Shell;

    goto :goto_0

    .line 339
    :cond_4
    sget-object v1, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    if-ne p0, v1, :cond_2

    .line 340
    sput-object v3, Lcom/stericson/RootShell/execution/Shell;->customShell:Lcom/stericson/RootShell/execution/Shell;

    goto :goto_0
.end method

.method public getCommandQueuePosition(Lcom/stericson/RootShell/execution/Command;)I
    .locals 1
    .param p1, "cmd"    # Lcom/stericson/RootShell/execution/Command;

    .prologue
    .line 381
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getCommandQueuePositionString(Lcom/stericson/RootShell/execution/Command;)Ljava/lang/String;
    .locals 2
    .param p1, "cmd"    # Lcom/stericson/RootShell/execution/Command;

    .prologue
    .line 385
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Command is in position "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/stericson/RootShell/execution/Shell;->getCommandQueuePosition(Lcom/stericson/RootShell/execution/Command;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " currently executing command at position "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/stericson/RootShell/execution/Shell;->write:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and the number of commands is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized isSELinuxEnforcing()Z
    .locals 7

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 509
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell;->isSELinuxEnforcing:Ljava/lang/Boolean;

    if-nez v3, :cond_3

    .line 510
    const/4 v0, 0x0

    .line 514
    .local v0, "enforcing":Ljava/lang/Boolean;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x11

    if-lt v3, v6, :cond_1

    .line 517
    new-instance v1, Ljava/io/File;

    const-string v3, "/sys/fs/selinux/enforce"

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 518
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v3

    if-eqz v3, :cond_0

    .line 520
    :try_start_1
    new-instance v2, Ljava/io/FileInputStream;

    const-string v3, "/sys/fs/selinux/enforce"

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 522
    .local v2, "is":Ljava/io/InputStream;
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v3

    const/16 v6, 0x31

    if-ne v3, v6, :cond_4

    move v3, v4

    :goto_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    .line 524
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 531
    .end local v2    # "is":Ljava/io/InputStream;
    :cond_0
    :goto_1
    if-nez v0, :cond_1

    .line 532
    :try_start_4
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x13

    if-lt v3, v6, :cond_5

    move v3, v4

    :goto_2
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 536
    .end local v1    # "f":Ljava/io/File;
    :cond_1
    if-nez v0, :cond_2

    .line 537
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 540
    :cond_2
    iput-object v0, p0, Lcom/stericson/RootShell/execution/Shell;->isSELinuxEnforcing:Ljava/lang/Boolean;

    .line 542
    .end local v0    # "enforcing":Ljava/lang/Boolean;
    :cond_3
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell;->isSELinuxEnforcing:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result v3

    monitor-exit p0

    return v3

    .restart local v0    # "enforcing":Ljava/lang/Boolean;
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "is":Ljava/io/InputStream;
    :cond_4
    move v3, v5

    .line 522
    goto :goto_0

    .line 524
    :catchall_0
    move-exception v3

    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v3
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 526
    .end local v2    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v3

    goto :goto_1

    :cond_5
    move v3, v5

    .line 532
    goto :goto_2

    .line 509
    .end local v0    # "enforcing":Ljava/lang/Boolean;
    .end local v1    # "f":Ljava/io/File;
    :catchall_1
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method protected notifyThreads()V
    .locals 1

    .prologue
    .line 626
    new-instance v0, Lcom/stericson/RootShell/execution/Shell$2;

    invoke-direct {v0, p0}, Lcom/stericson/RootShell/execution/Shell$2;-><init>(Lcom/stericson/RootShell/execution/Shell;)V

    .line 634
    .local v0, "t":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 635
    return-void
.end method

.method public processErrors(Lcom/stericson/RootShell/execution/Command;)V
    .locals 4
    .param p1, "command"    # Lcom/stericson/RootShell/execution/Command;

    .prologue
    .line 797
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell;->errorStream:Ljava/io/BufferedReader;

    invoke-virtual {v2}, Ljava/io/BufferedReader;->ready()Z

    move-result v2

    if-eqz v2, :cond_0

    if-eqz p1, :cond_0

    .line 798
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell;->errorStream:Ljava/io/BufferedReader;

    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 803
    .local v1, "line":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 815
    .end local v1    # "line":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 810
    .restart local v1    # "line":Ljava/lang/String;
    :cond_1
    iget v2, p1, Lcom/stericson/RootShell/execution/Command;->id:I

    invoke-virtual {p1, v2, v1}, Lcom/stericson/RootShell/execution/Command;->output(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 812
    .end local v1    # "line":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 813
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/stericson/RootShell/RootShell$LogLevel;->ERROR:Lcom/stericson/RootShell/RootShell$LogLevel;

    invoke-static {v2, v3, v0}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;Lcom/stericson/RootShell/RootShell$LogLevel;Ljava/lang/Exception;)V

    goto :goto_1
.end method

.method public switchRootShellContext(Lcom/stericson/RootShell/execution/Shell$ShellContext;)Lcom/stericson/RootShell/execution/Shell;
    .locals 3
    .param p1, "shellContext"    # Lcom/stericson/RootShell/execution/Shell$ShellContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootShell/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 930
    iget-object v1, p0, Lcom/stericson/RootShell/execution/Shell;->shellType:Lcom/stericson/RootShell/execution/Shell$ShellType;

    sget-object v2, Lcom/stericson/RootShell/execution/Shell$ShellType;->ROOT:Lcom/stericson/RootShell/execution/Shell$ShellType;

    if-ne v1, v2, :cond_0

    .line 932
    :try_start_0
    invoke-static {}, Lcom/stericson/RootShell/execution/Shell;->closeRootShell()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 939
    :goto_0
    iget v1, p0, Lcom/stericson/RootShell/execution/Shell;->shellTimeout:I

    const/4 v2, 0x3

    invoke-static {v1, p1, v2}, Lcom/stericson/RootShell/execution/Shell;->startRootShell(ILcom/stericson/RootShell/execution/Shell$ShellContext;I)Lcom/stericson/RootShell/execution/Shell;

    move-result-object p0

    .line 943
    .end local p0    # "this":Lcom/stericson/RootShell/execution/Shell;
    :goto_1
    return-object p0

    .line 933
    .restart local p0    # "this":Lcom/stericson/RootShell/execution/Shell;
    :catch_0
    move-exception v0

    .line 934
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Problem closing shell while trying to switch context..."

    invoke-static {v1}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 942
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v1, "Can only switch context on a root shell!"

    invoke-static {v1}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public final useCWD(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootShell/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 269
    new-instance v0, Lcom/stericson/RootShell/execution/Command;

    const/4 v1, -0x1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cd "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-direct {v0, v1, v5, v2}, Lcom/stericson/RootShell/execution/Command;-><init>(IZ[Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;

    .line 275
    return-void
.end method
