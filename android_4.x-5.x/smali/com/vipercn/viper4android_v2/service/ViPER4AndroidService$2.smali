.class Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$2;
.super Landroid/content/BroadcastReceiver;
.source "ViPER4AndroidService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$2;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    .line 850
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 853
    const-string v1, "ViPER4Android"

    const-string v2, "m3rdAPI_QUERY_DRIVERSTATUS_Receiver::onReceive()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 854
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.vipercn.viper4android_v2.QUERY_DRIVERSTATUS_RESULT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 855
    .local v0, "itResult":Landroid/content/Intent;
    const-string v1, "driver_ready"

    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$2;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z
    invoke-static {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$2(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 856
    const-string v1, "enabled"

    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$2;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getDriverEnabled()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 857
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$2;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-virtual {v1, v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->sendBroadcast(Landroid/content/Intent;)V

    .line 858
    return-void
.end method
