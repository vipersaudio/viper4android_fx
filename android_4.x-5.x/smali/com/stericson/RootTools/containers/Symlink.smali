.class public Lcom/stericson/RootTools/containers/Symlink;
.super Ljava/lang/Object;
.source "Symlink.java"


# instance fields
.field protected final file:Ljava/io/File;

.field protected final symlinkPath:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;
    .param p2, "path"    # Ljava/io/File;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/stericson/RootTools/containers/Symlink;->file:Ljava/io/File;

    .line 35
    iput-object p2, p0, Lcom/stericson/RootTools/containers/Symlink;->symlinkPath:Ljava/io/File;

    .line 36
    return-void
.end method


# virtual methods
.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/stericson/RootTools/containers/Symlink;->file:Ljava/io/File;

    return-object v0
.end method

.method public getSymlinkPath()Ljava/io/File;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/stericson/RootTools/containers/Symlink;->symlinkPath:Ljava/io/File;

    return-object v0
.end method
