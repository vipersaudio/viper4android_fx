.class Lcom/stericson/RootShell/execution/Shell$1;
.super Ljava/lang/Object;
.source "Shell.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootShell/execution/Shell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/stericson/RootShell/execution/Shell;


# direct methods
.method constructor <init>(Lcom/stericson/RootShell/execution/Shell;)V
    .locals 0

    .prologue
    .line 553
    iput-object p1, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 559
    :cond_0
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v4

    monitor-enter v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 565
    :goto_1
    :try_start_1
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->close:Z
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$200(Lcom/stericson/RootShell/execution/Shell;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->write:I
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$300(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v3

    iget-object v5, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v5}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lt v3, v5, :cond_1

    .line 566
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    const/4 v5, 0x0

    iput-boolean v5, v3, Lcom/stericson/RootShell/execution/Shell;->isExecuting:Z

    .line 567
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V

    goto :goto_1

    .line 569
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 614
    :catch_0
    move-exception v1

    .line 615
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/stericson/RootShell/RootShell$LogLevel;->ERROR:Lcom/stericson/RootShell/RootShell$LogLevel;

    invoke-static {v3, v4, v1}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;Lcom/stericson/RootShell/RootShell$LogLevel;Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 619
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # setter for: Lcom/stericson/RootShell/execution/Shell;->write:I
    invoke-static {v3, v6}, Lcom/stericson/RootShell/execution/Shell;->access$302(Lcom/stericson/RootShell/execution/Shell;I)I

    .line 620
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v3, v4}, Lcom/stericson/RootShell/execution/Shell;->access$1000(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Writer;)V

    .line 622
    .end local v1    # "e":Ljava/io/IOException;
    :goto_2
    return-void

    .line 569
    :cond_1
    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 571
    :try_start_5
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->write:I
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$300(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v3

    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->maxCommands:I
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$400(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v4

    if-lt v3, v4, :cond_3

    .line 576
    :goto_3
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->read:I
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$500(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v3

    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->write:I
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$300(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v4

    if-eq v3, v4, :cond_2

    .line 577
    const-string v3, "Waiting for read and write to catch up before cleanup."

    invoke-static {v3}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_3

    .line 616
    :catch_1
    move-exception v1

    .line 617
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_6
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/stericson/RootShell/RootShell$LogLevel;->ERROR:Lcom/stericson/RootShell/RootShell$LogLevel;

    invoke-static {v3, v4, v1}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;Lcom/stericson/RootShell/RootShell$LogLevel;Ljava/lang/Exception;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 619
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # setter for: Lcom/stericson/RootShell/execution/Shell;->write:I
    invoke-static {v3, v6}, Lcom/stericson/RootShell/execution/Shell;->access$302(Lcom/stericson/RootShell/execution/Shell;I)I

    .line 620
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v3, v4}, Lcom/stericson/RootShell/execution/Shell;->access$1000(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Writer;)V

    goto :goto_2

    .line 582
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_2
    :try_start_7
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # invokes: Lcom/stericson/RootShell/execution/Shell;->cleanCommands()V
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$600(Lcom/stericson/RootShell/execution/Shell;)V

    .line 591
    :cond_3
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->write:I
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$300(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v3

    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 592
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/stericson/RootShell/execution/Shell;->isExecuting:Z

    .line 593
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->write:I
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$300(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v4

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/stericson/RootShell/execution/Command;

    .line 594
    .local v0, "cmd":Lcom/stericson/RootShell/execution/Command;
    invoke-virtual {v0}, Lcom/stericson/RootShell/execution/Command;->startExecution()V

    .line 595
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Executing: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/stericson/RootShell/execution/Command;->getCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with context: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->shellContext:Lcom/stericson/RootShell/execution/Shell$ShellContext;
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$700(Lcom/stericson/RootShell/execution/Shell;)Lcom/stericson/RootShell/execution/Shell$ShellContext;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 597
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v3

    invoke-virtual {v0}, Lcom/stericson/RootShell/execution/Command;->getCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 598
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\necho F*D^W@#FGF "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->totalExecuted:I
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$900(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " $?\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 599
    .local v2, "line":Ljava/lang/String;
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 600
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->flush()V

    .line 601
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # operator++ for: Lcom/stericson/RootShell/execution/Shell;->write:I
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$308(Lcom/stericson/RootShell/execution/Shell;)I

    .line 602
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # operator++ for: Lcom/stericson/RootShell/execution/Shell;->totalExecuted:I
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$908(Lcom/stericson/RootShell/execution/Shell;)I
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto/16 :goto_0

    .line 619
    .end local v0    # "cmd":Lcom/stericson/RootShell/execution/Command;
    .end local v2    # "line":Ljava/lang/String;
    :catchall_1
    move-exception v3

    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # setter for: Lcom/stericson/RootShell/execution/Shell;->write:I
    invoke-static {v4, v6}, Lcom/stericson/RootShell/execution/Shell;->access$302(Lcom/stericson/RootShell/execution/Shell;I)I

    .line 620
    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v5, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v5}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v5

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v4, v5}, Lcom/stericson/RootShell/execution/Shell;->access$1000(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Writer;)V

    throw v3

    .line 603
    :cond_4
    :try_start_8
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->close:Z
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$200(Lcom/stericson/RootShell/execution/Shell;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 607
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    const/4 v4, 0x0

    iput-boolean v4, v3, Lcom/stericson/RootShell/execution/Shell;->isExecuting:Z

    .line 608
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v3

    const-string v4, "\nexit 0\n"

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 609
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v3}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->flush()V

    .line 610
    const-string v3, "Closing shell"

    invoke-static {v3}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 619
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # setter for: Lcom/stericson/RootShell/execution/Shell;->write:I
    invoke-static {v3, v6}, Lcom/stericson/RootShell/execution/Shell;->access$302(Lcom/stericson/RootShell/execution/Shell;I)I

    .line 620
    iget-object v3, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v4, p0, Lcom/stericson/RootShell/execution/Shell$1;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v3, v4}, Lcom/stericson/RootShell/execution/Shell;->access$1000(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Writer;)V

    goto/16 :goto_2
.end method
