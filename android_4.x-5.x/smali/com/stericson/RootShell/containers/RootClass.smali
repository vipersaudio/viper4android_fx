.class public Lcom/stericson/RootShell/containers/RootClass;
.super Ljava/lang/Object;
.source "RootClass.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/stericson/RootShell/containers/RootClass$1;,
        Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder;,
        Lcom/stericson/RootShell/containers/RootClass$RootArgs;,
        Lcom/stericson/RootShell/containers/RootClass$Candidate;,
        Lcom/stericson/RootShell/containers/RootClass$READ_STATE;
    }
.end annotation


# static fields
.field static PATH_TO_DX:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-string v0, "/Users/Chris/Projects/android-sdk-macosx/build-tools/18.0.1/dx"

    sput-object v0, Lcom/stericson/RootShell/containers/RootClass;->PATH_TO_DX:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .locals 8
    .param p1, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    aget-object v3, p1, v6

    .line 45
    .local v3, "className":Ljava/lang/String;
    new-instance v0, Lcom/stericson/RootShell/containers/RootClass$RootArgs;

    invoke-direct {v0, p0}, Lcom/stericson/RootShell/containers/RootClass$RootArgs;-><init>(Lcom/stericson/RootShell/containers/RootClass;)V

    .line 46
    .local v0, "actualArgs":Lcom/stericson/RootShell/containers/RootClass$RootArgs;
    array-length v4, p1

    add-int/lit8 v4, v4, -0x1

    new-array v4, v4, [Ljava/lang/String;

    iput-object v4, v0, Lcom/stericson/RootShell/containers/RootClass$RootArgs;->args:[Ljava/lang/String;

    .line 47
    iget-object v4, v0, Lcom/stericson/RootShell/containers/RootClass$RootArgs;->args:[Ljava/lang/String;

    array-length v5, p1

    add-int/lit8 v5, v5, -0x1

    invoke-static {p1, v7, v4, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 49
    .local v2, "classHandler":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v4, v7, [Ljava/lang/Class;

    const-class v5, Lcom/stericson/RootShell/containers/RootClass$RootArgs;

    aput-object v5, v4, v6

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 50
    .local v1, "classConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v4, v7, [Ljava/lang/Object;

    aput-object v0, v4, v6

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    return-void
.end method

.method static displayError(Ljava/lang/Exception;)V
    .locals 3
    .param p0, "e"    # Ljava/lang/Exception;

    .prologue
    .line 67
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "##ERR##"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "##"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 68
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 69
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 2
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 321
    :try_start_0
    array-length v1, p0

    if-nez v1, :cond_0

    .line 322
    new-instance v1, Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder;

    invoke-direct {v1}, Lcom/stericson/RootShell/containers/RootClass$AnnotationsFinder;-><init>()V

    .line 329
    :goto_0
    return-void

    .line 324
    :cond_0
    new-instance v1, Lcom/stericson/RootShell/containers/RootClass;

    invoke-direct {v1, p0}, Lcom/stericson/RootShell/containers/RootClass;-><init>([Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 326
    :catch_0
    move-exception v0

    .line 327
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/stericson/RootShell/containers/RootClass;->displayError(Ljava/lang/Exception;)V

    goto :goto_0
.end method
