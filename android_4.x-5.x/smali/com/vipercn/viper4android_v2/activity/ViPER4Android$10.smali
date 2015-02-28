.class Lcom/vipercn/viper4android_v2/activity/ViPER4Android$10;
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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$10;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 1097
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1099
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/activity/ViPER4Android$10;->this$0:Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    .line 1100
    const-string v3, "com.vipercn.viper4android_v2.settings"

    .line 1101
    const/4 v4, 0x0

    .line 1099
    invoke-virtual {v2, v3, v4}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1102
    .local v1, "prefSettings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1103
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    packed-switch p2, :pswitch_data_0

    .line 1115
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1116
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1117
    return-void

    .line 1106
    :pswitch_0
    const-string v2, "viper4android.settings.compatiblemode"

    .line 1107
    const-string v3, "global"

    .line 1105
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 1111
    :pswitch_1
    const-string v2, "viper4android.settings.compatiblemode"

    .line 1112
    const-string v3, "local"

    .line 1110
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 1103
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
