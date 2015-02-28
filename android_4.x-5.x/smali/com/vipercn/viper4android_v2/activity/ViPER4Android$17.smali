.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$17;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->loadProfile(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

.field private final synthetic val$profilename:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$17;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    iput-object p2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$17;->val$profilename:Ljava/lang/String;

    .line 1424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1426
    const-string v0, ""

    .line 1427
    .local v0, "applyPreference":Ljava/lang/String;
    packed-switch p2, :pswitch_data_0

    .line 1441
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1449
    :goto_1
    return-void

    .line 1429
    :pswitch_0
    const-string v0, "com.vipercn.viper4android_v2.headset"

    .line 1430
    goto :goto_0

    .line 1432
    :pswitch_1
    const-string v0, "com.vipercn.viper4android_v2.speaker"

    .line 1433
    goto :goto_0

    .line 1435
    :pswitch_2
    const-string v0, "com.vipercn.viper4android_v2.bluetooth"

    .line 1436
    goto :goto_0

    .line 1438
    :pswitch_3
    const-string v0, "com.vipercn.viper4android_v2.usb"

    goto :goto_0

    .line 1444
    :cond_0
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$17;->val$profilename:Ljava/lang/String;

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getV4aProfilePath()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$17;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-static {v1, v2, v0, v3}, Lcom/vipercn/viper4android_v2/activity/Utils;->loadProfileV1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Z

    .line 1447
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$17;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$17;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    const-class v4, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->startActivity(Landroid/content/Intent;)V

    .line 1448
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$17;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-virtual {v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->finish()V

    goto :goto_1

    .line 1427
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
