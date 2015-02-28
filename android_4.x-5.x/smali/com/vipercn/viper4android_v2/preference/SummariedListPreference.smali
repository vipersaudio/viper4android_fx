.class public Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;
.super Landroid/preference/ListPreference;
.source "SummariedListPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "set"    # Landroid/util/AttributeSet;

    .prologue
    .line 10
    invoke-direct {p0, p1, p2}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 11
    return-void
.end method


# virtual methods
.method public refreshFromPreference()V
    .locals 2

    .prologue
    .line 28
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;->onSetInitialValue(ZLjava/lang/Object;)V

    .line 29
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 15
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 17
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 18
    .local v0, "entries":[Ljava/lang/CharSequence;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v1

    .line 19
    .local v1, "entryValues":[Ljava/lang/CharSequence;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-lt v2, v3, :cond_0

    .line 25
    :goto_1
    return-void

    .line 20
    :cond_0
    aget-object v3, v1, v2

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 21
    aget-object v3, v0, v2

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 19
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method
