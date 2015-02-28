.class public Lcom/stericson/RootShell/exceptions/RootDeniedException;
.super Ljava/lang/Exception;
.source "RootDeniedException.java"


# static fields
.field private static final serialVersionUID:J = -0x78ee28d2a3ae4edeL


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 31
    return-void
.end method
