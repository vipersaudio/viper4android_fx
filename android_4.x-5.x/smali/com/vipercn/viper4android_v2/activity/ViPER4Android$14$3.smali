.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$3;
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

.field private final synthetic val$profileName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$3;->this$1:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;

    iput-object p2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$3;->val$profileName:Ljava/lang/String;

    .line 1332
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1334
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$3;->this$1:Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;

    # getter for: Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;
    invoke-static {v0}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;->access$0(Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14;)Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    move-result-object v0

    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$14$3;->val$profileName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->saveProfile(Ljava/lang/String;)V

    .line 1335
    return-void
.end method
