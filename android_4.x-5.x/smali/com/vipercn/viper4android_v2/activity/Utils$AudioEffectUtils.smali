.class public Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vipercn/viper4android_v2/activity/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioEffectUtils"
.end annotation


# instance fields
.field private mAudioEffectList:[Landroid/media/audiofx/AudioEffect$Descriptor;

.field private mHasViPER4AndroidEngine:Z

.field private final mV4AEngineVersion:[I

.field final synthetic this$0:Lcom/vipercn/viper4android_v2/activity/Utils;


# direct methods
.method public constructor <init>(Lcom/vipercn/viper4android_v2/activity/Utils;)V
    .locals 14

    .prologue
    const/4 v9, 0x4

    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 46
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->this$0:Lcom/vipercn/viper4android_v2/activity/Utils;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-array v6, v9, [I

    iput-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    .line 48
    :try_start_0
    invoke-static {}, Landroid/media/audiofx/AudioEffect;->queryEffects()[Landroid/media/audiofx/AudioEffect$Descriptor;

    move-result-object v6

    iput-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mAudioEffectList:[Landroid/media/audiofx/AudioEffect$Descriptor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mAudioEffectList:[Landroid/media/audiofx/AudioEffect$Descriptor;

    if-nez v6, :cond_0

    .line 60
    iput-boolean v10, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mHasViPER4AndroidEngine:Z

    .line 61
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v10

    .line 62
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v11

    .line 63
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v12

    .line 64
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v13

    .line 65
    const-string v6, "ViPER4Android"

    const-string v7, "Failed to query audio effects"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    :goto_0
    return-void

    .line 49
    :catch_0
    move-exception v1

    .line 50
    .local v1, "e":Ljava/lang/Exception;
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mAudioEffectList:[Landroid/media/audiofx/AudioEffect$Descriptor;

    .line 51
    iput-boolean v10, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mHasViPER4AndroidEngine:Z

    .line 52
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v10

    .line 53
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v11

    .line 54
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v12

    .line 55
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v13

    .line 56
    const-string v6, "ViPER4Android"

    const-string v7, "Failed to query audio effects"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 69
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v4, 0x0

    .line 70
    .local v4, "mViper4AndroidEngine":Landroid/media/audiofx/AudioEffect$Descriptor;
    const-string v6, "ViPER4Android"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Found "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mAudioEffectList:[Landroid/media/audiofx/AudioEffect$Descriptor;

    array-length v8, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " effects"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mAudioEffectList:[Landroid/media/audiofx/AudioEffect$Descriptor;

    array-length v6, v6

    if-lt v2, v6, :cond_1

    .line 88
    if-nez v4, :cond_4

    .line 89
    const-string v6, "ViPER4Android"

    const-string v7, "ViPER4Android engine not found"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    iput-boolean v10, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mHasViPER4AndroidEngine:Z

    .line 91
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v10

    .line 92
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v11

    .line 93
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v12

    .line 94
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v13

    goto :goto_0

    .line 72
    :cond_1
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mAudioEffectList:[Landroid/media/audiofx/AudioEffect$Descriptor;

    aget-object v6, v6, v2

    if-nez v6, :cond_3

    .line 71
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 74
    :cond_3
    :try_start_1
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mAudioEffectList:[Landroid/media/audiofx/AudioEffect$Descriptor;

    aget-object v0, v6, v2

    .line 75
    .local v0, "aeEffect":Landroid/media/audiofx/AudioEffect$Descriptor;
    const-string v6, "ViPER4Android"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "["

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "], "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Landroid/media/audiofx/AudioEffect$Descriptor;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 76
    iget-object v8, v0, Landroid/media/audiofx/AudioEffect$Descriptor;->implementor:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 75
    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    iget-object v6, v0, Landroid/media/audiofx/AudioEffect$Descriptor;->uuid:Ljava/util/UUID;

    sget-object v7, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->ID_V4A_GENERAL_FX:Ljava/util/UUID;

    invoke-virtual {v6, v7}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 78
    const-string v6, "ViPER4Android"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Perfect, found ViPER4Android engine at "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 78
    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 80
    move-object v4, v0

    goto :goto_2

    .line 82
    .end local v0    # "aeEffect":Landroid/media/audiofx/AudioEffect$Descriptor;
    :catch_1
    move-exception v1

    .line 83
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v6, "ViPER4Android"

    .line 84
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "AudioEffect Descriptor error , msg = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 83
    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 100
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4
    :try_start_2
    iget-object v5, v4, Landroid/media/audiofx/AudioEffect$Descriptor;->name:Ljava/lang/String;

    .line 101
    .local v5, "v4aVersionLine":Ljava/lang/String;
    const-string v6, "["

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 102
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x17

    if-lt v6, v7, :cond_6

    .line 104
    const/16 v6, 0xf

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 105
    :goto_3
    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 108
    const-string v6, "\\."

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 109
    .local v3, "mVerBlocks":[Ljava/lang/String;
    array-length v6, v3

    if-ne v6, v9, :cond_5

    .line 110
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    const/4 v7, 0x0

    const/4 v8, 0x0

    aget-object v8, v3, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    aput v8, v6, v7

    .line 111
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    const/4 v7, 0x1

    const/4 v8, 0x1

    aget-object v8, v3, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    aput v8, v6, v7

    .line 112
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    const/4 v7, 0x2

    const/4 v8, 0x2

    aget-object v8, v3, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    aput v8, v6, v7

    .line 113
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    const/4 v7, 0x3

    const/4 v8, 0x3

    aget-object v8, v3, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    aput v8, v6, v7

    .line 115
    :cond_5
    const-string v6, "ViPER4Android"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "The version of ViPER4Android engine is "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    const/4 v9, 0x0

    aget v8, v8, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 117
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    const/4 v9, 0x1

    aget v8, v8, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 118
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    const/4 v9, 0x2

    aget v8, v8, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 119
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    const/4 v9, 0x3

    aget v8, v8, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 115
    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mHasViPER4AndroidEngine:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 124
    .end local v3    # "mVerBlocks":[Ljava/lang/String;
    .end local v5    # "v4aVersionLine":Ljava/lang/String;
    :catch_2
    move-exception v1

    .line 125
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v6, "ViPER4Android"

    .line 126
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "ViPER4Android engine version exception: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 125
    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_6
    const-string v6, "ViPER4Android"

    const-string v7, "Cannot extract ViPER4Android engine version"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    iput-boolean v10, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mHasViPER4AndroidEngine:Z

    .line 131
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v10

    .line 132
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v11

    .line 133
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v12

    .line 134
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    aput v10, v6, v13

    goto/16 :goto_0

    .line 106
    .restart local v5    # "v4aVersionLine":Ljava/lang/String;
    :cond_7
    const/4 v6, 0x0

    :try_start_3
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move-result-object v5

    goto/16 :goto_3
.end method


# virtual methods
.method public getAudioEffectList()[Landroid/media/audiofx/AudioEffect$Descriptor;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mAudioEffectList:[Landroid/media/audiofx/AudioEffect$Descriptor;

    return-object v0
.end method

.method public getViper4AndroidEngineVersion()[I
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mV4AEngineVersion:[I

    return-object v0
.end method

.method public isViPER4AndroidEngineFound()Z
    .locals 1

    .prologue
    .line 142
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->mHasViPER4AndroidEngine:Z

    return v0
.end method
