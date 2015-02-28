.class Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$2;
.super Ljava/lang/Object;
.source "ViPER4AndroidService.java"

# interfaces
.implements Landroid/media/audiofx/AudioEffect$OnEnableStatusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$2;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEnableStatusChange(Landroid/media/audiofx/AudioEffect;Z)V
    .locals 10
    .param p1, "effect"    # Landroid/media/audiofx/AudioEffect;
    .param p2, "enabled"    # Z

    .prologue
    const/4 v7, 0x0

    .line 106
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$2;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v4

    .line 107
    const-string v5, "com.vipercn.viper4android_v2.settings"

    .line 106
    invoke-virtual {v4, v5, v7}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-static {v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getAudioOutputRouting(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v1

    .line 108
    .local v1, "mode":Ljava/lang/String;
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$2;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v4

    .line 109
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "com.vipercn.viper4android_v2."

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 108
    invoke-virtual {v4, v5, v7}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 110
    .local v2, "preferences":Landroid/content/SharedPreferences;
    const-string v0, "viper4android.headphonefx.enable"

    .line 111
    .local v0, "mEnableKey":Ljava/lang/String;
    const-string v4, "speaker"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 112
    const-string v0, "viper4android.speakerfx.enable"

    .line 114
    :cond_0
    invoke-interface {v2, v0, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 115
    .local v3, "shouldEnabled":Z
    if-eq v3, p2, :cond_1

    .line 116
    const-string v4, "ViPER4Android"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Engine status is "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 117
    const-string v6, ", but we expected "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 116
    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    const-string v4, "ViPER4Android"

    const-string v5, "Im sure you are experiencing no effect,because the effect is controlled by the system now"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    const-string v4, "ViPER4Android"

    const-string v5, "I really have no idea how to solve this problem.Fucking android. I\'m sorry, bro"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$2;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v4

    .line 123
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$2;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v5

    iget-object v6, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$2;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const-string v7, "text_token_lost"

    const-string v8, "string"

    .line 124
    iget-object v9, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$2;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget-object v9, v9, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 123
    invoke-virtual {v6, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 124
    const/4 v6, 0x1

    .line 122
    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 124
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 128
    :goto_0
    return-void

    .line 126
    :cond_1
    const-string v4, "ViPER4Android"

    const-string v5, "Everything is under control for now"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
