.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$16;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->loadProfileDialog()V
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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$16;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    iput-object p2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$16;->val$names:[Ljava/lang/String;

    .line 1377
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1379
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$16;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$16;->val$names:[Ljava/lang/String;

    aget-object v1, v1, p2

    invoke-virtual {v0, v1}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->loadProfile(Ljava/lang/String;)V

    .line 1380
    return-void
.end method
