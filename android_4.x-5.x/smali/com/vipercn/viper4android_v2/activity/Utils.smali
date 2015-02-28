.class public Lcom/vipercn/viper4android_v2/activity/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;,
        Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addondExists()Z
    .locals 2

    .prologue
    .line 629
    new-instance v0, Ljava/io/File;

    const-string v1, "/system/addon.d/"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 630
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static checkFileContainsKeyLower(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 12
    .param p0, "szFilePathName"    # Ljava/lang/String;
    .param p1, "szKey"    # Ljava/lang/String;
    .param p2, "szEncoding"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 474
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 476
    const/4 v5, 0x0

    .line 477
    .local v5, "fisInput":Ljava/io/FileInputStream;
    const/4 v7, 0x0

    .line 478
    .local v7, "isrInput":Ljava/io/InputStreamReader;
    const/4 v1, 0x0

    .line 480
    .local v1, "bufferInput":Ljava/io/BufferedReader;
    const/4 v0, 0x0

    .line 481
    .local v0, "bFoundKey":Z
    :try_start_0
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 482
    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .local v6, "fisInput":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v8, Ljava/io/InputStreamReader;

    invoke-direct {v8, v6, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 483
    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .local v8, "isrInput":Ljava/io/InputStreamReader;
    :try_start_2
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 485
    .end local v1    # "bufferInput":Ljava/io/BufferedReader;
    .local v2, "bufferInput":Ljava/io/BufferedReader;
    :cond_0
    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 486
    .local v3, "currLine":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 493
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 494
    invoke-virtual {v8}, Ljava/io/InputStreamReader;->close()V

    .line 495
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V

    .line 496
    const/4 v5, 0x0

    .line 497
    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    const/4 v7, 0x0

    .line 498
    .end local v8    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    const/4 v1, 0x0

    .line 514
    .end local v0    # "bFoundKey":Z
    .end local v2    # "bufferInput":Ljava/io/BufferedReader;
    .end local v3    # "currLine":Ljava/lang/String;
    .restart local v1    # "bufferInput":Ljava/io/BufferedReader;
    :goto_1
    return v0

    .line 487
    .end local v1    # "bufferInput":Ljava/io/BufferedReader;
    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v0    # "bFoundKey":Z
    .restart local v2    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v3    # "currLine":Ljava/lang/String;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v8    # "isrInput":Ljava/io/InputStreamReader;
    :cond_1
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    const-string v11, "#"

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 488
    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_8
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5

    move-result v10

    if-eqz v10, :cond_0

    .line 489
    const/4 v0, 0x1

    goto :goto_0

    .line 500
    .end local v2    # "bufferInput":Ljava/io/BufferedReader;
    .end local v3    # "currLine":Ljava/lang/String;
    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .end local v8    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v1    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    :catch_0
    move-exception v4

    .line 501
    .local v4, "e":Ljava/io/FileNotFoundException;
    :goto_2
    const/4 v5, 0x0

    .line 502
    const/4 v7, 0x0

    .line 503
    const/4 v1, 0x0

    move v0, v9

    .line 504
    goto :goto_1

    .line 505
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v4

    .line 506
    .local v4, "e":Ljava/io/UnsupportedEncodingException;
    :goto_3
    const/4 v5, 0x0

    .line 507
    const/4 v7, 0x0

    .line 508
    const/4 v1, 0x0

    move v0, v9

    .line 509
    goto :goto_1

    .line 510
    .end local v4    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_2
    move-exception v4

    .line 511
    .local v4, "e":Ljava/io/IOException;
    :goto_4
    const/4 v5, 0x0

    .line 512
    const/4 v7, 0x0

    .line 513
    const/4 v1, 0x0

    move v0, v9

    .line 514
    goto :goto_1

    .line 510
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    :catch_3
    move-exception v4

    move-object v5, v6

    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_4

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v8    # "isrInput":Ljava/io/InputStreamReader;
    :catch_4
    move-exception v4

    move-object v7, v8

    .end local v8    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    move-object v5, v6

    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_4

    .end local v1    # "bufferInput":Ljava/io/BufferedReader;
    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v2    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v8    # "isrInput":Ljava/io/InputStreamReader;
    :catch_5
    move-exception v4

    move-object v1, v2

    .end local v2    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v1    # "bufferInput":Ljava/io/BufferedReader;
    move-object v7, v8

    .end local v8    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    move-object v5, v6

    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_4

    .line 505
    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    :catch_6
    move-exception v4

    move-object v5, v6

    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_3

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v8    # "isrInput":Ljava/io/InputStreamReader;
    :catch_7
    move-exception v4

    move-object v7, v8

    .end local v8    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    move-object v5, v6

    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_3

    .end local v1    # "bufferInput":Ljava/io/BufferedReader;
    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v2    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v8    # "isrInput":Ljava/io/InputStreamReader;
    :catch_8
    move-exception v4

    move-object v1, v2

    .end local v2    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v1    # "bufferInput":Ljava/io/BufferedReader;
    move-object v7, v8

    .end local v8    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    move-object v5, v6

    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_3

    .line 500
    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    :catch_9
    move-exception v4

    move-object v5, v6

    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_2

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v8    # "isrInput":Ljava/io/InputStreamReader;
    :catch_a
    move-exception v4

    move-object v7, v8

    .end local v8    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    move-object v5, v6

    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_2

    .end local v1    # "bufferInput":Ljava/io/BufferedReader;
    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v2    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v8    # "isrInput":Ljava/io/InputStreamReader;
    :catch_b
    move-exception v4

    move-object v1, v2

    .end local v2    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v1    # "bufferInput":Ljava/io/BufferedReader;
    move-object v7, v8

    .end local v8    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    move-object v5, v6

    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_2
.end method

.method public static copyAssetsToLocal(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 12
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "mSourceName"    # Ljava/lang/String;
    .param p2, "mDestinationName"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 652
    invoke-static {p0}, Lcom/vipercn/viper4android_v2/activity/Utils;->getBasePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 653
    .local v4, "mBasePath":Ljava/lang/String;
    const-string v9, ""

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 679
    :goto_0
    return v8

    .line 654
    :cond_0
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 658
    move-object v7, p2

    .line 660
    .local v7, "outFileName":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 661
    .local v2, "hfOutput":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 662
    :cond_1
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 663
    .local v6, "myOutput":Ljava/io/OutputStream;
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    invoke-virtual {v9, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 664
    .local v5, "myInput":Ljava/io/InputStream;
    const/16 v9, 0x1000

    new-array v0, v9, [B

    .line 666
    .local v0, "buffer":[B
    :goto_1
    invoke-virtual {v5, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "length":I
    if-gtz v3, :cond_2

    .line 668
    invoke-virtual {v6}, Ljava/io/OutputStream;->flush()V

    .line 669
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 670
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 671
    const/4 v0, 0x0

    .line 672
    const/4 v5, 0x0

    .line 673
    const/4 v6, 0x0

    .line 679
    const/4 v8, 0x1

    goto :goto_0

    .line 667
    :cond_2
    const/4 v9, 0x0

    invoke-virtual {v6, v0, v9, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 674
    .end local v0    # "buffer":[B
    .end local v2    # "hfOutput":Ljava/io/File;
    .end local v3    # "length":I
    .end local v5    # "myInput":Ljava/io/InputStream;
    .end local v6    # "myOutput":Ljava/io/OutputStream;
    :catch_0
    move-exception v1

    .line 675
    .local v1, "e":Ljava/lang/Exception;
    const-string v9, "ViPER4Android"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "CopyAssetsToLocal() failed, msg = "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getBasePath(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 635
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 636
    .local v1, "mContext":Landroid/content/Context;
    const-string v0, ""

    .line 637
    .local v0, "mBasePath":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 639
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 640
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 647
    :cond_0
    :goto_0
    return-object v0

    .line 641
    :cond_1
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_0

    .line 642
    const-string v0, ""

    .line 644
    goto :goto_0

    .line 645
    :cond_2
    const-string v0, ""

    goto :goto_0
.end method

.method private static getFileLength(Ljava/lang/String;)J
    .locals 2
    .param p0, "mFileName"    # Ljava/lang/String;

    .prologue
    .line 342
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    .line 343
    :goto_0
    return-wide v0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    goto :goto_0
.end method

.method public static getFileNameList(Ljava/io/File;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 6
    .param p0, "path"    # Ljava/io/File;
    .param p1, "fileExt"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 348
    .local p2, "fileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 349
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 350
    .local v3, "files":[Ljava/io/File;
    if-nez v3, :cond_1

    .line 358
    .end local v3    # "files":[Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 351
    .restart local v3    # "files":[Ljava/io/File;
    :cond_1
    array-length v5, v3

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v5, :cond_0

    aget-object v0, v3, v4

    .local v0, "file":Ljava/io/File;
    invoke-static {v0, p1, p2}, Lcom/vipercn/viper4android_v2/activity/Utils;->getFileNameList(Ljava/io/File;Ljava/lang/String;Ljava/util/ArrayList;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 353
    .end local v0    # "file":Ljava/io/File;
    .end local v3    # "files":[Ljava/io/File;
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 354
    .local v2, "filePath":Ljava/lang/String;
    const-string v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 355
    .local v1, "fileName":Ljava/lang/String;
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 356
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public static getProfileList(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 10
    .param p0, "mProfileDir"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 394
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 395
    .local v1, "fProfileDirHandle":Ljava/io/File;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 396
    .local v6, "profileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v7, ".prf"

    invoke-static {v1, v7, v6}, Lcom/vipercn/viper4android_v2/activity/Utils;->getFileNameList(Ljava/io/File;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 398
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 399
    .local v5, "mProfileNameList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_0

    .line 404
    const/4 v6, 0x0

    .line 408
    .end local v1    # "fProfileDirHandle":Ljava/io/File;
    .end local v5    # "mProfileNameList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "profileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_1
    return-object v5

    .line 399
    .restart local v1    # "fProfileDirHandle":Ljava/io/File;
    .restart local v5    # "mProfileNameList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v6    # "profileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 400
    .local v4, "mProfileList":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 401
    .local v2, "mFileName":Ljava/lang/String;
    invoke-static {v2}, Lcom/vipercn/viper4android_v2/activity/Utils;->getProfileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 402
    .local v3, "mName":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 407
    .end local v1    # "fProfileDirHandle":Ljava/io/File;
    .end local v2    # "mFileName":Ljava/lang/String;
    .end local v3    # "mName":Ljava/lang/String;
    .end local v4    # "mProfileList":Ljava/lang/String;
    .end local v5    # "mProfileNameList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "profileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 408
    .local v0, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    goto :goto_1
.end method

.method private static getProfileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "mProfileFileName"    # Ljava/lang/String;

    .prologue
    .line 363
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 364
    .local v2, "fisInput":Ljava/io/FileInputStream;
    new-instance v3, Ljava/io/InputStreamReader;

    const-string v7, "UTF-8"

    invoke-direct {v3, v2, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 365
    .local v3, "isrInput":Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 366
    .local v0, "bufferInput":Ljava/io/BufferedReader;
    const-string v6, ""

    .line 368
    .local v6, "mProfileName":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .line 369
    .local v5, "mLine":Ljava/lang/String;
    if-nez v5, :cond_1

    .line 379
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 380
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V

    .line 381
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 382
    const/4 v0, 0x0

    .line 383
    const/4 v3, 0x0

    .line 384
    const/4 v2, 0x0

    .line 387
    .end local v0    # "bufferInput":Ljava/io/BufferedReader;
    .end local v2    # "fisInput":Ljava/io/FileInputStream;
    .end local v3    # "isrInput":Ljava/io/InputStreamReader;
    .end local v5    # "mLine":Ljava/lang/String;
    .end local v6    # "mProfileName":Ljava/lang/String;
    :goto_1
    return-object v6

    .line 370
    .restart local v0    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v2    # "fisInput":Ljava/io/FileInputStream;
    .restart local v3    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v5    # "mLine":Ljava/lang/String;
    .restart local v6    # "mProfileName":Ljava/lang/String;
    :cond_1
    const-string v7, "#"

    invoke-virtual {v5, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 372
    const-string v7, "="

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 373
    .local v4, "mChunks":[Ljava/lang/String;
    array-length v7, v4

    const/4 v8, 0x2

    if-ne v7, v8, :cond_0

    .line 374
    const/4 v7, 0x0

    aget-object v7, v4, v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v8, "profile_name"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 375
    const/4 v7, 0x1

    aget-object v6, v4, v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 386
    .end local v0    # "bufferInput":Ljava/io/BufferedReader;
    .end local v2    # "fisInput":Ljava/io/FileInputStream;
    .end local v3    # "isrInput":Ljava/io/InputStreamReader;
    .end local v4    # "mChunks":[Ljava/lang/String;
    .end local v5    # "mLine":Ljava/lang/String;
    .end local v6    # "mProfileName":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 387
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, ""

    goto :goto_1
.end method

.method public static installDrv_FX(Landroid/content/Context;Ljava/lang/String;)I
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "mDriverName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x6

    .line 956
    invoke-static {p0, p1}, Lcom/vipercn/viper4android_v2/activity/Utils;->installDrv_FX_RootTools(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 957
    .local v0, "method1Result":I
    packed-switch v0, :pswitch_data_0

    move v0, v1

    .line 972
    .end local v0    # "method1Result":I
    :goto_0
    :pswitch_0
    return v0

    .restart local v0    # "method1Result":I
    :pswitch_1
    move v0, v1

    .line 969
    goto :goto_0

    .line 957
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private static installDrv_FX_RootTools(Landroid/content/Context;Ljava/lang/String;)I
    .locals 22
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "mDriverName"    # Ljava/lang/String;

    .prologue
    .line 723
    const/4 v8, 0x0

    .line 726
    .local v8, "isAddondSupported":Z
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v17

    const-string v18, "mounted"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1

    .line 727
    const/4 v14, 0x2

    .line 950
    :cond_0
    :goto_0
    return v14

    .line 730
    :cond_1
    const-string v17, "libv4a_fx_ics.so"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-static {v0, v1, v2}, Lcom/vipercn/viper4android_v2/activity/Utils;->copyAssetsToLocal(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_2

    .line 731
    const/4 v14, 0x3

    goto :goto_0

    .line 734
    :cond_2
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/Utils;->addondExists()Z

    move-result v17

    if-eqz v17, :cond_3

    .line 735
    const-string v17, "91-v4a.sh"

    const-string v18, "91-v4a.sh"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/vipercn/viper4android_v2/activity/Utils;->copyAssetsToLocal(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 736
    const/4 v8, 0x1

    .line 740
    :cond_3
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->isAccessGiven()Z

    move-result v17

    if-nez v17, :cond_4

    const/4 v14, 0x1

    goto :goto_0

    .line 744
    :cond_4
    const-string v17, "chmod"

    invoke-static/range {v17 .. v17}, Lcom/stericson/RootTools/RootTools;->checkUtil(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_c

    .line 745
    const-string v11, "chmod"

    .line 756
    .local v11, "mChmod":Ljava/lang/String;
    :goto_1
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getExternalStoragePath()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, "v4a_audio_system.conf"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 757
    .local v12, "mSystemConf":Ljava/lang/String;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getExternalStoragePath()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, "v4a_audio_vendor.conf"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 760
    .local v13, "mVendorConf":Ljava/lang/String;
    const/4 v3, 0x1

    .line 761
    .local v3, "bConfigModified":Z
    const-string v17, "/system/etc/audio_effects.conf"

    const-string v18, "41d3c987-e6cf-11e3-a88a-11aba5d5c51b"

    const-string v19, "ASCII"

    invoke-static/range {v17 .. v19}, Lcom/vipercn/viper4android_v2/activity/Utils;->checkFileContainsKeyLower(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v17

    and-int v3, v3, v17

    .line 762
    const-string v17, "/system/vendor/etc/audio_effects.conf"

    invoke-static/range {v17 .. v17}, Lcom/stericson/RootTools/RootTools;->exists(Ljava/lang/String;)Z

    move-result v7

    .line 763
    .local v7, "ifVendorExists":Z
    if-eqz v7, :cond_5

    .line 764
    const-string v17, "/system/vendor/etc/audio_effects.conf"

    const-string v18, "41d3c987-e6cf-11e3-a88a-11aba5d5c51b"

    const-string v19, "ASCII"

    invoke-static/range {v17 .. v19}, Lcom/vipercn/viper4android_v2/activity/Utils;->checkFileContainsKeyLower(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v17

    and-int v3, v3, v17

    .line 765
    :cond_5
    if-nez v3, :cond_12

    .line 767
    if-eqz v7, :cond_f

    .line 769
    const-string v17, "/system/etc/audio_effects.conf"

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v0, v12, v1, v2}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    .line 770
    const-string v17, "/system/vendor/etc/audio_effects.conf"

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v0, v13, v1, v2}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    .line 776
    :goto_2
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v12, v0}, Lcom/vipercn/viper4android_v2/activity/Utils;->modifyFXConfig(Ljava/lang/String;Ljava/lang/String;)I

    move-result v14

    .line 777
    .local v14, "modifyResult1":I
    const/4 v15, 0x0

    .line 778
    .local v15, "modifyResult2":I
    if-eqz v7, :cond_6

    .line 779
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v13, v0}, Lcom/vipercn/viper4android_v2/activity/Utils;->modifyFXConfig(Ljava/lang/String;Ljava/lang/String;)I

    move-result v15

    .line 781
    :cond_6
    if-nez v14, :cond_7

    if-eqz v15, :cond_12

    .line 784
    :cond_7
    if-eqz v7, :cond_10

    .line 785
    const/16 v17, 0x0

    :try_start_0
    move/from16 v0, v17

    invoke-static {v12, v0}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_8

    .line 786
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, v17

    invoke-direct {v0, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 787
    :cond_8
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-static {v13, v0}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_9

    .line 788
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, v17

    invoke-direct {v0, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 789
    :cond_9
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_a

    .line 790
    new-instance v17, Ljava/io/File;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v19, ".out"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 791
    :cond_a
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_b

    .line 792
    new-instance v17, Ljava/io/File;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v19, ".out"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 800
    :cond_b
    :goto_3
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->closeAllShells()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 801
    if-nez v14, :cond_0

    move v14, v15

    .line 802
    goto/16 :goto_0

    .line 747
    .end local v3    # "bConfigModified":Z
    .end local v7    # "ifVendorExists":Z
    .end local v11    # "mChmod":Ljava/lang/String;
    .end local v12    # "mSystemConf":Ljava/lang/String;
    .end local v13    # "mVendorConf":Ljava/lang/String;
    .end local v14    # "modifyResult1":I
    .end local v15    # "modifyResult2":I
    :cond_c
    const-string v17, "busybox"

    invoke-static/range {v17 .. v17}, Lcom/stericson/RootTools/RootTools;->checkUtil(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_d

    const-string v17, "chmod"

    const-string v18, "busybox"

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->hasUtil(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_d

    .line 748
    const-string v11, "busybox chmod"

    .restart local v11    # "mChmod":Ljava/lang/String;
    goto/16 :goto_1

    .line 749
    .end local v11    # "mChmod":Ljava/lang/String;
    :cond_d
    const-string v17, "toolbox"

    invoke-static/range {v17 .. v17}, Lcom/stericson/RootTools/RootTools;->checkUtil(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_e

    const-string v17, "chmod"

    const-string v18, "toolbox"

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->hasUtil(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_e

    .line 750
    const-string v11, "toolbox chmod"

    .restart local v11    # "mChmod":Ljava/lang/String;
    goto/16 :goto_1

    .line 752
    .end local v11    # "mChmod":Ljava/lang/String;
    :cond_e
    const/4 v14, 0x5

    goto/16 :goto_0

    .line 773
    .restart local v3    # "bConfigModified":Z
    .restart local v7    # "ifVendorExists":Z
    .restart local v11    # "mChmod":Ljava/lang/String;
    .restart local v12    # "mSystemConf":Ljava/lang/String;
    .restart local v13    # "mVendorConf":Ljava/lang/String;
    :cond_f
    const-string v17, "/system/etc/audio_effects.conf"

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v0, v12, v1, v2}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    goto/16 :goto_2

    .line 794
    .restart local v14    # "modifyResult1":I
    .restart local v15    # "modifyResult2":I
    :cond_10
    const/16 v17, 0x0

    :try_start_1
    move/from16 v0, v17

    invoke-static {v12, v0}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_11

    .line 795
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, v17

    invoke-direct {v0, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 796
    :cond_11
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_b

    .line 797
    new-instance v17, Ljava/io/File;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v19, ".out"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_3

    .line 803
    :catch_0
    move-exception v6

    .line 804
    .local v6, "e":Ljava/lang/Exception;
    if-nez v14, :cond_0

    move v14, v15

    .line 805
    goto/16 :goto_0

    .line 812
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v14    # "modifyResult1":I
    .end local v15    # "modifyResult2":I
    :cond_12
    invoke-static/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/Utils;->getBasePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    .line 813
    .local v10, "mBaseDrvPathName":Ljava/lang/String;
    move-object v9, v10

    .line 814
    .local v9, "mAddondScriptPathName":Ljava/lang/String;
    const-string v17, "/"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_1d

    .line 815
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, "libv4a_fx_ics.so"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 816
    if-eqz v8, :cond_13

    .line 817
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, "91-v4a.sh"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 825
    :cond_13
    :goto_4
    if-eqz v7, :cond_1f

    .line 827
    :try_start_2
    const-string v17, "/system"

    const-string v18, "RW"

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v16

    .line 828
    .local v16, "operationSuccess":Z
    if-eqz v16, :cond_14

    .line 830
    const-string v17, "/system/lib/soundfx/libv4a_fx_ics.so"

    const/16 v18, 0x0

    const/16 v19, 0x0

    .line 829
    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v10, v0, v1, v2}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v16

    .line 832
    :cond_14
    if-nez v3, :cond_16

    .line 833
    if-eqz v16, :cond_15

    .line 834
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 835
    const-string v18, "/system/etc/audio_effects.conf"

    const/16 v19, 0x0

    const/16 v20, 0x0

    .line 834
    invoke-static/range {v17 .. v20}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v16

    .line 837
    :cond_15
    if-eqz v16, :cond_16

    .line 838
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 839
    const-string v18, "/system/vendor/etc/audio_effects.conf"

    const/16 v19, 0x0

    const/16 v20, 0x0

    .line 838
    invoke-static/range {v17 .. v20}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v16

    .line 842
    :cond_16
    if-eqz v16, :cond_17

    if-eqz v8, :cond_17

    .line 844
    const-string v17, "/system/addon.d/91-v4a.sh"

    const/16 v18, 0x0

    const/16 v19, 0x0

    .line 843
    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v9, v0, v1, v2}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v16

    .line 847
    :cond_17
    if-nez v3, :cond_1e

    .line 849
    new-instance v5, Lcom/stericson/RootShell/execution/Command;

    const/16 v17, 0x0

    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    .line 850
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, " 644 /system/etc/audio_effects.conf"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x1

    .line 851
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, " 644 /system/vendor/etc/audio_effects.conf"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x2

    .line 852
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, " 644 /system/lib/soundfx/libv4a_fx_ics.so"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 849
    aput-object v20, v18, v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v5, v0, v1}, Lcom/stericson/RootShell/execution/Command;-><init>(I[Ljava/lang/String;)V

    .line 853
    .local v5, "ccSetPermission":Lcom/stericson/RootShell/execution/Command;
    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;

    .line 862
    :goto_5
    if-eqz v8, :cond_18

    .line 863
    new-instance v4, Lcom/stericson/RootShell/execution/Command;

    const/16 v17, 0x0

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    .line 864
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, " 644 /system/addon.d/91-v4a.sh"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 863
    aput-object v20, v18, v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v4, v0, v1}, Lcom/stericson/RootShell/execution/Command;-><init>(I[Ljava/lang/String;)V

    .line 865
    .local v4, "ccSetAddondPermission":Lcom/stericson/RootShell/execution/Command;
    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;

    .line 868
    .end local v4    # "ccSetAddondPermission":Lcom/stericson/RootShell/execution/Command;
    :cond_18
    const-string v17, "/system"

    const-string v18, "RO"

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 916
    .end local v5    # "ccSetPermission":Lcom/stericson/RootShell/execution/Command;
    :goto_6
    if-nez v3, :cond_1c

    .line 917
    if-eqz v7, :cond_25

    .line 918
    const/16 v17, 0x0

    :try_start_3
    move/from16 v0, v17

    invoke-static {v12, v0}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_19

    .line 919
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, v17

    invoke-direct {v0, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 921
    :cond_19
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-static {v13, v0}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_1a

    .line 922
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, v17

    invoke-direct {v0, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 924
    :cond_1a
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_1b

    .line 925
    new-instance v17, Ljava/io/File;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v19, ".out"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 927
    :cond_1b
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_1c

    .line 928
    new-instance v17, Ljava/io/File;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v19, ".out"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 940
    :cond_1c
    :goto_7
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->closeAllShells()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 950
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 820
    .end local v16    # "operationSuccess":Z
    :cond_1d
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, "/libv4a_fx_ics.so"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 821
    if-eqz v8, :cond_13

    .line 822
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, "/91-v4a.sh"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_4

    .line 856
    .restart local v16    # "operationSuccess":Z
    :cond_1e
    :try_start_4
    new-instance v5, Lcom/stericson/RootShell/execution/Command;

    const/16 v17, 0x0

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    .line 857
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, " 644 /system/lib/soundfx/libv4a_fx_ics.so"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 856
    aput-object v20, v18, v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v5, v0, v1}, Lcom/stericson/RootShell/execution/Command;-><init>(I[Ljava/lang/String;)V

    .line 858
    .restart local v5    # "ccSetPermission":Lcom/stericson/RootShell/execution/Command;
    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_5

    .line 909
    .end local v5    # "ccSetPermission":Lcom/stericson/RootShell/execution/Command;
    .end local v16    # "operationSuccess":Z
    :catch_1
    move-exception v6

    .line 910
    .restart local v6    # "e":Ljava/lang/Exception;
    const/16 v16, 0x0

    .line 911
    .restart local v16    # "operationSuccess":Z
    const-string v17, "ViPER4Android"

    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "Failed to copy back to /system, msg = "

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 871
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v16    # "operationSuccess":Z
    :cond_1f
    :try_start_5
    const-string v17, "/system"

    const-string v18, "RW"

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v16

    .line 872
    .restart local v16    # "operationSuccess":Z
    if-eqz v16, :cond_20

    .line 874
    const-string v17, "/system/lib/soundfx/libv4a_fx_ics.so"

    const/16 v18, 0x0

    const/16 v19, 0x0

    .line 873
    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v10, v0, v1, v2}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v16

    .line 876
    :cond_20
    if-nez v3, :cond_21

    .line 877
    if-eqz v16, :cond_21

    .line 878
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 879
    const-string v18, "/system/etc/audio_effects.conf"

    const/16 v19, 0x0

    const/16 v20, 0x0

    .line 878
    invoke-static/range {v17 .. v20}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v16

    .line 882
    :cond_21
    if-eqz v16, :cond_22

    if-eqz v8, :cond_22

    .line 884
    const-string v17, "/system/addon.d/91-v4a.sh"

    const/16 v18, 0x0

    const/16 v19, 0x0

    .line 883
    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v9, v0, v1, v2}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v16

    .line 887
    :cond_22
    if-nez v3, :cond_24

    .line 889
    new-instance v5, Lcom/stericson/RootShell/execution/Command;

    const/16 v17, 0x0

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    .line 890
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, " 644 /system/etc/audio_effects.conf"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x1

    .line 891
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, " 644 /system/lib/soundfx/libv4a_fx_ics.so"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 889
    aput-object v20, v18, v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v5, v0, v1}, Lcom/stericson/RootShell/execution/Command;-><init>(I[Ljava/lang/String;)V

    .line 892
    .restart local v5    # "ccSetPermission":Lcom/stericson/RootShell/execution/Command;
    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;

    .line 901
    :goto_8
    if-eqz v8, :cond_23

    .line 902
    new-instance v4, Lcom/stericson/RootShell/execution/Command;

    const/16 v17, 0x0

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    .line 903
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, " 644 /system/addon.d/91-v4a.sh"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 902
    aput-object v20, v18, v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v4, v0, v1}, Lcom/stericson/RootShell/execution/Command;-><init>(I[Ljava/lang/String;)V

    .line 904
    .restart local v4    # "ccSetAddondPermission":Lcom/stericson/RootShell/execution/Command;
    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;

    .line 907
    .end local v4    # "ccSetAddondPermission":Lcom/stericson/RootShell/execution/Command;
    :cond_23
    const-string v17, "/system"

    const-string v18, "RO"

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_6

    .line 895
    .end local v5    # "ccSetPermission":Lcom/stericson/RootShell/execution/Command;
    :cond_24
    new-instance v5, Lcom/stericson/RootShell/execution/Command;

    const/16 v17, 0x0

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    .line 896
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, " 644 /system/lib/soundfx/libv4a_fx_ics.so"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 895
    aput-object v20, v18, v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v5, v0, v1}, Lcom/stericson/RootShell/execution/Command;-><init>(I[Ljava/lang/String;)V

    .line 897
    .restart local v5    # "ccSetPermission":Lcom/stericson/RootShell/execution/Command;
    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_8

    .line 931
    .end local v5    # "ccSetPermission":Lcom/stericson/RootShell/execution/Command;
    :cond_25
    const/16 v17, 0x0

    :try_start_6
    move/from16 v0, v17

    invoke-static {v12, v0}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_26

    .line 932
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, v17

    invoke-direct {v0, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 934
    :cond_26
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, ".out"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_1c

    .line 935
    new-instance v17, Ljava/io/File;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v19, ".out"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto/16 :goto_7

    .line 941
    :catch_2
    move-exception v6

    .line 942
    .restart local v6    # "e":Ljava/lang/Exception;
    const-string v17, "ViPER4Android"

    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "Copy back to /system cleanup failed, msg = "

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 943
    if-nez v16, :cond_27

    .line 944
    const/4 v14, 0x6

    goto/16 :goto_0

    .line 946
    :cond_27
    const/4 v14, 0x0

    goto/16 :goto_0
.end method

.method public static isBusyBoxInstalled(Landroid/content/Context;)Z
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 242
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->isBusyboxAvailable()Z

    move-result v1

    .line 243
    .local v1, "isBusyBoxAvailable":Z
    if-nez v1, :cond_0

    .line 244
    move-object v0, p0

    .line 245
    .local v0, "ctxInstance":Landroid/content/Context;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 246
    .local v2, "mBusyBox":Landroid/app/AlertDialog$Builder;
    const-string v3, "ViPER4Android"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 247
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0900b6

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 248
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0900a8

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 249
    new-instance v4, Lcom/vipercn/viper4android_v2/activity/Utils$1;

    invoke-direct {v4, v0}, Lcom/vipercn/viper4android_v2/activity/Utils$1;-><init>(Landroid/content/Context;)V

    .line 248
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 263
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0900a9

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 264
    new-instance v4, Lcom/vipercn/viper4android_v2/activity/Utils$2;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/activity/Utils$2;-><init>()V

    .line 263
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 270
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 274
    .end local v0    # "ctxInstance":Landroid/content/Context;
    .end local v2    # "mBusyBox":Landroid/app/AlertDialog$Builder;
    :cond_0
    return v1
.end method

.method public static loadProfileV1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Z
    .locals 21
    .param p0, "mProfileName"    # Ljava/lang/String;
    .param p1, "mProfileDir"    # Ljava/lang/String;
    .param p2, "mPreferenceName"    # Ljava/lang/String;
    .param p3, "ctx"    # Landroid/content/Context;

    .prologue
    .line 416
    :try_start_0
    new-instance v5, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 417
    .local v5, "fProfileDirHandle":Ljava/io/File;
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 418
    .local v17, "profileFileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v18, ".prf"

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-static {v5, v0, v1}, Lcom/vipercn/viper4android_v2/activity/Utils;->getFileNameList(Ljava/io/File;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 419
    const-string v14, ""

    .line 420
    .local v14, "mProfileFileName":Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_0
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-nez v19, :cond_1

    .line 428
    :goto_0
    const-string v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_2

    const/16 v18, 0x0

    .line 467
    .end local v5    # "fProfileDirHandle":Ljava/io/File;
    .end local v14    # "mProfileFileName":Ljava/lang/String;
    .end local v17    # "profileFileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_1
    return v18

    .line 420
    .restart local v5    # "fProfileDirHandle":Ljava/io/File;
    .restart local v14    # "mProfileFileName":Ljava/lang/String;
    .restart local v17    # "profileFileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 421
    .local v13, "mProfileFileList":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 422
    .local v9, "mFileName":Ljava/lang/String;
    invoke-static {v9}, Lcom/vipercn/viper4android_v2/activity/Utils;->getProfileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 423
    .local v11, "mName":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 424
    move-object v14, v9

    .line 425
    goto :goto_0

    .line 431
    .end local v9    # "mFileName":Ljava/lang/String;
    .end local v11    # "mName":Ljava/lang/String;
    .end local v13    # "mProfileFileList":Ljava/lang/String;
    :cond_2
    const/16 v18, 0x0

    .line 430
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v16

    .line 432
    .local v16, "preferences":Landroid/content/SharedPreferences;
    if-eqz v16, :cond_6

    .line 433
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v14}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 434
    .local v6, "fisInput":Ljava/io/FileInputStream;
    new-instance v7, Ljava/io/InputStreamReader;

    const-string v18, "UTF-8"

    move-object/from16 v0, v18

    invoke-direct {v7, v6, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 435
    .local v7, "isrInput":Ljava/io/InputStreamReader;
    new-instance v3, Ljava/io/BufferedReader;

    invoke-direct {v3, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 436
    .local v3, "bufferInput":Ljava/io/BufferedReader;
    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 438
    .local v4, "e":Landroid/content/SharedPreferences$Editor;
    :cond_3
    :goto_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v10

    .line 439
    .local v10, "mLine":Ljava/lang/String;
    if-nez v10, :cond_4

    .line 455
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 456
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 457
    invoke-virtual {v7}, Ljava/io/InputStreamReader;->close()V

    .line 458
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V

    .line 459
    const/4 v3, 0x0

    .line 460
    const/4 v7, 0x0

    .line 461
    const/4 v6, 0x0

    .line 462
    const/16 v18, 0x1

    goto :goto_1

    .line 440
    :cond_4
    const-string v18, "#"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_3

    .line 442
    const-string v18, "="

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 443
    .local v8, "mChunks":[Ljava/lang/String;
    array-length v0, v8

    move/from16 v18, v0

    const/16 v19, 0x3

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_3

    .line 444
    const/16 v18, 0x1

    aget-object v18, v8, v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v18

    const-string v19, "boolean"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 445
    const/16 v18, 0x0

    aget-object v12, v8, v18

    .line 446
    .local v12, "mParameter":Ljava/lang/String;
    const/16 v18, 0x2

    aget-object v18, v8, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v15

    .line 447
    .local v15, "mValue":Z
    invoke-interface {v4, v12, v15}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 465
    .end local v3    # "bufferInput":Ljava/io/BufferedReader;
    .end local v4    # "e":Landroid/content/SharedPreferences$Editor;
    .end local v5    # "fProfileDirHandle":Ljava/io/File;
    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .end local v8    # "mChunks":[Ljava/lang/String;
    .end local v10    # "mLine":Ljava/lang/String;
    .end local v12    # "mParameter":Ljava/lang/String;
    .end local v14    # "mProfileFileName":Ljava/lang/String;
    .end local v15    # "mValue":Z
    .end local v16    # "preferences":Landroid/content/SharedPreferences;
    .end local v17    # "profileFileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v4

    .line 466
    .local v4, "e":Ljava/lang/Exception;
    const-string v18, "ViPER4Android"

    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "loadProfile Error: "

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 467
    const/16 v18, 0x0

    goto/16 :goto_1

    .line 448
    .restart local v3    # "bufferInput":Ljava/io/BufferedReader;
    .local v4, "e":Landroid/content/SharedPreferences$Editor;
    .restart local v5    # "fProfileDirHandle":Ljava/io/File;
    .restart local v6    # "fisInput":Ljava/io/FileInputStream;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v8    # "mChunks":[Ljava/lang/String;
    .restart local v10    # "mLine":Ljava/lang/String;
    .restart local v14    # "mProfileFileName":Ljava/lang/String;
    .restart local v16    # "preferences":Landroid/content/SharedPreferences;
    .restart local v17    # "profileFileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_5
    const/16 v18, 0x1

    :try_start_1
    aget-object v18, v8, v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v18

    const-string v19, "string"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 449
    const/16 v18, 0x0

    aget-object v12, v8, v18

    .line 450
    .restart local v12    # "mParameter":Ljava/lang/String;
    const/16 v18, 0x2

    aget-object v15, v8, v18

    .line 451
    .local v15, "mValue":Ljava/lang/String;
    invoke-interface {v4, v12, v15}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .line 464
    .end local v3    # "bufferInput":Ljava/io/BufferedReader;
    .end local v4    # "e":Landroid/content/SharedPreferences$Editor;
    .end local v6    # "fisInput":Ljava/io/FileInputStream;
    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .end local v8    # "mChunks":[Ljava/lang/String;
    .end local v10    # "mLine":Ljava/lang/String;
    .end local v12    # "mParameter":Ljava/lang/String;
    .end local v15    # "mValue":Ljava/lang/String;
    :cond_6
    const/16 v18, 0x0

    goto/16 :goto_1
.end method

.method private static modifyFXConfig(Ljava/lang/String;Ljava/lang/String;)I
    .locals 18
    .param p0, "mInputFile"    # Ljava/lang/String;
    .param p1, "mOutputFile"    # Ljava/lang/String;

    .prologue
    .line 528
    const-string v15, "ViPER4Android"

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "Editing audio configuration, input = "

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    .line 529
    const-string v17, ", output = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 528
    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 531
    :try_start_0
    invoke-static/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/Utils;->getFileLength(Ljava/lang/String;)J

    move-result-wide v10

    .line 532
    .local v10, "inputFileLength":J
    const-wide/16 v16, 0x20

    cmp-long v15, v10, v16

    if-gez v15, :cond_0

    .line 534
    const/4 v15, 0x5

    .line 623
    .end local v10    # "inputFileLength":J
    :goto_0
    return v15

    .line 536
    .restart local v10    # "inputFileLength":J
    :cond_0
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    .line 539
    new-instance v7, Ljava/io/FileInputStream;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 540
    .local v7, "fisInput":Ljava/io/FileInputStream;
    new-instance v8, Ljava/io/FileOutputStream;

    move-object/from16 v0, p1

    invoke-direct {v8, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 541
    .local v8, "fosOutput":Ljava/io/FileOutputStream;
    new-instance v9, Ljava/io/InputStreamReader;

    const-string v15, "ASCII"

    invoke-direct {v9, v7, v15}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 542
    .local v9, "isrInput":Ljava/io/InputStreamReader;
    new-instance v14, Ljava/io/OutputStreamWriter;

    const-string v15, "ASCII"

    invoke-direct {v14, v8, v15}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 543
    .local v14, "oswOutput":Ljava/io/OutputStreamWriter;
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 544
    .local v2, "bufferInput":Ljava/io/BufferedReader;
    new-instance v3, Ljava/io/BufferedWriter;

    invoke-direct {v3, v14}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 547
    .local v3, "bufferOutput":Ljava/io/BufferedWriter;
    const/4 v4, 0x0

    .line 548
    .local v4, "configModified":Z
    long-to-int v15, v10

    invoke-virtual {v2, v15}, Ljava/io/BufferedReader;->mark(I)V

    .line 550
    :cond_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    .line 551
    .local v13, "mLine":Ljava/lang/String;
    if-nez v13, :cond_2

    .line 562
    :goto_1
    const/4 v12, 0x0

    .line 563
    .local v12, "libraryAppend":Z
    const/4 v6, 0x0

    .line 564
    .local v6, "effectAppend":Z
    if-eqz v4, :cond_4

    .line 566
    invoke-virtual {v2}, Ljava/io/BufferedReader;->reset()V

    .line 568
    :goto_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    .line 569
    if-nez v13, :cond_3

    .line 572
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V

    .line 574
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 575
    invoke-virtual {v9}, Ljava/io/InputStreamReader;->close()V

    .line 576
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V

    .line 577
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V

    .line 578
    invoke-virtual {v14}, Ljava/io/OutputStreamWriter;->close()V

    .line 579
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 581
    const/4 v15, 0x0

    goto :goto_0

    .line 552
    .end local v6    # "effectAppend":Z
    .end local v12    # "libraryAppend":Z
    :cond_2
    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    const-string v16, "#"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_1

    .line 554
    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v13, v15}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v15

    .line 555
    const-string v16, "41d3c987-e6cf-11e3-a88a-11aba5d5c51b"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 556
    const-string v15, "ViPER4Android"

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "Source file has been modified, line = "

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 557
    const/4 v4, 0x1

    goto :goto_1

    .line 570
    .restart local v6    # "effectAppend":Z
    .restart local v12    # "libraryAppend":Z
    :cond_3
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 621
    .end local v2    # "bufferInput":Ljava/io/BufferedReader;
    .end local v3    # "bufferOutput":Ljava/io/BufferedWriter;
    .end local v4    # "configModified":Z
    .end local v6    # "effectAppend":Z
    .end local v7    # "fisInput":Ljava/io/FileInputStream;
    .end local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .end local v9    # "isrInput":Ljava/io/InputStreamReader;
    .end local v10    # "inputFileLength":J
    .end local v12    # "libraryAppend":Z
    .end local v13    # "mLine":Ljava/lang/String;
    .end local v14    # "oswOutput":Ljava/io/OutputStreamWriter;
    :catch_0
    move-exception v5

    .line 622
    .local v5, "e":Ljava/lang/Exception;
    const-string v15, "ViPER4Android"

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "Error: "

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 623
    const/4 v15, 0x3

    goto/16 :goto_0

    .line 584
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v2    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v3    # "bufferOutput":Ljava/io/BufferedWriter;
    .restart local v4    # "configModified":Z
    .restart local v6    # "effectAppend":Z
    .restart local v7    # "fisInput":Ljava/io/FileInputStream;
    .restart local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v9    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v10    # "inputFileLength":J
    .restart local v12    # "libraryAppend":Z
    .restart local v13    # "mLine":Ljava/lang/String;
    .restart local v14    # "oswOutput":Ljava/io/OutputStreamWriter;
    :cond_4
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->reset()V

    .line 586
    :goto_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    .line 587
    if-nez v13, :cond_5

    .line 609
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V

    .line 611
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 612
    invoke-virtual {v9}, Ljava/io/InputStreamReader;->close()V

    .line 613
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V

    .line 614
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V

    .line 615
    invoke-virtual {v14}, Ljava/io/OutputStreamWriter;->close()V

    .line 616
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 618
    if-eqz v12, :cond_9

    if-eqz v6, :cond_9

    const/4 v15, 0x0

    goto/16 :goto_0

    .line 588
    :cond_5
    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    const-string v16, "#"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 589
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_3

    .line 592
    :cond_6
    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    const-string v16, "libraries {"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_7

    if-nez v12, :cond_7

    .line 594
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 595
    const-string v15, "  v4a_fx {\n"

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 596
    const-string v15, "    path /system/lib/soundfx/libv4a_fx_ics.so\n"

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 597
    const-string v15, "  }\n"

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 598
    const/4 v12, 0x1

    .line 599
    goto :goto_3

    :cond_7
    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    const-string v16, "effects {"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_8

    if-nez v6, :cond_8

    .line 601
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 602
    const-string v15, "  v4a_standard_fx {\n"

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 603
    const-string v15, "    library v4a_fx\n"

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 604
    const-string v15, "    uuid 41d3c987-e6cf-11e3-a88a-11aba5d5c51b\n"

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 605
    const-string v15, "  }\n"

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 606
    const/4 v6, 0x1

    .line 607
    goto/16 :goto_3

    :cond_8
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_3

    .line 619
    :cond_9
    const/4 v15, 0x4

    goto/16 :goto_0
.end method

.method public static proceedBuildProp(Landroid/content/Context;)V
    .locals 8
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 283
    const-string v0, "lpa.decode"

    .line 284
    .local v0, "LPA_DECODE":Ljava/lang/String;
    const-string v1, "lpa.use.stagefright"

    .line 285
    .local v1, "LPA_USE_STAGEFRIGHT":Ljava/lang/String;
    const-string v2, "tunnel.decode"

    .line 287
    .local v2, "TUNNEL_DECODE":Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 288
    .local v3, "mBuildProp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v4, Lcom/vipercn/viper4android_v2/activity/BuildProp;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/activity/BuildProp;-><init>()V

    .line 289
    .local v4, "mBuildPropUtil":Lcom/vipercn/viper4android_v2/activity/BuildProp;
    invoke-virtual {v4}, Lcom/vipercn/viper4android_v2/activity/BuildProp;->initializeBuildprop()V

    .line 291
    const-string v6, "lpa.decode"

    invoke-virtual {v4, v6}, Lcom/vipercn/viper4android_v2/activity/BuildProp;->propExists(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 292
    const-string v6, "lpa.decode"

    invoke-virtual {v4, v6}, Lcom/vipercn/viper4android_v2/activity/BuildProp;->getProp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "true"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 293
    const-string v6, "ViPER4Android"

    const-string v7, "[LPA] lpa.decode = true"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    const-string v6, "lpa.decode"

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    :cond_0
    :goto_0
    const-string v6, "lpa.use.stagefright"

    invoke-virtual {v4, v6}, Lcom/vipercn/viper4android_v2/activity/BuildProp;->propExists(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 298
    const-string v6, "lpa.use.stagefright"

    invoke-virtual {v4, v6}, Lcom/vipercn/viper4android_v2/activity/BuildProp;->getProp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "true"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 299
    const-string v6, "ViPER4Android"

    const-string v7, "[LPA] lpa.use.stagefright = true"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    const-string v6, "lpa.use.stagefright"

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 303
    :cond_1
    :goto_1
    const-string v6, "tunnel.decode"

    invoke-virtual {v4, v6}, Lcom/vipercn/viper4android_v2/activity/BuildProp;->propExists(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 304
    const-string v6, "tunnel.decode"

    invoke-virtual {v4, v6}, Lcom/vipercn/viper4android_v2/activity/BuildProp;->getProp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "true"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 305
    const-string v6, "ViPER4Android"

    const-string v7, "[LPA] tunnel.decode = true"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    const-string v6, "tunnel.decode"

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 310
    :cond_2
    :goto_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6

    .line 311
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-direct {v5, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 312
    .local v5, "mModifyWarn":Landroid/app/AlertDialog$Builder;
    const-string v6, "ViPER4Android"

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 313
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0900bd

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 314
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0900a8

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 315
    new-instance v7, Lcom/vipercn/viper4android_v2/activity/Utils$3;

    invoke-direct {v7, v3, v4}, Lcom/vipercn/viper4android_v2/activity/Utils$3;-><init>(Ljava/util/ArrayList;Lcom/vipercn/viper4android_v2/activity/BuildProp;)V

    .line 314
    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 325
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0900a9

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 326
    new-instance v7, Lcom/vipercn/viper4android_v2/activity/Utils$4;

    invoke-direct {v7}, Lcom/vipercn/viper4android_v2/activity/Utils$4;-><init>()V

    .line 325
    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 333
    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 338
    .end local v5    # "mModifyWarn":Landroid/app/AlertDialog$Builder;
    :goto_3
    return-void

    .line 295
    :cond_3
    const-string v6, "ViPER4Android"

    const-string v7, "[LPA] lpa.decode = false"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 301
    :cond_4
    const-string v6, "ViPER4Android"

    const-string v7, "[LPA] lpa.use.stagefright = false"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 307
    :cond_5
    const-string v6, "ViPER4Android"

    const-string v7, "[LPA] tunnel.decode = false"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 336
    :cond_6
    const-string v6, "ViPER4Android"

    const-string v7, "LPA feature not enabled"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3
.end method

.method public static restartActivity(Landroid/app/Activity;)V
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    const v3, 0x10a0001

    const/high16 v2, 0x10a0000

    .line 981
    if-nez p0, :cond_0

    .line 988
    :goto_0
    return-void

    .line 982
    :cond_0
    const/high16 v0, 0x10a0000

    .line 983
    .local v0, "enter_anim":I
    const v1, 0x10a0001

    .line 984
    .local v1, "exit_anim":I
    invoke-virtual {p0, v2, v3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 985
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 986
    invoke-virtual {p0, v2, v3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 987
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public static uninstallDrv_FX()V
    .locals 5

    .prologue
    .line 691
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->isAccessGiven()Z

    move-result v2

    if-nez v2, :cond_0

    .line 708
    .local v1, "mDriverPathName":Ljava/lang/String;
    :goto_0
    return-void

    .line 696
    .end local v1    # "mDriverPathName":Ljava/lang/String;
    :cond_0
    const-string v1, "/system/lib/soundfx/libv4a_fx_ics.so"

    .line 698
    .restart local v1    # "mDriverPathName":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->exists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 699
    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    .line 700
    const-string v2, "/system/addon.d/91-v4a.sh"

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->exists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 701
    const-string v2, "/system/addon.d/91-v4a.sh"

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    .line 704
    :cond_1
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->closeAllShells()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 705
    :catch_0
    move-exception v0

    .line 706
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Driver uninstall failed, msg = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
