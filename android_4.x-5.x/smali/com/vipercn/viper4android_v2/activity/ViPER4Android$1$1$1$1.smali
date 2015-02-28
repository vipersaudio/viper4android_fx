.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;

.field private final synthetic val$ctxInstance:Landroid/content/Context;

.field private final synthetic val$result:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->this$3:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1;

    iput-object p2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    iput-object p3, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$result:Ljava/lang/String;

    .line 401
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v5, 0x0

    const v4, 0x7f0900a8

    .line 404
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-static {v2}, Lcom/vipercn/viper4android_v2/activity/Utils;->isBusyBoxInstalled(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 405
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 406
    .local v1, "mResult":Landroid/app/AlertDialog$Builder;
    const-string v2, "ViPER4Android"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 407
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 408
    const v3, 0x7f0900b8

    .line 407
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 409
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 411
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 456
    :goto_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 457
    return-void

    .line 413
    .end local v1    # "mResult":Landroid/app/AlertDialog$Builder;
    :cond_0
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$result:Ljava/lang/String;

    # invokes: Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->determineCPUWithDriver(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->access$1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vipercn/viper4android_v2/activity/Utils;->installDrv_FX(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 414
    .local v0, "drvInstResult":I
    if-nez v0, :cond_1

    .line 415
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-static {v2}, Lcom/vipercn/viper4android_v2/activity/Utils;->proceedBuildProp(Landroid/content/Context;)V

    .line 416
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 417
    .restart local v1    # "mResult":Landroid/app/AlertDialog$Builder;
    const-string v2, "ViPER4Android"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 418
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 419
    const v3, 0x7f0900b4

    .line 418
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 420
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 421
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 420
    invoke-virtual {v1, v2, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 422
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 424
    .end local v1    # "mResult":Landroid/app/AlertDialog$Builder;
    :cond_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 425
    .restart local v1    # "mResult":Landroid/app/AlertDialog$Builder;
    const-string v2, "ViPER4Android"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 426
    packed-switch v0, :pswitch_data_0

    .line 446
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 447
    const v3, 0x7f0900bc

    .line 446
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 450
    :goto_1
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 452
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 428
    :pswitch_0
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 429
    const v3, 0x7f0900b7

    .line 428
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 432
    :pswitch_1
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 433
    const v3, 0x7f0900b9

    .line 432
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 436
    :pswitch_2
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 437
    const v3, 0x7f0900ba

    .line 436
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 440
    :pswitch_3
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$1$1$1$1;->val$ctxInstance:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 441
    const v3, 0x7f0900bb

    .line 440
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 426
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
