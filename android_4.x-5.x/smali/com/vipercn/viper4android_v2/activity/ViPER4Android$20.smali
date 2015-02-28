.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$20;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Ljava/lang/Runnable;


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
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$20;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 1544
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1547
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$20;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;
    invoke-static {v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$16(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Landroid/support/v4/app/ActionBarDrawerToggle;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/ActionBarDrawerToggle;->syncState()V

    .line 1548
    return-void
.end method
