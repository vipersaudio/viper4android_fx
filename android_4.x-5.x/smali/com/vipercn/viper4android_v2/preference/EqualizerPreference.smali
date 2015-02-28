.class public Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;
.super Landroid/preference/DialogPreference;
.source "EqualizerPreference.java"


# instance fields
.field private final connectionForDialog:Landroid/content/ServiceConnection;

.field private mAudioService:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

.field protected mDialogEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

.field protected mListEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    new-instance v0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$1;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$1;-><init>(Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->connectionForDialog:Landroid/content/ServiceConnection;

    .line 38
    const v0, 0x7f030004

    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->setLayoutResource(I)V

    .line 39
    const v0, 0x7f030005

    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->setDialogLayoutResource(I)V

    .line 40
    return-void
.end method

.method static synthetic access$0(Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V
    .locals 0

    .prologue
    .line 21
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mAudioService:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    return-void
.end method

.method private updateListEqualizerFromValue()V
    .locals 5

    .prologue
    .line 53
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 54
    .local v2, "value":Ljava/lang/String;
    if-eqz v2, :cond_0

    iget-object v3, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mListEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    if-eqz v3, :cond_0

    .line 55
    const-string v3, ";"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "levelsStr":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v3, 0xa

    if-lt v0, v3, :cond_1

    .line 60
    .end local v0    # "i":I
    .end local v1    # "levelsStr":[Ljava/lang/String;
    :cond_0
    return-void

    .line 57
    .restart local v0    # "i":I
    .restart local v1    # "levelsStr":[Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mListEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    aget-object v4, v1, v0

    invoke-static {v4}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v3, v0, v4}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->setBand(IF)V

    .line 56
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected onBindDialogView(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 64
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onBindDialogView(Landroid/view/View;)V

    .line 66
    const v2, 0x7f0c0008

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    iput-object v2, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mDialogEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    .line 67
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mDialogEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    new-instance v3, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$2;

    invoke-direct {v3, p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$2;-><init>(Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;)V

    invoke-virtual {v2, v3}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 90
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mListEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    if-eqz v2, :cond_0

    .line 91
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v2, 0xa

    if-lt v0, v2, :cond_1

    .line 96
    .end local v0    # "i":I
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 97
    .local v1, "serviceIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->connectionForDialog:Landroid/content/ServiceConnection;

    const/4 v4, 0x0

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 98
    return-void

    .line 92
    .end local v1    # "serviceIntent":Landroid/content/Intent;
    .restart local v0    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mDialogEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    iget-object v3, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mListEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    invoke-virtual {v3, v0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getBand(I)F

    move-result v3

    invoke-virtual {v2, v0, v3}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->setBand(IF)V

    .line 91
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 120
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onBindView(Landroid/view/View;)V

    .line 121
    const v0, 0x7f0c0008

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mListEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    .line 122
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->updateListEqualizerFromValue()V

    .line 123
    return-void
.end method

.method protected onDialogClosed(Z)V
    .locals 7
    .param p1, "positiveResult"    # Z

    .prologue
    .line 102
    if-eqz p1, :cond_0

    .line 103
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .local v1, "value":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v2, 0xa

    if-lt v0, v2, :cond_2

    .line 108
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->persistString(Ljava/lang/String;)Z

    .line 109
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->updateListEqualizerFromValue()V

    .line 112
    .end local v0    # "i":I
    .end local v1    # "value":Ljava/lang/StringBuilder;
    :cond_0
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mAudioService:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    if-eqz v2, :cond_1

    .line 113
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mAudioService:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->setEqualizerLevels([F)V

    .line 115
    :cond_1
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->connectionForDialog:Landroid/content/ServiceConnection;

    invoke-virtual {v2, v3}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 116
    return-void

    .line 105
    .restart local v0    # "i":I
    .restart local v1    # "value":Ljava/lang/StringBuilder;
    :cond_2
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "%.1f"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mDialogEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    invoke-virtual {v6, v0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getBand(I)F

    move-result v6

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    const/16 v2, 0x3b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 104
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .locals 2
    .param p1, "restorePersistedValue"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 127
    if-eqz p1, :cond_1

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 128
    .end local p2    # "defaultValue":Ljava/lang/Object;
    .local v0, "value":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->shouldPersist()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 129
    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->persistString(Ljava/lang/String;)Z

    .line 131
    :cond_0
    return-void

    .line 127
    .end local v0    # "value":Ljava/lang/String;
    .restart local p2    # "defaultValue":Ljava/lang/Object;
    :cond_1
    check-cast p2, Ljava/lang/String;

    move-object v0, p2

    goto :goto_0
.end method

.method public refreshFromPreference()V
    .locals 2

    .prologue
    .line 134
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->onSetInitialValue(ZLjava/lang/Object;)V

    .line 135
    return-void
.end method

.method protected updateDspFromDialogEqualizer()V
    .locals 3

    .prologue
    .line 43
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mAudioService:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    if-eqz v2, :cond_0

    .line 44
    const/16 v2, 0xa

    new-array v1, v2, [F

    .line 45
    .local v1, "levels":[F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-lt v0, v2, :cond_1

    .line 48
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mAudioService:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-virtual {v2, v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->setEqualizerLevels([F)V

    .line 50
    .end local v0    # "i":I
    .end local v1    # "levels":[F
    :cond_0
    return-void

    .line 46
    .restart local v0    # "i":I
    .restart local v1    # "levels":[F
    :cond_1
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mDialogEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    invoke-virtual {v2, v0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getBand(I)F

    move-result v2

    aput v2, v1, v0

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
