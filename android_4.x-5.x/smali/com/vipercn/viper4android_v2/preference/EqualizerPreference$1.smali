.class Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$1;
.super Ljava/lang/Object;
.source "EqualizerPreference.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$1;->this$0:Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "binder"    # Landroid/os/IBinder;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$1;->this$0:Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;

    check-cast p2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;

    .end local p2    # "binder":Landroid/os/IBinder;
    invoke-virtual {p2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;->getService()Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->access$0(Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    .line 27
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$1;->this$0:Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;

    invoke-virtual {v0}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->updateDspFromDialogEqualizer()V

    .line 28
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$1;->this$0:Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->access$0(Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    .line 33
    return-void
.end method
