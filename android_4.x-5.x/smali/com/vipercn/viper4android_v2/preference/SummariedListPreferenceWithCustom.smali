.class public Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;
.super Landroid/preference/ListPreference;
.source "SummariedListPreferenceWithCustom.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "set"    # Landroid/util/AttributeSet;

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    return-void
.end method


# virtual methods
.method protected onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
    .locals 14
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    const v13, 0x7f090092

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 27
    :try_start_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v8

    const-string v9, "mounted"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 28
    const-string v8, "ViPER4Android"

    const-string v9, "External storage not mounted"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {p0, v8}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setEntries([Ljava/lang/CharSequence;)V

    .line 30
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {p0, v8}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 31
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f090092

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 32
    .local v7, "tip":Ljava/lang/String;
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aKernelPath()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 33
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->getContext()Landroid/content/Context;

    move-result-object v8

    const/4 v9, 0x1

    invoke-static {v8, v7, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 34
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V

    .line 76
    .end local v7    # "tip":Ljava/lang/String;
    :goto_0
    return-void

    .line 38
    :cond_0
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aKernelPath()Ljava/lang/String;

    move-result-object v6

    .line 39
    .local v6, "kernelPath":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 41
    .local v4, "kernelFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_1

    .line 42
    const-string v8, "ViPER4Android"

    const-string v9, "Kernel directory does not exists"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 44
    invoke-virtual {v4}, Ljava/io/File;->mkdir()Z

    .line 47
    :goto_1
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .local v5, "kernelList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, ".irs"

    invoke-static {v4, v8, v5}, Lcom/vipercn/viper4android_v2/activity/Utils;->getFileNameList(Ljava/io/File;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 49
    const-string v8, ".wav"

    invoke-static {v4, v8, v5}, Lcom/vipercn/viper4android_v2/activity/Utils;->getFileNameList(Ljava/io/File;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 51
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 52
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f090092

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 53
    .restart local v7    # "tip":Ljava/lang/String;
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aKernelPath()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 54
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->getContext()Landroid/content/Context;

    move-result-object v8

    const/4 v9, 0x1

    invoke-static {v8, v7, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 57
    .end local v7    # "tip":Ljava/lang/String;
    :goto_2
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v3, v8, [Ljava/lang/String;

    .line 58
    .local v3, "kernelArray":[Ljava/lang/String;
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v0, v8, [Ljava/lang/String;

    .line 59
    .local v0, "arrayValue":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lt v2, v8, :cond_3

    .line 64
    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setEntries([Ljava/lang/CharSequence;)V

    .line 65
    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 67
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 68
    .end local v0    # "arrayValue":[Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "kernelArray":[Ljava/lang/String;
    .end local v4    # "kernelFile":Ljava/io/File;
    .end local v5    # "kernelList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "kernelPath":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 69
    .local v1, "e":Ljava/lang/Exception;
    new-array v8, v11, [Ljava/lang/String;

    invoke-virtual {p0, v8}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setEntries([Ljava/lang/CharSequence;)V

    .line 70
    new-array v8, v11, [Ljava/lang/String;

    invoke-virtual {p0, v8}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 71
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 72
    .restart local v7    # "tip":Ljava/lang/String;
    new-array v8, v12, [Ljava/lang/Object;

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aKernelPath()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 73
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8, v7, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 74
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V

    goto/16 :goto_0

    .line 45
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v7    # "tip":Ljava/lang/String;
    .restart local v4    # "kernelFile":Ljava/io/File;
    .restart local v6    # "kernelPath":Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v8, "ViPER4Android"

    const-string v9, "Kernel directory exists"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 55
    .restart local v5    # "kernelList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    invoke-static {v5}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    goto :goto_2

    .line 60
    .restart local v0    # "arrayValue":[Ljava/lang/String;
    .restart local v2    # "i":I
    .restart local v3    # "kernelArray":[Ljava/lang/String;
    :cond_3
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    aput-object v8, v3, v2

    .line 61
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 59
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method public refreshFromPreference()V
    .locals 2

    .prologue
    .line 114
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->onSetInitialValue(ZLjava/lang/Object;)V

    .line 115
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 6
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 83
    :try_start_0
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    .line 84
    .local v1, "entries":[Ljava/lang/CharSequence;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v2

    .line 85
    .local v2, "entryValues":[Ljava/lang/CharSequence;
    if-eqz v1, :cond_0

    if-nez v2, :cond_5

    .line 86
    :cond_0
    if-nez p1, :cond_2

    .line 87
    const-string v5, ""

    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setSummary(Ljava/lang/CharSequence;)V

    .line 111
    .end local v1    # "entries":[Ljava/lang/CharSequence;
    .end local v2    # "entryValues":[Ljava/lang/CharSequence;
    :cond_1
    :goto_0
    return-void

    .line 90
    .restart local v1    # "entries":[Ljava/lang/CharSequence;
    .restart local v2    # "entryValues":[Ljava/lang/CharSequence;
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 91
    const-string v5, ""

    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setSummary(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 108
    .end local v1    # "entries":[Ljava/lang/CharSequence;
    .end local v2    # "entryValues":[Ljava/lang/CharSequence;
    :catch_0
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/Exception;
    const-string v5, ""

    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 94
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "entries":[Ljava/lang/CharSequence;
    .restart local v2    # "entryValues":[Ljava/lang/CharSequence;
    :cond_3
    :try_start_1
    const-string v5, "/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 95
    const-string v5, "/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 96
    .local v3, "fileName":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 99
    .end local v3    # "fileName":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0, p1}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 102
    :cond_5
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v5, v2

    if-ge v4, v5, :cond_1

    .line 103
    aget-object v5, v2, v4

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 104
    aget-object v5, v1, v4

    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceWithCustom;->setSummary(Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 102
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method
