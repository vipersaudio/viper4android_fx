.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;
.super Landroid/app/DialogFragment;
.source "ViPER4Android.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 922
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 14
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "state"    # Landroid/os/Bundle;

    .prologue
    .line 926
    iget-object v11, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v11}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$12(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v11

    if-nez v11, :cond_0

    .line 927
    const v11, 0x7f030003

    const/4 v12, 0x0

    invoke-virtual {p1, v11, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v10

    .line 928
    .local v10, "v":Landroid/view/View;
    const v11, 0x7f0c0007

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 929
    .local v9, "tv":Landroid/widget/TextView;
    const v11, 0x7f0900c1

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(I)V

    .line 972
    :goto_0
    return-object v10

    .line 932
    .end local v9    # "tv":Landroid/widget/TextView;
    .end local v10    # "v":Landroid/view/View;
    :cond_0
    iget-object v11, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v11}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$12(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->startStatusUpdating()V

    .line 933
    const-wide/16 v12, 0x1f4

    invoke-static {v12, v13}, Landroid/os/SystemClock;->sleep(J)V

    .line 934
    iget-object v11, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v11}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$12(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->stopStatusUpdating()V

    .line 936
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f09009d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 937
    .local v4, "mDrvNEONEnabled":Ljava/lang/String;
    iget-object v11, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v11}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$12(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getDriverNEON()Z

    move-result v11

    if-nez v11, :cond_1

    .line 938
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f09009e

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 940
    :cond_1
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f09009d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 941
    .local v3, "mDrvEnabled":Ljava/lang/String;
    iget-object v11, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v11}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$12(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getDriverEnabled()Z

    move-result v11

    if-nez v11, :cond_2

    .line 942
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f09009e

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 944
    :cond_2
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f09009f

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 945
    .local v8, "mDrvUsable":Ljava/lang/String;
    iget-object v11, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v11}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$12(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getDriverCanWork()Z

    move-result v11

    if-nez v11, :cond_3

    .line 946
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0900a0

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 948
    :cond_3
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0900a1

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 949
    .local v7, "mDrvSupportFmt":Ljava/lang/String;
    iget-object v11, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v11}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$12(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getDriverSupportFormat()Z

    move-result v11

    if-nez v11, :cond_4

    .line 950
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0900a2

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 952
    :cond_4
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f09009d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 953
    .local v5, "mDrvProcess":Ljava/lang/String;
    iget-object v11, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v11}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$12(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getDriverProcess()Z

    move-result v11

    if-nez v11, :cond_5

    .line 954
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f09009e

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 957
    :cond_5
    new-instance v0, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;

    new-instance v11, Lcom/vipercn/viper4android_v2/activity/Utils;

    invoke-direct {v11}, Lcom/vipercn/viper4android_v2/activity/Utils;-><init>()V

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, v11}, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;-><init>(Lcom/vipercn/viper4android_v2/activity/Utils;)V

    .line 958
    .local v0, "aeuUtils":Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;
    invoke-virtual {v0}, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->getViper4AndroidEngineVersion()[I

    move-result-object v1

    .line 959
    .local v1, "iaDrvVer":[I
    new-instance v11, Ljava/lang/StringBuilder;

    const/4 v12, 0x0

    aget v12, v1, v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/4 v12, 0x1

    aget v12, v1, v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 960
    const/4 v12, 0x2

    aget v12, v1, v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/4 v12, 0x3

    aget v12, v1, v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 959
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 963
    .local v2, "mDriverVersion":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0900c0

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 964
    .local v6, "mDrvStatus":Ljava/lang/String;
    const/4 v11, 0x7

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    .line 965
    aput-object v2, v11, v12

    const/4 v12, 0x1

    aput-object v4, v11, v12

    const/4 v12, 0x2

    .line 966
    aput-object v3, v11, v12

    const/4 v12, 0x3

    aput-object v8, v11, v12

    const/4 v12, 0x4

    aput-object v7, v11, v12

    const/4 v12, 0x5

    aput-object v5, v11, v12

    const/4 v12, 0x6

    .line 967
    iget-object v13, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$7;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->mAudioServiceInstance:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    invoke-static {v13}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$12(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v13

    invoke-virtual {v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getDriverSamplingRate()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    .line 964
    invoke-static {v6, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 969
    const v11, 0x7f030003

    const/4 v12, 0x0

    invoke-virtual {p1, v11, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v10

    .line 970
    .restart local v10    # "v":Landroid/view/View;
    const v11, 0x7f0c0007

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 971
    .restart local v9    # "tv":Landroid/widget/TextView;
    invoke-virtual {v9, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method
