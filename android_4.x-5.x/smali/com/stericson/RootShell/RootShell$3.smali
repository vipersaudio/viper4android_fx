.class final Lcom/stericson/RootShell/RootShell$3;
.super Lcom/stericson/RootShell/execution/Command;
.source "RootShell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/stericson/RootShell/RootShell;->isAccessGiven()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$ID:Ljava/util/Set;


# direct methods
.method varargs constructor <init>(IZ[Ljava/lang/String;Ljava/util/Set;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # Z
    .param p3, "x2"    # [Ljava/lang/String;

    .prologue
    .line 361
    iput-object p4, p0, Lcom/stericson/RootShell/RootShell$3;->val$ID:Ljava/util/Set;

    invoke-direct {p0, p1, p2, p3}, Lcom/stericson/RootShell/execution/Command;-><init>(IZ[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public commandOutput(ILjava/lang/String;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 364
    const/16 v0, 0x9e

    if-ne p1, v0, :cond_0

    .line 365
    iget-object v0, p0, Lcom/stericson/RootShell/RootShell$3;->val$ID:Ljava/util/Set;

    const-string v1, " "

    invoke-virtual {p2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 368
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/stericson/RootShell/execution/Command;->commandOutput(ILjava/lang/String;)V

    .line 369
    return-void
.end method
