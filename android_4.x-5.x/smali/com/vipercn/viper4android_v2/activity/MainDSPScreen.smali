.class public final Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;
.super Landroid/preference/PreferenceFragment;
.source "MainDSPScreen.java"


# static fields
.field public static final EQ_VALUE_CUSTOM:Ljava/lang/String; = "custom"

.field public static final PREF_KEY_CUSTOM_EQ:Ljava/lang/String; = "viper4android.headphonefx.fireq.custom"

.field public static final PREF_KEY_DDC:Ljava/lang/String; = "viper4android.headphonefx.viperddc.enable"

.field public static final PREF_KEY_EQ:Ljava/lang/String; = "viper4android.headphonefx.fireq"

.field public static final PREF_KEY_FORCE:Ljava/lang/String; = "viper4android.global.forceenable.enable"

.field public static final PREF_KEY_VSE:Ljava/lang/String; = "viper4android.headphonefx.vse.enable"


# instance fields
.field private final listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    .line 27
    new-instance v0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen$1;-><init>(Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 17
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    .line 121
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 122
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string v7, "config"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "config":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v3

    .line 125
    .local v3, "prefManager":Landroid/preference/PreferenceManager;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getActivity()Landroid/app/Activity;

    move-result-object v6

    .line 126
    const-string v7, "com.vipercn.viper4android_v2.settings"

    .line 125
    invoke-virtual {v6, v7, v8}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 127
    .local v4, "prefSettings":Landroid/content/SharedPreferences;
    const-string v6, "viper4android.settings.uiprefer"

    invoke-interface {v4, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 128
    .local v2, "mControlLevel":I
    if-ltz v2, :cond_0

    const/4 v6, 0x2

    if-le v2, v6, :cond_1

    .line 129
    :cond_0
    const/4 v2, 0x0

    .line 133
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "com.vipercn.viper4android_v2."

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 132
    invoke-virtual {v3, v6}, Landroid/preference/PreferenceManager;->setSharedPreferencesName(Ljava/lang/String;)V

    .line 134
    const/4 v6, 0x4

    invoke-virtual {v3, v6}, Landroid/preference/PreferenceManager;->setSharedPreferencesMode(I)V

    .line 136
    :try_start_0
    const-class v6, Lcom/vipercn/viper4android_v2/R$xml;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "_preferences_l"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 137
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    .line 138
    .local v5, "xmlId":I
    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->addPreferencesFromResource(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    invoke-virtual {v3}, Landroid/preference/PreferenceManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v6

    iget-object v7, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v6, v7}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 144
    return-void

    .line 139
    .end local v5    # "xmlId":I
    :catch_0
    move-exception v1

    .line 140
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 148
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onDestroy()V

    .line 149
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/preference/PreferenceManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 150
    return-void
.end method
