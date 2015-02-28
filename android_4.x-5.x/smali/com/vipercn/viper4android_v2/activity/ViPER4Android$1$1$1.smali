.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;

.field private final synthetic val$ctxInstance:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->this$2:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1;

    iput-object p2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    .line 391
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 9
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v8, 0x0

    const v7, 0x7f0900a8

    .line 393
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 394
    const v6, 0x7f050001

    .line 393
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 395
    .local v1, "mQual":[Ljava/lang/String;
    aget-object v4, v1, p2

    .line 396
    .local v4, "result":Ljava/lang/String;
    const-string v5, "sq"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 397
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v3, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 398
    .local v3, "mSQWarn":Landroid/app/AlertDialog$Builder;
    const-string v5, "ViPER4Android"

    invoke-virtual {v3, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 399
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0900ab

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 400
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 401
    new-instance v6, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;

    iget-object v7, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v6, p0, v7, v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;Landroid/content/Context;Ljava/lang/String;)V

    .line 400
    invoke-virtual {v3, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 459
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0900a9

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 460
    new-instance v6, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$2;

    invoke-direct {v6, p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$2;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;)V

    .line 459
    invoke-virtual {v3, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 466
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 520
    .end local v3    # "mSQWarn":Landroid/app/AlertDialog$Builder;
    :goto_0
    return-void

    .line 468
    :cond_0
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-static {v5}, Lcom/vipercn/viper4android_v2/activity/Utils;->isBusyBoxInstalled(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 469
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v2, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 470
    .local v2, "mResult":Landroid/app/AlertDialog$Builder;
    const-string v5, "ViPER4Android"

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 471
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 472
    const v6, 0x7f0900b8

    .line 471
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 473
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 475
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 477
    .end local v2    # "mResult":Landroid/app/AlertDialog$Builder;
    :cond_1
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    # invokes: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->determineCPUWithDriver(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vipercn/viper4android_v2/activity/Utils;->installDrv_FX(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 478
    .local v0, "drvInstResult":I
    if-nez v0, :cond_2

    .line 479
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-static {v5}, Lcom/vipercn/viper4android_v2/activity/Utils;->proceedBuildProp(Landroid/content/Context;)V

    .line 480
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v2, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 481
    .restart local v2    # "mResult":Landroid/app/AlertDialog$Builder;
    const-string v5, "ViPER4Android"

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 482
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 483
    const v6, 0x7f0900b4

    .line 482
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 484
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 485
    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 484
    invoke-virtual {v2, v5, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 486
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 488
    .end local v2    # "mResult":Landroid/app/AlertDialog$Builder;
    :cond_2
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v2, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 489
    .restart local v2    # "mResult":Landroid/app/AlertDialog$Builder;
    const-string v5, "ViPER4Android"

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 490
    packed-switch v0, :pswitch_data_0

    .line 510
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 511
    const v6, 0x7f0900bc

    .line 510
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 514
    :goto_1
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 516
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 492
    :pswitch_0
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 493
    const v6, 0x7f0900b7

    .line 492
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 496
    :pswitch_1
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 497
    const v6, 0x7f0900b9

    .line 496
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 500
    :pswitch_2
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 501
    const v6, 0x7f0900ba

    .line 500
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 504
    :pswitch_3
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 505
    const v6, 0x7f0900bb

    .line 504
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 490
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
