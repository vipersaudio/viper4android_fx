.class Lcom/stericson/RootShell/execution/Shell$3;
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
    .line 642
    iput-object p1, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v12, 0x2

    const/4 v14, 0x1

    const/4 v13, 0x0

    .line 645
    const/4 v2, 0x0

    .line 648
    .local v2, "command":Lcom/stericson/RootShell/execution/Command;
    :cond_0
    :goto_0
    :try_start_0
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->close:Z
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$200(Lcom/stericson/RootShell/execution/Shell;)Z

    move-result v10

    if-eqz v10, :cond_1

    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->inputStream:Ljava/io/BufferedReader;
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$1100(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/BufferedReader;->ready()Z

    move-result v10

    if-nez v10, :cond_1

    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->read:I
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$500(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v10

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-ge v10, v11, :cond_2

    .line 649
    :cond_1
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    const/4 v11, 0x0

    iput-boolean v11, v10, Lcom/stericson/RootShell/execution/Shell;->isReading:Z

    .line 650
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->inputStream:Ljava/io/BufferedReader;
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$1100(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    .line 651
    .local v8, "outputLine":Ljava/lang/String;
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    const/4 v11, 0x1

    iput-boolean v11, v10, Lcom/stericson/RootShell/execution/Shell;->isReading:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 656
    if-nez v8, :cond_4

    .line 755
    .end local v8    # "outputLine":Ljava/lang/String;
    :cond_2
    :goto_1
    :try_start_1
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$1300(Lcom/stericson/RootShell/execution/Shell;)Ljava/lang/Process;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Process;->waitFor()I

    .line 756
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->proc:Ljava/lang/Process;
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$1300(Lcom/stericson/RootShell/execution/Shell;)Ljava/lang/Process;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Process;->destroy()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 760
    :goto_2
    :try_start_2
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->read:I
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$500(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v10

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-ge v10, v11, :cond_c

    .line 761
    if-nez v2, :cond_3

    .line 762
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v10

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->read:I
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$500(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v11

    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lcom/stericson/RootShell/execution/Command;

    move-object v2, v0

    .line 765
    :cond_3
    iget v10, v2, Lcom/stericson/RootShell/execution/Command;->totalOutput:I

    iget v11, v2, Lcom/stericson/RootShell/execution/Command;->totalOutputProcessed:I

    if-ge v10, v11, :cond_b

    .line 767
    const-string v10, "All output not processed!"

    invoke-virtual {v2, v10}, Lcom/stericson/RootShell/execution/Command;->terminated(Ljava/lang/String;)V

    .line 768
    const-string v10, "Did you forget the super.commandOutput call or are you waiting on the command object?"

    invoke-virtual {v2, v10}, Lcom/stericson/RootShell/execution/Command;->terminated(Ljava/lang/String;)V

    .line 775
    :goto_3
    const/4 v2, 0x0

    .line 776
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # operator++ for: Lcom/stericson/RootShell/execution/Shell;->read:I
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$508(Lcom/stericson/RootShell/execution/Shell;)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    .line 781
    :catch_0
    move-exception v3

    .line 782
    .local v3, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    sget-object v11, Lcom/stericson/RootShell/RootShell$LogLevel;->ERROR:Lcom/stericson/RootShell/RootShell$LogLevel;

    invoke-static {v10, v11, v3}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;Lcom/stericson/RootShell/RootShell$LogLevel;Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 784
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v11

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v10, v11}, Lcom/stericson/RootShell/execution/Shell;->access$1000(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Writer;)V

    .line 785
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->errorStream:Ljava/io/BufferedReader;
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$1400(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v11

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V
    invoke-static {v10, v11}, Lcom/stericson/RootShell/execution/Shell;->access$1500(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Reader;)V

    .line 786
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->inputStream:Ljava/io/BufferedReader;
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$1100(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v11

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V
    invoke-static {v10, v11}, Lcom/stericson/RootShell/execution/Shell;->access$1500(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Reader;)V

    .line 788
    const-string v10, "Shell destroyed"

    invoke-static {v10}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 789
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iput-boolean v14, v10, Lcom/stericson/RootShell/execution/Shell;->isClosed:Z

    .line 790
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iput-boolean v13, v10, Lcom/stericson/RootShell/execution/Shell;->isReading:Z

    .line 792
    .end local v3    # "e":Ljava/io/IOException;
    :goto_4
    return-void

    .line 660
    .restart local v8    # "outputLine":Ljava/lang/String;
    :cond_4
    if-nez v2, :cond_6

    .line 661
    :try_start_4
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->read:I
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$500(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v10

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-lt v10, v11, :cond_5

    .line 662
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->close:Z
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$200(Lcom/stericson/RootShell/execution/Shell;)Z

    move-result v10

    if-eqz v10, :cond_0

    goto/16 :goto_1

    .line 669
    :cond_5
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v10

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->read:I
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$500(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v11

    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lcom/stericson/RootShell/execution/Command;

    move-object v2, v0

    .line 677
    :cond_6
    const/4 v9, -0x1

    .line 679
    .local v9, "pos":I
    const-string v10, "F*D^W@#FGF"

    invoke-virtual {v8, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    .line 681
    const/4 v10, -0x1

    if-ne v9, v10, :cond_9

    .line 685
    iget v10, v2, Lcom/stericson/RootShell/execution/Command;->id:I

    invoke-virtual {v2, v10, v8}, Lcom/stericson/RootShell/execution/Command;->output(ILjava/lang/String;)V

    .line 693
    :cond_7
    :goto_5
    if-ltz v9, :cond_0

    .line 694
    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 695
    const-string v10, " "

    invoke-virtual {v8, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 697
    .local v5, "fields":[Ljava/lang/String;
    array-length v10, v5

    if-lt v10, v12, :cond_0

    const/4 v10, 0x1

    aget-object v10, v5, v10
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v10, :cond_0

    .line 698
    const/4 v6, 0x0

    .line 701
    .local v6, "id":I
    const/4 v10, 0x1

    :try_start_5
    aget-object v10, v5, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result v6

    .line 705
    :goto_6
    const/4 v4, -0x1

    .line 708
    .local v4, "exitCode":I
    const/4 v10, 0x2

    :try_start_6
    aget-object v10, v5, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    move-result v4

    .line 712
    :goto_7
    :try_start_7
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->totalRead:I
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$1200(Lcom/stericson/RootShell/execution/Shell;)I

    move-result v10

    if-ne v6, v10, :cond_0

    .line 713
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    invoke-virtual {v10, v2}, Lcom/stericson/RootShell/execution/Shell;->processErrors(Lcom/stericson/RootShell/execution/Command;)V

    .line 720
    const/4 v7, 0x0

    .line 721
    .local v7, "iterations":I
    :goto_8
    iget v10, v2, Lcom/stericson/RootShell/execution/Command;->totalOutput:I

    iget v11, v2, Lcom/stericson/RootShell/execution/Command;->totalOutputProcessed:I

    if-le v10, v11, :cond_a

    .line 723
    if-nez v7, :cond_8

    .line 725
    add-int/lit8 v7, v7, 0x1

    .line 726
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Waiting for output to be processed. "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v2, Lcom/stericson/RootShell/execution/Command;->totalOutputProcessed:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Of "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v2, Lcom/stericson/RootShell/execution/Command;->totalOutput:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 731
    :cond_8
    :try_start_8
    monitor-enter p0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 733
    const-wide/16 v10, 0x7d0

    :try_start_9
    invoke-virtual {p0, v10, v11}, Ljava/lang/Object;->wait(J)V

    .line 734
    monitor-exit p0

    goto :goto_8

    :catchall_0
    move-exception v10

    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    :try_start_a
    throw v10
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 735
    :catch_1
    move-exception v3

    .line 736
    .local v3, "e":Ljava/lang/Exception;
    :try_start_b
    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto :goto_8

    .line 784
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "exitCode":I
    .end local v5    # "fields":[Ljava/lang/String;
    .end local v6    # "id":I
    .end local v7    # "iterations":I
    .end local v8    # "outputLine":Ljava/lang/String;
    .end local v9    # "pos":I
    :catchall_1
    move-exception v10

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v12, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v12}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v12

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v11, v12}, Lcom/stericson/RootShell/execution/Shell;->access$1000(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Writer;)V

    .line 785
    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v12, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->errorStream:Ljava/io/BufferedReader;
    invoke-static {v12}, Lcom/stericson/RootShell/execution/Shell;->access$1400(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v12

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V
    invoke-static {v11, v12}, Lcom/stericson/RootShell/execution/Shell;->access$1500(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Reader;)V

    .line 786
    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v12, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->inputStream:Ljava/io/BufferedReader;
    invoke-static {v12}, Lcom/stericson/RootShell/execution/Shell;->access$1100(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v12

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V
    invoke-static {v11, v12}, Lcom/stericson/RootShell/execution/Shell;->access$1500(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Reader;)V

    .line 788
    const-string v11, "Shell destroyed"

    invoke-static {v11}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 789
    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iput-boolean v14, v11, Lcom/stericson/RootShell/execution/Shell;->isClosed:Z

    .line 790
    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iput-boolean v13, v11, Lcom/stericson/RootShell/execution/Shell;->isReading:Z

    throw v10

    .line 686
    .restart local v8    # "outputLine":Ljava/lang/String;
    .restart local v9    # "pos":I
    :cond_9
    if-lez v9, :cond_7

    .line 690
    :try_start_c
    iget v10, v2, Lcom/stericson/RootShell/execution/Command;->id:I

    const/4 v11, 0x0

    invoke-virtual {v8, v11, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v2, v10, v11}, Lcom/stericson/RootShell/execution/Command;->output(ILjava/lang/String;)V

    goto/16 :goto_5

    .line 740
    .restart local v4    # "exitCode":I
    .restart local v5    # "fields":[Ljava/lang/String;
    .restart local v6    # "id":I
    .restart local v7    # "iterations":I
    :cond_a
    const-string v10, "Read all output"

    invoke-static {v10}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 742
    invoke-virtual {v2, v4}, Lcom/stericson/RootShell/execution/Command;->setExitCode(I)V

    .line 743
    invoke-virtual {v2}, Lcom/stericson/RootShell/execution/Command;->commandFinished()V

    .line 744
    const/4 v2, 0x0

    .line 746
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # operator++ for: Lcom/stericson/RootShell/execution/Shell;->read:I
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$508(Lcom/stericson/RootShell/execution/Shell;)I

    .line 747
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # operator++ for: Lcom/stericson/RootShell/execution/Shell;->totalRead:I
    invoke-static {v10}, Lcom/stericson/RootShell/execution/Shell;->access$1208(Lcom/stericson/RootShell/execution/Shell;)I

    goto/16 :goto_0

    .line 772
    .end local v4    # "exitCode":I
    .end local v5    # "fields":[Ljava/lang/String;
    .end local v6    # "id":I
    .end local v7    # "iterations":I
    .end local v8    # "outputLine":Ljava/lang/String;
    .end local v9    # "pos":I
    :cond_b
    const-string v10, "Unexpected Termination."

    invoke-virtual {v2, v10}, Lcom/stericson/RootShell/execution/Command;->terminated(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 779
    :cond_c
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    const/4 v11, 0x0

    # setter for: Lcom/stericson/RootShell/execution/Shell;->read:I
    invoke-static {v10, v11}, Lcom/stericson/RootShell/execution/Shell;->access$502(Lcom/stericson/RootShell/execution/Shell;I)I
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 784
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->outputStream:Ljava/io/OutputStreamWriter;
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$800(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v11

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v10, v11}, Lcom/stericson/RootShell/execution/Shell;->access$1000(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Writer;)V

    .line 785
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->errorStream:Ljava/io/BufferedReader;
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$1400(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v11

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V
    invoke-static {v10, v11}, Lcom/stericson/RootShell/execution/Shell;->access$1500(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Reader;)V

    .line 786
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iget-object v11, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->inputStream:Ljava/io/BufferedReader;
    invoke-static {v11}, Lcom/stericson/RootShell/execution/Shell;->access$1100(Lcom/stericson/RootShell/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v11

    # invokes: Lcom/stericson/RootShell/execution/Shell;->closeQuietly(Ljava/io/Reader;)V
    invoke-static {v10, v11}, Lcom/stericson/RootShell/execution/Shell;->access$1500(Lcom/stericson/RootShell/execution/Shell;Ljava/io/Reader;)V

    .line 788
    const-string v10, "Shell destroyed"

    invoke-static {v10}, Lcom/stericson/RootShell/RootShell;->log(Ljava/lang/String;)V

    .line 789
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iput-boolean v14, v10, Lcom/stericson/RootShell/execution/Shell;->isClosed:Z

    .line 790
    iget-object v10, p0, Lcom/stericson/RootShell/execution/Shell$3;->this$0:Lcom/stericson/RootShell/execution/Shell;

    iput-boolean v13, v10, Lcom/stericson/RootShell/execution/Shell;->isReading:Z

    goto/16 :goto_4

    .line 757
    :catch_2
    move-exception v10

    goto/16 :goto_2

    .line 709
    .restart local v4    # "exitCode":I
    .restart local v5    # "fields":[Ljava/lang/String;
    .restart local v6    # "id":I
    .restart local v8    # "outputLine":Ljava/lang/String;
    .restart local v9    # "pos":I
    :catch_3
    move-exception v10

    goto/16 :goto_7

    .line 702
    .end local v4    # "exitCode":I
    :catch_4
    move-exception v10

    goto/16 :goto_6
.end method
