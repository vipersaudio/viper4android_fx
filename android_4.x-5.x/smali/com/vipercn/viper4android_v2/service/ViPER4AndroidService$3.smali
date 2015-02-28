.class Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$3;
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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$3;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    .line 860
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/16 v9, 0xa

    const/4 v8, 0x0

    .line 863
    const-string v5, "ViPER4Android"

    const-string v6, "m3rdAPI_QUERY_EQUALIZER_Receiver::onReceive()"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 864
    new-instance v0, Landroid/content/Intent;

    const-string v5, "com.vipercn.viper4android_v2.QUERY_EQUALIZER_RESULT"

    invoke-direct {v0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 866
    .local v0, "itResult":Landroid/content/Intent;
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$3;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    .line 867
    const-string v6, "com.vipercn.viper4android_v2.settings"

    .line 866
    invoke-virtual {v5, v6, v8}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-static {v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getAudioOutputRouting(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v3

    .line 868
    .local v3, "mode":Ljava/lang/String;
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$3;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    .line 869
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "com.vipercn.viper4android_v2."

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 868
    invoke-virtual {v5, v6, v8}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 871
    .local v4, "preferences":Landroid/content/SharedPreferences;
    const-string v5, "viper4android.headphonefx.fireq.enable"

    .line 870
    invoke-interface {v4, v5, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 872
    .local v2, "mEqEnabled":Z
    const-string v5, "equalizer_enabled"

    invoke-virtual {v0, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 873
    const-string v5, "equalizer_bandcount"

    invoke-virtual {v0, v5, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 874
    new-array v1, v9, [F

    fill-array-data v1, :array_0

    .line 877
    .local v1, "mEqBands":[F
    const-string v5, "equalizer_bandfreq"

    invoke-virtual {v0, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[F)Landroid/content/Intent;

    .line 878
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$3;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-virtual {v5, v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->sendBroadcast(Landroid/content/Intent;)V

    .line 879
    return-void

    .line 874
    :array_0
    .array-data 4
        0x41f80000
        0x42780000
        0x42fa0000
        0x437a0000
        0x43fa0000
        0x447a0000
        0x44fa0000
        0x457a0000
        0x45fa0000
        0x467a0000
    .end array-data
.end method
