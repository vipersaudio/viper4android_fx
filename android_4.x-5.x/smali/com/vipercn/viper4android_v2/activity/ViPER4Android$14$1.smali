.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$1;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;

.field private final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$1;->this$1:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;

    iput-object p2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$1;->val$input:Landroid/widget/EditText;

    .line 1312
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 1314
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$1;->val$input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1315
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$1;->this$1:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;
    invoke-static {v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->access$0(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;)Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->saveProfile(Ljava/lang/String;)V

    .line 1316
    return-void
.end method
