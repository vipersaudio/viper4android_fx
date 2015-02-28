.class Lcom/vipercn/viper4android_v2/activity/Utils$3;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/activity/Utils;->proceedBuildProp(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$mBuildProp:Ljava/util/ArrayList;

.field private final synthetic val$mBuildPropUtil:Lcom/vipercn/viper4android_v2/activity/BuildProp;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;Lcom/vipercn/viper4android_v2/activity/BuildProp;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/Utils$3;->val$mBuildProp:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/vipercn/viper4android_v2/activity/Utils$3;->val$mBuildPropUtil:Lcom/vipercn/viper4android_v2/activity/BuildProp;

    .line 315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 318
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/Utils$3;->val$mBuildProp:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 321
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/Utils$3;->val$mBuildPropUtil:Lcom/vipercn/viper4android_v2/activity/BuildProp;

    invoke-static {}, Lcom/vipercn/viper4android_v2/activity/StaticEnvironment;->getExternalStoragePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/activity/BuildProp;->commitBuildprop(Ljava/lang/String;)V

    .line 322
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/activity/Utils$3;->val$mBuildPropUtil:Lcom/vipercn/viper4android_v2/activity/BuildProp;

    invoke-virtual {v1}, Lcom/vipercn/viper4android_v2/activity/BuildProp;->initializeBuildprop()V

    .line 323
    return-void

    .line 318
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 319
    .local v0, "buildProp":Ljava/lang/String;
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/Utils$3;->val$mBuildPropUtil:Lcom/vipercn/viper4android_v2/activity/BuildProp;

    const-string v3, "false"

    invoke-virtual {v2, v0, v3}, Lcom/vipercn/viper4android_v2/activity/BuildProp;->setProp(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
