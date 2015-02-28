.class public Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;
.super Landroid/os/Binder;
.source "ViPER4AndroidService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LocalBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;


# direct methods
.method public constructor <init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V
    .locals 0

    .prologue
    .line 677
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public getService()Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
    .locals 1

    .prologue
    .line 680
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;->this$0:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;

    return-object v0
.end method
