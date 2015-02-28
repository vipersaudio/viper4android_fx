.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$2;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->onCreate(Landroid/os/Bundle;)V
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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$2;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 684
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 687
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$2;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # invokes: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->checkSoftwareActive()Z
    invoke-static {v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$4(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 688
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$2;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # invokes: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->submitInformation()Z
    invoke-static {v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$5(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 689
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$2;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # invokes: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->setSoftwareActive()V
    invoke-static {v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$6(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)V

    .line 692
    :cond_0
    return-void
.end method
