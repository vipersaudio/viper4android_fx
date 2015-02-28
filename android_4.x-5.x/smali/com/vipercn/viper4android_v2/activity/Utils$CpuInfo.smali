.class public Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vipercn/viper4android_v2/activity/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CpuInfo"
.end annotation


# instance fields
.field private mCpuHasNEON:Z

.field private mCpuHasVFP:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    iput-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasNEON:Z

    .line 225
    iput-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasVFP:Z

    .line 226
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->readCpuInfo()Z

    move-result v0

    if-nez v0, :cond_0

    .line 227
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->readCPUInfoJni()V

    .line 229
    :cond_0
    return-void
.end method

.method private readCPUInfoJni()V
    .locals 1

    .prologue
    .line 218
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/V4AJniInterface;->IsCPUSupportNEON()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasNEON:Z

    .line 219
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/V4AJniInterface;->IsCPUSupportVFP()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasVFP:Z

    .line 220
    return-void
.end method

.method private readCpuInfo()Z
    .locals 15

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 157
    const-string v6, "/proc/cpuinfo"

    .line 158
    .local v6, "mCPUInfoFile":Ljava/lang/String;
    const/4 v2, 0x0

    .line 159
    .local v2, "cpuInfoReader":Ljava/io/FileReader;
    const/4 v0, 0x0

    .line 161
    .local v0, "bufferReader":Ljava/io/BufferedReader;
    iput-boolean v10, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasNEON:Z

    .line 162
    iput-boolean v10, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasVFP:Z

    .line 166
    :try_start_0
    new-instance v3, Ljava/io/FileReader;

    invoke-direct {v3, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 167
    .end local v2    # "cpuInfoReader":Ljava/io/FileReader;
    .local v3, "cpuInfoReader":Ljava/io/FileReader;
    :try_start_1
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 169
    .end local v0    # "bufferReader":Ljava/io/BufferedReader;
    .local v1, "bufferReader":Ljava/io/BufferedReader;
    :cond_0
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    .line 170
    .local v8, "mLine":Ljava/lang/String;
    if-nez v8, :cond_1

    .line 189
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 190
    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 191
    const/4 v0, 0x0

    .line 192
    .end local v1    # "bufferReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufferReader":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 194
    .end local v3    # "cpuInfoReader":Ljava/io/FileReader;
    .restart local v2    # "cpuInfoReader":Ljava/io/FileReader;
    :try_start_3
    const-string v12, "ViPER4Android"

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "cpuInfo[java] = NEON:"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v14, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasNEON:Z

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", VFP:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 195
    iget-boolean v14, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasVFP:Z

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 194
    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    iget-boolean v12, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasNEON:Z

    if-nez v12, :cond_6

    iget-boolean v12, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasVFP:Z
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    if-nez v12, :cond_6

    .line 211
    .end local v8    # "mLine":Ljava/lang/String;
    :goto_0
    return v10

    .line 173
    .end local v0    # "bufferReader":Ljava/io/BufferedReader;
    .end local v2    # "cpuInfoReader":Ljava/io/FileReader;
    .restart local v1    # "bufferReader":Ljava/io/BufferedReader;
    .restart local v3    # "cpuInfoReader":Ljava/io/FileReader;
    .restart local v8    # "mLine":Ljava/lang/String;
    :cond_1
    :try_start_4
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 174
    const-string v12, "Features"

    invoke-virtual {v8, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 175
    const-string v12, "ViPER4Android"

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "CpuInfo[java] = <"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ">"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    new-instance v9, Ljava/util/StringTokenizer;

    invoke-direct {v9, v8}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 177
    .local v9, "stBlock":Ljava/util/StringTokenizer;
    :cond_2
    :goto_1
    invoke-virtual {v9}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 178
    invoke-virtual {v9}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v7

    .line 179
    .local v7, "mFeature":Ljava/lang/String;
    if-eqz v7, :cond_2

    .line 180
    const-string v12, "neon"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 181
    const/4 v12, 0x1

    iput-boolean v12, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasNEON:Z
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    .line 197
    .end local v7    # "mFeature":Ljava/lang/String;
    .end local v8    # "mLine":Ljava/lang/String;
    .end local v9    # "stBlock":Ljava/util/StringTokenizer;
    :catch_0
    move-exception v4

    move-object v0, v1

    .end local v1    # "bufferReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufferReader":Ljava/io/BufferedReader;
    move-object v2, v3

    .line 199
    .end local v3    # "cpuInfoReader":Ljava/io/FileReader;
    .restart local v2    # "cpuInfoReader":Ljava/io/FileReader;
    .local v4, "e":Ljava/io/IOException;
    :goto_2
    if-eqz v0, :cond_3

    .line 200
    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 202
    :cond_3
    if-eqz v2, :cond_4

    .line 203
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 205
    :cond_4
    const/4 v0, 0x0

    .line 206
    const/4 v2, 0x0

    goto :goto_0

    .line 182
    .end local v0    # "bufferReader":Ljava/io/BufferedReader;
    .end local v2    # "cpuInfoReader":Ljava/io/FileReader;
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v1    # "bufferReader":Ljava/io/BufferedReader;
    .restart local v3    # "cpuInfoReader":Ljava/io/FileReader;
    .restart local v7    # "mFeature":Ljava/lang/String;
    .restart local v8    # "mLine":Ljava/lang/String;
    .restart local v9    # "stBlock":Ljava/util/StringTokenizer;
    :cond_5
    :try_start_6
    const-string v12, "vfp"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 183
    const/4 v12, 0x1

    iput-boolean v12, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasVFP:Z
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_1

    .end local v1    # "bufferReader":Ljava/io/BufferedReader;
    .end local v3    # "cpuInfoReader":Ljava/io/FileReader;
    .end local v7    # "mFeature":Ljava/lang/String;
    .end local v9    # "stBlock":Ljava/util/StringTokenizer;
    .restart local v0    # "bufferReader":Ljava/io/BufferedReader;
    .restart local v2    # "cpuInfoReader":Ljava/io/FileReader;
    :cond_6
    move v10, v11

    .line 196
    goto :goto_0

    .line 208
    .end local v8    # "mLine":Ljava/lang/String;
    .restart local v4    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v5

    .line 209
    .local v5, "ex":Ljava/lang/Exception;
    const/4 v0, 0x0

    .line 210
    const/4 v2, 0x0

    .line 211
    goto :goto_0

    .line 197
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "ex":Ljava/lang/Exception;
    :catch_2
    move-exception v4

    goto :goto_2

    .end local v2    # "cpuInfoReader":Ljava/io/FileReader;
    .restart local v3    # "cpuInfoReader":Ljava/io/FileReader;
    :catch_3
    move-exception v4

    move-object v2, v3

    .end local v3    # "cpuInfoReader":Ljava/io/FileReader;
    .restart local v2    # "cpuInfoReader":Ljava/io/FileReader;
    goto :goto_2
.end method


# virtual methods
.method public hasNEON()Z
    .locals 1

    .prologue
    .line 232
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasNEON:Z

    return v0
.end method

.method public hasVFP()Z
    .locals 1

    .prologue
    .line 236
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->mCpuHasVFP:Z

    return v0
.end method
