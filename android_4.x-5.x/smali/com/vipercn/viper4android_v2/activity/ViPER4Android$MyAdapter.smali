.class public Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;
.super Landroid/support/v13/app/FragmentPagerAdapter;
.source "ViPER4Android.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyAdapter"
.end annotation


# instance fields
.field private final entries:[Ljava/lang/String;

.field final synthetic this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

.field private final titles:Ljava/util/List;
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


# direct methods
.method public constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;Landroid/app/FragmentManager;)V
    .locals 1
    .param p2, "fm"    # Landroid/app/FragmentManager;

    .prologue
    .line 1649
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 1650
    invoke-direct {p0, p2}, Landroid/support/v13/app/FragmentPagerAdapter;-><init>(Landroid/app/FragmentManager;)V

    .line 1652
    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mEntries:[Ljava/lang/String;
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$2()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;->entries:[Ljava/lang/String;

    .line 1653
    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mTitles:Ljava/util/List;
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$3()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;->titles:Ljava/util/List;

    .line 1654
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 1667
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;->entries:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public getEntries()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 1662
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;->entries:[Ljava/lang/String;

    return-object v0
.end method

.method public getItem(I)Landroid/app/Fragment;
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 1672
    new-instance v1, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;

    invoke-direct {v1}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;-><init>()V

    .line 1673
    .local v1, "dspFragment":Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1674
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "config"

    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;->entries:[Ljava/lang/String;

    aget-object v3, v3, p1

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1675
    invoke-virtual {v1, v0}, Lcom/vipercn/viper4android_v2/activity/MainDSPScreen;->setArguments(Landroid/os/Bundle;)V

    .line 1676
    return-object v1
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 1658
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$MyAdapter;->titles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "TITLE"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method
