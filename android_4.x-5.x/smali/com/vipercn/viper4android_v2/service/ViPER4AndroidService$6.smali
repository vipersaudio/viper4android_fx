.class Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$6;
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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$6;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    .line 921
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x0

    .line 924
    const-string v1, "ViPER4Android"

    const-string v2, "m3rdAPI_SET_ENABLED_Receiver::onReceive()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$6;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mWorkingWith3rd:Z
    invoke-static {v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$4(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 943
    :cond_0
    :goto_0
    return-void

    .line 928
    :cond_1
    const-string v1, "token"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 929
    const-string v1, "ViPER4Android"

    const-string v2, "m3rdAPI_SET_ENABLED_Receiver, no token found"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 931
    :cond_2
    const-string v1, "token"

    invoke-virtual {p2, v1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 932
    .local v0, "nToken":I
    if-nez v0, :cond_3

    .line 933
    const-string v1, "ViPER4Android"

    const-string v2, "m3rdAPI_SET_ENABLED_Receiver, invalid token found"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 935
    :cond_3
    const-string v1, "enabled"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 937
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$6;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    const-string v2, "enabled"

    invoke-virtual {p2, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$5(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;Z)V

    .line 938
    const-string v1, "ViPER4Android"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "m3rdAPI_SET_ENABLED_Receiver, token = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 939
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", enabled = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$6;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEnabled:Z
    invoke-static {v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$6(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 938
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 940
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$6;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-virtual {v1, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem(Z)V

    goto :goto_0
.end method
