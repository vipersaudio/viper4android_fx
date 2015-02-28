.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 736
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 7
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "binder"    # Landroid/os/IBinder;

    .prologue
    .line 739
    const-string v4, "ViPER4Android"

    const-string v5, "ViPER4Android service connected"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 741
    check-cast p2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;

    .end local p2    # "binder":Landroid/os/IBinder;
    invoke-virtual {p2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;->getService()Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v3

    .line 742
    .local v3, "service":Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-static {v4, v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$8(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    .line 743
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 744
    const-string v5, "com.vipercn.viper4android_v2.settings"

    const/4 v6, 0x0

    .line 743
    invoke-virtual {v4, v5, v6}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-static {v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getAudioOutputRouting(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v2

    .line 745
    .local v2, "routing":Ljava/lang/String;
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z
    invoke-static {v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$9(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    iget-object v4, v4, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->viewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v4, :cond_3

    .line 746
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # invokes: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getEntries()[Ljava/lang/String;
    invoke-static {v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$10(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)[Ljava/lang/String;

    move-result-object v0

    .line 747
    .local v0, "entries":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v0

    if-lt v1, v4, :cond_1

    .line 763
    .end local v0    # "entries":[Ljava/lang/String;
    .end local v1    # "i":I
    :cond_0
    :goto_1
    const-string v4, "ViPER4Android"

    const-string v5, "Unbinding service ..."

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 764
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-virtual {v4, p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->unbindService(Landroid/content/ServiceConnection;)V

    .line 765
    return-void

    .line 748
    .restart local v0    # "entries":[Ljava/lang/String;
    .restart local v1    # "i":I
    :cond_1
    aget-object v4, v0, v1

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 749
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    iget-object v4, v4, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v4, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    goto :goto_1

    .line 747
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 753
    .end local v0    # "entries":[Ljava/lang/String;
    .end local v1    # "i":I
    :cond_3
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mIsTabbed:Z
    invoke-static {v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$9(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 754
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # invokes: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getEntries()[Ljava/lang/String;
    invoke-static {v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$10(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)[Ljava/lang/String;

    move-result-object v0

    .line 755
    .restart local v0    # "entries":[Ljava/lang/String;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2
    array-length v4, v0

    if-ge v1, v4, :cond_0

    .line 756
    aget-object v4, v0, v1

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 757
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$4;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # invokes: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->selectItem(I)V
    invoke-static {v4, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$11(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;I)V

    goto :goto_1

    .line 755
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 769
    const-string v0, "ViPER4Android"

    const-string v1, "ViPER4Android service disconnected"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 770
    return-void
.end method
