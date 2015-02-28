.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$11;
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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$11;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 1174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1176
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$11;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 1177
    const-string v3, "com.vipercn.viper4android_v2.settings"

    .line 1178
    const/4 v4, 0x0

    .line 1176
    invoke-virtual {v2, v3, v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1179
    .local v1, "prefSettings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1180
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    packed-switch p2, :pswitch_data_0

    .line 1202
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1204
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$11;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.vipercn.viper4android_v2.UPDATE"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->sendBroadcast(Landroid/content/Intent;)V

    .line 1205
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1206
    return-void

    .line 1182
    :pswitch_0
    const-string v2, "viper4android.settings.lock_effect"

    .line 1183
    const-string v3, "none"

    .line 1182
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 1186
    :pswitch_1
    const-string v2, "viper4android.settings.lock_effect"

    .line 1187
    const-string v3, "headset"

    .line 1186
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 1190
    :pswitch_2
    const-string v2, "viper4android.settings.lock_effect"

    .line 1191
    const-string v3, "speaker"

    .line 1190
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 1194
    :pswitch_3
    const-string v2, "viper4android.settings.lock_effect"

    .line 1195
    const-string v3, "bluetooth"

    .line 1194
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 1198
    :pswitch_4
    const-string v2, "viper4android.settings.lock_effect"

    .line 1199
    const-string v3, "usb"

    .line 1198
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 1180
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
