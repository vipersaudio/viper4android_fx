.class Lcom/stericson/RootShell/execution/Shell$2;
.super Ljava/lang/Thread;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/stericson/RootShell/execution/Shell;->notifyThreads()V
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
    .line 626
    iput-object p1, p0, Lcom/stericson/RootShell/execution/Shell$2;->this$0:Lcom/stericson/RootShell/execution/Shell;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 628
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Shell$2;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v0}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v1

    monitor-enter v1

    .line 629
    :try_start_0
    iget-object v0, p0, Lcom/stericson/RootShell/execution/Shell$2;->this$0:Lcom/stericson/RootShell/execution/Shell;

    # getter for: Lcom/stericson/RootShell/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v0}, Lcom/stericson/RootShell/execution/Shell;->access$100(Lcom/stericson/RootShell/execution/Shell;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 630
    monitor-exit v1

    .line 631
    return-void

    .line 630
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
