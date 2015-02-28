.class public Lcom/stericson/RootShell/execution/Shell$Worker;
.super Ljava/lang/Thread;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootShell/execution/Shell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Worker"
.end annotation


# instance fields
.field public exit:I

.field public shell:Lcom/stericson/RootShell/execution/Shell;


# direct methods
.method private constructor <init>(Lcom/stericson/RootShell/execution/Shell;)V
    .locals 1
    .param p1, "shell"    # Lcom/stericson/RootShell/execution/Shell;

    .prologue
    .line 953
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 949
    const/16 v0, -0x38f

    iput v0, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->exit:I

    .line 954
    iput-object p1, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    .line 955
    return-void
.end method

.method synthetic constructor <init>(Lcom/stericson/RootShell/execution/Shell;Lcom/stericson/RootShell/execution/Shell$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/stericson/RootShell/execution/Shell;
    .param p2, "x1"    # Lcom/stericson/RootShell/execution/Shell$1;

    .prologue
    .line 947
    invoke-direct {p0, p1}, Lcom/stericson/RootShell/execution/Shell$Worker;-><init>(Lcom/stericson/RootShell/execution/Shell;)V

    return-void
.end method

.method private setShellOom()V
    .locals 7

    .prologue
    .line 1006
    :try_start_0
    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$1300(Lcom/stericson/RootShell/execution/Shell;)Ljava/lang/Process;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v3

    .line 1009
    .local v3, "processClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_1
    const-string v4, "pid"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 1013
    .local v1, "field":Ljava/lang/reflect/Field;
    :goto_0
    const/4 v4, 0x1

    :try_start_2
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1014
    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$1300(Lcom/stericson/RootShell/execution/Shell;)Ljava/lang/Process;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 1015
    .local v2, "pid":I
    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "(echo -17 > /proc/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/oom_adj) &> /dev/null\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 1016
    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    const-string v5, "(echo -17 > /proc/$$/oom_adj) &> /dev/null\n"

    invoke-virtual {v4, v5}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 1017
    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/OutputStreamWriter;->flush()V

    .line 1021
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "pid":I
    .end local v3    # "processClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    return-void

    .line 1010
    .restart local v3    # "processClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v0

    .line 1011
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    const-string v4, "id"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v1

    .restart local v1    # "field":Ljava/lang/reflect/Field;
    goto :goto_0

    .line 1018
    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "processClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_1
    move-exception v0

    .line 1019
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 970
    :try_start_0
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v2}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v2

    const-string v3, "echo Started\n"

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 971
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v2}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->flush()V

    .line 974
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->inputStream:Ljava/io/BufferedReader;
    invoke-static {v2}, Lcom/stericson/RootShell/execution/Shell;->access$1100(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 976
    .local v1, "line":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 977
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 988
    .end local v1    # "line":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 989
    .local v0, "e":Ljava/io/IOException;
    const/16 v2, -0x2a

    iput v2, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->exit:I

    .line 990
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 991
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    # setter for: Lcom/stericson/RootShell/execution/Shell;->error:Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/stericson/RootShell/execution/Shell;->access$1602(Lcom/stericson/RootShell/execution/Shell;Ljava/lang/String;)Ljava/lang/String;

    .line 997
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1
    return-void

    .line 978
    .restart local v1    # "line":Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 980
    const-string v2, "Started"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 981
    const/4 v2, 0x1

    iput v2, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->exit:I

    .line 982
    invoke-direct {p0}, Lcom/stericson/RootShell/execution/Shell$Worker;->setShellOom()V

    goto :goto_1

    .line 986
    :cond_2
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    const-string v3, "unkown error occured."

    # setter for: Lcom/stericson/RootShell/execution/Shell;->error:Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/stericson/RootShell/execution/Shell;->access$1602(Lcom/stericson/RootShell/execution/Shell;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 993
    .end local v1    # "line":Ljava/lang/String;
    .restart local v0    # "e":Ljava/io/IOException;
    :cond_3
    iget-object v2, p0, Lcom/stericson/RootShell/execution/Shell$Worker;->shell:Lcom/stericson/RootShell/execution/Shell;

    const-string v3, "RootAccess denied?."

    # setter for: Lcom/stericson/RootShell/execution/Shell;->error:Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/stericson/RootShell/execution/Shell;->access$1602(Lcom/stericson/RootShell/execution/Shell;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_1
.end method
