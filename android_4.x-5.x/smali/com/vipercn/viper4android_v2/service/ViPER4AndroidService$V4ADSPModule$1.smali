.class Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$1;
.super Ljava/lang/Object;
.source "ViPER4AndroidService.java"

# interfaces
.implements Landroid/media/audiofx/AudioEffect$OnControlStatusChangeListener;


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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$1;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onControlStatusChange(Landroid/media/audiofx/AudioEffect;Z)V
    .locals 7
    .param p1, "effect"    # Landroid/media/audiofx/AudioEffect;
    .param p2, "controlGranted"    # Z

    .prologue
    const/4 v6, 0x1

    .line 91
    if-nez p2, :cond_0

    .line 92
    const-string v0, "ViPER4Android"

    const-string v1, "We lost effect control token"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$1;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v0

    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$1;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v1

    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$1;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 94
    const-string v3, "text_token_lost"

    const-string v4, "string"

    iget-object v5, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$1;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    .line 95
    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 94
    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 93
    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 95
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 100
    :goto_0
    return-void

    .line 97
    :cond_0
    const-string v0, "ViPER4Android"

    const-string v1, "We got effect control token"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule$1;->this$1:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem(Z)V

    goto :goto_0
.end method
