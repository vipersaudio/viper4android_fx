.class public final Lcom/vipercn/viper4android_v2/activity/ViPER4Android;
.super Landroid/app/Activity;
.source "ViPER4Android.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;,
        Lcom/vipercn/viper4android_v2/activity/ViPER4Android$PlaceholderFragment;
    }
.end annotation


# static fields
.field public static final ACTION_CANCEL_NOTIFY:Ljava/lang/String; = "com.vipercn.viper4android_v2.CANCELNOTIFY"

.field public static final ACTION_SHOW_NOTIFY:Ljava/lang/String; = "com.vipercn.viper4android_v2.SHOWNOTIFY"

.field public static final ACTION_UPDATE_PREFERENCES:Ljava/lang/String; = "com.vipercn.viper4android_v2.UPDATE"

.field public static final NOTIFY_FOREGROUND_ID:I = 0x1

.field private static final PREF_IS_TABBED:Ljava/lang/String; = "pref_is_tabbed"

.field private static final PREF_USER_LEARNED_DRAWER:Ljava/lang/String; = "navigation_drawer_learned"

.field public static final SHARED_PREFERENCES_BASENAME:Ljava/lang/String; = "com.vipercn.viper4android_v2"

.field private static final STATE_SELECTED_POSITION:Ljava/lang/String; = "selected_navigation_drawer_position"

.field private static final mDriverHandler:Landroid/os/Handler;

