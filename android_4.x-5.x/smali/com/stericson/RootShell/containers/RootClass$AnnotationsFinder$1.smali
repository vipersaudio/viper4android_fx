.class Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder$1;
.super Ljava/lang/Object;
.source "RootClass.java"

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder;->lookup(Ljava/io/File;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder;

.field final synthetic val$fileNamePrefix:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 194
    iput-object p1, p0, Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder$1;->this$0:Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder;

    iput-object p2, p0, Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder$1;->val$fileNamePrefix:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 1
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder$1;->val$fileNamePrefix:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
