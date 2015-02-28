.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1;

.field private final synthetic val$ctxInstance:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->this$1:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1;

    iput-object p2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    .line 382
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v7, 0x0

    const v6, 0x7f0900a8

    .line 386
    # invokes: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->cpuHasQualitySelection()Z
    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$0()Z

    move-result v0

    .line 387
    .local v0, "canChooseQuality":Z
    if-eqz v0, :cond_0

    .line 388
    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 389
    const v5, 0x7f0900aa

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 390
    const v5, 0x7f020003

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 391
    const/high16 v5, 0x7f050000

    new-instance v6, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;

    iget-object v7, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v6, p0, v7}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;Landroid/content/Context;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 522
    const v5, 0x7f0900a9

    .line 523
    new-instance v6, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$2;

    invoke-direct {v6, p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$2;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;)V

    .line 522
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 526
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    .line 582
    :goto_0
    return-void

    .line 528
    :cond_0
    const-string v4, ""

    # invokes: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->determineCPUWithDriver(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 530
    .local v2, "mDriverFileName":Ljava/lang/String;
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-static {v4}, Lcom/vipercn/viper4android_v2/activity/Utils;->isBusyBoxInstalled(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 531
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 532
    .local v3, "mResult":Landroid/app/AlertDialog$Builder;
    const-string v4, "ViPER4Android"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 533
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 534
    const v5, 0x7f0900b8

    .line 533
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 535
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 537
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 539
    .end local v3    # "mResult":Landroid/app/AlertDialog$Builder;
    :cond_1
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-static {v4, v2}, Lcom/vipercn/viper4android_v2/activity/Utils;->installDrv_FX(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    .line 540
    .local v1, "drvInstResult":I
    if-nez v1, :cond_2

    .line 541
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-static {v4}, Lcom/vipercn/viper4android_v2/activity/Utils;->proceedBuildProp(Landroid/content/Context;)V

    .line 542
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 543
    .restart local v3    # "mResult":Landroid/app/AlertDialog$Builder;
    const-string v4, "ViPER4Android"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 544
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 545
    const v5, 0x7f0900b4

    .line 544
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 546
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 547
    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 546
    invoke-virtual {v3, v4, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 548
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 550
    .end local v3    # "mResult":Landroid/app/AlertDialog$Builder;
    :cond_2
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 551
    .restart local v3    # "mResult":Landroid/app/AlertDialog$Builder;
    const-string v4, "ViPER4Android"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 552
    packed-switch v1, :pswitch_data_0

    .line 572
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 573
    const v5, 0x7f0900bc

    .line 572
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 576
    :goto_1
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 578
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 554
    :pswitch_0
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 555
    const v5, 0x7f0900b7

    .line 554
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 558
    :pswitch_1
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 559
    const v5, 0x7f0900b9

    .line 558
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 562
    :pswitch_2
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 563
    const v5, 0x7f0900ba

    .line 562
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 566
    :pswitch_3
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 567
    const v5, 0x7f0900bb

    .line 566
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 552
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
