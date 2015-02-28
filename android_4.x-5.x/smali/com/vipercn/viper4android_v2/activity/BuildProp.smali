.class public Lcom/vipercn/viper4android_v2/activity/BuildProp;
.super Ljava/lang/Object;
.source "BuildProp.java"


# instance fields
.field private final ENABLE_DEBUG:Z

.field private mBuildPropContent:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->ENABLE_DEBUG:Z

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    .line 34
    return-void
.end method


# virtual methods
.method public commitBuildprop(Ljava/lang/String;)V
    .locals 20
    .param p1, "tmpDirPath"    # Ljava/lang/String;

    .prologue
    .line 146
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v15

    const/16 v16, 0x1c

    move/from16 v0, v16

    if-ge v15, v0, :cond_0

    .line 151
    const-string v15, "ViPER4Android"

    const-string v16, "[Commit build.prop] mBuildPropContent.size() < 28"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    :goto_0
    return-void

    .line 155
    :cond_0
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "tmp_buildprop"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 156
    .local v14, "tempBuildpropFile":Ljava/lang/String;
    const-string v6, "/system/build.prop"

    .line 159
    .local v6, "destBuildpropFile":Ljava/lang/String;
    const/4 v8, 0x0

    .line 160
    .local v8, "fosOutput":Ljava/io/FileOutputStream;
    const/4 v12, 0x0

    .line 161
    .local v12, "oswOutput":Ljava/io/OutputStreamWriter;
    const/4 v2, 0x0

    .line 163
    .local v2, "bufferOutput":Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v9, Ljava/io/FileOutputStream;

    invoke-direct {v9, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_c
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 164
    .end local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .local v9, "fosOutput":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v13, Ljava/io/OutputStreamWriter;

    const-string v15, "ASCII"

    invoke-direct {v13, v9, v15}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6

    .line 165
    .end local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    .local v13, "oswOutput":Ljava/io/OutputStreamWriter;
    :try_start_2
    new-instance v3, Ljava/io/BufferedWriter;

    invoke-direct {v3, v13}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_a
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7

    .line 166
    .end local v2    # "bufferOutput":Ljava/io/BufferedWriter;
    .local v3, "bufferOutput":Ljava/io/BufferedWriter;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    :try_start_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-lt v10, v15, :cond_1

    .line 174
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V

    .line 175
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V

    .line 176
    invoke-virtual {v13}, Ljava/io/OutputStreamWriter;->close()V

    .line 177
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_b
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_8

    .line 192
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->isAccessGiven()Z

    move-result v15

    if-nez v15, :cond_4

    .line 193
    const-string v15, "ViPER4Android"

    const-string v16, "[Commit build.prop] no root permission"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 167
    :cond_1
    :try_start_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v15, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 168
    .local v5, "currLine":Ljava/lang/String;
    if-eqz v5, :cond_2

    const-string v15, ""

    invoke-virtual {v5, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 169
    :cond_2
    const-string v15, "\n"

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 166
    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 172
    :cond_3
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_b
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_8

    goto :goto_2

    .line 178
    .end local v5    # "currLine":Ljava/lang/String;
    :catch_0
    move-exception v7

    move-object v2, v3

    .end local v3    # "bufferOutput":Ljava/io/BufferedWriter;
    .restart local v2    # "bufferOutput":Ljava/io/BufferedWriter;
    move-object v12, v13

    .end local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    move-object v8, v9

    .line 179
    .end local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .end local v10    # "i":I
    .local v7, "e":Ljava/io/FileNotFoundException;
    .restart local v8    # "fosOutput":Ljava/io/FileOutputStream;
    :goto_3
    const-string v15, "ViPER4Android"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v17, " not found"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 181
    .end local v7    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v7

    .line 182
    .local v7, "e":Ljava/io/UnsupportedEncodingException;
    :goto_4
    const-string v15, "ViPER4Android"

    const-string v16, "ASCII encoding unsupported"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 185
    .end local v7    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_2
    move-exception v7

    .line 186
    .local v7, "e":Ljava/io/IOException;
    :goto_5
    const-string v15, "ViPER4Android"

    const-string v16, "[Commit build.prop] I/O exception"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 198
    .end local v2    # "bufferOutput":Ljava/io/BufferedWriter;
    .end local v7    # "e":Ljava/io/IOException;
    .end local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .end local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v3    # "bufferOutput":Ljava/io/BufferedWriter;
    .restart local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v10    # "i":I
    .restart local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    :cond_4
    const-string v15, "chmod"

    invoke-static {v15}, Lcom/stericson/RootTools/RootTools;->checkUtil(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 199
    const-string v11, "chmod"

    .line 211
    .local v11, "mChmod":Ljava/lang/String;
    :goto_6
    const-string v15, "/system"

    const-string v16, "RW"

    invoke-static/range {v15 .. v16}, Lcom/stericson/RootTools/RootTools;->remount(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_8

    .line 212
    const-string v15, "ViPER4Android"

    const-string v16, "[Commit build.prop] remount /system failed"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 201
    .end local v11    # "mChmod":Ljava/lang/String;
    :cond_5
    const-string v15, "busybox"

    invoke-static {v15}, Lcom/stericson/RootTools/RootTools;->checkUtil(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_6

    const-string v15, "chmod"

    const-string v16, "busybox"

    invoke-static/range {v15 .. v16}, Lcom/stericson/RootTools/RootTools;->hasUtil(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 202
    const-string v11, "busybox chmod"

    .restart local v11    # "mChmod":Ljava/lang/String;
    goto :goto_6

    .line 203
    .end local v11    # "mChmod":Ljava/lang/String;
    :cond_6
    const-string v15, "toolbox"

    invoke-static {v15}, Lcom/stericson/RootTools/RootTools;->checkUtil(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_7

    const-string v15, "chmod"

    const-string v16, "toolbox"

    invoke-static/range {v15 .. v16}, Lcom/stericson/RootTools/RootTools;->hasUtil(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 204
    const-string v11, "toolbox chmod"

    .restart local v11    # "mChmod":Ljava/lang/String;
    goto :goto_6

    .line 206
    .end local v11    # "mChmod":Ljava/lang/String;
    :cond_7
    const-string v15, "ViPER4Android"

    const-string v16, "[Commit build.prop] chmod not found"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 216
    .restart local v11    # "mChmod":Ljava/lang/String;
    :cond_8
    const/4 v15, 0x0

    invoke-static {v6, v15}, Lcom/stericson/RootTools/RootTools;->deleteFileOrDirectory(Ljava/lang/String;Z)Z

    move-result v15

    if-nez v15, :cond_9

    .line 217
    const-string v15, "ViPER4Android"

    const-string v16, "[Commit build.prop] can not delete old file"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 221
    :cond_9
    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-static {v14, v6, v15, v0}, Lcom/stericson/RootTools/RootTools;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v15

    if-nez v15, :cond_a

    .line 222
    const-string v15, "ViPER4Android"

    const-string v16, "[Commit build.prop] can not copy file"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 226
    :cond_a
    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    .line 227
    new-instance v4, Lcom/stericson/RootShell/execution/Command;

    const/4 v15, 0x0

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    .line 228
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v19, " 644 "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 227
    aput-object v18, v16, v17

    move-object/from16 v0, v16

    invoke-direct {v4, v15, v0}, Lcom/stericson/RootShell/execution/Command;-><init>(I[Ljava/lang/String;)V

    .line 230
    .local v4, "ccSetPermission":Lcom/stericson/RootShell/execution/Command;
    const/4 v15, 0x1

    :try_start_5
    invoke-static {v15}, Lcom/stericson/RootTools/RootTools;->getShell(Z)Lcom/stericson/RootShell/execution/Shell;

    move-result-object v15

    invoke-virtual {v15, v4}, Lcom/stericson/RootShell/execution/Shell;->add(Lcom/stericson/RootShell/execution/Command;)Lcom/stericson/RootShell/execution/Command;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Lcom/stericson/RootShell/exceptions/RootDeniedException; {:try_start_5 .. :try_end_5} :catch_3

    .line 237
    :goto_7
    invoke-static {v6}, Lcom/stericson/RootTools/RootTools;->getFilePermissionsSymlinks(Ljava/lang/String;)Lcom/stericson/RootTools/containers/Permissions;

    move-result-object v1

    .line 238
    .local v1, "bpPermission":Lcom/stericson/RootTools/containers/Permissions;
    invoke-virtual {v1}, Lcom/stericson/RootTools/containers/Permissions;->getPermissions()I

    move-result v15

    const/16 v16, 0x284

    move/from16 v0, v16

    if-eq v15, v0, :cond_b

    .line 239
    const-string v15, "ViPER4Android"

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "[Commit build.prop] chmod failed, permission of build.prop is "

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/stericson/RootTools/containers/Permissions;->getPermissions()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 241
    :cond_b
    const-string v15, "ViPER4Android"

    const-string v16, "[Commit build.prop] build.prop updated"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 233
    .end local v1    # "bpPermission":Lcom/stericson/RootTools/containers/Permissions;
    :catch_3
    move-exception v15

    goto :goto_7

    .line 232
    :catch_4
    move-exception v15

    goto :goto_7

    .line 231
    :catch_5
    move-exception v15

    goto :goto_7

    .line 185
    .end local v3    # "bufferOutput":Ljava/io/BufferedWriter;
    .end local v4    # "ccSetPermission":Lcom/stericson/RootShell/execution/Command;
    .end local v10    # "i":I
    .end local v11    # "mChmod":Ljava/lang/String;
    .end local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v2    # "bufferOutput":Ljava/io/BufferedWriter;
    .restart local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    :catch_6
    move-exception v7

    move-object v8, v9

    .end local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v8    # "fosOutput":Ljava/io/FileOutputStream;
    goto/16 :goto_5

    .end local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .end local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    :catch_7
    move-exception v7

    move-object v12, v13

    .end local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    move-object v8, v9

    .end local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v8    # "fosOutput":Ljava/io/FileOutputStream;
    goto/16 :goto_5

    .end local v2    # "bufferOutput":Ljava/io/BufferedWriter;
    .end local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .end local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v3    # "bufferOutput":Ljava/io/BufferedWriter;
    .restart local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v10    # "i":I
    .restart local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    :catch_8
    move-exception v7

    move-object v2, v3

    .end local v3    # "bufferOutput":Ljava/io/BufferedWriter;
    .restart local v2    # "bufferOutput":Ljava/io/BufferedWriter;
    move-object v12, v13

    .end local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    move-object v8, v9

    .end local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v8    # "fosOutput":Ljava/io/FileOutputStream;
    goto/16 :goto_5

    .line 181
    .end local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .end local v10    # "i":I
    .restart local v9    # "fosOutput":Ljava/io/FileOutputStream;
    :catch_9
    move-exception v7

    move-object v8, v9

    .end local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v8    # "fosOutput":Ljava/io/FileOutputStream;
    goto/16 :goto_4

    .end local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .end local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    :catch_a
    move-exception v7

    move-object v12, v13

    .end local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    move-object v8, v9

    .end local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v8    # "fosOutput":Ljava/io/FileOutputStream;
    goto/16 :goto_4

    .end local v2    # "bufferOutput":Ljava/io/BufferedWriter;
    .end local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .end local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v3    # "bufferOutput":Ljava/io/BufferedWriter;
    .restart local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v10    # "i":I
    .restart local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    :catch_b
    move-exception v7

    move-object v2, v3

    .end local v3    # "bufferOutput":Ljava/io/BufferedWriter;
    .restart local v2    # "bufferOutput":Ljava/io/BufferedWriter;
    move-object v12, v13

    .end local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    move-object v8, v9

    .end local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v8    # "fosOutput":Ljava/io/FileOutputStream;
    goto/16 :goto_4

    .line 178
    .end local v10    # "i":I
    :catch_c
    move-exception v7

    goto/16 :goto_3

    .end local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v9    # "fosOutput":Ljava/io/FileOutputStream;
    :catch_d
    move-exception v7

    move-object v8, v9

    .end local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v8    # "fosOutput":Ljava/io/FileOutputStream;
    goto/16 :goto_3

    .end local v8    # "fosOutput":Ljava/io/FileOutputStream;
    .end local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    :catch_e
    move-exception v7

    move-object v12, v13

    .end local v13    # "oswOutput":Ljava/io/OutputStreamWriter;
    .restart local v12    # "oswOutput":Ljava/io/OutputStreamWriter;
    move-object v8, v9

    .end local v9    # "fosOutput":Ljava/io/FileOutputStream;
    .restart local v8    # "fosOutput":Ljava/io/FileOutputStream;
    goto/16 :goto_3
.end method

.method public getProp(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 96
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_0

    .line 109
    const-string v3, ""

    :goto_1
    return-object v3

    .line 97
    :cond_0
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 98
    .local v0, "currLine":Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 96
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 99
    :cond_2
    const-string v3, "#"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 100
    const-string v3, "="

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 101
    .local v2, "keyANDvalue":[Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 102
    array-length v3, v2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 103
    aget-object v3, v2, v5

    if-eqz v3, :cond_1

    .line 104
    aget-object v3, v2, v5

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 105
    aget-object v3, v2, v6

    if-nez v3, :cond_3

    const-string v3, ""

    goto :goto_1

    .line 106
    :cond_3
    aget-object v3, v2, v6

    goto :goto_1
.end method

.method public initializeBuildprop()V
    .locals 10

    .prologue
    .line 42
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    .line 44
    const/4 v4, 0x0

    .line 45
    .local v4, "fisInput":Ljava/io/FileInputStream;
    const/4 v6, 0x0

    .line 46
    .local v6, "isrInput":Ljava/io/InputStreamReader;
    const/4 v0, 0x0

    .line 48
    .local v0, "bufferInput":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    const-string v8, "/system/build.prop"

    invoke-direct {v5, v8}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 49
    .end local v4    # "fisInput":Ljava/io/FileInputStream;
    .local v5, "fisInput":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v7, Ljava/io/InputStreamReader;

    const-string v8, "ASCII"

    invoke-direct {v7, v5, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 50
    .end local v6    # "isrInput":Ljava/io/InputStreamReader;
    .local v7, "isrInput":Ljava/io/InputStreamReader;
    :try_start_2
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 52
    .end local v0    # "bufferInput":Ljava/io/BufferedReader;
    .local v1, "bufferInput":Ljava/io/BufferedReader;
    :goto_0
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, "currLine":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 56
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 57
    invoke-virtual {v7}, Ljava/io/InputStreamReader;->close()V

    .line 58
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    move-object v0, v1

    .end local v1    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v0    # "bufferInput":Ljava/io/BufferedReader;
    move-object v6, v7

    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v6    # "isrInput":Ljava/io/InputStreamReader;
    move-object v4, v5

    .line 71
    .end local v2    # "currLine":Ljava/lang/String;
    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v4    # "fisInput":Ljava/io/FileInputStream;
    :goto_1
    return-void

    .line 54
    .end local v0    # "bufferInput":Ljava/io/BufferedReader;
    .end local v4    # "fisInput":Ljava/io/FileInputStream;
    .end local v6    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v1    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v2    # "currLine":Ljava/lang/String;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    :cond_0
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_8
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    goto :goto_0

    .line 59
    .end local v2    # "currLine":Ljava/lang/String;
    :catch_0
    move-exception v3

    move-object v0, v1

    .end local v1    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v0    # "bufferInput":Ljava/io/BufferedReader;
    move-object v6, v7

    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v6    # "isrInput":Ljava/io/InputStreamReader;
    move-object v4, v5

    .line 60
    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .local v3, "e":Ljava/io/FileNotFoundException;
    .restart local v4    # "fisInput":Ljava/io/FileInputStream;
    :goto_2
    const-string v8, "ViPER4Android"

    const-string v9, "/system/build.prop not found"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 62
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v8

    goto :goto_1

    .end local v4    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    :catch_2
    move-exception v8

    move-object v4, v5

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v4    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_1

    .end local v4    # "fisInput":Ljava/io/FileInputStream;
    .end local v6    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    :catch_3
    move-exception v8

    move-object v6, v7

    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v6    # "isrInput":Ljava/io/InputStreamReader;
    move-object v4, v5

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v4    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_1

    .end local v0    # "bufferInput":Ljava/io/BufferedReader;
    .end local v4    # "fisInput":Ljava/io/FileInputStream;
    .end local v6    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v1    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    :catch_4
    move-exception v8

    move-object v0, v1

    .end local v1    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v0    # "bufferInput":Ljava/io/BufferedReader;
    move-object v6, v7

    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v6    # "isrInput":Ljava/io/InputStreamReader;
    move-object v4, v5

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v4    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_1

    .line 61
    :catch_5
    move-exception v8

    goto :goto_1

    .end local v4    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    :catch_6
    move-exception v8

    move-object v4, v5

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v4    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_1

    .end local v4    # "fisInput":Ljava/io/FileInputStream;
    .end local v6    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    :catch_7
    move-exception v8

    move-object v6, v7

    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v6    # "isrInput":Ljava/io/InputStreamReader;
    move-object v4, v5

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v4    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_1

    .end local v0    # "bufferInput":Ljava/io/BufferedReader;
    .end local v4    # "fisInput":Ljava/io/FileInputStream;
    .end local v6    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v1    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    :catch_8
    move-exception v8

    move-object v0, v1

    .end local v1    # "bufferInput":Ljava/io/BufferedReader;
    .restart local v0    # "bufferInput":Ljava/io/BufferedReader;
    move-object v6, v7

    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v6    # "isrInput":Ljava/io/InputStreamReader;
    move-object v4, v5

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v4    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_1

    .line 59
    :catch_9
    move-exception v3

    goto :goto_2

    .end local v4    # "fisInput":Ljava/io/FileInputStream;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    :catch_a
    move-exception v3

    move-object v4, v5

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v4    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_2

    .end local v4    # "fisInput":Ljava/io/FileInputStream;
    .end local v6    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v7    # "isrInput":Ljava/io/InputStreamReader;
    :catch_b
    move-exception v3

    move-object v6, v7

    .end local v7    # "isrInput":Ljava/io/InputStreamReader;
    .restart local v6    # "isrInput":Ljava/io/InputStreamReader;
    move-object v4, v5

    .end local v5    # "fisInput":Ljava/io/FileInputStream;
    .restart local v4    # "fisInput":Ljava/io/FileInputStream;
    goto :goto_2
.end method

.method public propExists(Ljava/lang/String;)Z
    .locals 6
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 77
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_0

    move v3, v4

    .line 89
    :goto_1
    return v3

    .line 78
    :cond_0
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 79
    .local v0, "currLine":Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 77
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 80
    :cond_2
    const-string v3, "#"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 81
    const-string v3, "="

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 82
    .local v2, "keyANDvalue":[Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 83
    array-length v3, v2

    const/4 v5, 0x2

    if-ne v3, v5, :cond_1

    .line 84
    aget-object v3, v2, v4

    if-eqz v3, :cond_1

    .line 85
    aget-object v3, v2, v4

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 86
    const/4 v3, 0x1

    goto :goto_1
.end method

.method public setProp(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 116
    const/4 v1, 0x0

    .line 117
    .local v1, "foundKey":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v2, v4, :cond_1

    .line 137
    if-nez v1, :cond_0

    .line 138
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    :cond_0
    return-void

    .line 118
    :cond_1
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 119
    .local v0, "currLine":Ljava/lang/String;
    if-eqz v0, :cond_2

    const-string v4, ""

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 117
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 120
    :cond_3
    const-string v4, "#"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 121
    const-string v4, "="

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 122
    .local v3, "keyANDvalue":[Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 123
    array-length v4, v3

    const/4 v5, 0x2

    if-ne v4, v5, :cond_2

    .line 124
    aget-object v4, v3, v7

    if-eqz v4, :cond_2

    .line 125
    aget-object v4, v3, v7

    invoke-virtual {p1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 126
    aput-object p2, v3, v8

    .line 127
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/BuildProp;->mBuildPropContent:Ljava/util/ArrayList;

    new-instance v5, Ljava/lang/StringBuilder;

    aget-object v6, v3, v7

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v8

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 128
    const/4 v1, 0x1

    goto :goto_1
.end method
