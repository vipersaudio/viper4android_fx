.class public Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;
.super Landroid/preference/ListPreference;
.source "SummariedListPreferenceDDC.java"


# instance fields
.field private mDDCMMData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "set"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->mDDCMMData:Ljava/util/Map;

    .line 24
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/vipercn/viper4android_v2/activity/DDCDatabase;->queryManufacturerAndModel(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v4

    iput-object v4, p0, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->mDDCMMData:Ljava/util/Map;

    .line 25
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->mDDCMMData:Ljava/util/Map;

    if-nez v4, :cond_0

    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v4, p0, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->mDDCMMData:Ljava/util/Map;

    .line 27
    :cond_0
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aCustomDDCPath()Ljava/lang/String;

    move-result-object v2

    .line 28
    .local v2, "customDDCPath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 29
    .local v0, "customDDCFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_2

    .line 30
    const-string v4, "ViPER4Android"

    const-string v5, "Custom DDC directory does not exists"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 32
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 34
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .local v1, "customDDCList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v4, ".vdc"

    invoke-static {v0, v4, v1}, Lcom/vipercn/viper4android_v2/activity/Utils;->getFileNameList(Ljava/io/File;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 36
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 37
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v3, v4, :cond_3

    .line 41
    .end local v3    # "i":I
    :cond_1
    return-void

    .line 33
    .end local v1    # "customDDCList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    const-string v4, "ViPER4Android"

    const-string v5, "Custom DDC directory exists"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 38
    .restart local v1    # "customDDCList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v3    # "i":I
    :cond_3
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->mDDCMMData:Ljava/util/Map;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v4, "FILE:"

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method


# virtual methods
.method protected onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
    .locals 8
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    const/4 v7, 0x0

    .line 46
    :try_start_0
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->mDDCMMData:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    new-array v1, v5, [Ljava/lang/String;

    .line 47
    .local v1, "entriesArray":[Ljava/lang/String;
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->mDDCMMData:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    new-array v4, v5, [Ljava/lang/String;

    .line 48
    .local v4, "valuesArray":[Ljava/lang/String;
    const/4 v3, 0x0

    .line 49
    .local v3, "index":I
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->mDDCMMData:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 54
    invoke-virtual {p0, v1}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->setEntries([Ljava/lang/CharSequence;)V

    .line 55
    invoke-virtual {p0, v4}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 56
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V

    .line 62
    .end local v1    # "entriesArray":[Ljava/lang/String;
    .end local v3    # "index":I
    .end local v4    # "valuesArray":[Ljava/lang/String;
    :goto_1
    return-void

    .line 49
    .restart local v1    # "entriesArray":[Ljava/lang/String;
    .restart local v3    # "index":I
    .restart local v4    # "valuesArray":[Ljava/lang/String;
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 50
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v1, v3

    .line 51
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v4, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 57
    .end local v1    # "entriesArray":[Ljava/lang/String;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "index":I
    .end local v4    # "valuesArray":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    new-array v5, v7, [Ljava/lang/String;

    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->setEntries([Ljava/lang/CharSequence;)V

    .line 59
    new-array v5, v7, [Ljava/lang/String;

    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 60
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V

    goto :goto_1
.end method

.method public refreshFromPreference()V
    .locals 2

    .prologue
    .line 75
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->onSetInitialValue(ZLjava/lang/Object;)V

    .line 76
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 68
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->mDDCMMData:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 69
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->mDDCMMData:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 70
    .local v0, "szSummary":Ljava/lang/CharSequence;
    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->setSummary(Ljava/lang/CharSequence;)V

    .line 72
    .end local v0    # "szSummary":Ljava/lang/CharSequence;
    :goto_0
    return-void

    .line 71
    :cond_0
    const-string v1, ""

    invoke-virtual {p0, v1}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreferenceDDC;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
