.class Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
.super Ljava/lang/Object;
.source "ViPER4AndroidService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "V4ADSPModule"
.end annotation


# instance fields
.field private final EFFECT_TYPE_NULL:Ljava/util/UUID;

.field public mInstance:Landroid/media/audiofx/AudioEffect;

.field final synthetic this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;


# direct methods
.method public constructor <init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;I)V
    .locals 6
    .param p2, "nAudioSession"    # I

    .prologue
    .line 68
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const-string v2, "ec7178ec-e5e1-4432-a3f4-4657e6795210"

    invoke-static {v2}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->EFFECT_TYPE_NULL:Ljava/util/UUID;

    .line 70
    :try_start_0
    const-string v2, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Creating viper4android module, "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->ID_V4A_GENERAL_FX:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    const-class v2, Landroid/media/audiofx/AudioEffect;

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    .line 72
    const-class v5, Ljava/util/UUID;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Ljava/util/UUID;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x3

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 73
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->EFFECT_TYPE_NULL:Ljava/util/UUID;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->ID_V4A_GENERAL_FX:Ljava/util/UUID;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    .line 72
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/audiofx/AudioEffect;

    .line 71
    iput-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :goto_0
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-eqz v2, :cond_0

    .line 81
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    invoke-virtual {v2}, Landroid/media/audiofx/AudioEffect;->getDescriptor()Landroid/media/audiofx/AudioEffect$Descriptor;

    move-result-object v0

    .line 82
    .local v0, "adModuleDescriptor":Landroid/media/audiofx/AudioEffect$Descriptor;
    const-string v2, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Effect name : "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Landroid/media/audiofx/AudioEffect$Descriptor;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    const-string v2, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Type id : "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Landroid/media/audiofx/AudioEffect$Descriptor;->type:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    const-string v2, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unique id : "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Landroid/media/audiofx/AudioEffect$Descriptor;->uuid:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    const-string v2, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Implementor : "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Landroid/media/audiofx/AudioEffect$Descriptor;->implementor:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    const-string v2, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Connect mode : "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Landroid/media/audiofx/AudioEffect$Descriptor;->connectMode:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    new-instance v3, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$1;

    invoke-direct {v3, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$1;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)V

    invoke-virtual {v2, v3}, Landroid/media/audiofx/AudioEffect;->setControlStatusListener(Landroid/media/audiofx/AudioEffect$OnControlStatusChangeListener;)V

    .line 103
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    new-instance v3, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$2;

    invoke-direct {v3, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$2;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)V

    invoke-virtual {v2, v3}, Landroid/media/audiofx/AudioEffect;->setEnableStatusListener(Landroid/media/audiofx/AudioEffect$OnEnableStatusChangeListener;)V

    .line 131
    .end local v0    # "adModuleDescriptor":Landroid/media/audiofx/AudioEffect$Descriptor;
    :cond_0
    return-void

    .line 74
    :catch_0
    move-exception v1

    .line 75
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "ViPER4Android"

    const-string v3, "Can not create audio effect instance,V4A driver not installed or not supported by this rom"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    goto/16 :goto_0
.end method

.method static synthetic access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    return-object v0
.end method