.field private static mEntries:[Ljava/lang/String;

.field private static mTitles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

.field private mCurrentSelectedPosition:I

.field private mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

.field private mDrawerListView:Landroid/widget/ListView;

.field private mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

.field private mFragmentContainerView:Landroid/view/View;

.field private mFromSavedInstanceState:Z

.field private mIsTabbed:Z

.field private mPreferences:Landroid/content/SharedPreferences;

.field private mTitle:Ljava/lang/CharSequence;

.field private mUserLearnedDrawer:Z

.field protected pagerAdapter:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;

.field protected pagerTabStrip:Landroid/support/v4/view/PagerTabStrip;

.field protected viewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 366
    new-instance v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1;

    invoke-direct {v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1;-><init>()V

    sput-object v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDriverHandler:Landroid/os/Handler;

    .line 598
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 73
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 113
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    .line 73
    return-void
.end method

.method static synthetic access$0()Z
    .locals 1

    .prologue
    .line 288
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->cpuHasQualitySelection()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 295
    invoke-static {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->determineCPUWithDriver(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$10(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 1609
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getEntries()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$11(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;I)V
    .locals 0

    .prologue
    .line 1559
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->selectItem(I)V

    return-void
.end method

.method static synthetic access$12(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    .locals 1

    .prologue
    .line 363
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    return-object v0
.end method

.method static synthetic access$13(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Z
    .locals 1

    .prologue
    .line 100
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mUserLearnedDrawer:Z

    return v0
.end method

.method static synthetic access$14(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;Z)V
    .locals 0

    .prologue
    .line 100
    iput-boolean p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mUserLearnedDrawer:Z

    return-void
.end method

.method static synthetic access$15(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$16(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Landroid/support/v4/app/ActionBarDrawerToggle;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    return-object v0
.end method

.method static synthetic access$2()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    sget-object v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mEntries:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3()Ljava/util/List;
    .locals 1

    .prologue
    .line 89
    sget-object v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mTitles:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$4(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Z
    .locals 1

    .prologue
    .line 193
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->checkSoftwareActive()Z

    move-result v0

    return v0
.end method

.method static synthetic access$5(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Z
    .locals 1

    .prologue
    .line 210
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->submitInformation()Z

    move-result v0

    return v0
.end method

.method static synthetic access$6(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V
    .locals 0

    .prologue
    .line 200
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->setSoftwareActive()V

    return-void
.end method

.method static synthetic access$7(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V
    .locals 0

    .prologue
    .line 245
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->processDriverCheck()V

    return-void
.end method

.method static synthetic access$8(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V
    .locals 0

    .prologue
    .line 363
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    return-void
.end method

.method static synthetic access$9(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Z
    .locals 1

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    return v0
.end method

.method private checkDDCDBVer()Z
    .locals 9

    .prologue
    const/4 v6, 0x0

    .line 136
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 140
    .local v4, "packageMgr":Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 141
    .local v3, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v2, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 147
    .local v2, "mVersion":Ljava/lang/String;
    const-string v7, "com.vipercn.viper4android_v2.settings"

    .line 146
    invoke-virtual {p0, v7, v6}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 148
    .local v5, "prefSettings":Landroid/content/SharedPreferences;
    const-string v7, "viper4android.settings.ddc_db_compatible"

    const-string v8, ""

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 149
    .local v1, "mDBVersion":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v7, ""

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 150
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 149
    .end local v1    # "mDBVersion":Ljava/lang/String;
    .end local v2    # "mVersion":Ljava/lang/String;
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v5    # "prefSettings":Landroid/content/SharedPreferences;
    :goto_0
    return v6

    .line 142
    :catch_0
    move-exception v0

    .line 143
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_0

    .line 149
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v1    # "mDBVersion":Ljava/lang/String;
    .restart local v2    # "mVersion":Ljava/lang/String;
    .restart local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v5    # "prefSettings":Landroid/content/SharedPreferences;
    :cond_0
    const/4 v6, 0x1

    goto :goto_0
.end method

.method private checkFirstRun()Z
    .locals 9

    .prologue
    const/4 v6, 0x0

    .line 118
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 122
    .local v4, "packageMgr":Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 123
    .local v3, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v2, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    .local v2, "mVersion":Ljava/lang/String;
    const-string v7, "com.vipercn.viper4android_v2.settings"

    .line 128
    invoke-virtual {p0, v7, v6}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 130
    .local v5, "prefSettings":Landroid/content/SharedPreferences;
    const-string v7, "viper4android.settings.lastversion"

    const-string v8, ""

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 131
    .local v1, "mLastVersion":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v7, ""

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 132
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 131
    .end local v1    # "mLastVersion":Ljava/lang/String;
    .end local v2    # "mVersion":Ljava/lang/String;
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v5    # "prefSettings":Landroid/content/SharedPreferences;
    :goto_0
    return v6

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_0

    .line 131
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v1    # "mLastVersion":Ljava/lang/String;
    .restart local v2    # "mVersion":Ljava/lang/String;
    .restart local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v5    # "prefSettings":Landroid/content/SharedPreferences;
    :cond_0
    const/4 v6, 0x1

    goto :goto_0
.end method

.method private checkSoftwareActive()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 194
    .line 195
    const-string v3, "com.vipercn.viper4android_v2.settings"

    .line 194
    invoke-virtual {p0, v3, v2}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 196
    .local v1, "prefSettings":Landroid/content/SharedPreferences;
    const-string v3, "viper4android.settings.onlineactive"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 197
    .local v0, "mActived":Z
    if-eqz v0, :cond_0

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static copy(Ljava/io/File;Ljava/io/File;)V
    .locals 7
    .param p0, "src"    # Ljava/io/File;
    .param p1, "dst"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1486
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 1487
    .local v1, "in":Ljava/io/InputStream;
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1489
    .local v3, "out":Ljava/io/OutputStream;
    const-string v4, "ViPER4Android"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Copying "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1492
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 1494
    .local v0, "buf":[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "len":I
    if-gtz v2, :cond_0

    .line 1497
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 1498
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 1499
    return-void

    .line 1495
    :cond_0
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method private static cpuHasQualitySelection()Z
    .locals 2

    .prologue
    .line 289
    new-instance v1, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;

    invoke-direct {v1}, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;-><init>()V

    .line 290
    .local v1, "mCPUInfo":Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;
    invoke-virtual {v1}, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->hasNEON()Z

    move-result v0

    .line 291
    .local v0, "bCPUHasNEON":Z
    const/4 v1, 0x0

    .line 292
    return v0
.end method

.method private static determineCPUWithDriver(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "mQual"    # Ljava/lang/String;

    .prologue
    .line 296
    const-string v1, "libv4a_fx_"

    .line 298
    .local v1, "mDriverFile":Ljava/lang/String;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x12

    if-lt v3, v4, :cond_1

    .line 299
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "jb_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 304
    :goto_0
    sget-object v3, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    const-string v4, "x86"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 305
    sget-object v3, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    const-string v4, "X86"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 307
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "X86.so"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 308
    const-string v3, "ViPER4Android"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Driver selection = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v1

    .line 335
    .end local v1    # "mDriverFile":Ljava/lang/String;
    .local v2, "mDriverFile":Ljava/lang/String;
    :goto_1
    return-object v2

    .line 301
    .end local v2    # "mDriverFile":Ljava/lang/String;
    .restart local v1    # "mDriverFile":Ljava/lang/String;
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "ics_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 312
    :cond_2
    new-instance v0, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;

    invoke-direct {v0}, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;-><init>()V

    .line 313
    .local v0, "mCPUInfo":Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;
    invoke-virtual {v0}, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->hasNEON()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 314
    if-nez p0, :cond_3

    .line 315
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "NEON"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 330
    :goto_2
    const/4 v0, 0x0

    .line 332
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ".so"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 333
    const-string v3, "ViPER4Android"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Driver selection = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v1

    .line 335
    .end local v1    # "mDriverFile":Ljava/lang/String;
    .restart local v2    # "mDriverFile":Ljava/lang/String;
    goto :goto_1

    .line 316
    .end local v2    # "mDriverFile":Ljava/lang/String;
    .restart local v1    # "mDriverFile":Ljava/lang/String;
    :cond_3
    const-string v3, ""

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 317
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "NEON"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 318
    goto :goto_2

    :cond_4
    const-string v3, "sq"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 319
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "NEON_SQ"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 320
    goto :goto_2

    :cond_5
    const-string v3, "hq"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 321
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "NEON_HQ"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 322
    goto :goto_2

    .line 323
    :cond_6
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "NEON"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 325
    goto/16 :goto_2

    :cond_7
    invoke-virtual {v0}, Lcom/vipercn/viper4android_v2/activity/Utils$CpuInfo;->hasVFP()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 326
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "VFP"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 327
    goto/16 :goto_2

    .line 328
    :cond_8
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "NOVFP"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2
.end method

.method private getEntries()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 1610
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1611
    .local v0, "entryString":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v1, "headset"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1612
    const-string v1, "speaker"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1613
    const-string v1, "bluetooth"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1614
    const-string v1, "usb"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1616
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1
.end method

.method private getTitles()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 1581
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1583
    .local v1, "tmpList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1584
    .local v0, "mTitleMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "ICON"

    const-string v3, "2130837505"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1585
    const-string v2, "TITLE"

    const v3, 0x7f090003

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1586
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1588
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "mTitleMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1589
    .restart local v0    # "mTitleMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "ICON"

    const-string v3, "2130837505"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1590
    const-string v2, "TITLE"

    const v3, 0x7f090004

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1591
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1593
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "mTitleMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1594
    .restart local v0    # "mTitleMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "ICON"

    const-string v3, "2130837505"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1595
    const-string v2, "TITLE"

    const v3, 0x7f090005

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1596
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1598
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "mTitleMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1599
    .restart local v0    # "mTitleMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "ICON"

    const-string v3, "2130837505"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1600
    const-string v2, "TITLE"

    const v3, 0x7f090006

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1601
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1603
    return-object v1
.end method

.method public static isDriverCompatible(Ljava/lang/String;)Z
    .locals 3
    .param p0, "szDrvVersion"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 269
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 272
    .local v0, "lstCompatibleList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 273
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 274
    const/4 v0, 0x0

    .line 284
    :cond_0
    :goto_0
    return v1

    .line 277
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 278
    const/4 v0, 0x0

    .line 281
    const-string v2, "2.3.4.0"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 284
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private processDriverCheck()V
    .locals 7

    .prologue
    .line 248
    new-instance v0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;

    new-instance v5, Lcom/vipercn/viper4android_v2/activity/Utils;

    invoke-direct {v5}, Lcom/vipercn/viper4android_v2/activity/Utils;-><init>()V

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, v5}, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;-><init>(Lcom/vipercn/viper4android_v2/activity/Utils;)V

    .line 249
    .local v0, "aeuUtils":Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;
    invoke-virtual {v0}, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->isViPER4AndroidEngineFound()Z

    move-result v5

    if-nez v5, :cond_1

    .line 250
    const/4 v2, 0x0

    .line 258
    .local v2, "isDriverUsable":Z
    :goto_0
    if-nez v2, :cond_0

    .line 259
    const-string v5, "ViPER4Android"

    .line 260
    const-string v6, "Android audio effect engine reports the v4a driver is not usable"

    .line 259
    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    new-instance v4, Landroid/os/Message;

    invoke-direct {v4}, Landroid/os/Message;-><init>()V

    .line 262
    .local v4, "message":Landroid/os/Message;
    const v5, 0xa00a

    iput v5, v4, Landroid/os/Message;->what:I

    .line 263
    iput-object p0, v4, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 264
    sget-object v5, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDriverHandler:Landroid/os/Handler;

    invoke-virtual {v5, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 266
    .end local v4    # "message":Landroid/os/Message;
    :cond_0
    return-void

    .line 252
    .end local v2    # "isDriverUsable":Z
    :cond_1
    invoke-virtual {v0}, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->getViper4AndroidEngineVersion()[I

    move-result-object v1

    .line 253
    .local v1, "iaDrvVer":[I
    new-instance v5, Ljava/lang/StringBuilder;

    const/4 v6, 0x0

    aget v6, v1, v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    aget v6, v1, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x2

    aget v6, v1, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 254
    const/4 v6, 0x3

    aget v6, v1, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 253
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 255
    .local v3, "mDriverVersion":Ljava/lang/String;
    invoke-static {v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->isDriverCompatible(Ljava/lang/String;)Z

    move-result v2

    .restart local v2    # "isDriverUsable":Z
    goto :goto_0
.end method

.method private static readTextFile(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 7
    .param p0, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 341
    :try_start_0
    new-instance v3, Ljava/io/InputStreamReader;

    const-string v6, "UTF-8"

    invoke-direct {v3, p0, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 345
    .local v3, "inputStreamReader":Ljava/io/InputStreamReader;
    new-instance v5, Ljava/io/BufferedReader;

    invoke-direct {v5, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 346
    .local v5, "reader":Ljava/io/BufferedReader;
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 349
    .local v0, "build":Ljava/lang/StringBuilder;
    :goto_0
    :try_start_1
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-nez v4, :cond_0

    .line 353
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    .line 354
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 355
    const/4 v5, 0x0

    .line 356
    const/4 v3, 0x0

    .line 360
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .end local v0    # "build":Ljava/lang/StringBuilder;
    .end local v3    # "inputStreamReader":Ljava/io/InputStreamReader;
    .end local v4    # "line":Ljava/lang/String;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    :goto_1
    return-object v6

    .line 342
    :catch_0
    move-exception v2

    .line 343
    .local v2, "e1":Ljava/io/UnsupportedEncodingException;
    const-string v6, ""

    goto :goto_1

    .line 350
    .end local v2    # "e1":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "build":Ljava/lang/StringBuilder;
    .restart local v3    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v4    # "line":Ljava/lang/String;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :cond_0
    :try_start_2
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    const-string v6, "\n"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 357
    .end local v4    # "line":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 358
    .local v1, "e":Ljava/io/IOException;
    const-string v6, ""

    goto :goto_1
.end method

.method private selectItem(I)V
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 1560
    iput p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mCurrentSelectedPosition:I

    .line 1561
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerListView:Landroid/widget/ListView;

    if-eqz v1, :cond_0

    .line 1562
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerListView:Landroid/widget/ListView;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 1564
    :cond_0
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    if-eqz v1, :cond_1

    .line 1565
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mFragmentContainerView:Landroid/view/View;

    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;->closeDrawer(Landroid/view/View;)V

    .line 1568
    :cond_1
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 1569
    .local v0, "fragmentManager":Landroid/app/FragmentManager;
    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 1570
    const v2, 0x7f0c0001

    invoke-static {p1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$PlaceholderFragment;->newInstance(I)Landroid/app/Fragment;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 1571
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 1572
    sget-object v1, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mTitles:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    const-string v2, "TITLE"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    iput-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mTitle:Ljava/lang/CharSequence;

    .line 1573
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 1574
    return-void
.end method

.method private setDDCDBVer()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 174
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 178
    .local v4, "packageMgr":Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 179
    .local v3, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v2, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    .local v2, "mVersion":Ljava/lang/String;
    const-string v6, "com.vipercn.viper4android_v2.settings"

    .line 184
    invoke-virtual {p0, v6, v8}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 186
    .local v5, "prefSettings":Landroid/content/SharedPreferences;
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 187
    .local v1, "editSettings":Landroid/content/SharedPreferences$Editor;
    if-eqz v1, :cond_0

    .line 188
    const-string v6, "viper4android.settings.ddc_db_compatible"

    invoke-interface {v1, v6, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 189
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 191
    .end local v1    # "editSettings":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "mVersion":Ljava/lang/String;
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v5    # "prefSettings":Landroid/content/SharedPreferences;
    :cond_0
    :goto_0
    return-void

    .line 180
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_0
.end method

.method private setFirstRun()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 154
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 158
    .local v4, "packageMgr":Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 159
    .local v3, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v2, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    .local v2, "mVersion":Ljava/lang/String;
    const-string v6, "com.vipercn.viper4android_v2.settings"

    .line 164
    invoke-virtual {p0, v6, v8}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 166
    .local v5, "prefSettings":Landroid/content/SharedPreferences;
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 167
    .local v1, "editSettings":Landroid/content/SharedPreferences$Editor;
    if-eqz v1, :cond_0

    .line 168
    const-string v6, "viper4android.settings.lastversion"

    invoke-interface {v1, v6, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 169
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 171
    .end local v1    # "editSettings":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "mVersion":Ljava/lang/String;
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v5    # "prefSettings":Landroid/content/SharedPreferences;
    :cond_0
    :goto_0
    return-void

    .line 160
    :catch_0
    move-exception v0

    .line 161
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_0
.end method

.method private setSoftwareActive()V
    .locals 4

    .prologue
    .line 201
    .line 202
    const-string v2, "com.vipercn.viper4android_v2.settings"

    const/4 v3, 0x0

    .line 201
    invoke-virtual {p0, v2, v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 203
    .local v1, "prefSettings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 204
    .local v0, "editSettings":Landroid/content/SharedPreferences$Editor;
    if-eqz v0, :cond_0

    .line 205
    const-string v2, "viper4android.settings.onlineactive"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 206
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 208
    :cond_0
    return-void
.end method

.method private setUpUi()V
    .locals 11

    .prologue
    const v10, 0x7f0c0002

    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 1231
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getTitles()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mTitles:Ljava/util/List;

    .line 1232
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getEntries()[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mEntries:[Ljava/lang/String;

    .line 1234
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    if-nez v0, :cond_0

    .line 1235
    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->setContentView(I)V

    .line 1236
    invoke-virtual {p0, v10}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerListView:Landroid/widget/ListView;

    .line 1237
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerListView:Landroid/widget/ListView;

    new-instance v1, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$12;

    invoke-direct {v1, p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$12;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 1244
    iget-object v6, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerListView:Landroid/widget/ListView;

    new-instance v0, Landroid/widget/SimpleAdapter;

    .line 1245
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ActionBar;->getThemedContext()Landroid/content/Context;

    move-result-object v1

    .line 1246
    sget-object v2, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mTitles:Ljava/util/List;

    .line 1247
    const v3, 0x7f030002

    .line 1248
    new-array v4, v9, [Ljava/lang/String;

    const-string v5, "ICON"

    aput-object v5, v4, v8

    const-string v5, "TITLE"

    aput-object v5, v4, v7

    .line 1249
    new-array v5, v9, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 1244
    invoke-virtual {v6, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1250
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerListView:Landroid/widget/ListView;

    iget v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mCurrentSelectedPosition:I

    invoke-virtual {v0, v1, v7}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 1253
    invoke-virtual {p0, v10}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1254
    const/high16 v1, 0x7f0c0000

    invoke-virtual {p0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 1252
    invoke-virtual {p0, v0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->setUpNavigationDrawer(Landroid/view/View;Landroid/view/View;)V

    .line 1270
    :goto_0
    return-void

    .line 1257
    :cond_0
    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->setContentView(I)V

    .line 1259
    new-instance v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;Landroid/app/FragmentManager;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->pagerAdapter:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;

    .line 1260
    const v0, 0x7f0c0003

    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->viewPager:Landroid/support/v4/view/ViewPager;

    .line 1261
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->viewPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->pagerAdapter:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 1262
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, v8}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 1263
    const v0, 0x7f0c0004

    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/PagerTabStrip;

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->pagerTabStrip:Landroid/support/v4/view/PagerTabStrip;

    .line 1265
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->pagerTabStrip:Landroid/support/v4/view/PagerTabStrip;

    invoke-virtual {v0, v7}, Landroid/support/v4/view/PagerTabStrip;->setDrawFullUnderline(Z)V

    .line 1266
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->pagerTabStrip:Landroid/support/v4/view/PagerTabStrip;

    .line 1267
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f06000e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 1266
    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerTabStrip;->setTabIndicatorColor(I)V

    goto :goto_0

    .line 1249
    nop

    :array_0
    .array-data 4
        0x7f0c0005
        0x7f0c0006
    .end array-data
.end method

.method private submitInformation()Z
    .locals 15

    .prologue
    const/16 v14, 0x100

    const/4 v13, 0x2

    const/4 v10, 0x0

    .line 211
    const-string v6, ""

    .line 212
    .local v6, "mCode":Ljava/lang/String;
    new-instance v9, Ljava/util/Random;

    invoke-direct {v9}, Ljava/util/Random;-><init>()V

    .line 213
    .local v9, "rndMachine":Ljava/util/Random;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    const/16 v11, 0x8

    if-lt v5, v11, :cond_1

    .line 221
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "-"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 222
    const/4 v5, 0x0

    :goto_1
    const/4 v11, 0x4

    if-lt v5, v11, :cond_3

    .line 230
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "-"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 232
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "http://vipersaudio.com/stat/v4a_stat.php?code="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 233
    const-string v12, "&ver=viper4android-fx"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 232
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 235
    .local v7, "mURL":Ljava/lang/String;
    :try_start_0
    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v3, v7}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 236
    .local v3, "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 237
    .local v2, "httpClient":Lorg/apache/http/client/HttpClient;
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 238
    .local v4, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v11

    const/16 v12, 0xc8

    if-ne v11, v12, :cond_0

    const/4 v10, 0x1

    .line 241
    .end local v2    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    .end local v4    # "httpResponse":Lorg/apache/http/HttpResponse;
    :cond_0
    :goto_2
    return v10

    .line 214
    .end local v7    # "mURL":Ljava/lang/String;
    :cond_1
    invoke-virtual {v9, v14}, Ljava/util/Random;->nextInt(I)I

    move-result v8

    .line 215
    .local v8, "oneByte":I
    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 216
    .local v0, "byteHexString":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v11

    if-ge v11, v13, :cond_2

    .line 217
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "0"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 219
    :cond_2
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 213
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 223
    .end local v0    # "byteHexString":Ljava/lang/String;
    .end local v8    # "oneByte":I
    :cond_3
    invoke-virtual {v9, v14}, Ljava/util/Random;->nextInt(I)I

    move-result v8

    .line 224
    .restart local v8    # "oneByte":I
    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 225
    .restart local v0    # "byteHexString":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v11

    if-ge v11, v13, :cond_4

    .line 226
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "0"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 228
    :cond_4
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 222
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1

    .line 239
    .end local v0    # "byteHexString":Ljava/lang/String;
    .end local v8    # "oneByte":I
    .restart local v7    # "mURL":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 240
    .local v1, "e":Ljava/lang/Exception;
    const-string v11, "ViPER4Android"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Submit failed, error = "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method


# virtual methods
.method public isDrawerOpen()Z
    .locals 2

    .prologue
    .line 1556
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mFragmentContainerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;->isDrawerOpen(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loadProfile(Ljava/lang/String;)V
    .locals 11
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1412
    new-instance v4, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aProfilePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1413
    .local v4, "profileDir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_0

    .line 1415
    const/4 v7, 0x4

    new-array v0, v7, [Ljava/lang/String;

    .line 1416
    .local v0, "audioDevices":[Ljava/lang/String;
    const/4 v7, 0x0

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f090096

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v7

    .line 1417
    const/4 v7, 0x1

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f090098

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v7

    .line 1418
    const/4 v7, 0x2

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f090097

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v7

    .line 1419
    const/4 v7, 0x3

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f090099

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v7

    .line 1421
    move-object v5, p1

    .line 1422
    .local v5, "profilename":Ljava/lang/String;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1423
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const v7, 0x7f0900a7

    invoke-virtual {v1, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 1424
    new-instance v8, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$17;

    invoke-direct {v8, p0, v5}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$17;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;Ljava/lang/String;)V

    invoke-virtual {v7, v0, v8}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 1450
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0900a9

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1451
    new-instance v9, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$18;

    invoke-direct {v9, p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$18;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    .line 1450
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1457
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    .line 1483
    .end local v0    # "audioDevices":[Ljava/lang/String;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v5    # "profilename":Ljava/lang/String;
    :goto_0
    return-void

    .line 1461
    :cond_0
    const-string v3, "com.vipercn.viper4android_v2."

    .line 1462
    .local v3, "packageName":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v8

    iget-object v8, v8, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "/shared_prefs/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1465
    .local v6, "spDir":Ljava/lang/String;
    :try_start_0
    new-instance v7, Ljava/io/File;

    const-string v8, "com.vipercn.viper4android_v2.bluetooth.xml"

    invoke-direct {v7, v4, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1466
    new-instance v8, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "com.vipercn.viper4android_v2."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "bluetooth.xml"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1465
    invoke-static {v7, v8}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->copy(Ljava/io/File;Ljava/io/File;)V

    .line 1467
    new-instance v7, Ljava/io/File;

    const-string v8, "com.vipercn.viper4android_v2.headset.xml"

    invoke-direct {v7, v4, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1468
    new-instance v8, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "com.vipercn.viper4android_v2."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "headset.xml"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1467
    invoke-static {v7, v8}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->copy(Ljava/io/File;Ljava/io/File;)V

    .line 1469
    new-instance v7, Ljava/io/File;

    const-string v8, "com.vipercn.viper4android_v2.speaker.xml"

    invoke-direct {v7, v4, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1470
    new-instance v8, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "com.vipercn.viper4android_v2."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "speaker.xml"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1469
    invoke-static {v7, v8}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->copy(Ljava/io/File;Ljava/io/File;)V

    .line 1471
    new-instance v7, Ljava/io/File;

    const-string v8, "com.vipercn.viper4android_v2.usb.xml"

    invoke-direct {v7, v4, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1472
    new-instance v8, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "com.vipercn.viper4android_v2."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "usb.xml"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1471
    invoke-static {v7, v8}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->copy(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1478
    :goto_1
    new-instance v7, Landroid/content/Intent;

    const-string v8, "com.vipercn.viper4android_v2.UPDATE"

    invoke-direct {v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v7}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->sendBroadcast(Landroid/content/Intent;)V

    .line 1481
    new-instance v7, Landroid/content/Intent;

    const-class v8, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-direct {v7, p0, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v7}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->startActivity(Landroid/content/Intent;)V

    .line 1482
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->finish()V

    goto/16 :goto_0

    .line 1473
    :catch_0
    move-exception v2

    .line 1474
    .local v2, "e":Ljava/io/IOException;
    const-string v7, "ViPER4Android"

    const-string v8, "Cannot load preset"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public loadProfileDialog()V
    .locals 8

    .prologue
    .line 1346
    new-instance v3, Ljava/io/File;

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aProfilePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1347
    .local v3, "profileDir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 1351
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aProfilePath()Ljava/lang/String;

    move-result-object v6

    .line 1350
    invoke-static {v6}, Lcom/vipercn/viper4android_v2/activity/Utils;->getProfileList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    .line 1354
    .local v4, "profilenames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v6, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$15;

    invoke-direct {v6, p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$15;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    invoke-virtual {v3, v6}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v5

    .line 1362
    .local v5, "profiles":[Ljava/io/File;
    if-eqz v5, :cond_0

    .line 1363
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v6, v5

    if-lt v1, v6, :cond_1

    .line 1369
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v2, v6, [Ljava/lang/String;

    .line 1370
    .local v2, "names":[Ljava/lang/String;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v1, v6, :cond_2

    .line 1375
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1376
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v6, 0x7f0900a3

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 1377
    new-instance v7, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$16;

    invoke-direct {v7, p0, v2}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$16;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;[Ljava/lang/String;)V

    invoke-virtual {v6, v2, v7}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1382
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/AlertDialog;->show()V

    .line 1383
    return-void

    .line 1364
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v2    # "names":[Ljava/lang/String;
    :cond_1
    aget-object v6, v5, v1

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1363
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1371
    .restart local v2    # "names":[Ljava/lang/String;
    :cond_2
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    aput-object v6, v2, v1

    .line 1370
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 716
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 717
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    if-nez v0, :cond_0

    .line 718
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/ActionBarDrawerToggle;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 720
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 16
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 602
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 605
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/V4AJniInterface;->CheckLibrary()Z

    move-result v4

    .line 606
    .local v4, "jniLoaded":Z
    const-string v12, "ViPER4Android"

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Jni library status = "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 609
    invoke-direct/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->checkFirstRun()Z

    .line 614
    invoke-direct/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->checkDDCDBVer()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 615
    invoke-static/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/DDCDatabase;->initializeDatabase(Landroid/content/Context;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 616
    invoke-direct/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->setDDCDBVer()V

    .line 620
    :cond_0
    const-string v12, "ViPER4Android"

    const-string v13, "Starting service, reason = ViPER4Android::onCreate"

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 621
    new-instance v11, Landroid/content/Intent;

    const-class v12, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-object/from16 v0, p0

    invoke-direct {v11, v0, v12}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 622
    .local v11, "serviceIntent":Landroid/content/Intent;
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 625
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mPreferences:Landroid/content/SharedPreferences;

    .line 626
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mPreferences:Landroid/content/SharedPreferences;

    const-string v13, "navigation_drawer_learned"

    const/4 v14, 0x0

    invoke-interface {v12, v13, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mUserLearnedDrawer:Z

    .line 628
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f070001

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 629
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mPreferences:Landroid/content/SharedPreferences;

    const-string v13, "pref_is_tabbed"

    .line 630
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const/high16 v15, 0x7f070000

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v14

    .line 629
    invoke-interface {v12, v13, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    .line 635
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getTitle()Ljava/lang/CharSequence;

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mTitle:Ljava/lang/CharSequence;

    .line 638
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getActionBar()Landroid/app/ActionBar;

    move-result-object v5

    .line 639
    .local v5, "mActionBar":Landroid/app/ActionBar;
    const/4 v12, 0x1

    invoke-virtual {v5, v12}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 640
    const/4 v12, 0x1

    invoke-virtual {v5, v12}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 641
    const/4 v12, 0x1

    invoke-virtual {v5, v12}, Landroid/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 644
    if-eqz p1, :cond_1

    .line 645
    const-string v12, "selected_navigation_drawer_position"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v12

    move-object/from16 v0, p0

    iput v12, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mCurrentSelectedPosition:I

    .line 646
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mFromSavedInstanceState:Z

    .line 650
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->checkFirstRun()Z

    move-result v12

    if-eqz v12, :cond_2

    .line 651
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "_"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 652
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 651
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 653
    .local v9, "mLocale":Ljava/lang/String;
    const-string v7, "Changelog_"

    .line 654
    .local v7, "mChangelog_AssetsName":Ljava/lang/String;
    const-string v12, "zh_CN"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 655
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "zh_CN"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 660
    :goto_1
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, ".txt"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 662
    const-string v6, ""

    .line 665
    .local v6, "mChangeLog":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v12

    invoke-virtual {v12, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 666
    .local v3, "isChglogHandle":Ljava/io/InputStream;
    invoke-static {v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->readTextFile(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v6

    .line 667
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 671
    .end local v3    # "isChglogHandle":Ljava/io/InputStream;
    :goto_2
    invoke-direct/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->setFirstRun()V

    .line 672
    const-string v12, ""

    invoke-virtual {v6, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_6

    .line 673
    new-instance v8, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    invoke-direct {v8, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 674
    .local v8, "mChglog":Landroid/app/AlertDialog$Builder;
    const v12, 0x7f0900be

    invoke-virtual {v8, v12}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 675
    invoke-virtual {v8, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 676
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f0900a8

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v8, v12, v13}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 677
    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 684
    .end local v6    # "mChangeLog":Ljava/lang/String;
    .end local v7    # "mChangelog_AssetsName":Ljava/lang/String;
    .end local v8    # "mChglog":Landroid/app/AlertDialog$Builder;
    .end local v9    # "mLocale":Ljava/lang/String;
    :cond_2
    :goto_3
    new-instance v1, Ljava/lang/Thread;

    new-instance v12, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$2;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$2;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    invoke-direct {v1, v12}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 694
    .local v1, "activeThread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 697
    new-instance v10, Ljava/lang/Thread;

    new-instance v12, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$3;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$3;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    invoke-direct {v10, v12}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 709
    .local v10, "postInitThread":Ljava/lang/Thread;
    invoke-virtual {v10}, Ljava/lang/Thread;->start()V

    .line 711
    invoke-direct/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->setUpUi()V

    .line 712
    return-void

    .line 632
    .end local v1    # "activeThread":Ljava/lang/Thread;
    .end local v5    # "mActionBar":Landroid/app/ActionBar;
    .end local v10    # "postInitThread":Ljava/lang/Thread;
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const/high16 v13, 0x7f070000

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v12

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    goto/16 :goto_0

    .line 657
    .restart local v5    # "mActionBar":Landroid/app/ActionBar;
    .restart local v7    # "mChangelog_AssetsName":Ljava/lang/String;
    .restart local v9    # "mLocale":Ljava/lang/String;
    :cond_4
    const-string v12, "zh_TW"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_5

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 658
    const-string v13, "zh_TW"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 657
    :goto_4
    goto/16 :goto_1

    .line 658
    :cond_5
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "en_US"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_4

    .line 668
    .restart local v6    # "mChangeLog":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 669
    .local v2, "e":Ljava/io/IOException;
    const-string v12, "ViPER4Android"

    const-string v13, "Can not read changelog"

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 679
    .end local v2    # "e":Ljava/io/IOException;
    :cond_6
    const-string v12, "ViPER4Android"

    const-string v13, "Changelog is empty"

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 780
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->isDrawerOpen()Z

    move-result v0

    if-nez v0, :cond_2

    .line 781
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    if-eqz v0, :cond_1

    const v0, 0x7f0b0001

    :goto_0
    invoke-virtual {v1, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 782
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070001

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 783
    const v0, 0x7f0c0009

    invoke-interface {p1, v0}, Landroid/view/Menu;->removeItem(I)V

    .line 785
    :cond_0
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 786
    const/4 v0, 0x1

    .line 789
    :goto_1
    return v0

    .line 781
    :cond_1
    const/high16 v0, 0x7f0b0000

    goto :goto_0

    .line 788
    :cond_2
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const v1, 0x7f090001

    invoke-virtual {p0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 789
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    goto :goto_1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 36
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 861
    if-nez p1, :cond_0

    const/16 v33, 0x1

    .line 1221
    :goto_0
    return v33

    .line 864
    :cond_0
    const-string v33, "com.vipercn.viper4android_v2.settings"

    const/16 v34, 0x0

    .line 863
    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v29

    .line 865
    .local v29, "prefSettings":Landroid/content/SharedPreferences;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    move/from16 v33, v0

    if-nez v33, :cond_2

    .line 866
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    move-object/from16 v33, v0

    if-nez v33, :cond_1

    .line 868
    const/16 v33, 0x1

    goto :goto_0

    .line 870
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/ActionBarDrawerToggle;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v33

    if-eqz v33, :cond_2

    .line 871
    const/16 v33, 0x1

    goto :goto_0

    .line 875
    :cond_2
    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    .line 876
    .local v4, "choice":I
    packed-switch v4, :pswitch_data_0

    .line 1221
    const/16 v33, 0x0

    goto :goto_0

    .line 878
    :pswitch_0
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v28

    .line 882
    .local v28, "packageMgr":Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getPackageName()Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x0

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v27

    .line 883
    .local v27, "packageInfo":Landroid/content/pm/PackageInfo;
    move-object/from16 v0, v27

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v22, v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 887
    .end local v27    # "packageInfo":Landroid/content/pm/PackageInfo;
    .local v22, "mVersion":Ljava/lang/String;
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f0900c3

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 888
    .local v11, "mAbout":Ljava/lang/String;
    new-instance v33, Ljava/lang/StringBuilder;

    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    aput-object v22, v34, v35

    move-object/from16 v0, v34

    invoke-static {v11, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v34 .. v34}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v34, "\n"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 889
    new-instance v33, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v34

    const v35, 0x7f0900c4

    invoke-virtual/range {v34 .. v35}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 891
    new-instance v17, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 892
    .local v17, "mHelp":Landroid/app/AlertDialog$Builder;
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f0900c2

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 893
    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 894
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f0900a8

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    .line 895
    new-instance v34, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$5;

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$5;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    .line 894
    move-object/from16 v0, v17

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 900
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f0900c6

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    .line 901
    new-instance v34, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$6;

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$6;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    .line 900
    move-object/from16 v0, v17

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 910
    invoke-virtual/range {v17 .. v17}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 911
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 884
    .end local v11    # "mAbout":Ljava/lang/String;
    .end local v17    # "mHelp":Landroid/app/AlertDialog$Builder;
    .end local v22    # "mVersion":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 885
    .local v6, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v22, "N/A"

    .restart local v22    # "mVersion":Ljava/lang/String;
    goto/16 :goto_1

    .line 915
    .end local v6    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v22    # "mVersion":Ljava/lang/String;
    .end local v28    # "packageMgr":Landroid/content/pm/PackageManager;
    :pswitch_1
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f0900c8

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v32

    .line 916
    .local v32, "uri":Landroid/net/Uri;
    new-instance v9, Landroid/content/Intent;

    const-string v33, "android.intent.action.VIEW"

    move-object/from16 v0, v33

    move-object/from16 v1, v32

    invoke-direct {v9, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 917
    .local v9, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->startActivity(Landroid/content/Intent;)V

    .line 918
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 922
    .end local v9    # "intent":Landroid/content/Intent;
    .end local v32    # "uri":Landroid/net/Uri;
    :pswitch_2
    new-instance v5, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    .line 976
    .local v5, "df":Landroid/app/DialogFragment;
    const/16 v33, 0x1

    const/16 v34, 0x0

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v5, v0, v1}, Landroid/app/DialogFragment;->setStyle(II)V

    .line 977
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v33

    const-string v34, "v4astatus"

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    invoke-virtual {v5, v0, v1}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 978
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 983
    .end local v5    # "df":Landroid/app/DialogFragment;
    :pswitch_3
    new-instance v33, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v34 .. v34}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v34, "_"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    .line 984
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    .line 983
    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 985
    .local v18, "mLocale":Ljava/lang/String;
    const-string v13, "Changelog_"

    .line 986
    .local v13, "mChangelog_AssetsName":Ljava/lang/String;
    const-string v33, "zh_CN"

    move-object/from16 v0, v18

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_3

    .line 987
    new-instance v33, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v34, "zh_CN"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 992
    :goto_2
    new-instance v33, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v34, ".txt"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 993
    const-string v12, ""

    .line 996
    .local v12, "mChangeLog":Ljava/lang/String;
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v0, v13}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v10

    .line 997
    .local v10, "isChglogHandle":Ljava/io/InputStream;
    invoke-static {v10}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->readTextFile(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v12

    .line 998
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1003
    .end local v10    # "isChglogHandle":Ljava/io/InputStream;
    :goto_3
    const-string v33, ""

    move-object/from16 v0, v33

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_5

    const/16 v33, 0x1

    goto/16 :goto_0

    .line 989
    .end local v12    # "mChangeLog":Ljava/lang/String;
    :cond_3
    const-string v33, "zh_TW"

    move-object/from16 v0, v18

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_4

    .line 990
    new-instance v33, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v34, "zh_TW"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 989
    :goto_4
    goto :goto_2

    .line 990
    :cond_4
    new-instance v33, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v34, "en_US"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_4

    .line 999
    .restart local v12    # "mChangeLog":Ljava/lang/String;
    :catch_1
    move-exception v6

    .line 1000
    .local v6, "e":Ljava/io/IOException;
    const-string v33, "ViPER4Android"

    const-string v34, "Can not read changelog"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 1004
    .end local v6    # "e":Ljava/io/IOException;
    :cond_5
    new-instance v14, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1005
    .local v14, "mChglog":Landroid/app/AlertDialog$Builder;
    const v33, 0x7f0900be

    move/from16 v0, v33

    invoke-virtual {v14, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1006
    invoke-virtual {v14, v12}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1007
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f0900a8

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x0

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    invoke-virtual {v14, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1008
    invoke-virtual {v14}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1009
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 1013
    .end local v12    # "mChangeLog":Ljava/lang/String;
    .end local v13    # "mChangelog_AssetsName":Ljava/lang/String;
    .end local v14    # "mChglog":Landroid/app/AlertDialog$Builder;
    .end local v18    # "mLocale":Ljava/lang/String;
    :pswitch_4
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->loadProfileDialog()V

    .line 1014
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 1018
    :pswitch_5
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->saveProfileDialog()V

    .line 1019
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 1023
    :pswitch_6
    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v33

    invoke-interface/range {v33 .. v33}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v23

    .line 1024
    .local v23, "menuText":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f0900b2

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_6

    .line 1026
    new-instance v16, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1027
    .local v16, "mConfirm":Landroid/app/AlertDialog$Builder;
    const-string v33, "ViPER4Android"

    move-object/from16 v0, v16

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1028
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f0900ad

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v16

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1029
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f09009d

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    .line 1030
    new-instance v34, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$8;

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$8;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    .line 1029
    move-object/from16 v0, v16

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1042
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f09009e

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1043
    invoke-virtual/range {v16 .. v16}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1053
    .end local v16    # "mConfirm":Landroid/app/AlertDialog$Builder;
    :goto_5
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 1044
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f0900b3

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_7

    .line 1045
    new-instance v24, Landroid/os/Message;

    invoke-direct/range {v24 .. v24}, Landroid/os/Message;-><init>()V

    .line 1046
    .local v24, "message":Landroid/os/Message;
    const v33, 0xa00a

    move/from16 v0, v33

    move-object/from16 v1, v24

    iput v0, v1, Landroid/os/Message;->what:I

    .line 1047
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1048
    sget-object v33, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDriverHandler:Landroid/os/Handler;

    move-object/from16 v0, v33

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_5

    .line 1050
    .end local v24    # "message":Landroid/os/Message;
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f0900c1

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v31

    .line 1051
    .local v31, "szTip":Ljava/lang/String;
    const/16 v33, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Landroid/widget/Toast;->show()V

    goto :goto_5

    .line 1057
    .end local v23    # "menuText":Ljava/lang/String;
    .end local v31    # "szTip":Ljava/lang/String;
    :pswitch_7
    const-string v33, "viper4android.settings.uiprefer"

    const/16 v34, 0x0

    move-object/from16 v0, v29

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v26

    .line 1058
    .local v26, "nUIPrefer":I
    if-ltz v26, :cond_8

    const/16 v33, 0x2

    move/from16 v0, v26

    move/from16 v1, v33

    if-le v0, v1, :cond_9

    .line 1059
    :cond_8
    const/16 v26, 0x0

    .line 1061
    :cond_9
    new-instance v33, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1062
    const v34, 0x7f0900af

    invoke-virtual/range {v33 .. v34}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    .line 1063
    const v34, 0x7f020003

    invoke-virtual/range {v33 .. v34}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    .line 1064
    const v34, 0x7f050002

    .line 1065
    new-instance v35, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$9;

    invoke-direct/range {v35 .. v36}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$9;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    .line 1064
    move-object/from16 v0, v33

    move/from16 v1, v34

    move/from16 v2, v26

    move-object/from16 v3, v35

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    .line 1083
    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v30

    .line 1084
    .local v30, "selectDialog":Landroid/app/Dialog;
    invoke-virtual/range {v30 .. v30}, Landroid/app/Dialog;->show()V

    .line 1085
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 1090
    .end local v26    # "nUIPrefer":I
    .end local v30    # "selectDialog":Landroid/app/Dialog;
    :pswitch_8
    const-string v33, "viper4android.settings.compatiblemode"

    const-string v34, "global"

    .line 1089
    move-object/from16 v0, v29

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1092
    .local v15, "mCompatibleMode":Ljava/lang/String;
    const-string v33, "global"

    move-object/from16 v0, v33

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_a

    const/16 v21, 0x0

    .line 1093
    .local v21, "mSelectIndex":I
    :goto_6
    new-instance v33, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1094
    const v34, 0x7f0900b0

    invoke-virtual/range {v33 .. v34}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    .line 1095
    const v34, 0x7f020003

    invoke-virtual/range {v33 .. v34}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    .line 1096
    const v34, 0x7f050004

    .line 1097
    new-instance v35, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$10;

    invoke-direct/range {v35 .. v36}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$10;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    .line 1096
    move-object/from16 v0, v33

    move/from16 v1, v34

    move/from16 v2, v21

    move-object/from16 v3, v35

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    .line 1118
    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v30

    .line 1119
    .restart local v30    # "selectDialog":Landroid/app/Dialog;
    invoke-virtual/range {v30 .. v30}, Landroid/app/Dialog;->show()V

    .line 1120
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 1092
    .end local v21    # "mSelectIndex":I
    .end local v30    # "selectDialog":Landroid/app/Dialog;
    :cond_a
    const/16 v21, 0x1

    goto :goto_6

    .line 1125
    .end local v15    # "mCompatibleMode":Ljava/lang/String;
    :pswitch_9
    const-string v33, "viper4android.settings.show_notify_icon"

    const/16 v34, 0x0

    .line 1124
    move-object/from16 v0, v29

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    .line 1126
    .local v8, "enableNotify":Z
    if-eqz v8, :cond_b

    const/4 v8, 0x0

    .line 1127
    :goto_7
    if-eqz v8, :cond_c

    .line 1128
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f09009b

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 1132
    :goto_8
    invoke-interface/range {v29 .. v29}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 1133
    .local v7, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v33, "viper4android.settings.show_notify_icon"

    move-object/from16 v0, v33

    invoke-interface {v7, v0, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1134
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1136
    if-eqz v8, :cond_d

    .line 1137
    new-instance v33, Landroid/content/Intent;

    const-string v34, "com.vipercn.viper4android_v2.SHOWNOTIFY"

    invoke-direct/range {v33 .. v34}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->sendBroadcast(Landroid/content/Intent;)V

    .line 1141
    :goto_9
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 1126
    .end local v7    # "edit":Landroid/content/SharedPreferences$Editor;
    :cond_b
    const/4 v8, 0x1

    goto :goto_7

    .line 1130
    :cond_c
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v33

    const v34, 0x7f09009a

    invoke-virtual/range {v33 .. v34}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_8

    .line 1139
    .restart local v7    # "edit":Landroid/content/SharedPreferences$Editor;
    :cond_d
    new-instance v33, Landroid/content/Intent;

    const-string v34, "com.vipercn.viper4android_v2.CANCELNOTIFY"

    invoke-direct/range {v33 .. v34}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_9

    .line 1146
    .end local v7    # "edit":Landroid/content/SharedPreferences$Editor;
    .end local v8    # "enableNotify":Z
    :pswitch_a
    const-string v33, "viper4android.settings.lock_effect"

    const-string v34, "none"

    .line 1145
    move-object/from16 v0, v29

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 1148
    .local v20, "mLockedEffect":Ljava/lang/String;
    const-string v33, "none"

    move-object/from16 v0, v20

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_e

    .line 1149
    const/16 v19, 0x0

    .line 1162
    .local v19, "mLockIndex":I
    :goto_a
    const/16 v33, 0x5

    move/from16 v0, v33

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v33, 0x0

    .line 1163
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v34

    const v35, 0x7f090095

    invoke-virtual/range {v34 .. v35}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v34

    aput-object v34, v25, v33

    const/16 v33, 0x1

    .line 1164
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v34

    const v35, 0x7f090096

    invoke-virtual/range {v34 .. v35}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v34

    aput-object v34, v25, v33

    const/16 v33, 0x2

    .line 1165
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v34

    const v35, 0x7f090098

    invoke-virtual/range {v34 .. v35}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v34

    aput-object v34, v25, v33

    const/16 v33, 0x3

    .line 1166
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v34

    const v35, 0x7f090097

    invoke-virtual/range {v34 .. v35}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v34

    aput-object v34, v25, v33

    const/16 v33, 0x4

    .line 1167
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v34

    const v35, 0x7f090099

    invoke-virtual/range {v34 .. v35}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v34

    aput-object v34, v25, v33

    .line 1170
    .local v25, "modeList":[Ljava/lang/String;
    new-instance v33, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1171
    const v34, 0x7f09009c

    invoke-virtual/range {v33 .. v34}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    .line 1172
    const v34, 0x7f020003

    invoke-virtual/range {v33 .. v34}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    .line 1174
    new-instance v34, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$11;

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$11;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    .line 1173
    move-object/from16 v0, v33

    move-object/from16 v1, v25

    move/from16 v2, v19

    move-object/from16 v3, v34

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    .line 1207
    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v30

    .line 1208
    .restart local v30    # "selectDialog":Landroid/app/Dialog;
    invoke-virtual/range {v30 .. v30}, Landroid/app/Dialog;->show()V

    .line 1210
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 1150
    .end local v19    # "mLockIndex":I
    .end local v25    # "modeList":[Ljava/lang/String;
    .end local v30    # "selectDialog":Landroid/app/Dialog;
    :cond_e
    const-string v33, "headset"

    move-object/from16 v0, v20

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_f

    .line 1151
    const/16 v19, 0x1

    .line 1152
    .restart local v19    # "mLockIndex":I
    goto/16 :goto_a

    .end local v19    # "mLockIndex":I
    :cond_f
    const-string v33, "speaker"

    move-object/from16 v0, v20

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_10

    .line 1153
    const/16 v19, 0x2

    .line 1154
    .restart local v19    # "mLockIndex":I
    goto/16 :goto_a

    .end local v19    # "mLockIndex":I
    :cond_10
    const-string v33, "bluetooth"

    move-object/from16 v0, v20

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_11

    .line 1155
    const/16 v19, 0x3

    .line 1156
    .restart local v19    # "mLockIndex":I
    goto/16 :goto_a

    .end local v19    # "mLockIndex":I
    :cond_11
    const-string v33, "usb"

    move-object/from16 v0, v20

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_12

    .line 1157
    const/16 v19, 0x4

    .line 1158
    .restart local v19    # "mLockIndex":I
    goto/16 :goto_a

    .line 1159
    .end local v19    # "mLockIndex":I
    :cond_12
    const/16 v19, 0x5

    .restart local v19    # "mLockIndex":I
    goto/16 :goto_a

    .line 1214
    .end local v19    # "mLockIndex":I
    .end local v20    # "mLockedEffect":Ljava/lang/String;
    :pswitch_b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    move/from16 v33, v0

    if-eqz v33, :cond_13

    const/16 v33, 0x0

    :goto_b
    move/from16 v0, v33

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    .line 1215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mPreferences:Landroid/content/SharedPreferences;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v33

    const-string v34, "pref_is_tabbed"

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    move/from16 v35, v0

    invoke-interface/range {v33 .. v35}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v33

    invoke-interface/range {v33 .. v33}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1216
    invoke-static/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/activity/Utils;->restartActivity(Landroid/app/Activity;)V

    .line 1217
    const/16 v33, 0x1

    goto/16 :goto_0

    .line 1214
    :cond_13
    const/16 v33, 0x1

    goto :goto_b

    .line 876
    nop

    :pswitch_data_0
    .packed-switch 0x7f0c0009
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_4
        :pswitch_5
        :pswitch_7
        :pswitch_8
        :pswitch_6
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 12
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 795
    .line 796
    const-string v10, "com.vipercn.viper4android_v2.settings"

    const/4 v11, 0x0

    .line 795
    invoke-virtual {p0, v10, v11}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    .line 797
    .local v9, "preferences":Landroid/content/SharedPreferences;
    const-string v10, "viper4android.settings.show_notify_icon"

    const/4 v11, 0x0

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 798
    .local v5, "mEnableNotify":Z
    const-string v10, "viper4android.settings.compatiblemode"

    const-string v11, "global"

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 800
    .local v3, "mDriverMode":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->isDrawerOpen()Z

    move-result v10

    if-nez v10, :cond_1

    .line 802
    if-eqz v5, :cond_2

    .line 803
    const v10, 0x7f0c000b

    invoke-interface {p1, v10}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 804
    .local v6, "mNotify":Landroid/view/MenuItem;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f09009b

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 805
    .local v7, "mNotifyTitle":Ljava/lang/String;
    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 813
    :goto_0
    const/4 v1, 0x1

    .line 814
    .local v1, "isDriverInGlobalMode":Z
    const-string v10, "global"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 815
    const/4 v1, 0x0

    .line 817
    :cond_0
    if-nez v1, :cond_3

    .line 819
    const v10, 0x7f0c0011

    invoke-interface {p1, v10}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 820
    .local v4, "mDrvStatus":Landroid/view/MenuItem;
    const/4 v10, 0x0

    invoke-interface {v4, v10}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 827
    :goto_1
    iget-object v10, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    if-nez v10, :cond_5

    .line 828
    const v10, 0x7f0c0010

    invoke-interface {p1, v10}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 829
    .local v0, "drvInstItem":Landroid/view/MenuItem;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0900b3

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 830
    .local v8, "menuTitle":Ljava/lang/String;
    invoke-interface {v0, v8}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 831
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->isEnvironmentInitialized()Z

    move-result v10

    if-nez v10, :cond_4

    .line 832
    const/4 v10, 0x0

    invoke-interface {v0, v10}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 855
    .end local v0    # "drvInstItem":Landroid/view/MenuItem;
    .end local v1    # "isDriverInGlobalMode":Z
    .end local v4    # "mDrvStatus":Landroid/view/MenuItem;
    .end local v6    # "mNotify":Landroid/view/MenuItem;
    .end local v7    # "mNotifyTitle":Ljava/lang/String;
    .end local v8    # "menuTitle":Ljava/lang/String;
    :cond_1
    :goto_2
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v10

    return v10

    .line 807
    :cond_2
    const v10, 0x7f0c000b

    invoke-interface {p1, v10}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 808
    .restart local v6    # "mNotify":Landroid/view/MenuItem;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f09009a

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 809
    .restart local v7    # "mNotifyTitle":Ljava/lang/String;
    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_0

    .line 822
    .restart local v1    # "isDriverInGlobalMode":Z
    :cond_3
    const v10, 0x7f0c0011

    invoke-interface {p1, v10}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 823
    .restart local v4    # "mDrvStatus":Landroid/view/MenuItem;
    const/4 v10, 0x1

    invoke-interface {v4, v10}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_1

    .line 834
    .restart local v0    # "drvInstItem":Landroid/view/MenuItem;
    .restart local v8    # "menuTitle":Ljava/lang/String;
    :cond_4
    const/4 v10, 0x1

    invoke-interface {v0, v10}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_2

    .line 837
    .end local v0    # "drvInstItem":Landroid/view/MenuItem;
    .end local v8    # "menuTitle":Ljava/lang/String;
    :cond_5
    iget-object v10, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-virtual {v10}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getDriverIsReady()Z

    move-result v2

    .line 838
    .local v2, "mDriverIsReady":Z
    if-eqz v2, :cond_7

    .line 839
    const v10, 0x7f0c0010

    invoke-interface {p1, v10}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 840
    .restart local v0    # "drvInstItem":Landroid/view/MenuItem;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0900b2

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 841
    .restart local v8    # "menuTitle":Ljava/lang/String;
    invoke-interface {v0, v8}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 842
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->isEnvironmentInitialized()Z

    move-result v10

    if-nez v10, :cond_6

    .line 843
    const/4 v10, 0x0

    invoke-interface {v0, v10}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_2

    .line 844
    :cond_6
    const/4 v10, 0x1

    invoke-interface {v0, v10}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_2

    .line 846
    .end local v0    # "drvInstItem":Landroid/view/MenuItem;
    .end local v8    # "menuTitle":Ljava/lang/String;
    :cond_7
    const v10, 0x7f0c0010

    invoke-interface {p1, v10}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 847
    .restart local v0    # "drvInstItem":Landroid/view/MenuItem;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0900b3

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 848
    .restart local v8    # "menuTitle":Ljava/lang/String;
    invoke-interface {v0, v8}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 849
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->isEnvironmentInitialized()Z

    move-result v10

    if-nez v10, :cond_8

    .line 850
    const/4 v10, 0x0

    invoke-interface {v0, v10}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_2

    .line 851
    :cond_8
    const/4 v10, 0x1

    invoke-interface {v0, v10}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_2
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 732
    const-string v2, "ViPER4Android"

    const-string v3, "Main activity onResume()"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 736
    new-instance v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    .line 773
    .local v0, "connection":Landroid/content/ServiceConnection;
    const-string v2, "ViPER4Android"

    const-string v3, "onResume(), Binding service ..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 774
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 775
    .local v1, "serviceIntent":Landroid/content/Intent;
    const/16 v2, 0x40

    invoke-virtual {p0, v1, v0, v2}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 776
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 724
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 725
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z

    if-nez v0, :cond_0

    .line 726
    const-string v0, "selected_navigation_drawer_position"

    iget v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mCurrentSelectedPosition:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 728
    :cond_0
    return-void
.end method

.method public saveProfile(Ljava/lang/String;)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1386
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "/shared_prefs/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1389
    .local v3, "spDir":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aProfilePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1390
    .local v2, "profileDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 1392
    const-string v4, "ViPER4Android"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Saving profile to "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1394
    const-string v1, "com.vipercn.viper4android_v2."

    .line 1397
    .local v1, "packageName":Ljava/lang/String;
    :try_start_0
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "com.vipercn.viper4android_v2."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "bluetooth.xml"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1398
    new-instance v5, Ljava/io/File;

    const-string v6, "com.vipercn.viper4android_v2.bluetooth.xml"

    invoke-direct {v5, v2, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1397
    invoke-static {v4, v5}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->copy(Ljava/io/File;Ljava/io/File;)V

    .line 1399
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "com.vipercn.viper4android_v2."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "headset.xml"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1400
    new-instance v5, Ljava/io/File;

    const-string v6, "com.vipercn.viper4android_v2.headset.xml"

    invoke-direct {v5, v2, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1399
    invoke-static {v4, v5}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->copy(Ljava/io/File;Ljava/io/File;)V

    .line 1401
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "com.vipercn.viper4android_v2."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "speaker.xml"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1402
    new-instance v5, Ljava/io/File;

    const-string v6, "com.vipercn.viper4android_v2.speaker.xml"

    invoke-direct {v5, v2, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1401
    invoke-static {v4, v5}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->copy(Ljava/io/File;Ljava/io/File;)V

    .line 1403
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "com.vipercn.viper4android_v2."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "usb.xml"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1404
    new-instance v5, Ljava/io/File;

    const-string v6, "com.vipercn.viper4android_v2.usb.xml"

    invoke-direct {v5, v2, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1403
    invoke-static {v4, v5}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->copy(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1408
    :goto_0
    return-void

    .line 1405
    :catch_0
    move-exception v0

    .line 1406
    .local v0, "e":Ljava/io/IOException;
    const-string v4, "ViPER4Android"

    const-string v5, "Cannot save preset"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public saveProfileDialog()V
    .locals 9

    .prologue
    .line 1274
    new-instance v4, Ljava/io/File;

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aProfilePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1275
    .local v4, "profileDir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 1277
    const-string v6, "ViPER4Android"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Saving preset to "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1280
    new-instance v6, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$13;

    invoke-direct {v6, p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$13;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    invoke-virtual {v4, v6}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v5

    .line 1288
    .local v5, "profiles":[Ljava/io/File;
    if-eqz v5, :cond_1

    array-length v6, v5

    add-int/lit8 v6, v6, 0x1

    :goto_0
    new-array v3, v6, [Ljava/lang/String;

    .line 1289
    .local v3, "names":[Ljava/lang/String;
    const/4 v6, 0x0

    const v7, 0x7f0900a4

    invoke-virtual {p0, v7}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v6

    .line 1290
    if-eqz v5, :cond_0

    .line 1291
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v6, v5

    if-lt v2, v6, :cond_2

    .line 1296
    .end local v2    # "i":I
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1297
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v6, 0x7f0900a5

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 1298
    new-instance v7, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;

    invoke-direct {v7, p0, v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;[Ljava/lang/String;)V

    invoke-virtual {v6, v3, v7}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1341
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 1342
    .local v1, "dlg":Landroid/app/Dialog;
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 1343
    return-void

    .line 1288
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v1    # "dlg":Landroid/app/Dialog;
    .end local v3    # "names":[Ljava/lang/String;
    :cond_1
    const/4 v6, 0x1

    goto :goto_0

    .line 1292
    .restart local v2    # "i":I
    .restart local v3    # "names":[Ljava/lang/String;
    :cond_2
    add-int/lit8 v6, v2, 0x1

    aget-object v7, v5, v2

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v6

    .line 1291
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public setUpNavigationDrawer(Landroid/view/View;Landroid/view/View;)V
    .locals 7
    .param p1, "fragmentContainerView"    # Landroid/view/View;
    .param p2, "drawerLayout"    # Landroid/view/View;

    .prologue
    .line 1509
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mFragmentContainerView:Landroid/view/View;

    .line 1510
    check-cast p2, Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    .end local p2    # "drawerLayout":Landroid/view/View;
    iput-object p2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    .line 1512
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    const/high16 v1, 0x7f020000

    const v2, 0x800003

    invoke-virtual {v0, v1, v2}, Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;->setDrawerShadow(II)V

    .line 1514
    new-instance v0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$19;

    .line 1516
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    .line 1517
    const v4, 0x7f020002

    .line 1518
    const v5, 0x7f0900c9

    .line 1519
    const v6, 0x7f0900ca

    move-object v1, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$19;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;III)V

    .line 1514
    iput-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    .line 1540
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mUserLearnedDrawer:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mFromSavedInstanceState:Z

    if-nez v0, :cond_0

    .line 1541
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mFragmentContainerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;->openDrawer(Landroid/view/View;)V

    .line 1544
    :cond_0
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    new-instance v1, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$20;

    invoke-direct {v1, p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$20;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    invoke-virtual {v0, v1}, Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;->post(Ljava/lang/Runnable;)Z

    .line 1551
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerLayout:Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;

    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    invoke-virtual {v0, v1}, Lcom/vipercn/viper4android_v2/widgets/CustomDrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    .line 1552
    iget v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mCurrentSelectedPosition:I

    invoke-direct {p0, v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->selectItem(I)V

    .line 1553
    return-void
.end method
