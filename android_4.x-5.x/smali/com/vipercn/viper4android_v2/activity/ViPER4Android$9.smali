.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$9;
.super Ljava/lang/Object;
.source "ViPER4Android.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$9;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 1065
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

    .line 1067
    if-ltz p2, :cond_0

    const/4 v3, 0x2

    if-le p2, v3, :cond_1

    :cond_0
    const/4 p2, 0x0

    .line 1068
    :cond_1
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$9;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 1069
    const-string v4, "com.vipercn.viper4android_v2.settings"

    .line 1068
    invoke-virtual {v3, v4, v5}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 1071
    .local v2, "prefSettings":Landroid/content/SharedPreferences;
    const-string v3, "viper4android.settings.uiprefer"

    .line 1070
    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 1072
    .local v1, "nOldSelIdx":I
    if-ne v1, p2, :cond_2

    .line 1073
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1082
    :goto_0
    return-void

    .line 1076
    :cond_2
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1077
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v3, "viper4android.settings.uiprefer"

    invoke-interface {v0, v3, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1078
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1079
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$9;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    new-instance v4, Landroid/content/Intent;

    const-string v5, "com.vipercn.viper4android_v2.UPDATE"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->sendBroadcast(Landroid/content/Intent;)V

    .line 1080
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1081
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$9;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-static {v3}, Lcom/vipercn/viper4android_v2/activity/Utils;->restartActivity(Landroid/app/Activity;)V

    goto :goto_0
.end method
