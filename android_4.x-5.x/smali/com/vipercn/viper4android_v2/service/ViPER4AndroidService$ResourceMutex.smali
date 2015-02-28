.class Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;
.super Ljava/lang/Object;
.source "ViPER4AndroidService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ResourceMutex"
.end annotation


# instance fields
.field private final mSignal:Ljava/util/concurrent/Semaphore;

.field final synthetic this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;


# direct methods
.method private constructor <init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V
    .locals 2

    .prologue
    .line 45
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->mSignal:Ljava/util/concurrent/Semaphore;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;)V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    return-void
.end method


# virtual methods
.method public acquire()Z
    .locals 2

    .prologue
    .line 51
    :try_start_0
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->mSignal:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    const/4 v1, 0x1

    .line 54
    :goto_0
    return v1

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->mSignal:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 60
    return-void
.end method
