.class public Lcom/vipercn/viper4android_v2/activity/DDCDatabase;
.super Ljava/lang/Object;
.source "DDCDatabase.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static blockToFloatArray(Ljava/lang/String;)[F
    .locals 7
    .param p0, "szDDCBlock"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 188
    if-eqz p0, :cond_0

    .line 189
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x3

    if-lt v5, v6, :cond_0

    .line 190
    const-string v5, ","

    invoke-virtual {p0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    :cond_0
    move-object v1, v4

    .line 200
    :cond_1
    :goto_0
    return-object v1

    .line 193
    :cond_2
    :try_start_0
    const-string v5, ","

    invoke-virtual {p0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 194
    .local v3, "szCoeffs":[Ljava/lang/String;
    array-length v5, v3

    new-array v1, v5, [F

    .line 195
    .local v1, "faCoeffsArray":[F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v5, v3

    if-ge v2, v5, :cond_1

    .line 196
    aget-object v5, v3, v2

    invoke-static {v5}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    aput v5, v1, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 199
    .end local v1    # "faCoeffsArray":[F
    .end local v2    # "i":I
    .end local v3    # "szCoeffs":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .local v0, "ex":Ljava/lang/Exception;
    move-object v1, v4

    .line 200
    goto :goto_0
.end method

.method public static initializeDatabase(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-static {p0}, Lcom/vipercn/viper4android_v2/activity/Utils;->getBasePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 21
    .local v1, "szLocalDatabasePathName":Ljava/lang/String;
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "ViPERDDC.db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 27
    :goto_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 28
    .local v0, "fDBFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    const-string v2, "ViPERDDC.db"

    const-string v3, "ViPERDDC.db"

    invoke-static {p0, v2, v3}, Lcom/vipercn/viper4android_v2/activity/Utils;->copyAssetsToLocal(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 31
    const/4 v1, 0x0

    .line 32
    const/4 v2, 0x0

    .line 35
    :goto_1
    return v2

    .line 24
    .end local v0    # "fDBFile":Ljava/io/File;
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "/ViPERDDC.db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 35
    .restart local v0    # "fDBFile":Ljava/io/File;
    :cond_2
    const/4 v2, 0x1

    goto :goto_1
.end method

.method public static queryDDCBlock(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 26
    .param p0, "szKeyID"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 79
    if-nez p0, :cond_0

    const-string v3, ""

    .line 183
    :goto_0
    return-object v3

    .line 80
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, ""

    goto :goto_0

    .line 81
    :cond_1
    const-string v3, "FILE:"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 82
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aCustomDDCPath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    const/4 v5, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 82
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 84
    .local v21, "szDDCFilePath":Ljava/lang/String;
    new-instance v18, Ljava/io/File;

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 85
    .local v18, "mDDCFileHandle":Ljava/io/File;
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_2

    .line 86
    const-string v3, ""

    goto :goto_0

    .line 88
    :cond_2
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->canRead()Z

    move-result v3

    if-nez v3, :cond_3

    .line 89
    const-string v3, ""

    goto :goto_0

    .line 92
    :cond_3
    const-string v24, ""

    .line 93
    .local v24, "szSR44100Coeffs":Ljava/lang/String;
    const-string v25, ""

    .line 95
    .local v25, "szSR48000Coeffs":Ljava/lang/String;
    const/4 v15, 0x0

    .line 96
    .local v15, "frDDCReader":Ljava/io/FileReader;
    const/4 v10, 0x0

    .line 98
    .local v10, "brDDCBufferedReader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v16, Ljava/io/FileReader;

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .end local v15    # "frDDCReader":Ljava/io/FileReader;
    .local v16, "frDDCReader":Ljava/io/FileReader;
    :try_start_1
    new-instance v11, Ljava/io/BufferedReader;

    move-object/from16 v0, v16

    invoke-direct {v11, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 101
    .end local v10    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .local v11, "brDDCBufferedReader":Ljava/io/BufferedReader;
    :cond_4
    :goto_1
    :try_start_2
    invoke-virtual {v11}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v22

    .line 102
    .local v22, "szLine":Ljava/lang/String;
    if-nez v22, :cond_5

    .line 112
    invoke-virtual {v11}, Ljava/io/BufferedReader;->close()V

    .line 113
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 114
    const/4 v10, 0x0

    .line 115
    .end local v11    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .restart local v10    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    const/4 v15, 0x0

    .line 116
    .end local v16    # "frDDCReader":Ljava/io/FileReader;
    .restart local v15    # "frDDCReader":Ljava/io/FileReader;
    const/16 v18, 0x0

    .line 137
    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_9

    const-string v3, ""

    goto :goto_0

    .line 105
    .end local v10    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .end local v15    # "frDDCReader":Ljava/io/FileReader;
    .restart local v11    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .restart local v16    # "frDDCReader":Ljava/io/FileReader;
    :cond_5
    :try_start_3
    invoke-virtual/range {v22 .. v22}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v22

    .line 106
    const-string v3, "SR_44100:"

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 107
    const/16 v3, 0x9

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v24

    .line 108
    goto :goto_1

    :cond_6
    const-string v3, "SR_48000:"

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 109
    const/16 v3, 0x9

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    move-result-object v25

    .line 100
    goto :goto_1

    .line 117
    .end local v11    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .end local v16    # "frDDCReader":Ljava/io/FileReader;
    .end local v22    # "szLine":Ljava/lang/String;
    .restart local v10    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .restart local v15    # "frDDCReader":Ljava/io/FileReader;
    :catch_0
    move-exception v12

    .line 119
    .local v12, "e1":Ljava/io/IOException;
    :goto_2
    if-eqz v10, :cond_7

    .line 120
    :try_start_4
    invoke-virtual {v10}, Ljava/io/BufferedReader;->close()V

    .line 122
    :cond_7
    if-eqz v15, :cond_8

    .line 123
    invoke-virtual {v15}, Ljava/io/FileReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 125
    :cond_8
    const/4 v10, 0x0

    .line 126
    const/4 v15, 0x0

    .line 127
    const/16 v18, 0x0

    .line 128
    const-string v3, ""

    goto/16 :goto_0

    .line 129
    :catch_1
    move-exception v13

    .line 130
    .local v13, "e2":Ljava/io/IOException;
    const/4 v10, 0x0

    .line 131
    const/4 v15, 0x0

    .line 132
    const/16 v18, 0x0

    .line 133
    const-string v3, ""

    goto/16 :goto_0

    .line 138
    .end local v12    # "e1":Ljava/io/IOException;
    .end local v13    # "e2":Ljava/io/IOException;
    .restart local v22    # "szLine":Ljava/lang/String;
    :cond_9
    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_a

    const-string v3, ""

    goto/16 :goto_0

    .line 139
    :cond_a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v24 .. v24}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v25

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_0

    .line 142
    .end local v10    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .end local v15    # "frDDCReader":Ljava/io/FileReader;
    .end local v18    # "mDDCFileHandle":Ljava/io/File;
    .end local v21    # "szDDCFilePath":Ljava/lang/String;
    .end local v22    # "szLine":Ljava/lang/String;
    .end local v24    # "szSR44100Coeffs":Ljava/lang/String;
    .end local v25    # "szSR48000Coeffs":Ljava/lang/String;
    :cond_b
    invoke-static/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/Utils;->getBasePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v23

    .line 143
    .local v23, "szLocalDatabasePathName":Ljava/lang/String;
    const-string v3, "/"

    move-object/from16 v0, v23

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 144
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "ViPERDDC.db"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 149
    :goto_3
    const/4 v2, 0x0

    .line 150
    .local v2, "dbViPERDDC":Landroid/database/sqlite/SQLiteDatabase;
    const/16 v17, 0x0

    .line 152
    .local v17, "mDDCData":Landroid/database/Cursor;
    const/4 v3, 0x3

    :try_start_5
    new-array v4, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "ID"

    aput-object v5, v4, v3

    const/4 v3, 0x1

    const-string v5, "SR_44100_Coeffs"

    aput-object v5, v4, v3

    const/4 v3, 0x2

    const-string v5, "SR_48000_Coeffs"

    aput-object v5, v4, v3

    .line 153
    .local v4, "szColumns":[Ljava/lang/String;
    const/4 v3, 0x1

    new-array v6, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p0, v6, v3

    .line 154
    .local v6, "szQueryArgs":[Ljava/lang/String;
    const/4 v3, 0x0

    const/16 v5, 0x11

    move-object/from16 v0, v23

    invoke-static {v0, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 155
    const-string v3, "DDCData"

    const-string v5, "ID=?"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 156
    if-eqz v17, :cond_c

    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->getCount()I

    move-result v3

    const/4 v5, 0x1

    if-eq v3, v5, :cond_e

    .line 157
    :cond_c
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 158
    const/4 v2, 0x0

    .line 159
    const/4 v4, 0x0

    .line 160
    const/4 v6, 0x0

    .line 161
    const/16 v23, 0x0

    .line 162
    const-string v3, ""

    goto/16 :goto_0

    .line 146
    .end local v2    # "dbViPERDDC":Landroid/database/sqlite/SQLiteDatabase;
    .end local v4    # "szColumns":[Ljava/lang/String;
    .end local v6    # "szQueryArgs":[Ljava/lang/String;
    .end local v17    # "mDDCData":Landroid/database/Cursor;
    :cond_d
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "/ViPERDDC.db"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    goto :goto_3

    .line 164
    .restart local v2    # "dbViPERDDC":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v4    # "szColumns":[Ljava/lang/String;
    .restart local v6    # "szQueryArgs":[Ljava/lang/String;
    .restart local v17    # "mDDCData":Landroid/database/Cursor;
    :cond_e
    :try_start_6
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToFirst()Z

    .line 165
    const/4 v3, 0x1

    move-object/from16 v0, v17

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    .line 166
    .local v19, "szC44100":Ljava/lang/String;
    const/4 v3, 0x2

    move-object/from16 v0, v17

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v20

    .line 167
    .local v20, "szC48000":Ljava/lang/String;
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 168
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 169
    const/16 v17, 0x0

    .line 170
    const/4 v2, 0x0

    .line 171
    const/4 v4, 0x0

    .line 172
    const/4 v6, 0x0

    .line 173
    const/16 v23, 0x0

    .line 174
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_f

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    move-result v3

    if-gtz v3, :cond_10

    .line 175
    :cond_f
    const-string v3, ""

    goto/16 :goto_0

    .line 177
    :cond_10
    :try_start_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    move-result-object v3

    goto/16 :goto_0

    .line 178
    .end local v4    # "szColumns":[Ljava/lang/String;
    .end local v6    # "szQueryArgs":[Ljava/lang/String;
    .end local v19    # "szC44100":Ljava/lang/String;
    .end local v20    # "szC48000":Ljava/lang/String;
    :catch_2
    move-exception v14

    .line 179
    .local v14, "ex":Ljava/lang/Exception;
    const-string v3, "ViPER4Android"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "queryDDCBlock[ViPER-DDC] :"

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    const/16 v17, 0x0

    .line 181
    const/4 v2, 0x0

    .line 182
    const/16 v23, 0x0

    .line 183
    const-string v3, ""

    goto/16 :goto_0

    .line 117
    .end local v2    # "dbViPERDDC":Landroid/database/sqlite/SQLiteDatabase;
    .end local v14    # "ex":Ljava/lang/Exception;
    .end local v17    # "mDDCData":Landroid/database/Cursor;
    .end local v23    # "szLocalDatabasePathName":Ljava/lang/String;
    .restart local v10    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .restart local v16    # "frDDCReader":Ljava/io/FileReader;
    .restart local v18    # "mDDCFileHandle":Ljava/io/File;
    .restart local v21    # "szDDCFilePath":Ljava/lang/String;
    .restart local v24    # "szSR44100Coeffs":Ljava/lang/String;
    .restart local v25    # "szSR48000Coeffs":Ljava/lang/String;
    :catch_3
    move-exception v12

    move-object/from16 v15, v16

    .end local v16    # "frDDCReader":Ljava/io/FileReader;
    .restart local v15    # "frDDCReader":Ljava/io/FileReader;
    goto/16 :goto_2

    .end local v10    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .end local v15    # "frDDCReader":Ljava/io/FileReader;
    .restart local v11    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .restart local v16    # "frDDCReader":Ljava/io/FileReader;
    :catch_4
    move-exception v12

    move-object v10, v11

    .end local v11    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    .restart local v10    # "brDDCBufferedReader":Ljava/io/BufferedReader;
    move-object/from16 v15, v16

    .end local v16    # "frDDCReader":Ljava/io/FileReader;
    .restart local v15    # "frDDCReader":Ljava/io/FileReader;
    goto/16 :goto_2
.end method

.method public static queryManufacturerAndModel(Landroid/content/Context;)Ljava/util/Map;
    .locals 13
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    invoke-static {p0}, Lcom/vipercn/viper4android_v2/activity/Utils;->getBasePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    .line 40
    .local v12, "szLocalDatabasePathName":Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v12, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "ViPERDDC.db"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 46
    :goto_0
    new-instance v10, Ljava/util/LinkedHashMap;

    invoke-direct {v10}, Ljava/util/LinkedHashMap;-><init>()V

    .line 47
    .local v10, "mManufacturerAndModel":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 48
    .local v0, "dbViPERDDC":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v9, 0x0

    .line 50
    .local v9, "mDDCData":Landroid/database/Cursor;
    const/4 v1, 0x3

    :try_start_0
    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v3, "ID"

    aput-object v3, v2, v1

    const/4 v1, 0x1

    const-string v3, "Company"

    aput-object v3, v2, v1

    const/4 v1, 0x2

    const-string v3, "Model"

    aput-object v3, v2, v1

    .line 51
    .local v2, "szColumns":[Ljava/lang/String;
    const/4 v1, 0x0

    const/16 v3, 0x11

    invoke-static {v12, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 52
    const-string v1, "DDCData"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "Company COLLATE NOCASE"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 53
    if-eqz v9, :cond_2

    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 55
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    invoke-interface {v9, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x2

    invoke-interface {v9, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 59
    :cond_1
    :goto_1
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 60
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 61
    const/4 v9, 0x0

    .line 63
    :cond_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    const/4 v0, 0x0

    .line 65
    const/4 v2, 0x0

    .line 66
    const/4 v12, 0x0

    .line 73
    .end local v2    # "szColumns":[Ljava/lang/String;
    :goto_2
    return-object v10

    .line 43
    .end local v0    # "dbViPERDDC":Landroid/database/sqlite/SQLiteDatabase;
    .end local v9    # "mDDCData":Landroid/database/Cursor;
    .end local v10    # "mManufacturerAndModel":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "/ViPERDDC.db"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    goto :goto_0

    .line 57
    .restart local v0    # "dbViPERDDC":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v2    # "szColumns":[Ljava/lang/String;
    .restart local v9    # "mDDCData":Landroid/database/Cursor;
    .restart local v10    # "mManufacturerAndModel":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    const/4 v3, 0x1

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " - "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v3, 0x2

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 58
    .local v11, "szKey":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v10, v1, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 68
    .end local v2    # "szColumns":[Ljava/lang/String;
    .end local v11    # "szKey":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 69
    .local v8, "ex":Landroid/database/sqlite/SQLiteException;
    const-string v1, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "queryManufacturerAndModel[ViPER-DDC] :"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    const/4 v9, 0x0

    .line 71
    const/4 v0, 0x0

    .line 72
    const/4 v12, 0x0

    .line 73
    goto :goto_2
.end method
