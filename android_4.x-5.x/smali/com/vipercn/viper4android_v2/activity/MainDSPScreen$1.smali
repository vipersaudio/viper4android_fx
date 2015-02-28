.class Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;
.super Ljava/lang/Object;
.source "MainDSPScreen.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 12
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 30
    const-string v8, "ViPER4Android"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Update key = "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    const-string v8, "viper4android.headphonefx.fireq"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 33
    const/4 v8, 0x0

    invoke-interface {p1, p2, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 34
    .local v5, "newValue":Ljava/lang/String;
    const-string v8, "custom"

    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 35
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "viper4android.headphonefx.fireq.custom"

    invoke-interface {v8, v9, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 39
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    const-string v9, "viper4android.headphonefx.fireq.custom"

    invoke-virtual {v8, v9}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;

    .line 40
    .local v2, "eq":Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;
    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->refreshFromPreference()V

    .line 46
    .end local v2    # "eq":Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;
    .end local v5    # "newValue":Ljava/lang/String;
    :cond_0
    const-string v8, "viper4android.headphonefx.fireq.custom"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 47
    const/4 v8, 0x0

    invoke-interface {p1, p2, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 48
    .restart local v5    # "newValue":Ljava/lang/String;
    const-string v0, "custom"

    .line 49
    .local v0, "desiredValue":Ljava/lang/String;
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    const-string v9, "viper4android.headphonefx.fireq"

    invoke-virtual {v8, v9}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;

    .line 50
    .local v7, "preset":Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;
    invoke-virtual {v7}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v9

    array-length v10, v9

    const/4 v8, 0x0

    :goto_0
    if-lt v8, v10, :cond_5

    .line 58
    :goto_1
    invoke-virtual {v7}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 59
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "viper4android.headphonefx.fireq"

    invoke-interface {v8, v9, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 60
    invoke-virtual {v7}, Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;->refreshFromPreference()V

    .line 65
    .end local v0    # "desiredValue":Ljava/lang/String;
    .end local v5    # "newValue":Ljava/lang/String;
    .end local v7    # "preset":Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;
    :cond_1
    const-string v8, "viper4android.global.forceenable.enable"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 66
    const/4 v8, 0x0

    invoke-interface {p1, p2, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 68
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v3, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 69
    .local v3, "mDlgWarning":Landroid/app/AlertDialog$Builder;
    const-string v8, "ViPER4Android"

    invoke-virtual {v3, v8}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 70
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 71
    const v9, 0x7f090010

    .line 70
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 73
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0900a8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    .line 72
    invoke-virtual {v3, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 74
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 79
    .end local v3    # "mDlgWarning":Landroid/app/AlertDialog$Builder;
    :cond_2
    const-string v8, "viper4android.headphonefx.viperddc.enable"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 80
    const/4 v8, 0x0

    invoke-interface {p1, p2, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 81
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-string v9, "com.vipercn.viper4android_v2.settings"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 82
    .local v6, "prefSettings":Landroid/content/SharedPreferences;
    const-string v8, "viper4android.settings.viperddc.notice"

    const/4 v9, 0x0

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_3

    .line 83
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "viper4android.settings.viperddc.notice"

    const/4 v10, 0x1

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 84
    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v4, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 85
    .local v4, "mNotice":Landroid/app/AlertDialog$Builder;
    const-string v8, "ViPER4Android"

    invoke-virtual {v4, v8}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 86
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 87
    const v9, 0x7f090032

    .line 86
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 89
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0900a8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    .line 88
    invoke-virtual {v4, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 90
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 97
    .end local v4    # "mNotice":Landroid/app/AlertDialog$Builder;
    .end local v6    # "prefSettings":Landroid/content/SharedPreferences;
    :cond_3
    const-string v8, "viper4android.headphonefx.vse.enable"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 98
    const/4 v8, 0x0

    invoke-interface {p1, p2, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 99
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-string v9, "com.vipercn.viper4android_v2.settings"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 100
    .restart local v6    # "prefSettings":Landroid/content/SharedPreferences;
    const-string v8, "viper4android.settings.vse.notice"

    const/4 v9, 0x0

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_4

    .line 101
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "viper4android.settings.vse.notice"

    const/4 v10, 0x1

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 102
    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v4, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 103
    .restart local v4    # "mNotice":Landroid/app/AlertDialog$Builder;
    const-string v8, "ViPER4Android"

    invoke-virtual {v4, v8}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 104
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 105
    const v9, 0x7f090039

    .line 104
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 107
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0900a8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    .line 106
    invoke-virtual {v4, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 108
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 115
    .end local v4    # "mNotice":Landroid/app/AlertDialog$Builder;
    .end local v6    # "prefSettings":Landroid/content/SharedPreferences;
    :cond_4
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;->this$0:Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v8

    new-instance v9, Landroid/content/Intent;

    const-string v10, "com.vipercn.viper4android_v2.UPDATE"

    invoke-direct {v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v9}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 116
    return-void

    .line 50
    .restart local v0    # "desiredValue":Ljava/lang/String;
    .restart local v5    # "newValue":Ljava/lang/String;
    .restart local v7    # "preset":Lcom/vipercn/viper4android_v2/preference/SummariedListPreference;
    :cond_5
    aget-object v1, v9, v8

    .line 51
    .local v1, "entry":Ljava/lang/CharSequence;
    invoke-virtual {v1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 52
    move-object v0, v5

    .line 53
    goto/16 :goto_1

    .line 50
    :cond_6
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0
.end method
