.class Lcom/stericson/RootTools/internal/Installer;
.super Ljava/lang/Object;
.source "Installer.java"


# static fields
.field static final BOGUS_FILE_NAME:Ljava/lang/String; = "bogus"

.field static final LOG_TAG:Ljava/lang/String; = "RootTools::Installer"


# instance fields
.field context:Landroid/content/Context;

.field filesPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    .line 65
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/stericson/RootTools/internal/Installer;->filesPath:Ljava/lang/String;

    .line 66
    return-void
.end method

.method private commandWait(Lcom/stericson/RootShell/execution/Command;)V
    .locals 4
    .param p1, "cmd"    # Lcom/stericson/RootShell/execution/Command;

    .prologue
    .line 288
    monitor-enter p1

    .line 292
    :try_start_0
    invoke-virtual {p1}, Lcom/stericson/RootShell/execution/Command;->isFinished()Z

    move-result v1

    if-nez v1, :cond_0

    .line 294
    const-wide/16 v2, 0x7d0

    invoke-virtual {p1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 301
    :cond_0
    :goto_0
    :try_start_1
    monitor-exit p1

    .line 302
    return-void

    .line 297
    :catch_0
    move-exception v0

    .line 299
    .local v0, "ex":Ljava/lang/InterruptedException;
    const-string v1, "RootTools::Installer"

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 301
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method protected getFileSignature(Ljava/io/File;)Ljava/lang/String;
    .locals 4
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 228
    const-string v1, ""

    .line 231
    .local v1, "signature":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v2}, Lcom/stericson/RootTools/internal/Installer;->getStreamSignature(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 237
    :goto_0
    return-object v1

    .line 233
    :catch_0
    move-exception v0

    .line 235
    .local v0, "ex":Ljava/io/FileNotFoundException;
    const-string v2, "RootTools::Installer"

    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected getStreamSignature(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 10
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 245
    const-string v7, ""

    .line 248
    .local v7, "signature":Ljava/lang/String;
    :try_start_0
    const-string v8, "MD5"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    .line 249
    .local v5, "md":Ljava/security/MessageDigest;
    new-instance v2, Ljava/security/DigestInputStream;

    invoke-direct {v2, p1, v5}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V

    .line 250
    .local v2, "dis":Ljava/security/DigestInputStream;
    const/16 v8, 0x1000

    new-array v0, v8, [B

    .line 251
    .local v0, "buffer":[B
    :cond_0
    const/4 v8, -0x1

    invoke-virtual {v2, v0}, Ljava/security/DigestInputStream;->read([B)I

    move-result v9

    if-ne v8, v9, :cond_0

    .line 255
    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 256
    .local v1, "digest":[B
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 258
    .local v6, "sb":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v8, v1

    if-ge v4, v8, :cond_1

    .line 260
    aget-byte v8, v1, v4

    and-int/lit16 v8, v8, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 258
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 263
    :cond_1
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 277
    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    .line 283
    .end local v0    # "buffer":[B
    .end local v1    # "digest":[B
    .end local v2    # "dis":Ljava/security/DigestInputStream;
    .end local v4    # "i":I
    .end local v5    # "md":Ljava/security/MessageDigest;
    .end local v6    # "sb":Ljava/lang/StringBuffer;
    :goto_1
    return-object v7

    .line 265
    :catch_0
    move-exception v3

    .line 267
    .local v3, "ex":Ljava/io/IOException;
    :try_start_2
    const-string v8, "RootTools::Installer"

    invoke-virtual {v3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 277
    :try_start_3
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 279
    :catch_1
    move-exception v8

    goto :goto_1

    .line 269
    .end local v3    # "ex":Ljava/io/IOException;
    :catch_2
    move-exception v3

    .line 271
    .local v3, "ex":Ljava/security/NoSuchAlgorithmException;
    :try_start_4
    const-string v8, "RootTools::Installer"

    invoke-virtual {v3}, Ljava/security/NoSuchAlgorithmException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 277
    :try_start_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_1

    .line 279
    :catch_3
    move-exception v8

    goto :goto_1

    .line 275
    .end local v3    # "ex":Ljava/security/NoSuchAlgorithmException;
    :catchall_0
    move-exception v8

    .line 277
    :try_start_6
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    .line 281
    :goto_2
    throw v8

    .line 279
    .restart local v0    # "buffer":[B
    .restart local v1    # "digest":[B
    .restart local v2    # "dis":Ljava/security/DigestInputStream;
    .restart local v4    # "i":I
    .restart local v5    # "md":Ljava/security/MessageDigest;
    .restart local v6    # "sb":Ljava/lang/StringBuffer;
    :catch_4
    move-exception v8

    goto :goto_1

    .end local v0    # "buffer":[B
    .end local v1    # "digest":[B
    .end local v2    # "dis":Ljava/security/DigestInputStream;
    .end local v4    # "i":I
    .end local v5    # "md":Ljava/security/MessageDigest;
    .end local v6    # "sb":Ljava/lang/StringBuffer;
    :catch_5
    move-exception v9

    goto :goto_2
.end method

.method protected installBinary(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 23
    .param p1, "sourceId"    # I
    .param p2, "destName"    # Ljava/lang/String;
    .param p3, "mode"    # Ljava/lang/String;

    .prologue
    .line 82
    new-instance v14, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/stericson/RootTools/internal/Installer;->filesPath:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p2

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v14, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 83
    .local v14, "mf":Ljava/io/File;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/stericson/RootTools/internal/Installer;->getFileSignature(Ljava/io/File;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    move/from16 v0, p1

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/stericson/RootTools/internal/Installer;->getStreamSignature(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 89
    :cond_0
    const-string v6, "RootTools::Installer"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Installing a new version of binary: "

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    :try_start_0
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    const-string v7, "bogus"

    invoke-virtual {v6, v7}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v11

    .line 96
    .local v11, "fis":Ljava/io/FileInputStream;
    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    .line 139
    .end local v11    # "fis":Ljava/io/FileInputStream;
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    move/from16 v0, p1

    invoke-virtual {v6, v0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v13

    .line 140
    .local v13, "iss":Ljava/io/InputStream;
    invoke-static {v13}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/InputStream;)Ljava/nio/channels/ReadableByteChannel;

    move-result-object v3

    .line 141
    .local v3, "rfc":Ljava/nio/channels/ReadableByteChannel;
    const/4 v15, 0x0

    .line 144
    .local v15, "oss":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v16, Ljava/io/FileOutputStream;

    move-object/from16 v0, v16

    invoke-direct {v0, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 145
    .end local v15    # "oss":Ljava/io/FileOutputStream;
    .local v16, "oss":Ljava/io/FileOutputStream;
    :try_start_2
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_c
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result-object v2

    .line 146
    .local v2, "ofc":Ljava/nio/channels/FileChannel;
    const-wide/16 v4, 0x0

    .line 149
    .local v4, "pos":J
    :try_start_3
    invoke-virtual {v13}, Ljava/io/InputStream;->available()I

    move-result v6

    int-to-long v0, v6

    move-wide/from16 v18, v0

    .line 150
    .local v18, "size":J
    :cond_2
    sub-long v6, v18, v4

    invoke-virtual/range {v2 .. v7}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_c
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-result-wide v6

    add-long/2addr v4, v6

    cmp-long v6, v4, v18

    if-ltz v6, :cond_2

    .line 174
    if-eqz v16, :cond_3

    .line 178
    :try_start_4
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->flush()V

    .line 179
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/FileDescriptor;->sync()V

    .line 180
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_d

    .line 189
    :cond_3
    :goto_1
    :try_start_5
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_9

    .line 202
    :try_start_6
    new-instance v8, Lcom/stericson/RootShell/execution/Command;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v20, 0x0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "chmod "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/stericson/RootTools/internal/Installer;->filesPath:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    sget-object v22, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v17, v20

    move-object/from16 v0, v17

    invoke-direct {v8, v6, v7, v0}, Lcom/stericson/RootShell/execution/Command;-><init>(IZ[Ljava/lang/String;)V

    .line 203
    .local v8, "command":Lcom/stericson/RootShell/execution/Command;
    invoke-static {}, Lcom/stericson/RootShell/execution/Shell;->startRootShell()Lcom/stericson/RootShell/execution/Shell;

    move-result-object v6

    invoke-virtual {v6, v8}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;

    .line 204
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/stericson/RootTools/internal/Installer;->commandWait(Lcom/stericson/RootShell/execution/Command;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_a

    .line 211
    .end local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .end local v3    # "rfc":Ljava/nio/channels/ReadableByteChannel;
    .end local v4    # "pos":J
    .end local v8    # "command":Lcom/stericson/RootShell/execution/Command;
    .end local v13    # "iss":Ljava/io/InputStream;
    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .end local v18    # "size":J
    :cond_4
    :goto_2
    const/4 v6, 0x1

    :cond_5
    :goto_3
    return v6

    .line 98
    :catch_0
    move-exception v9

    .line 100
    .local v9, "e":Ljava/io/FileNotFoundException;
    const/4 v12, 0x0

    .line 103
    .local v12, "fos":Ljava/io/FileOutputStream;
    :try_start_7
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    const-string v7, "bogus"

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v6, v7, v0}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v12

    .line 104
    const-string v6, "justcreatedfilesdirectory"

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v12, v6}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 116
    if-eqz v12, :cond_1

    .line 120
    :try_start_8
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V

    .line 121
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    const-string v7, "bogus"

    invoke-virtual {v6, v7}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1

    goto/16 :goto_0

    .line 123
    :catch_1
    move-exception v6

    goto/16 :goto_0

    .line 106
    :catch_2
    move-exception v10

    .line 108
    .local v10, "ex":Ljava/lang/Exception;
    :try_start_9
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_6

    .line 110
    const-string v6, "RootTools::Installer"

    invoke-virtual {v10}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 112
    :cond_6
    const/4 v6, 0x0

    .line 116
    if-eqz v12, :cond_5

    .line 120
    :try_start_a
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V

    .line 121
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    const-string v17, "bogus"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_3

    goto :goto_3

    .line 123
    :catch_3
    move-exception v7

    goto :goto_3

    .line 116
    .end local v10    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    if-eqz v12, :cond_7

    .line 120
    :try_start_b
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V

    .line 121
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    const-string v17, "bogus"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_e

    .line 125
    :cond_7
    :goto_4
    throw v6

    .line 129
    .end local v9    # "e":Ljava/io/FileNotFoundException;
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v10

    .line 131
    .local v10, "ex":Ljava/io/IOException;
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_8

    .line 133
    const-string v6, "RootTools::Installer"

    invoke-virtual {v10}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    :cond_8
    const/4 v6, 0x0

    goto :goto_3

    .line 155
    .end local v10    # "ex":Ljava/io/IOException;
    .restart local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .restart local v3    # "rfc":Ljava/nio/channels/ReadableByteChannel;
    .restart local v4    # "pos":J
    .restart local v13    # "iss":Ljava/io/InputStream;
    .restart local v16    # "oss":Ljava/io/FileOutputStream;
    :catch_5
    move-exception v10

    .line 157
    .restart local v10    # "ex":Ljava/io/IOException;
    :try_start_c
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_9

    .line 159
    const-string v6, "RootTools::Installer"

    invoke-virtual {v10}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c
    .catch Ljava/io/FileNotFoundException; {:try_start_c .. :try_end_c} :catch_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 161
    :cond_9
    const/4 v6, 0x0

    .line 174
    if-eqz v16, :cond_5

    .line 178
    :try_start_d
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->flush()V

    .line 179
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/FileDescriptor;->sync()V

    .line 180
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_6

    goto/16 :goto_3

    .line 182
    :catch_6
    move-exception v7

    goto/16 :goto_3

    .line 164
    .end local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .end local v4    # "pos":J
    .end local v10    # "ex":Ljava/io/IOException;
    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .restart local v15    # "oss":Ljava/io/FileOutputStream;
    :catch_7
    move-exception v10

    .line 166
    .local v10, "ex":Ljava/io/FileNotFoundException;
    :goto_5
    :try_start_e
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_a

    .line 168
    const-string v6, "RootTools::Installer"

    invoke-virtual {v10}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 170
    :cond_a
    const/4 v6, 0x0

    .line 174
    if-eqz v15, :cond_5

    .line 178
    :try_start_f
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->flush()V

    .line 179
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/FileDescriptor;->sync()V

    .line 180
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_8

    goto/16 :goto_3

    .line 182
    :catch_8
    move-exception v7

    goto/16 :goto_3

    .line 174
    .end local v10    # "ex":Ljava/io/FileNotFoundException;
    :catchall_1
    move-exception v6

    :goto_6
    if-eqz v15, :cond_b

    .line 178
    :try_start_10
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->flush()V

    .line 179
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/FileDescriptor;->sync()V

    .line 180
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_b

    .line 184
    :cond_b
    :goto_7
    throw v6

    .line 191
    .end local v15    # "oss":Ljava/io/FileOutputStream;
    .restart local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .restart local v4    # "pos":J
    .restart local v16    # "oss":Ljava/io/FileOutputStream;
    .restart local v18    # "size":J
    :catch_9
    move-exception v10

    .line 193
    .local v10, "ex":Ljava/io/IOException;
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_c

    .line 195
    const-string v6, "RootTools::Installer"

    invoke-virtual {v10}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    :cond_c
    const/4 v6, 0x0

    goto/16 :goto_3

    .line 207
    .end local v10    # "ex":Ljava/io/IOException;
    :catch_a
    move-exception v6

    goto/16 :goto_2

    .line 182
    .end local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .end local v4    # "pos":J
    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .end local v18    # "size":J
    .restart local v15    # "oss":Ljava/io/FileOutputStream;
    :catch_b
    move-exception v7

    goto :goto_7

    .line 174
    .end local v15    # "oss":Ljava/io/FileOutputStream;
    .restart local v16    # "oss":Ljava/io/FileOutputStream;
    :catchall_2
    move-exception v6

    move-object/from16 v15, v16

    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .restart local v15    # "oss":Ljava/io/FileOutputStream;
    goto :goto_6

    .line 164
    .end local v15    # "oss":Ljava/io/FileOutputStream;
    .restart local v16    # "oss":Ljava/io/FileOutputStream;
    :catch_c
    move-exception v10

    move-object/from16 v15, v16

    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .restart local v15    # "oss":Ljava/io/FileOutputStream;
    goto :goto_5

    .line 182
    .end local v15    # "oss":Ljava/io/FileOutputStream;
    .restart local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .restart local v4    # "pos":J
    .restart local v16    # "oss":Ljava/io/FileOutputStream;
    .restart local v18    # "size":J
    :catch_d
    move-exception v6

    goto/16 :goto_1

    .line 123
    .end local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .end local v3    # "rfc":Ljava/nio/channels/ReadableByteChannel;
    .end local v4    # "pos":J
    .end local v13    # "iss":Ljava/io/InputStream;
    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .end local v18    # "size":J
    .restart local v9    # "e":Ljava/io/FileNotFoundException;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    :catch_e
    move-exception v7

    goto/16 :goto_4
.end method

.method protected isBinaryInstalled(Ljava/lang/String;)Z
    .locals 4
    .param p1, "destName"    # Ljava/lang/String;

    .prologue
    .line 216
    const/4 v0, 0x0

    .line 217
    .local v0, "installed":Z
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/stericson/RootTools/internal/Installer;->filesPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 218
    .local v1, "mf":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 220
    const/4 v0, 0x1

    .line 223
    :cond_0
    return v0
.end method
