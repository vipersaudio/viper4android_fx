.class Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;
.super Landroid/content/BroadcastReceiver;
.source "ViPER4AndroidService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;


# direct methods
.method constructor <init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    .line 987
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 990
    const-string v9, "ViPER4Android"

    const-string v10, "mAudioSessionReceiver::onReceive()"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 992
    iget-object v9, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    .line 993
    const-string v10, "com.vipercn.viper4android_v2.settings"

    .line 992
    invoke-virtual {v9, v10, v7}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 995
    .local v3, "prefSettings":Landroid/content/SharedPreferences;
    const-string v9, "viper4android.settings.compatiblemode"

    const-string v10, "global"

    .line 994
    invoke-interface {v3, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 996
    .local v1, "mCompatibleMode":Ljava/lang/String;
    const-string v9, "global"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    move v2, v7

    .line 998
    .local v2, "mFXInLocalMode":Z
    :goto_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 999
    .local v0, "action":Ljava/lang/String;
    const-string v9, "android.media.extra.AUDIO_SESSION"

    invoke-virtual {p2, v9, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 1000
    .local v4, "sessionId":I
    if-nez v4, :cond_1

    .line 1001
    const-string v7, "ViPER4Android"

    const-string v8, "Global output mixer session control received! "

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1046
    :goto_1
    return-void

    .end local v0    # "action":Ljava/lang/String;
    .end local v2    # "mFXInLocalMode":Z
    .end local v4    # "sessionId":I
    :cond_0
    move v2, v8

    .line 996
    goto :goto_0

    .line 1005
    .restart local v0    # "action":Ljava/lang/String;
    .restart local v2    # "mFXInLocalMode":Z
    .restart local v4    # "sessionId":I
    :cond_1
    const-string v9, "android.media.action.OPEN_AUDIO_EFFECT_CONTROL_SESSION"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 1006
    const-string v9, "ViPER4Android"

    const-string v10, "New audio session: %d"

    new-array v11, v8, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v7

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1007
    if-nez v2, :cond_2

    .line 1008
    const-string v7, "ViPER4Android"

    const-string v8, "Only global effect allowed."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 1011
    :cond_2
    iget-object v9, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;
    invoke-static {v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$11(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->acquire()Z

    move-result v9

    if-eqz v9, :cond_8

    .line 1012
    iget-object v9, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;
    invoke-static {v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$12(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Landroid/util/SparseArray;

    move-result-object v9

    invoke-virtual {v9, v4}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v9

    if-gez v9, :cond_7

    .line 1013
    const-string v9, "ViPER4Android"

    const-string v10, "Creating local V4ADSPModule ..."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1014
    new-instance v5, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    iget-object v9, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-direct {v5, v9, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;I)V

    .line 1015
    .local v5, "v4aNewDSPModule":Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    iget-object v9, v5, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-nez v9, :cond_6

    .line 1016
    const-string v9, "ViPER4Android"

    const-string v10, "Failed to load v4a driver."

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1017
    invoke-virtual {v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    .line 1018
    const/4 v5, 0x0

    .line 1025
    :goto_2
    iget-object v9, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;
    invoke-static {v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$11(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->release()V

    .line 1030
    .end local v5    # "v4aNewDSPModule":Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    :cond_3
    :goto_3
    const-string v9, "android.media.action.CLOSE_AUDIO_EFFECT_CONTROL_SESSION"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 1031
    const-string v9, "ViPER4Android"

    const-string v10, "Audio session removed: %d"

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v8, v7

    invoke-static {v10, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v9, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1032
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;
    invoke-static {v8}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$11(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->acquire()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 1033
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;
    invoke-static {v8}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$12(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Landroid/util/SparseArray;

    move-result-object v8

    invoke-virtual {v8, v4}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v8

    if-ltz v8, :cond_4

    .line 1034
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;
    invoke-static {v8}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$12(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Landroid/util/SparseArray;

    move-result-object v8

    invoke-virtual {v8, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1035
    .local v6, "v4aRemove":Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;
    invoke-static {v8}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$12(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Landroid/util/SparseArray;

    move-result-object v8

    invoke-virtual {v8, v4}, Landroid/util/SparseArray;->remove(I)V

    .line 1036
    if-eqz v6, :cond_4

    .line 1037
    invoke-virtual {v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    .line 1040
    .end local v6    # "v4aRemove":Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    :cond_4
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;
    invoke-static {v8}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$11(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->release()V

    .line 1045
    :cond_5
    :goto_4
    iget-object v8, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-virtual {v8, v7}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem(Z)V

    goto/16 :goto_1

    .line 1019
    .restart local v5    # "v4aNewDSPModule":Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    :cond_6
    iget-object v9, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;
    invoke-static {v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$12(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Landroid/util/SparseArray;

    move-result-object v9

    invoke-virtual {v9, v4, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_2

    .line 1021
    .end local v5    # "v4aNewDSPModule":Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    :cond_7
    const-string v7, "ViPER4Android"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Effect module already exist [session = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1022
    iget-object v7, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    # getter for: Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;
    invoke-static {v7}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->access$11(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->release()V

    goto/16 :goto_1

    .line 1027
    :cond_8
    const-string v9, "ViPER4Android"

    const-string v10, "Semaphore acquire failed."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 1042
    :cond_9
    const-string v8, "ViPER4Android"

    const-string v9, "Semaphore accquire failed."

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4
.end method
