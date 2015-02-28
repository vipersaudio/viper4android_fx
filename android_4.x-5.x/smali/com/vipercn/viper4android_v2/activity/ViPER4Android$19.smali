.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$19;
.super Landroid/support/v4/app/ActionBarDrawerToggle;
.source "ViPER4Android.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->setUpNavigationDrawer(Landroid/view/View;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;III)V
    .locals 6
    .param p2, "$anonymous0"    # Landroid/app/Activity;
    .param p3, "$anonymous1"    # Landroid/support/v4/widget/DrawerLayout;
    .param p4, "$anonymous2"    # I
    .param p5, "$anonymous3"    # I
    .param p6, "$anonymous4"    # I

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$19;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    .line 1514
    invoke-direct/range {v0 .. v5}, Landroid/support/v4/app/ActionBarDrawerToggle;-><init>(Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;III)V

    return-void
.end method


# virtual methods
.method public onDrawerClosed(Landroid/view/View;)V
    .locals 1
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 1523
    invoke-super {p0, p1}, Landroid/support/v4/app/ActionBarDrawerToggle;->onDrawerClosed(Landroid/view/View;)V

    .line 1525
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$19;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-virtual {v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->invalidateOptionsMenu()V

    .line 1526
    return-void
.end method

.method public onDrawerOpened(Landroid/view/View;)V
    .locals 3
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    .line 1530
    invoke-super {p0, p1}, Landroid/support/v4/app/ActionBarDrawerToggle;->onDrawerOpened(Landroid/view/View;)V

    .line 1532
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$19;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mUserLearnedDrawer:Z
    invoke-static {v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$13(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1533
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$19;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-static {v0, v2}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$14(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;Z)V

    .line 1534
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$19;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mPreferences:Landroid/content/SharedPreferences;
    invoke-static {v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$15(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "navigation_drawer_learned"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1536
    :cond_0
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$19;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-virtual {v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->invalidateOptionsMenu()V

    .line 1537
    return-void
.end method
