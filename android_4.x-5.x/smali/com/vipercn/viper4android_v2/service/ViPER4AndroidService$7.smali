.class Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;
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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    .line 945
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/16 v7, 0xa

    const/4 v6, 0x0

    .line 948
    const-string v3, "ViPER4Android"

    const-string v4, "m3rdAPI_SET_EQUALIZER_Receiver::onReceive()"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 950
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mWorkingWith3rd:Z
    invoke-static {v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$4(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 982
    :goto_0
    return-void

    .line 951
    :cond_0
    const-string v3, "token"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 952
    const-string v3, "ViPER4Android"

    const-string v4, "m3rdAPI_SET_EQUALIZER_Receiver, no token found"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 954
    :cond_1
    const-string v3, "token"

    invoke-virtual {p2, v3, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 955
    .local v2, "nToken":I
    if-nez v2, :cond_2

    .line 956
    const-string v3, "ViPER4Android"

    const-string v4, "m3rdAPI_SET_EQUALIZER_Receiver, invalid token found"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 959
    :cond_2
    const-string v3, "ViPER4Android"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "m3rdAPI_SET_EQUALIZER_Receiver, token = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 960
    const-string v3, "enabled"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 961
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    const-string v4, "enabled"

    iget-object v5, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerEnabled:Z
    invoke-static {v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$7(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z

    move-result v5

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    invoke-static {v3, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$8(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;Z)V

    .line 962
    const-string v3, "ViPER4Android"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "m3rdAPI_SET_EQUALIZER_Receiver, enable equalizer = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 963
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerEnabled:Z
    invoke-static {v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$7(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 962
    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 965
    :cond_3
    const-string v3, "bandcount"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    const-string v3, "bandvalues"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 966
    const-string v3, "bandcount"

    invoke-virtual {p2, v3, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 967
    .local v0, "nBandCount":I
    const-string v3, "bandvalues"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getFloatArrayExtra(Ljava/lang/String;)[F

    move-result-object v1

    .line 968
    .local v1, "nBandValues":[F
    if-ne v0, v7, :cond_4

    if-nez v1, :cond_5

    .line 969
    :cond_4
    const-string v3, "ViPER4Android"

    const-string v4, "m3rdAPI_SET_EQUALIZER_Receiver,invalid band parameters"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 973
    :cond_5
    const-string v3, "ViPER4Android"

    .line 974
    const-string v4, "m3rdAPI_SET_EQUALIZER_Receiver, got new eq band values"

    .line 973
    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 975
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerLevels:[F
    invoke-static {v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$9(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)[F

    move-result-object v3

    if-nez v3, :cond_6

    .line 976
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    new-array v4, v7, [F

    invoke-static {v3, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$10(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;[F)V

    .line 977
    :cond_6
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerLevels:[F
    invoke-static {v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$9(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)[F

    move-result-object v3

    invoke-static {v1, v6, v3, v6, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 980
    .end local v0    # "nBandCount":I
    .end local v1    # "nBandValues":[F
    :cond_7
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-virtual {v3, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem(Z)V

    goto/16 :goto_0
.end method
