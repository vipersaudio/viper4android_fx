.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->saveProfileDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

.field private final synthetic val$names:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android;[Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    iput-object p2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->val$names:[Ljava/lang/String;

    .line 1298
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;)Lcom/vipercn/viper4android_v2/activity/ViPER4Android;
    .locals 1

    .prologue
    .line 1298
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const v7, 0x7f0900a9

    const v6, 0x7f0900a8

    .line 1300
    if-nez p2, :cond_0

    .line 1303
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-direct {v1, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1305
    .local v1, "inputBuilder":Landroid/app/AlertDialog$Builder;
    const v4, 0x7f0900a4

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1308
    new-instance v0, Landroid/widget/EditText;

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-direct {v0, v4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1309
    .local v0, "input":Landroid/widget/EditText;
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 1312
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-virtual {v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$1;

    invoke-direct {v5, p0, v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$1;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;Landroid/widget/EditText;)V

    .line 1311
    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1319
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-virtual {v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$2;

    invoke-direct {v5, p0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$2;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;)V

    .line 1318
    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1325
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1339
    .end local v0    # "input":Landroid/widget/EditText;
    .end local v1    # "inputBuilder":Landroid/app/AlertDialog$Builder;
    :goto_0
    return-void

    .line 1328
    :cond_0
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->val$names:[Ljava/lang/String;

    aget-object v3, v4, p2

    .line 1329
    .local v3, "profileName":Ljava/lang/String;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-direct {v2, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1330
    .local v2, "mOverwriteProfile":Landroid/app/AlertDialog$Builder;
    const-string v4, "ViPER4Android"

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1331
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-virtual {v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0900a6

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1332
    iget-object v4, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-virtual {v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$3;

    invoke-direct {v5, p0, v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$3;-><init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;Ljava/lang/String;)V

    invoke-virtual {v2, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 1336
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-virtual {v5}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1337
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method