.method private byteArrayToInt([B)I
    .locals 2
    .param p1, "valueBuf"    # [B

    .prologue
    .line 153
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 154
    .local v0, "converter":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 155
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v1

    return v1
.end method

.method private varargs concatArrays([[B)[B
    .locals 8
    .param p1, "arrays"    # [[B

    .prologue
    const/4 v5, 0x0

    .line 159
    const/4 v2, 0x0

    .line 160
    .local v2, "len":I
    array-length v6, p1

    move v4, v5

    :goto_0
    if-lt v4, v6, :cond_0

    .line 163
    new-array v1, v2, [B

    .line 164
    .local v1, "b":[B
    const/4 v3, 0x0

    .line 165
    .local v3, "offs":I
    array-length v6, p1

    move v4, v5

    :goto_1
    if-lt v4, v6, :cond_1

    .line 169
    return-object v1

    .line 160
    .end local v1    # "b":[B
    .end local v3    # "offs":I
    :cond_0
    aget-object v0, p1, v4

    .line 161
    .local v0, "a":[B
    array-length v7, v0

    add-int/2addr v2, v7

    .line 160
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 165
    .end local v0    # "a":[B
    .restart local v1    # "b":[B
    .restart local v3    # "offs":I
    :cond_1
    aget-object v0, p1, v4

    .line 166
    .restart local v0    # "a":[B
    array-length v7, v0

    invoke-static {v0, v5, v1, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 167
    array-length v7, v0

    add-int/2addr v3, v7

    .line 165
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method private intToByteArray(I)[B
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 146
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 147
    .local v0, "converter":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 148
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 149
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method

.method private proceedIRBuffer_Headphone(Lcom/vipercn/viper4android_v2/activity/IRSUtils;Ljava/lang/String;)V
    .locals 25
    .param p1, "irs"    # Lcom/vipercn/viper4android_v2/activity/IRSUtils;
    .param p2, "mConvIRFile"    # Ljava/lang/String;

    .prologue
    .line 511
    new-instance v20, Ljava/util/Random;

    invoke-direct/range {v20 .. v20}, Ljava/util/Random;-><init>()V

    .line 512
    .local v20, "rndMachine":Ljava/util/Random;
    invoke-virtual/range {v20 .. v20}, Ljava/util/Random;->nextInt()I

    move-result v11

    .line 513
    .local v11, "mKernelBufferID":I
    const v21, 0x10004

    .line 514
    invoke-virtual/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->getChannels()I

    move-result v22

    const/16 v23, 0x0

    .line 513
    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v0, v1, v11, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 515
    const/16 v20, 0x0

    .line 518
    invoke-virtual/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->readEntireData()[B

    move-result-object v12

    .line 520
    .local v12, "mKernelData":[B
    if-eqz v12, :cond_0

    array-length v0, v12

    move/from16 v21, v0

    if-gtz v21, :cond_1

    .line 521
    :cond_0
    const v21, 0x10004

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    move/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 522
    const/4 v12, 0x0

    .line 563
    :goto_0
    return-void

    .line 525
    :cond_1
    array-length v0, v12

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-static {v12, v0}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->hashIRS([BI)J

    move-result-wide v18

    .line 526
    .local v18, "nlHashCode":J
    move-wide/from16 v0, v18

    long-to-int v6, v0

    .line 528
    .local v6, "hashCode":I
    const-string v21, "ViPER4Android"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "[Kernel] Channels = "

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->getChannels()I

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ", Frames = "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->getSampleCount()I

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 529
    const-string v23, ", Bytes = "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    array-length v0, v12

    move/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ", Hash = "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 528
    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    const/16 v7, 0x1ff8

    .line 536
    .local v7, "mBlockSize":I
    array-length v14, v12

    .local v14, "mRestBytes":I
    const/16 v16, 0x0

    .local v16, "mSendOffset":I
    const/4 v13, 0x0

    .line 537
    .local v13, "mPacketIndex":I
    :goto_1
    if-gtz v14, :cond_3

    .line 552
    const/4 v12, 0x0

    .line 555
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    .line 556
    .local v9, "mIrsName":[B
    const/4 v10, 0x0

    .line 557
    .local v10, "mIrsNameHashCode":I
    if-eqz v9, :cond_2

    .line 558
    array-length v0, v9

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-static {v9, v0}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->hashIRS([BI)J

    move-result-wide v22

    move-wide/from16 v0, v22

    long-to-int v10, v0

    .line 559
    const/4 v9, 0x0

    .line 561
    :cond_2
    const v21, 0x10006

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1, v11, v6, v10}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    goto :goto_0

    .line 538
    .end local v9    # "mIrsName":[B
    .end local v10    # "mIrsNameHashCode":I
    :cond_3
    invoke-static {v7, v14}, Ljava/lang/Math;->min(II)I

    move-result v17

    .line 539
    .local v17, "minBlockSize":I
    move/from16 v0, v17

    new-array v15, v0, [B

    .line 540
    .local v15, "mSendData":[B
    const/16 v21, 0x0

    move/from16 v0, v16

    move/from16 v1, v21

    move/from16 v2, v17

    invoke-static {v12, v0, v15, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 541
    add-int v16, v16, v17

    .line 542
    sub-int v14, v14, v17

    .line 543
    const-string v21, "ViPER4Android"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "Setting kernel buffer, index = "

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ","

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 544
    const-string v23, "length = "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 543
    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 545
    add-int/lit8 v13, v13, 0x1

    .line 547
    div-int/lit8 v8, v17, 0x4

    .line 548
    .local v8, "mFramesCount":I
    const v21, 0x10005

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1, v11, v8, v15}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx2x8192(III[B)V

    goto :goto_1
.end method

.method private proceedIRBuffer_Headphone(Ljava/lang/String;II)V
    .locals 24
    .param p1, "mConvIRFile"    # Ljava/lang/String;
    .param p2, "mChannels"    # I
    .param p3, "mFrames"    # I

    .prologue
    .line 395
    new-instance v19, Ljava/util/Random;

    invoke-direct/range {v19 .. v19}, Ljava/util/Random;-><init>()V

    .line 396
    .local v19, "rndMachine":Ljava/util/Random;
    invoke-virtual/range {v19 .. v19}, Ljava/util/Random;->nextInt()I

    move-result v12

    .line 397
    .local v12, "mKernelBufferID":I
    const v20, 0x10004

    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, p2

    move/from16 v3, v21

    invoke-virtual {v0, v1, v12, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 398
    const/16 v19, 0x0

    .line 401
    invoke-static/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/V4AJniInterface;->ReadImpulseResponseToArray(Ljava/lang/String;)[B

    move-result-object v13

    .line 403
    .local v13, "mKernelData":[B
    if-eqz v13, :cond_0

    array-length v0, v13

    move/from16 v20, v0

    if-gtz v20, :cond_1

    .line 404
    :cond_0
    const v20, 0x10004

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    move/from16 v4, v23

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 405
    const/4 v13, 0x0

    .line 454
    :goto_0
    return-void

    .line 408
    :cond_1
    invoke-static {v13}, Lcom/vipercn/viper4android_v2/activity/V4AJniInterface;->GetHashImpulseResponseArray([B)[I

    move-result-object v9

    .line 410
    .local v9, "mHashCode":[I
    if-eqz v9, :cond_2

    array-length v0, v9

    move/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_2

    const/16 v20, 0x0

    aget v20, v9, v20

    if-nez v20, :cond_3

    .line 411
    :cond_2
    const v20, 0x10004

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    move/from16 v4, v23

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 412
    const/4 v13, 0x0

    .line 413
    const/4 v9, 0x0

    .line 414
    goto :goto_0

    .line 416
    :cond_3
    const/16 v20, 0x1

    aget v6, v9, v20

    .line 417
    .local v6, "hashCode":I
    const/4 v9, 0x0

    .line 419
    const-string v20, "ViPER4Android"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "[Kernel] Channels = "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ", Frames = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    .line 420
    const-string v22, ", Bytes = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    array-length v0, v13

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ", Hash = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 419
    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    const/16 v7, 0x1ff8

    .line 427
    .local v7, "mBlockSize":I
    array-length v15, v13

    .local v15, "mRestBytes":I
    const/16 v17, 0x0

    .local v17, "mSendOffset":I
    const/4 v14, 0x0

    .line 428
    .local v14, "mPacketIndex":I
    :goto_1
    if-gtz v15, :cond_5

    .line 443
    const/4 v13, 0x0

    .line 446
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    .line 447
    .local v10, "mIrsName":[B
    const/4 v11, 0x0

    .line 448
    .local v11, "mIrsNameHashCode":I
    if-eqz v10, :cond_4

    .line 449
    array-length v0, v10

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-static {v10, v0}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->hashIRS([BI)J

    move-result-wide v20

    move-wide/from16 v0, v20

    long-to-int v11, v0

    .line 450
    const/4 v10, 0x0

    .line 452
    :cond_4
    const v20, 0x10006

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1, v12, v6, v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    goto/16 :goto_0

    .line 429
    .end local v10    # "mIrsName":[B
    .end local v11    # "mIrsNameHashCode":I
    :cond_5
    invoke-static {v7, v15}, Ljava/lang/Math;->min(II)I

    move-result v18

    .line 430
    .local v18, "minBlockSize":I
    move/from16 v0, v18

    new-array v0, v0, [B

    move-object/from16 v16, v0

    .line 431
    .local v16, "mSendData":[B
    const/16 v20, 0x0

    move/from16 v0, v17

    move-object/from16 v1, v16

    move/from16 v2, v20

    move/from16 v3, v18

    invoke-static {v13, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 432
    add-int v17, v17, v18

    .line 433
    sub-int v15, v15, v18

    .line 434
    const-string v20, "ViPER4Android"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "Setting kernel buffer, index = "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    .line 435
    const-string v22, ", length = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 434
    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 436
    add-int/lit8 v14, v14, 0x1

    .line 438
    div-int/lit8 v8, v18, 0x4

    .line 439
    .local v8, "mFramesCount":I
    const v20, 0x10005

    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v12, v8, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx2x8192(III[B)V

    goto :goto_1
.end method

.method private proceedIRBuffer_Speaker(Lcom/vipercn/viper4android_v2/activity/IRSUtils;Ljava/lang/String;)V
    .locals 24
    .param p1, "irs"    # Lcom/vipercn/viper4android_v2/activity/IRSUtils;
    .param p2, "mConvIRFile"    # Ljava/lang/String;

    .prologue
    .line 458
    new-instance v19, Ljava/util/Random;

    invoke-direct/range {v19 .. v19}, Ljava/util/Random;-><init>()V

    .line 459
    .local v19, "rndMachine":Ljava/util/Random;
    invoke-virtual/range {v19 .. v19}, Ljava/util/Random;->nextInt()I

    move-result v13

    .line 460
    .local v13, "mKernelBufferID":I
    const v20, 0x10035

    .line 461
    invoke-virtual/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->getChannels()I

    move-result v21

    const/16 v22, 0x0

    .line 460
    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-virtual {v0, v1, v13, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 462
    const/16 v19, 0x0

    .line 465
    invoke-virtual/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->readEntireData()[B

    move-result-object v14

    .line 467
    .local v14, "mKernelData":[B
    if-eqz v14, :cond_0

    array-length v0, v14

    move/from16 v20, v0

    if-gtz v20, :cond_1

    .line 468
    :cond_0
    const v20, 0x10035

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    move/from16 v4, v23

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 469
    const/4 v14, 0x0

    .line 507
    :goto_0
    return-void

    .line 472
    :cond_1
    array-length v0, v14

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-static {v14, v0}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->hashIRS([BI)J

    move-result-wide v10

    .line 473
    .local v10, "mHashCode":J
    long-to-int v6, v10

    .line 475
    .local v6, "hashCode":I
    const-string v20, "ViPER4Android"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "[Kernel] Channels = "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->getChannels()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ", Frames = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->getSampleCount()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    .line 476
    const-string v22, ", Bytes = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    array-length v0, v14

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ", Hash = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 475
    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    const/16 v7, 0x1ff8

    .line 483
    .local v7, "mBlockSize":I
    array-length v15, v14

    .local v15, "mRestBytes":I
    const/16 v17, 0x0

    .line 484
    .local v17, "mSendOffset":I
    :goto_1
    if-gtz v15, :cond_3

    .line 496
    const/4 v14, 0x0

    .line 499
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    .line 500
    .local v9, "mIrsName":[B
    const/4 v12, 0x0

    .line 501
    .local v12, "mIrsNameHashCode":I
    if-eqz v9, :cond_2

    .line 502
    array-length v0, v9

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-static {v9, v0}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->hashIRS([BI)J

    move-result-wide v20

    move-wide/from16 v0, v20

    long-to-int v12, v0

    .line 503
    const/4 v9, 0x0

    .line 505
    :cond_2
    const v20, 0x10037

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1, v13, v6, v12}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    goto :goto_0

    .line 485
    .end local v9    # "mIrsName":[B
    .end local v12    # "mIrsNameHashCode":I
    :cond_3
    invoke-static {v7, v15}, Ljava/lang/Math;->min(II)I

    move-result v18

    .line 486
    .local v18, "minBlockSize":I
    move/from16 v0, v18

    new-array v0, v0, [B

    move-object/from16 v16, v0

    .line 487
    .local v16, "mSendData":[B
    const/16 v20, 0x0

    move/from16 v0, v17

    move-object/from16 v1, v16

    move/from16 v2, v20

    move/from16 v3, v18

    invoke-static {v14, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 488
    add-int v17, v17, v18

    .line 489
    sub-int v15, v15, v18

    .line 491
    div-int/lit8 v8, v18, 0x4

    .line 492
    .local v8, "mFramesCount":I
    const v20, 0x10036

    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v13, v8, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx2x8192(III[B)V

    goto :goto_1
.end method

.method private proceedIRBuffer_Speaker(Ljava/lang/String;II)V
    .locals 23
    .param p1, "mConvIRFile"    # Ljava/lang/String;
    .param p2, "mChannels"    # I
    .param p3, "mFrames"    # I

    .prologue
    .line 332
    new-instance v18, Ljava/util/Random;

    invoke-direct/range {v18 .. v18}, Ljava/util/Random;-><init>()V

    .line 333
    .local v18, "rndMachine":Ljava/util/Random;
    invoke-virtual/range {v18 .. v18}, Ljava/util/Random;->nextInt()I

    move-result v12

    .line 334
    .local v12, "mKernelBufferID":I
    const v19, 0x10035

    .line 335
    const/16 v20, 0x0

    .line 334
    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, p2

    move/from16 v3, v20

    invoke-virtual {v0, v1, v12, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 336
    const/16 v18, 0x0

    .line 339
    invoke-static/range {p1 .. p1}, Lcom/vipercn/viper4android_v2/activity/V4AJniInterface;->ReadImpulseResponseToArray(Ljava/lang/String;)[B

    move-result-object v13

    .line 341
    .local v13, "mKernelData":[B
    if-eqz v13, :cond_0

    array-length v0, v13

    move/from16 v19, v0

    if-gtz v19, :cond_1

    .line 342
    :cond_0
    const v19, 0x10035

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    move/from16 v4, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 343
    const/4 v13, 0x0

    .line 391
    :goto_0
    return-void

    .line 347
    :cond_1
    invoke-static {v13}, Lcom/vipercn/viper4android_v2/activity/V4AJniInterface;->GetHashImpulseResponseArray([B)[I

    move-result-object v9

    .line 349
    .local v9, "mHashCode":[I
    if-eqz v9, :cond_2

    array-length v0, v9

    move/from16 v19, v0

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_2

    const/16 v19, 0x0

    aget v19, v9, v19

    if-nez v19, :cond_3

    .line 350
    :cond_2
    const v19, 0x10035

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    move/from16 v4, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 351
    const/4 v13, 0x0

    .line 352
    const/4 v9, 0x0

    .line 353
    goto :goto_0

    .line 356
    :cond_3
    const/16 v19, 0x1

    aget v6, v9, v19

    .line 357
    .local v6, "hashCode":I
    const/4 v9, 0x0

    .line 359
    const-string v19, "ViPER4Android"

    new-instance v20, Ljava/lang/StringBuilder;

    const-string v21, "[Kernel] Channels = "

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", Frames = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    .line 360
    const-string v21, ", Bytes = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    array-length v0, v13

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", Hash = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 359
    invoke-static/range {v19 .. v20}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    const/16 v7, 0x1ff8

    .line 367
    .local v7, "mBlockSize":I
    array-length v14, v13

    .local v14, "mRestBytes":I
    const/16 v16, 0x0

    .line 368
    .local v16, "mSendOffset":I
    :goto_1
    if-gtz v14, :cond_5

    .line 380
    const/4 v13, 0x0

    .line 383
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    .line 384
    .local v10, "mIrsName":[B
    const/4 v11, 0x0

    .line 385
    .local v11, "mIrsNameHashCode":I
    if-eqz v10, :cond_4

    .line 386
    array-length v0, v10

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-static {v10, v0}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->hashIRS([BI)J

    move-result-wide v20

    move-wide/from16 v0, v20

    long-to-int v11, v0

    .line 387
    const/4 v10, 0x0

    .line 389
    :cond_4
    const v19, 0x10037

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1, v12, v6, v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    goto/16 :goto_0

    .line 369
    .end local v10    # "mIrsName":[B
    .end local v11    # "mIrsNameHashCode":I
    :cond_5
    invoke-static {v7, v14}, Ljava/lang/Math;->min(II)I

    move-result v17

    .line 370
    .local v17, "minBlockSize":I
    move/from16 v0, v17

    new-array v15, v0, [B

    .line 371
    .local v15, "mSendData":[B
    const/16 v19, 0x0

    move/from16 v0, v16

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-static {v13, v0, v15, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 372
    add-int v16, v16, v17

    .line 373
    sub-int v14, v14, v17

    .line 375
    div-int/lit8 v8, v17, 0x4

    .line 376
    .local v8, "mFramesCount":I
    const v19, 0x10036

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1, v12, v8, v15}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx2x8192(III[B)V

    goto :goto_1
.end method


# virtual methods
.method public getParameter_Native([B[B)V
    .locals 7
    .param p1, "parameter"    # [B
    .param p2, "value"    # [B

    .prologue
    .line 319
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-nez v2, :cond_0

    .line 328
    :goto_0
    return-void

    .line 322
    :cond_0
    :try_start_0
    const-class v2, Landroid/media/audiofx/AudioEffect;

    .line 323
    const-string v3, "getParameter"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, [B

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, [B

    aput-object v6, v4, v5

    .line 322
    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 324
    .local v1, "getParameter":Ljava/lang/reflect/Method;
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 325
    .end local v1    # "getParameter":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 326
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "getParameter_Native: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getParameter_px4_vx4x1(I)I
    .locals 6
    .param p1, "param"    # I

    .prologue
    .line 308
    :try_start_0
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v1

    .line 309
    .local v1, "p":[B
    const/4 v3, 0x4

    new-array v2, v3, [B

    .line 310
    .local v2, "v":[B
    invoke-virtual {p0, v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->getParameter_Native([B[B)V

    .line 311
    invoke-direct {p0, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->byteArrayToInt([B)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 314
    .end local v1    # "p":[B
    .end local v2    # "v":[B
    :goto_0
    return v3

    .line 312
    :catch_0
    move-exception v0

    .line 313
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "ViPER4Android"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "getParameter_px4_vx4x1: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    const/4 v3, -0x1

    goto :goto_0
.end method

.method public release()V
    .locals 4

    .prologue
    .line 134
    const-string v1, "ViPER4Android"

    const-string v2, "Free viper4android module."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-eqz v1, :cond_0

    .line 137
    :try_start_0
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    invoke-virtual {v1}, Landroid/media/audiofx/AudioEffect;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    :cond_0
    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    .line 143
    return-void

    .line 138
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "ViPER4Android"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "release: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setConvIRFile(Ljava/lang/String;Z)V
    .locals 14
    .param p1, "mConvIRFile"    # Ljava/lang/String;
    .param p2, "bSpeakerParam"    # Z

    .prologue
    .line 569
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 570
    .local v0, "chkIrsFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_1

    .line 571
    const-string v10, "ViPER4Android"

    const-string v11, "Convolver kernel does not exist"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    if-eqz p2, :cond_0

    .line 574
    const v10, 0x10035

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-virtual {p0, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 674
    :goto_0
    return-void

    .line 576
    :cond_0
    const v10, 0x10004

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-virtual {p0, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    goto :goto_0

    .line 580
    :cond_1
    const-string v10, "ViPER4Android"

    const-string v11, "Convolver kernel exists"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    if-nez p1, :cond_3

    .line 584
    const-string v10, "ViPER4Android"

    const-string v11, "Clear convolver kernel"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 586
    if-eqz p2, :cond_2

    .line 587
    const v10, 0x10035

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-virtual {p0, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    goto :goto_0

    .line 589
    :cond_2
    const v10, 0x10004

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-virtual {p0, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    goto :goto_0

    .line 592
    :cond_3
    const-string v10, "ViPER4Android"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Convolver kernel = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 595
    const-string v10, ""

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 596
    const-string v10, "ViPER4Android"

    const-string v11, "Clear convolver kernel"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 598
    if-eqz p2, :cond_4

    .line 599
    const v10, 0x10035

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-virtual {p0, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    goto :goto_0

    .line 601
    :cond_4
    const v10, 0x10004

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-virtual {p0, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    goto :goto_0

    .line 604
    :cond_5
    const/4 v7, 0x1

    .line 605
    .local v7, "needSendIRSToDriver":Z
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    .line 606
    .local v6, "mIrsName":[B
    if-eqz v6, :cond_6

    .line 607
    array-length v10, v6

    invoke-static {v6, v10}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->hashIRS([BI)J

    move-result-wide v8

    .line 608
    .local v8, "mIrsNameHash":J
    const/4 v6, 0x0

    .line 609
    long-to-int v3, v8

    .line 610
    .local v3, "irsNameHash":I
    const v10, 0x800a

    invoke-virtual {p0, v10}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->getParameter_px4_vx4x1(I)I

    move-result v4

    .line 611
    .local v4, "irsNameHashInDriver":I
    const-string v10, "ViPER4Android"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Kernel ID = [driver: "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 612
    const-string v12, ", client: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 611
    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    if-ne v3, v4, :cond_6

    .line 614
    const/4 v7, 0x0

    .line 618
    .end local v3    # "irsNameHash":I
    .end local v4    # "irsNameHashInDriver":I
    .end local v8    # "mIrsNameHash":J
    :cond_6
    if-nez v7, :cond_7

    .line 619
    const-string v10, "ViPER4Android"

    const-string v11, "Driver is holding the same irs now"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 623
    :cond_7
    const v5, 0x10004

    .line 624
    .local v5, "mCommand":I
    if-eqz p2, :cond_8

    .line 625
    const v5, 0x10035

    .line 628
    :cond_8
    const-string v10, "ViPER4Android"

    const-string v11, "We are going to load irs through internal method"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 629
    new-instance v2, Lcom/vipercn/viper4android_v2/activity/IRSUtils;

    invoke-direct {v2}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;-><init>()V

    .line 630
    .local v2, "irs":Lcom/vipercn/viper4android_v2/activity/IRSUtils;
    invoke-virtual {v2, p1}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->LoadIrs(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 632
    if-eqz p2, :cond_9

    .line 633
    invoke-direct {p0, v2, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->proceedIRBuffer_Speaker(Lcom/vipercn/viper4android_v2/activity/IRSUtils;Ljava/lang/String;)V

    .line 637
    :goto_1
    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/activity/IRSUtils;->Release()V

    .line 638
    const/4 v2, 0x0

    .line 639
    goto/16 :goto_0

    .line 635
    :cond_9
    invoke-direct {p0, v2, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->proceedIRBuffer_Headphone(Lcom/vipercn/viper4android_v2/activity/IRSUtils;Ljava/lang/String;)V

    goto :goto_1

    .line 640
    :cond_a
    const/4 v2, 0x0

    .line 641
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/V4AJniInterface;->IsLibraryUsable()Z

    move-result v10

    if-eqz v10, :cond_f

    .line 642
    const-string v10, "ViPER4Android"

    const-string v11, "We are going to load irs through jni"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 644
    invoke-static {p1}, Lcom/vipercn/viper4android_v2/activity/V4AJniInterface;->GetImpulseResponseInfoArray(Ljava/lang/String;)[I

    move-result-object v1

    .line 645
    .local v1, "iaIRInfo":[I
    if-nez v1, :cond_b

    .line 646
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-virtual {p0, v5, v10, v11, v12}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    goto/16 :goto_0

    .line 648
    :cond_b
    array-length v10, v1

    const/4 v11, 0x4

    if-eq v10, v11, :cond_c

    .line 649
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-virtual {p0, v5, v10, v11, v12}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 650
    const/4 v1, 0x0

    .line 651
    goto/16 :goto_0

    .line 652
    :cond_c
    const/4 v10, 0x0

    aget v10, v1, v10

    if-nez v10, :cond_d

    .line 653
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-virtual {p0, v5, v10, v11, v12}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x3(IIII)V

    .line 654
    const/4 v1, 0x0

    .line 655
    goto/16 :goto_0

    .line 657
    :cond_d
    if-eqz p2, :cond_e

    .line 658
    const/4 v10, 0x1

    aget v10, v1, v10

    .line 659
    const/4 v11, 0x2

    aget v11, v1, v11

    .line 658
    invoke-direct {p0, p1, v10, v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->proceedIRBuffer_Speaker(Ljava/lang/String;II)V

    goto/16 :goto_0

    .line 661
    :cond_e
    const/4 v10, 0x1

    aget v10, v1, v10

    .line 662
    const/4 v11, 0x2

    aget v11, v1, v11

    .line 661
    invoke-direct {p0, p1, v10, v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->proceedIRBuffer_Headphone(Ljava/lang/String;II)V

    goto/16 :goto_0

    .line 669
    .end local v1    # "iaIRInfo":[I
    :cond_f
    const-string v10, "ViPER4Android"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Failed to load "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method public setParameter_Native([B[B)V
    .locals 7
    .param p1, "parameter"    # [B
    .param p2, "value"    # [B

    .prologue
    .line 295
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-nez v2, :cond_0

    .line 304
    :goto_0
    return-void

    .line 298
    :cond_0
    :try_start_0
    const-class v2, Landroid/media/audiofx/AudioEffect;

    .line 299
    const-string v3, "setParameter"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, [B

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, [B

    aput-object v6, v4, v5

    .line 298
    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 300
    .local v1, "setParameter":Ljava/lang/reflect/Method;
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 301
    .end local v1    # "setParameter":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 302
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "setParameter_Native: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setParameter_px4_vx1x1024(I[F)V
    .locals 12
    .param p1, "param"    # I
    .param p2, "floatData"    # [F

    .prologue
    .line 245
    :try_start_0
    array-length v9, p2

    mul-int/lit8 v9, v9, 0x4

    new-array v0, v9, [B

    .line 246
    .local v0, "byteData":[B
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 247
    .local v1, "byteDataBuffer":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 248
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v9, p2

    if-lt v3, v9, :cond_1

    .line 250
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v4

    .line 251
    .local v4, "p":[B
    array-length v9, p2

    div-int/lit8 v9, v9, 0x2

    invoke-direct {p0, v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v6

    .line 252
    .local v6, "vL":[B
    const/4 v9, 0x2

    new-array v9, v9, [[B

    const/4 v10, 0x0

    aput-object v6, v9, v10

    const/4 v10, 0x1

    aput-object v0, v9, v10

    invoke-direct {p0, v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->concatArrays([[B)[B

    move-result-object v5

    .line 253
    .local v5, "v":[B
    array-length v9, v5

    const/16 v10, 0x400

    if-ge v9, v10, :cond_0

    .line 254
    array-length v9, v5

    rsub-int v8, v9, 0x400

    .line 255
    .local v8, "zeroPad":I
    new-array v7, v8, [B

    .line 256
    .local v7, "zeroArray":[B
    const/4 v9, 0x2

    new-array v9, v9, [[B

    const/4 v10, 0x0

    aput-object v5, v9, v10

    const/4 v10, 0x1

    aput-object v7, v9, v10

    invoke-direct {p0, v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->concatArrays([[B)[B

    move-result-object v5

    .line 259
    .end local v7    # "zeroArray":[B
    .end local v8    # "zeroPad":I
    :cond_0
    invoke-virtual {p0, v4, v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_Native([B[B)V

    .line 260
    const/4 v0, 0x0

    .line 265
    .end local v0    # "byteData":[B
    .end local v1    # "byteDataBuffer":Ljava/nio/ByteBuffer;
    .end local v3    # "i":I
    .end local v4    # "p":[B
    .end local v5    # "v":[B
    .end local v6    # "vL":[B
    :goto_1
    return-void

    .line 249
    .restart local v0    # "byteData":[B
    .restart local v1    # "byteDataBuffer":Ljava/nio/ByteBuffer;
    .restart local v3    # "i":I
    :cond_1
    aget v9, p2, v3

    invoke-virtual {v1, v9}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 248
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 262
    .end local v0    # "byteData":[B
    .end local v1    # "byteDataBuffer":Ljava/nio/ByteBuffer;
    .end local v3    # "i":I
    :catch_0
    move-exception v2

    .line 263
    .local v2, "e":Ljava/lang/Exception;
    const-string v9, "ViPER4Android"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "setParameter_px4_vx1x1024: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public setParameter_px4_vx1x256(II[B)V
    .locals 9
    .param p1, "param"    # I
    .param p2, "dataLength"    # I
    .param p3, "byteData"    # [B

    .prologue
    .line 227
    :try_start_0
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v1

    .line 228
    .local v1, "p":[B
    invoke-direct {p0, p2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v3

    .line 229
    .local v3, "vL":[B
    const/4 v6, 0x2

    new-array v6, v6, [[B

    const/4 v7, 0x0

    aput-object v3, v6, v7

    const/4 v7, 0x1

    aput-object p3, v6, v7

    invoke-direct {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->concatArrays([[B)[B

    move-result-object v2

    .line 230
    .local v2, "v":[B
    array-length v6, v2

    const/16 v7, 0x100

    if-ge v6, v7, :cond_0

    .line 231
    array-length v6, v2

    rsub-int v5, v6, 0x100

    .line 232
    .local v5, "zeroPad":I
    new-array v4, v5, [B

    .line 233
    .local v4, "zeroArray":[B
    const/4 v6, 0x2

    new-array v6, v6, [[B

    const/4 v7, 0x0

    aput-object v2, v6, v7

    const/4 v7, 0x1

    aput-object v4, v6, v7

    invoke-direct {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->concatArrays([[B)[B

    move-result-object v2

    .line 236
    .end local v4    # "zeroArray":[B
    .end local v5    # "zeroPad":I
    :cond_0
    invoke-virtual {p0, v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_Native([B[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 241
    .end local v1    # "p":[B
    .end local v2    # "v":[B
    .end local v3    # "vL":[B
    :goto_0
    return-void

    .line 238
    :catch_0
    move-exception v0

    .line 239
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "ViPER4Android"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "setParameter_px4_vx1x256: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setParameter_px4_vx2x8192(III[B)V
    .locals 10
    .param p1, "param"    # I
    .param p2, "valueL"    # I
    .param p3, "dataLength"    # I
    .param p4, "byteData"    # [B

    .prologue
    .line 269
    :try_start_0
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v1

    .line 270
    .local v1, "p":[B
    invoke-direct {p0, p2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v4

    .line 271
    .local v4, "vL":[B
    invoke-direct {p0, p3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v3

    .line 272
    .local v3, "vH":[B
    const/4 v7, 0x3

    new-array v7, v7, [[B

    const/4 v8, 0x0

    aput-object v4, v7, v8

    const/4 v8, 0x1

    aput-object v3, v7, v8

    const/4 v8, 0x2

    aput-object p4, v7, v8

    invoke-direct {p0, v7}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->concatArrays([[B)[B

    move-result-object v2

    .line 273
    .local v2, "v":[B
    array-length v7, v2

    const/16 v8, 0x2000

    if-ge v7, v8, :cond_0

    .line 274
    array-length v7, v2

    rsub-int v6, v7, 0x2000

    .line 275
    .local v6, "zeroPad":I
    new-array v5, v6, [B

    .line 276
    .local v5, "zeroArray":[B
    const/4 v7, 0x2

    new-array v7, v7, [[B

    const/4 v8, 0x0

    aput-object v2, v7, v8

    const/4 v8, 0x1

    aput-object v5, v7, v8

    invoke-direct {p0, v7}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->concatArrays([[B)[B

    move-result-object v2

    .line 279
    .end local v5    # "zeroArray":[B
    .end local v6    # "zeroPad":I
    :cond_0
    invoke-virtual {p0, v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_Native([B[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    .end local v1    # "p":[B
    .end local v2    # "v":[B
    .end local v3    # "vH":[B
    .end local v4    # "vL":[B
    :goto_0
    return-void

    .line 281
    :catch_0
    move-exception v0

    .line 282
    .local v0, "e":Ljava/lang/Exception;
    const-string v7, "ViPER4Android"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "setParameter_px4_vx2x8192: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setParameter_px4_vx4x1(II)V
    .locals 6
    .param p1, "param"    # I
    .param p2, "valueL"    # I

    .prologue
    .line 174
    :try_start_0
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v1

    .line 175
    .local v1, "p":[B
    invoke-direct {p0, p2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v2

    .line 176
    .local v2, "v":[B
    invoke-virtual {p0, v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_Native([B[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    .end local v1    # "p":[B
    .end local v2    # "v":[B
    :goto_0
    return-void

    .line 177
    :catch_0
    move-exception v0

    .line 178
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "ViPER4Android"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "setParameter_px4_vx4x1: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setParameter_px4_vx4x2(III)V
    .locals 8
    .param p1, "param"    # I
    .param p2, "valueL"    # I
    .param p3, "valueH"    # I

    .prologue
    .line 184
    :try_start_0
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v1

    .line 185
    .local v1, "p":[B
    invoke-direct {p0, p2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v4

    .line 186
    .local v4, "vL":[B
    invoke-direct {p0, p3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v3

    .line 187
    .local v3, "vH":[B
    const/4 v5, 0x2

    new-array v5, v5, [[B

    const/4 v6, 0x0

    aput-object v4, v5, v6

    const/4 v6, 0x1

    aput-object v3, v5, v6

    invoke-direct {p0, v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->concatArrays([[B)[B

    move-result-object v2

    .line 188
    .local v2, "v":[B
    invoke-virtual {p0, v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_Native([B[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    .end local v1    # "p":[B
    .end local v2    # "v":[B
    .end local v3    # "vH":[B
    .end local v4    # "vL":[B
    :goto_0
    return-void

    .line 190
    :catch_0
    move-exception v0

    .line 191
    .local v0, "e":Ljava/lang/Exception;
    const-string v5, "ViPER4Android"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "setParameter_px4_vx4x2: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setParameter_px4_vx4x3(IIII)V
    .locals 9
    .param p1, "param"    # I
    .param p2, "valueL"    # I
    .param p3, "valueH"    # I
    .param p4, "valueE"    # I

    .prologue
    .line 197
    :try_start_0
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v1

    .line 198
    .local v1, "p":[B
    invoke-direct {p0, p2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v5

    .line 199
    .local v5, "vL":[B
    invoke-direct {p0, p3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v4

    .line 200
    .local v4, "vH":[B
    invoke-direct {p0, p4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v3

    .line 201
    .local v3, "vE":[B
    const/4 v6, 0x3

    new-array v6, v6, [[B

    const/4 v7, 0x0

    aput-object v5, v6, v7

    const/4 v7, 0x1

    aput-object v4, v6, v7

    const/4 v7, 0x2

    aput-object v3, v6, v7

    invoke-direct {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->concatArrays([[B)[B

    move-result-object v2

    .line 202
    .local v2, "v":[B
    invoke-virtual {p0, v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_Native([B[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    .end local v1    # "p":[B
    .end local v2    # "v":[B
    .end local v3    # "vE":[B
    .end local v4    # "vH":[B
    .end local v5    # "vL":[B
    :goto_0
    return-void

    .line 204
    :catch_0
    move-exception v0

    .line 205
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "ViPER4Android"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "setParameter_px4_vx4x3: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setParameter_px4_vx4x4(IIIII)V
    .locals 10
    .param p1, "param"    # I
    .param p2, "valueL"    # I
    .param p3, "valueH"    # I
    .param p4, "valueE"    # I
    .param p5, "valueR"    # I

    .prologue
    .line 212
    :try_start_0
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v1

    .line 213
    .local v1, "p":[B
    invoke-direct {p0, p2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v5

    .line 214
    .local v5, "vL":[B
    invoke-direct {p0, p3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v4

    .line 215
    .local v4, "vH":[B
    invoke-direct {p0, p4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v3

    .line 216
    .local v3, "vE":[B
    invoke-direct {p0, p5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->intToByteArray(I)[B

    move-result-object v6

    .line 217
    .local v6, "vR":[B
    const/4 v7, 0x4

    new-array v7, v7, [[B

    const/4 v8, 0x0

    aput-object v5, v7, v8

    const/4 v8, 0x1

    aput-object v4, v7, v8

    const/4 v8, 0x2

    aput-object v3, v7, v8

    const/4 v8, 0x3

    aput-object v6, v7, v8

    invoke-direct {p0, v7}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->concatArrays([[B)[B

    move-result-object v2

    .line 218
    .local v2, "v":[B
    invoke-virtual {p0, v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_Native([B[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    .end local v1    # "p":[B
    .end local v2    # "v":[B
    .end local v3    # "vE":[B
    .end local v4    # "vH":[B
    .end local v5    # "vL":[B
    .end local v6    # "vR":[B
    :goto_0
    return-void

    .line 220
    :catch_0
    move-exception v0

    .line 221
    .local v0, "e":Ljava/lang/Exception;
    const-string v7, "ViPER4Android"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "setParameter_px4_vx4x4: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setParameter_px4_vxString(ILjava/lang/String;)V
    .locals 3
    .param p1, "param"    # I
    .param p2, "mData"    # Ljava/lang/String;

    .prologue
    .line 288
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    .line 289
    .local v1, "stringLen":I
    const-string v2, "US-ASCII"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 290
    .local v0, "stringBytes":[B
    invoke-virtual {p0, p1, v1, v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx1x256(II[B)V

    .line 291
    const/4 v0, 0x0

    .line 292
    return-void
.end method
