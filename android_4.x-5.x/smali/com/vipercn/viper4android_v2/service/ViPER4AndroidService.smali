.class public Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;
.super Landroid/app/Service;
.source "ViPER4AndroidService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;,
        Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;,
        Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    }
.end annotation


# static fields
.field private static final ACTION_QUERY_DRIVERSTATUS:Ljava/lang/String; = "com.vipercn.viper4android_v2.QUERY_DRIVERSTATUS"

.field private static final ACTION_QUERY_DRIVERSTATUS_RESULT:Ljava/lang/String; = "com.vipercn.viper4android_v2.QUERY_DRIVERSTATUS_RESULT"

.field private static final ACTION_QUERY_EQUALIZER:Ljava/lang/String; = "com.vipercn.viper4android_v2.QUERY_EQUALIZER"

.field private static final ACTION_QUERY_EQUALIZER_RESULT:Ljava/lang/String; = "com.vipercn.viper4android_v2.QUERY_EQUALIZER_RESULT"

.field private static final ACTION_RELEASE_EFFECT:Ljava/lang/String; = "com.vipercn.viper4android_v2.RELEASE_EFFECT"

.field private static final ACTION_SET_ENABLED:Ljava/lang/String; = "com.vipercn.viper4android_v2.SET_ENABLED"

.field private static final ACTION_SET_EQUALIZER:Ljava/lang/String; = "com.vipercn.viper4android_v2.SET_EQUALIZER"

.field private static final ACTION_TAKEOVER_EFFECT:Ljava/lang/String; = "com.vipercn.viper4android_v2.TAKEOVER_EFFECT"

.field private static final ACTION_TAKEOVER_EFFECT_RESULT:Ljava/lang/String; = "com.vipercn.viper4android_v2.TAKEOVER_EFFECT_RESULT"

.field private static final DEVICE_GLOBAL_OUTPUT_MIXER:I = 0x0

.field public static final ID_V4A_GENERAL_FX:Ljava/util/UUID;

.field private static final PARAM_FX_TYPE_SWITCH:I = 0x10001

.field private static final PARAM_GET_CONFIGURE:I = 0x8004

.field private static final PARAM_GET_CONVKNLID:I = 0x800a

.field private static final PARAM_GET_CONVUSABLE:I = 0x8009

.field private static final PARAM_GET_DRVCANWORK:I = 0x8005

.field private static final PARAM_GET_EFFECT_TYPE:I = 0x8007

.field private static final PARAM_GET_ENABLED:I = 0x8003

.field private static final PARAM_GET_NEONENABLED:I = 0x8002

.field private static final PARAM_GET_SAMPLINGRATE:I = 0x8008

.field private static final PARAM_GET_STREAMING:I = 0x8006

.field private static final PARAM_HPFX_AGC_MAXSCALER:I = 0x10020

.field private static final PARAM_HPFX_AGC_PROCESS_ENABLED:I = 0x1001d

.field private static final PARAM_HPFX_AGC_RATIO:I = 0x1001e

.field private static final PARAM_HPFX_AGC_VOLUME:I = 0x1001f

.field private static final PARAM_HPFX_COLM_DEPTH:I = 0x10014

.field private static final PARAM_HPFX_COLM_MIDIMAGE:I = 0x10013

.field private static final PARAM_HPFX_COLM_PROCESS_ENABLED:I = 0x10011

.field private static final PARAM_HPFX_COLM_WIDENING:I = 0x10012

.field private static final PARAM_HPFX_CONV_COMMITBUFFER:I = 0x10006

.field private static final PARAM_HPFX_CONV_CROSSCHANNEL:I = 0x10007

.field private static final PARAM_HPFX_CONV_PREPAREBUFFER:I = 0x10004

.field private static final PARAM_HPFX_CONV_PROCESS_ENABLED:I = 0x10002

.field private static final PARAM_HPFX_CONV_SETBUFFER:I = 0x10005

.field private static final PARAM_HPFX_CONV_UPDATEKERNEL:I = 0x10003

.field private static final PARAM_HPFX_CURE_CROSSFEED:I = 0x1002e

.field private static final PARAM_HPFX_CURE_PROCESS_ENABLED:I = 0x1002d

.field private static final PARAM_HPFX_DIFFSURR_DELAYTIME:I = 0x10016

.field private static final PARAM_HPFX_DIFFSURR_PROCESS_ENABLED:I = 0x10015

.field private static final PARAM_HPFX_DYNSYS_BASSGAIN:I = 0x10025

.field private static final PARAM_HPFX_DYNSYS_PROCESS_ENABLED:I = 0x10021

.field private static final PARAM_HPFX_DYNSYS_SIDEGAIN:I = 0x10024

.field private static final PARAM_HPFX_DYNSYS_XCOEFFS:I = 0x10022

.field private static final PARAM_HPFX_DYNSYS_YCOEFFS:I = 0x10023

.field private static final PARAM_HPFX_FIREQ_BANDLEVEL:I = 0x10010

.field private static final PARAM_HPFX_FIREQ_PROCESS_ENABLED:I = 0x1000f

.field private static final PARAM_HPFX_LIMITER_THRESHOLD:I = 0x10032

.field private static final PARAM_HPFX_OUTPUT_PAN:I = 0x10031

.field private static final PARAM_HPFX_OUTPUT_VOLUME:I = 0x10030

.field private static final PARAM_HPFX_REVB_DAMP:I = 0x1001a

.field private static final PARAM_HPFX_REVB_DRY:I = 0x1001c

.field private static final PARAM_HPFX_REVB_PROCESS_ENABLED:I = 0x10017

.field private static final PARAM_HPFX_REVB_ROOMSIZE:I = 0x10018

.field private static final PARAM_HPFX_REVB_WET:I = 0x1001b

.field private static final PARAM_HPFX_REVB_WIDTH:I = 0x10019

.field private static final PARAM_HPFX_TUBE_PROCESS_ENABLED:I = 0x1002f

.field private static final PARAM_HPFX_VDDC_COEFFS:I = 0x1000b

.field private static final PARAM_HPFX_VDDC_PROCESS_ENABLED:I = 0x1000a

.field private static final PARAM_HPFX_VHE_EFFECT_LEVEL:I = 0x10009

.field private static final PARAM_HPFX_VHE_PROCESS_ENABLED:I = 0x10008

.field private static final PARAM_HPFX_VIPERBASS_BASSGAIN:I = 0x10029

.field private static final PARAM_HPFX_VIPERBASS_MODE:I = 0x10027

.field private static final PARAM_HPFX_VIPERBASS_PROCESS_ENABLED:I = 0x10026

.field private static final PARAM_HPFX_VIPERBASS_SPEAKER:I = 0x10028

.field private static final PARAM_HPFX_VIPERCLARITY_CLARITY:I = 0x1002c

.field private static final PARAM_HPFX_VIPERCLARITY_MODE:I = 0x1002b

.field private static final PARAM_HPFX_VIPERCLARITY_PROCESS_ENABLED:I = 0x1002a

.field private static final PARAM_HPFX_VSE_BARK_RECONSTRUCT:I = 0x1000e

.field private static final PARAM_HPFX_VSE_PROCESS_ENABLED:I = 0x1000c

.field private static final PARAM_HPFX_VSE_REFERENCE_BARK:I = 0x1000d

.field private static final PARAM_SET_DOPROCESS_STATUS:I = 0x9004

.field private static final PARAM_SET_FORCEENABLE_STATUS:I = 0x9005

.field private static final PARAM_SET_RESET_STATUS:I = 0x9003

.field private static final PARAM_SET_SELFDIAGNOSE_STATUS:I = 0x9006

.field private static final PARAM_SET_UPDATE_STATUS:I = 0x9002

.field private static final PARAM_SPKFX_AGC_MAXSCALER:I = 0x10045

.field private static final PARAM_SPKFX_AGC_PROCESS_ENABLED:I = 0x10042

.field private static final PARAM_SPKFX_AGC_RATIO:I = 0x10043

.field private static final PARAM_SPKFX_AGC_VOLUME:I = 0x10044

.field private static final PARAM_SPKFX_CONV_COMMITBUFFER:I = 0x10037

.field private static final PARAM_SPKFX_CONV_CROSSCHANNEL:I = 0x10038

.field private static final PARAM_SPKFX_CONV_PREPAREBUFFER:I = 0x10035

.field private static final PARAM_SPKFX_CONV_PROCESS_ENABLED:I = 0x10033

.field private static final PARAM_SPKFX_CONV_SETBUFFER:I = 0x10036

.field private static final PARAM_SPKFX_CONV_UPDATEKERNEL:I = 0x10034

.field private static final PARAM_SPKFX_CORR_PROCESS_ENABLED:I = 0x10041

.field private static final PARAM_SPKFX_FIREQ_BANDLEVEL:I = 0x1003a

.field private static final PARAM_SPKFX_FIREQ_PROCESS_ENABLED:I = 0x10039

.field private static final PARAM_SPKFX_LIMITER_THRESHOLD:I = 0x10047

.field private static final PARAM_SPKFX_OUTPUT_VOLUME:I = 0x10046

.field private static final PARAM_SPKFX_REVB_DAMP:I = 0x1003e

.field private static final PARAM_SPKFX_REVB_DRY:I = 0x10040

.field private static final PARAM_SPKFX_REVB_PROCESS_ENABLED:I = 0x1003b

.field private static final PARAM_SPKFX_REVB_ROOMSIZE:I = 0x1003c

.field private static final PARAM_SPKFX_REVB_WET:I = 0x1003f

.field private static final PARAM_SPKFX_REVB_WIDTH:I = 0x1003d

.field private static final V4A_FX_TYPE_HEADPHONE:I = 0x1

.field private static final V4A_FX_TYPE_NONE:I = 0x0

.field private static final V4A_FX_TYPE_SPEAKER:I = 0x2

.field private static mPreviousMode:Ljava/lang/String;

.field private static mUseBluetooth:Z

.field private static mUseHeadset:Z

.field private static mUseUSB:Z


# instance fields
.field private final m3rdAPI_QUERY_DRIVERSTATUS_Receiver:Landroid/content/BroadcastReceiver;

.field private final m3rdAPI_QUERY_EQUALIZER_Receiver:Landroid/content/BroadcastReceiver;

.field private final m3rdAPI_RELEASE_EFFECT_Receiver:Landroid/content/BroadcastReceiver;

.field private final m3rdAPI_SET_ENABLED_Receiver:Landroid/content/BroadcastReceiver;

.field private final m3rdAPI_SET_EQUALIZER_Receiver:Landroid/content/BroadcastReceiver;

.field private final m3rdAPI_TAKEOVER_EFFECT_Receiver:Landroid/content/BroadcastReceiver;

.field private m3rdEnabled:Z

.field private m3rdEqualizerEnabled:Z

.field private m3rdEqualizerLevels:[F

.field private final mAudioSessionReceiver:Landroid/content/BroadcastReceiver;

.field private final mBinder:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;

.field private final mCancelNotifyReceiver:Landroid/content/BroadcastReceiver;

.field private mDriverIsReady:Z

.field private mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

.field private final mGeneralFXList:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;",
            ">;"
        }
    .end annotation
.end field

.field private mOverriddenEqualizerLevels:[F

.field private final mPreferenceUpdateReceiver:Landroid/content/BroadcastReceiver;

.field private final mRoutingReceiver:Landroid/content/BroadcastReceiver;

.field private final mShowNotifyReceiver:Landroid/content/BroadcastReceiver;

.field private final mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

.field private mWorkingWith3rd:Z

.field private mediaMounted:Z

.field private final mediaStatusTimer:Ljava/util/Timer;

.field private final mediaTimerTask:Ljava/util/TimerTask;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 685
    const-string v0, "41d3c987-e6cf-11e3-a88a-11aba5d5c51b"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    .line 684
    sput-object v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->ID_V4A_GENERAL_FX:Ljava/util/UUID;

    .line 793
    const-string v0, "none"

    sput-object v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mPreviousMode:Ljava/lang/String;

    .line 819
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 789
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mBinder:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;

    .line 798
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;

    .line 799
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    .line 827
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mediaStatusTimer:Ljava/util/Timer;

    .line 828
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$1;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$1;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mediaTimerTask:Ljava/util/TimerTask;

    .line 850
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$2;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$2;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_QUERY_DRIVERSTATUS_Receiver:Landroid/content/BroadcastReceiver;

    .line 860
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$3;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$3;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_QUERY_EQUALIZER_Receiver:Landroid/content/BroadcastReceiver;

    .line 881
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$4;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$4;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_TAKEOVER_EFFECT_Receiver:Landroid/content/BroadcastReceiver;

    .line 906
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$5;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$5;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_RELEASE_EFFECT_Receiver:Landroid/content/BroadcastReceiver;

    .line 921
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$6;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$6;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_SET_ENABLED_Receiver:Landroid/content/BroadcastReceiver;

    .line 945
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$7;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_SET_EQUALIZER_Receiver:Landroid/content/BroadcastReceiver;

    .line 987
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$8;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mAudioSessionReceiver:Landroid/content/BroadcastReceiver;

    .line 1049
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$9;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$9;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mPreferenceUpdateReceiver:Landroid/content/BroadcastReceiver;

    .line 1057
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$10;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$10;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mShowNotifyReceiver:Landroid/content/BroadcastReceiver;

    .line 1080
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$11;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$11;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mCancelNotifyReceiver:Landroid/content/BroadcastReceiver;

    .line 1088
    new-instance v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$12;

    invoke-direct {v0, p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$12;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mRoutingReceiver:Landroid/content/BroadcastReceiver;

    .line 43
    return-void
.end method

.method static synthetic access$0(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;Z)V
    .locals 0

    .prologue
    .line 826
    iput-boolean p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mediaMounted:Z

    return-void
.end method

.method static synthetic access$1(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z
    .locals 1

    .prologue
    .line 826
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mediaMounted:Z

    return v0
.end method

.method static synthetic access$10(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;[F)V
    .locals 0

    .prologue
    .line 822
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerLevels:[F

    return-void
.end method

.method static synthetic access$11(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;
    .locals 1

    .prologue
    .line 799
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    return-object v0
.end method

.method static synthetic access$12(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Landroid/util/SparseArray;
    .locals 1

    .prologue
    .line 798
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$13(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1122
    invoke-direct {p0, p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->showNotification(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$14(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)V
    .locals 0

    .prologue
    .line 1161
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->cancelNotification()V

    return-void
.end method

.method static synthetic access$15()Z
    .locals 1

    .prologue
    .line 790
    sget-boolean v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseHeadset:Z

    return v0
.end method

.method static synthetic access$16()Z
    .locals 1

    .prologue
    .line 791
    sget-boolean v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseBluetooth:Z

    return v0
.end method

.method static synthetic access$17()Z
    .locals 1

    .prologue
    .line 792
    sget-boolean v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseUSB:Z

    return v0
.end method

.method static synthetic access$18(Z)V
    .locals 0

    .prologue
    .line 790
    sput-boolean p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseHeadset:Z

    return-void
.end method

.method static synthetic access$19(Z)V
    .locals 0

    .prologue
    .line 791
    sput-boolean p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseBluetooth:Z

    return-void
.end method

.method static synthetic access$2(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z
    .locals 1

    .prologue
    .line 796
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    return v0
.end method

.method static synthetic access$20(Z)V
    .locals 0

    .prologue
    .line 792
    sput-boolean p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseUSB:Z

    return-void
.end method

.method static synthetic access$3(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;Z)V
    .locals 0

    .prologue
    .line 823
    iput-boolean p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mWorkingWith3rd:Z

    return-void
.end method

.method static synthetic access$4(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z
    .locals 1

    .prologue
    .line 823
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mWorkingWith3rd:Z

    return v0
.end method

.method static synthetic access$5(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;Z)V
    .locals 0

    .prologue
    .line 820
    iput-boolean p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEnabled:Z

    return-void
.end method

.method static synthetic access$6(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z
    .locals 1

    .prologue
    .line 820
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEnabled:Z

    return v0
.end method

.method static synthetic access$7(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)Z
    .locals 1

    .prologue
    .line 821
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerEnabled:Z

    return v0
.end method

.method static synthetic access$8(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;Z)V
    .locals 0

    .prologue
    .line 821
    iput-boolean p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerEnabled:Z

    return-void
.end method

.method static synthetic access$9(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;)[F
    .locals 1

    .prologue
    .line 822
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerLevels:[F

    return-object v0
.end method

.method private cancelNotification()V
    .locals 2

    .prologue
    .line 1162
    .line 1163
    const-string v1, "notification"

    .line 1162
    invoke-virtual {p0, v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 1164
    .local v0, "notificationManager":Landroid/app/NotificationManager;
    if-eqz v0, :cond_0

    .line 1165
    const/16 v1, 0x1234

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 1167
    :cond_0
    return-void
.end method

.method public static getAudioOutputRouting(Landroid/content/SharedPreferences;)Ljava/lang/String;
    .locals 3
    .param p0, "prefSettings"    # Landroid/content/SharedPreferences;

    .prologue
    .line 1462
    .line 1463
    const-string v1, "viper4android.settings.lock_effect"

    const-string v2, "none"

    .line 1462
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1464
    .local v0, "mLockedEffect":Ljava/lang/String;
    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1465
    sget-boolean v1, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseBluetooth:Z

    if-eqz v1, :cond_1

    .line 1466
    const-string v0, "bluetooth"

    .line 1473
    .end local v0    # "mLockedEffect":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .line 1467
    .restart local v0    # "mLockedEffect":Ljava/lang/String;
    :cond_1
    sget-boolean v1, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseHeadset:Z

    if-eqz v1, :cond_2

    .line 1468
    const-string v0, "headset"

    goto :goto_0

    .line 1469
    :cond_2
    sget-boolean v1, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseUSB:Z

    if-eqz v1, :cond_3

    .line 1470
    const-string v0, "usb"

    goto :goto_0

    .line 1471
    :cond_3
    const-string v0, "speaker"

    goto :goto_0
.end method

.method private showNotification(Ljava/lang/String;)V
    .locals 14
    .param p1, "mFXType"    # Ljava/lang/String;

    .prologue
    const/4 v13, 0x0

    .line 1123
    .line 1124
    const-string v9, "com.vipercn.viper4android_v2.settings"

    .line 1123
    invoke-virtual {p0, v9, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 1126
    .local v7, "preferences":Landroid/content/SharedPreferences;
    const-string v9, "viper4android.settings.show_notify_icon"

    .line 1125
    invoke-interface {v7, v9, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 1127
    .local v2, "enableNotify":Z
    if-nez v2, :cond_1

    .line 1128
    const-string v9, "ViPER4Android"

    const-string v10, "showNotification(): show_notify = false"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1159
    :cond_0
    :goto_0
    return-void

    .line 1132
    :cond_1
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const-string v10, "icon"

    const-string v11, "drawable"

    .line 1133
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v12

    iget-object v12, v12, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1132
    invoke-virtual {v9, v10, v11, v12}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 1134
    .local v3, "mIconID":I
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "ViPER4Android FX "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1135
    .local v4, "mNotifyText":Ljava/lang/String;
    const-string v1, "ViPER4Android FX"

    .line 1136
    .local v1, "contentTitle":Ljava/lang/CharSequence;
    new-instance v5, Landroid/content/Intent;

    const-class v9, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;

    invoke-direct {v5, p0, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1137
    .local v5, "notificationIntent":Landroid/content/Intent;
    invoke-static {p0, v13, v5, v13}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 1140
    .local v0, "contentItent":Landroid/app/PendingIntent;
    if-eqz v0, :cond_0

    .line 1141
    new-instance v9, Landroid/app/Notification$Builder;

    invoke-direct {v9, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 1142
    invoke-virtual {v9, v13}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1143
    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1144
    invoke-virtual {v9, v13}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1145
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1146
    invoke-virtual {v9, v3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1147
    invoke-virtual {v9, v4}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1148
    invoke-virtual {v9, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1149
    invoke-virtual {v9, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1150
    invoke-virtual {v9, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1151
    invoke-virtual {v9}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v8

    .line 1154
    .local v8, "v4aNotify":Landroid/app/Notification;
    const-string v9, "notification"

    .line 1153
    invoke-virtual {p0, v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/NotificationManager;

    .line 1155
    .local v6, "notificationManager":Landroid/app/NotificationManager;
    if-eqz v6, :cond_0

    .line 1156
    const/16 v9, 0x1234

    invoke-virtual {v6, v9, v8}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0
.end method


# virtual methods
.method extractDDCCoeffs(Landroid/content/SharedPreferences;)[F
    .locals 7
    .param p1, "preferences"    # Landroid/content/SharedPreferences;

    .prologue
    const/4 v4, 0x0

    .line 1556
    const-string v5, "viper4android.headphonefx.viperddc.device"

    const-string v6, ""

    invoke-interface {p1, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1557
    .local v3, "szDeviceID":Ljava/lang/String;
    if-eqz v3, :cond_0

    const-string v5, ""

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1558
    :cond_0
    const-string v5, "ViPER4Android"

    const-string v6, "extractDDCCoeffs(): DeviceID not found."

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v4

    .line 1581
    :goto_0
    return-object v0

    .line 1562
    :cond_1
    const/4 v0, 0x0

    .line 1563
    .local v0, "ddcCoeffs":[F
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "viper4android.ddcblock."

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-interface {p1, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1564
    .local v2, "szDeviceDDCCoeffs":Ljava/lang/String;
    if-eqz v2, :cond_2

    const-string v5, ""

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 1565
    :cond_2
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/vipercn/viper4android_v2/activity/DDCDatabase;->queryDDCBlock(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 1566
    if-eqz v2, :cond_3

    const-string v5, ""

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    :cond_3
    move-object v0, v4

    goto :goto_0

    .line 1567
    :cond_4
    invoke-static {v2}, Lcom/vipercn/viper4android_v2/activity/DDCDatabase;->blockToFloatArray(Ljava/lang/String;)[F

    move-result-object v0

    .line 1568
    if-eqz v0, :cond_5

    array-length v5, v0

    const/4 v6, 0x2

    if-ge v5, v6, :cond_6

    :cond_5
    move-object v0, v4

    goto :goto_0

    .line 1569
    :cond_6
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1570
    .local v1, "edit":Landroid/content/SharedPreferences$Editor;
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "viper4android.ddcblock."

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1571
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1575
    .end local v1    # "edit":Landroid/content/SharedPreferences$Editor;
    :goto_1
    if-nez v0, :cond_8

    .line 1576
    const-string v4, "ViPER4Android"

    const-string v5, "extractDDCCoeffs(): DDC coeffs not found."

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1573
    :cond_7
    invoke-static {v2}, Lcom/vipercn/viper4android_v2/activity/DDCDatabase;->blockToFloatArray(Ljava/lang/String;)[F

    move-result-object v0

    goto :goto_1

    .line 1578
    :cond_8
    const-string v4, "ViPER4Android"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "extractDDCCoeffs(): DDC coeffs found, length = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v6, v0

    div-int/lit8 v6, v6, 0x2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getConvolverUsable()Z
    .locals 3

    .prologue
    .line 1547
    const/4 v0, 0x0

    .line 1548
    .local v0, "mResult":Z
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-eqz v1, :cond_0

    .line 1549
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const v2, 0x8009

    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->getParameter_px4_vx4x1(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 1550
    const/4 v0, 0x1

    .line 1552
    :cond_0
    return v0
.end method

.method public getDriverCanWork()Z
    .locals 3

    .prologue
    .line 1522
    const/4 v0, 0x0

    .line 1523
    .local v0, "mResult":Z
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-eqz v1, :cond_0

    .line 1524
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const v2, 0x8005

    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->getParameter_px4_vx4x1(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 1525
    const/4 v0, 0x1

    .line 1527
    :cond_0
    return v0
.end method

.method public getDriverEnabled()Z
    .locals 3

    .prologue
    .line 1504
    const/4 v0, 0x0

    .line 1505
    .local v0, "mResult":Z
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-eqz v1, :cond_0

    .line 1506
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const v2, 0x8003

    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->getParameter_px4_vx4x1(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 1507
    const/4 v0, 0x1

    .line 1509
    :cond_0
    return v0
.end method

.method public getDriverIsReady()Z
    .locals 1

    .prologue
    .line 1477
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    return v0
.end method

.method public getDriverLoaded()Z
    .locals 1

    .prologue
    .line 1481
    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    iget-object v0, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getDriverNEON()Z
    .locals 3

    .prologue
    .line 1495
    const/4 v0, 0x0

    .line 1496
    .local v0, "mResult":Z
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-eqz v1, :cond_0

    .line 1497
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const v2, 0x8002

    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->getParameter_px4_vx4x1(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 1498
    const/4 v0, 0x1

    .line 1500
    :cond_0
    return v0
.end method

.method public getDriverProcess()Z
    .locals 3

    .prologue
    .line 1531
    const/4 v0, 0x0

    .line 1532
    .local v0, "mResult":Z
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-eqz v1, :cond_0

    .line 1533
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const v2, 0x8006

    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->getParameter_px4_vx4x1(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 1534
    const/4 v0, 0x1

    .line 1536
    :cond_0
    return v0
.end method

.method public getDriverSamplingRate()I
    .locals 3

    .prologue
    .line 1540
    const/4 v0, 0x0

    .line 1541
    .local v0, "nResult":I
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-eqz v1, :cond_0

    .line 1542
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const v2, 0x8008

    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->getParameter_px4_vx4x1(I)I

    move-result v0

    .line 1543
    :cond_0
    return v0
.end method

.method public getDriverSupportFormat()Z
    .locals 3

    .prologue
    .line 1513
    const/4 v0, 0x0

    .line 1514
    .local v0, "mResult":Z
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-eqz v1, :cond_0

    .line 1515
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const v2, 0x8004

    invoke-virtual {v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->getParameter_px4_vx4x1(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 1516
    const/4 v0, 0x1

    .line 1518
    :cond_0
    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1341
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mBinder:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$LocalBinder;

    return-object v0
.end method

.method public onCreate()V
    .locals 18

    .prologue
    .line 1172
    invoke-super/range {p0 .. p0}, Landroid/app/Service;->onCreate()V

    .line 1174
    const-string v2, "ViPER4Android"

    const-string v3, "Query ViPER4Android engine ..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1175
    new-instance v8, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;

    new-instance v2, Lcom/vipercn/viper4android_v2/activity/Utils;

    invoke-direct {v2}, Lcom/vipercn/viper4android_v2/activity/Utils;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v8, v2}, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;-><init>(Lcom/vipercn/viper4android_v2/activity/Utils;)V

    .line 1176
    .local v8, "aeuUtils":Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;
    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->isViPER4AndroidEngineFound()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1177
    const-string v2, "ViPER4Android"

    const-string v3, "ViPER4Android engine not found, create empty service"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1178
    const/4 v8, 0x0

    .line 1179
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    .line 1289
    :goto_0
    return-void

    .line 1182
    :cond_0
    invoke-virtual {v8}, Lcom/vipercn/viper4android_v2/activity/Utils$AudioEffectUtils;->getViper4AndroidEngineVersion()[I

    move-result-object v12

    .line 1183
    .local v12, "iaDrvVer":[I
    new-instance v2, Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    aget v3, v12, v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x1

    aget v3, v12, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x2

    aget v3, v12, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1184
    const/4 v3, 0x3

    aget v3, v12, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1183
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 1185
    .local v16, "mDriverVersion":Ljava/lang/String;
    const/4 v8, 0x0

    .line 1186
    invoke-static/range {v16 .. v16}, Lcom/vipercn/viper4android_v2/activity/ViPER4Android;->isDriverCompatible(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1187
    const-string v2, "ViPER4Android"

    const-string v3, "ViPER4Android engine is not compatible with service"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1188
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    goto :goto_0

    .line 1192
    :cond_1
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    .line 1194
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "audio"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/media/AudioManager;

    .line 1195
    .local v13, "mAudioManager":Landroid/media/AudioManager;
    if-eqz v13, :cond_2

    .line 1196
    invoke-virtual {v13}, Landroid/media/AudioManager;->isBluetoothA2dpOn()Z

    move-result v2

    sput-boolean v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseBluetooth:Z

    .line 1197
    sget-boolean v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseBluetooth:Z

    if-eqz v2, :cond_9

    .line 1198
    const-string v2, "ViPER4Android"

    const-string v3, "Current is a2dp mode [bluetooth]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1199
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseHeadset:Z

    .line 1200
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseUSB:Z

    .line 1212
    :cond_2
    :goto_1
    const-string v2, "ViPER4Android"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Get current mode from system ["

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1213
    const-string v4, "com.vipercn.viper4android_v2.settings"

    .line 1214
    const/4 v5, 0x0

    .line 1213
    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 1212
    invoke-static {v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getAudioOutputRouting(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1214
    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1212
    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1216
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v2, :cond_3

    .line 1217
    const-string v2, "ViPER4Android"

    const-string v3, "onCreate, mGeneralFX != null"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1218
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    .line 1219
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1223
    :cond_3
    const-string v2, "com.vipercn.viper4android_v2.settings"

    const/4 v3, 0x0

    .line 1222
    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 1225
    .local v17, "prefSettings":Landroid/content/SharedPreferences;
    const-string v2, "viper4android.settings.driverconfigured"

    const/4 v3, 0x0

    .line 1224
    move-object/from16 v0, v17

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v15

    .line 1226
    .local v15, "mDriverConfigured":Z
    if-nez v15, :cond_4

    .line 1227
    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    .line 1228
    .local v11, "editPrefs":Landroid/content/SharedPreferences$Editor;
    if-eqz v11, :cond_4

    .line 1229
    const-string v2, "viper4android.settings.driverconfigured"

    const/4 v3, 0x1

    invoke-interface {v11, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1230
    invoke-interface {v11}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1234
    .end local v11    # "editPrefs":Landroid/content/SharedPreferences$Editor;
    :cond_4
    const-string v2, "viper4android.settings.compatiblemode"

    const-string v3, "global"

    .line 1233
    move-object/from16 v0, v17

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1235
    .local v14, "mCompatibleMode":Ljava/lang/String;
    const-string v2, "global"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1236
    const-string v2, "ViPER4Android"

    const-string v3, "Creating global V4ADSPModule ..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1237
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-nez v2, :cond_5

    .line 1238
    new-instance v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;I)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1239
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    iget-object v2, v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-nez v2, :cond_6

    .line 1240
    const-string v2, "ViPER4Android"

    const-string v3, "Found v4a driver, but failed to load."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1241
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    .line 1242
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1245
    :cond_6
    const/16 v17, 0x0

    .line 1247
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x12

    if-ge v2, v3, :cond_7

    .line 1248
    const/4 v2, 0x1

    new-instance v3, Landroid/app/Notification;

    invoke-direct {v3}, Landroid/app/Notification;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->startForeground(ILandroid/app/Notification;)V

    .line 1250
    :cond_7
    new-instance v10, Landroid/content/IntentFilter;

    invoke-direct {v10}, Landroid/content/IntentFilter;-><init>()V

    .line 1251
    .local v10, "audioSessionFilter":Landroid/content/IntentFilter;
    const-string v2, "android.media.action.OPEN_AUDIO_EFFECT_CONTROL_SESSION"

    invoke-virtual {v10, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1252
    const-string v2, "android.media.action.CLOSE_AUDIO_EFFECT_CONTROL_SESSION"

    invoke-virtual {v10, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1253
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mAudioSessionReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v10}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1255
    new-instance v9, Landroid/content/IntentFilter;

    invoke-direct {v9}, Landroid/content/IntentFilter;-><init>()V

    .line 1256
    .local v9, "audioFilter":Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {v9, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1257
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_8

    .line 1259
    const-string v2, "android.intent.action.ANALOG_AUDIO_DOCK_PLUG"

    invoke-virtual {v9, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1261
    :cond_8
    const-string v2, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v9, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1262
    const-string v2, "android.media.AUDIO_BECOMING_NOISY"

    invoke-virtual {v9, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1263
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mRoutingReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v9}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1265
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mPreferenceUpdateReceiver:Landroid/content/BroadcastReceiver;

    .line 1266
    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.vipercn.viper4android_v2.UPDATE"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 1265
    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1267
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mShowNotifyReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.vipercn.viper4android_v2.SHOWNOTIFY"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1268
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mCancelNotifyReceiver:Landroid/content/BroadcastReceiver;

    .line 1269
    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.vipercn.viper4android_v2.CANCELNOTIFY"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 1268
    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1272
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_QUERY_DRIVERSTATUS_Receiver:Landroid/content/BroadcastReceiver;

    .line 1273
    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.vipercn.viper4android_v2.QUERY_DRIVERSTATUS"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 1272
    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1274
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_QUERY_EQUALIZER_Receiver:Landroid/content/BroadcastReceiver;

    .line 1275
    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.vipercn.viper4android_v2.QUERY_EQUALIZER"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 1274
    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1276
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_TAKEOVER_EFFECT_Receiver:Landroid/content/BroadcastReceiver;

    .line 1277
    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.vipercn.viper4android_v2.TAKEOVER_EFFECT"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 1276
    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1278
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_RELEASE_EFFECT_Receiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.vipercn.viper4android_v2.RELEASE_EFFECT"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1279
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_SET_ENABLED_Receiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.vipercn.viper4android_v2.SET_ENABLED"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1280
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_SET_EQUALIZER_Receiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.vipercn.viper4android_v2.SET_EQUALIZER"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1283
    const-string v2, "ViPER4Android"

    const-string v3, "Service launched."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1285
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem(Z)V

    .line 1288
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mediaStatusTimer:Ljava/util/Timer;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mediaTimerTask:Ljava/util/TimerTask;

    const-wide/16 v4, 0x3a98

    const-wide/32 v6, 0xea60

    invoke-virtual/range {v2 .. v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    goto/16 :goto_0

    .line 1202
    .end local v9    # "audioFilter":Landroid/content/IntentFilter;
    .end local v10    # "audioSessionFilter":Landroid/content/IntentFilter;
    .end local v14    # "mCompatibleMode":Ljava/lang/String;
    .end local v15    # "mDriverConfigured":Z
    .end local v17    # "prefSettings":Landroid/content/SharedPreferences;
    :cond_9
    invoke-virtual {v13}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v2

    sput-boolean v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseHeadset:Z

    .line 1203
    sget-boolean v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseHeadset:Z

    if-eqz v2, :cond_a

    .line 1204
    const-string v2, "ViPER4Android"

    const-string v3, "Current is headset mode"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1205
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseUSB:Z

    goto/16 :goto_1

    .line 1207
    :cond_a
    const-string v2, "ViPER4Android"

    const-string v3, "Current is speaker mode"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1208
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mUseUSB:Z

    goto/16 :goto_1
.end method

.method public onDestroy()V
    .locals 5

    .prologue
    .line 1293
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 1295
    iget-boolean v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-nez v3, :cond_0

    .line 1337
    :goto_0
    return-void

    .line 1298
    :cond_0
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mediaStatusTimer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 1300
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x12

    if-ge v3, v4, :cond_1

    .line 1301
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->stopForeground(Z)V

    .line 1304
    :cond_1
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mAudioSessionReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1305
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mRoutingReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1306
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mPreferenceUpdateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1307
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mShowNotifyReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1308
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mCancelNotifyReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1311
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_QUERY_DRIVERSTATUS_Receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1312
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_QUERY_EQUALIZER_Receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1313
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_TAKEOVER_EFFECT_Receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1314
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_RELEASE_EFFECT_Receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1315
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_SET_ENABLED_Receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1316
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdAPI_SET_EQUALIZER_Receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1319
    invoke-direct {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->cancelNotification()V

    .line 1321
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v3, :cond_2

    .line 1322
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-virtual {v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    .line 1323
    :cond_2
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1325
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    invoke-virtual {v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->acquire()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1326
    const/4 v0, 0x0

    .local v0, "idx":I
    :goto_1
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-lt v0, v3, :cond_4

    .line 1332
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    .line 1333
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    invoke-virtual {v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->release()V

    .line 1336
    .end local v0    # "idx":I
    :cond_3
    const-string v3, "ViPER4Android"

    const-string v4, "Service destroyed."

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1327
    .restart local v0    # "idx":I
    :cond_4
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 1328
    .local v1, "sessionId":Ljava/lang/Integer;
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1329
    .local v2, "v4aModule":Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ltz v3, :cond_5

    if-nez v2, :cond_6

    .line 1326
    :cond_5
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1330
    :cond_6
    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    goto :goto_2
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1348
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [Begin check driver]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1350
    iget-boolean v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-nez v2, :cond_0

    .line 1351
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [V4A Engine not found]"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1352
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v2

    .line 1453
    :goto_0
    return v2

    .line 1356
    :cond_0
    const-string v2, "com.vipercn.viper4android_v2.settings"

    .line 1355
    invoke-virtual {p0, v2, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1358
    .local v1, "prefSettings":Landroid/content/SharedPreferences;
    const-string v2, "viper4android.settings.compatiblemode"

    const-string v3, "global"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1359
    .local v0, "mCompatibleMode":Ljava/lang/String;
    const-string v2, "global"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1360
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [V4A is local effect mode]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1361
    const/4 v1, 0x0

    .line 1362
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v2

    goto :goto_0

    .line 1364
    :cond_1
    const/4 v1, 0x0

    .line 1366
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-nez v2, :cond_3

    .line 1368
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [Creating global V4ADSPModule ...]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1369
    new-instance v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-direct {v2, p0, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;I)V

    iput-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1370
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    iget-object v2, v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-nez v2, :cond_2

    .line 1375
    const-string v2, "ViPER4Android"

    .line 1376
    const-string v3, "Service::onStartCommand [Found v4a driver, but failed to load]"

    .line 1375
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1377
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    .line 1378
    iput-object v6, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1379
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v2

    goto :goto_0

    .line 1383
    :cond_2
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [V4ADSPModule created]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1384
    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem(Z)V

    .line 1385
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v2

    goto :goto_0

    .line 1388
    :cond_3
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    iget-object v2, v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-nez v2, :cond_5

    .line 1391
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    .line 1392
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [Recreating global V4ADSPModule ...]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1393
    new-instance v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-direct {v2, p0, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;I)V

    iput-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1394
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    iget-object v2, v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-nez v2, :cond_4

    .line 1399
    const-string v2, "ViPER4Android"

    .line 1400
    const-string v3, "Service::onStartCommand [Found v4a driver, but failed to load]"

    .line 1399
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1401
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    .line 1402
    iput-object v6, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1403
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v2

    goto/16 :goto_0

    .line 1407
    :cond_4
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [V4ADSPModule created]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1408
    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem(Z)V

    .line 1409
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v2

    goto/16 :goto_0

    .line 1412
    :cond_5
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getDriverCanWork()Z

    move-result v2

    if-nez v2, :cond_8

    .line 1420
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [Begin self diagnose procedure ...]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1421
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const v3, 0x9006

    invoke-virtual {v2, v3, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1422
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getDriverCanWork()Z

    move-result v2

    if-nez v2, :cond_7

    .line 1424
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    .line 1425
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [Recreating global V4ADSPModule ...]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1426
    new-instance v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-direct {v2, p0, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;-><init>(Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;I)V

    iput-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1427
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    iget-object v2, v2, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-nez v2, :cond_6

    .line 1432
    const-string v2, "ViPER4Android"

    .line 1433
    const-string v3, "Service::onStartCommand [Found v4a driver, but failed to load]"

    .line 1432
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1434
    iget-object v2, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    invoke-virtual {v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->release()V

    .line 1435
    iput-object v6, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1436
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v2

    goto/16 :goto_0

    .line 1439
    :cond_6
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [Engine fixed]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1440
    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem(Z)V

    .line 1448
    :goto_1
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v2

    goto/16 :goto_0

    .line 1444
    :cond_7
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [Engine fixed]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1445
    invoke-virtual {p0, v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem(Z)V

    goto :goto_1

    .line 1451
    :cond_8
    const-string v2, "ViPER4Android"

    const-string v3, "Service::onStartCommand [Everything is ok]"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1453
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v2

    goto/16 :goto_0
.end method

.method public setEqualizerLevels([F)V
    .locals 1
    .param p1, "levels"    # [F

    .prologue
    .line 1457
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mOverriddenEqualizerLevels:[F

    .line 1458
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem(Z)V

    .line 1459
    return-void
.end method

.method setV4AEqualizerBandLevel(IIZLcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)V
    .locals 1
    .param p1, "idx"    # I
    .param p2, "level"    # I
    .param p3, "hpfx"    # Z
    .param p4, "dsp"    # Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .prologue
    .line 1585
    if-eqz p4, :cond_0

    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-nez v0, :cond_1

    .line 1592
    :cond_0
    :goto_0
    return-void

    .line 1587
    :cond_1
    if-eqz p3, :cond_2

    .line 1588
    const v0, 0x10010

    invoke-virtual {p4, v0, p1, p2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x2(III)V

    goto :goto_0

    .line 1590
    :cond_2
    const v0, 0x1003a

    invoke-virtual {p4, v0, p1, p2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x2(III)V

    goto :goto_0
.end method

.method public startStatusUpdating()V
    .locals 3

    .prologue
    .line 1485
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-eqz v0, :cond_0

    .line 1486
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const v1, 0x9002

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1487
    :cond_0
    return-void
.end method

.method public stopStatusUpdating()V
    .locals 3

    .prologue
    .line 1490
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-eqz v0, :cond_0

    .line 1491
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const v1, 0x9002

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1492
    :cond_0
    return-void
.end method

.method updateSystem(Z)V
    .locals 10
    .param p1, "mRequireReset"    # Z

    .prologue
    const/4 v1, 0x0

    .line 1595
    .line 1596
    const-string v6, "com.vipercn.viper4android_v2.settings"

    .line 1595
    invoke-virtual {p0, v6, v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-static {v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getAudioOutputRouting(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v3

    .line 1598
    .local v3, "mode":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "com.vipercn.viper4android_v2."

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1597
    invoke-virtual {p0, v6, v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 1599
    .local v5, "preferences":Landroid/content/SharedPreferences;
    const-string v6, "ViPER4Android"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Begin system update("

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1601
    const/4 v2, 0x1

    .line 1602
    .local v2, "mFXType":I
    const-string v6, "speaker"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1603
    const/4 v2, 0x2

    .line 1605
    :cond_0
    sget-object v6, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mPreviousMode:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 1606
    sput-object v3, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mPreviousMode:Ljava/lang/String;

    .line 1607
    const-string v6, "headset"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1608
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const-string v7, "text_headset"

    const-string v8, "string"

    .line 1609
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget-object v9, v9, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1608
    invoke-virtual {v6, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->showNotification(Ljava/lang/String;)V

    .line 1622
    :cond_1
    :goto_0
    const-string v6, "com.vipercn.viper4android_v2.settings"

    .line 1621
    invoke-virtual {p0, v6, v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 1624
    .local v4, "prefSettings":Landroid/content/SharedPreferences;
    const-string v6, "viper4android.settings.compatiblemode"

    const-string v7, "global"

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1626
    .local v0, "mCompatibleMode":Ljava/lang/String;
    const-string v6, "global"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1628
    .local v1, "mFXInLocalMode":Z
    :goto_1
    const-string v6, "ViPER4Android"

    const-string v7, "<+++++++++++++++ Update global effect +++++++++++++++>"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1629
    invoke-virtual {p0, v5, v2, p1, v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem_Global(Landroid/content/SharedPreferences;IZZ)V

    .line 1630
    const-string v6, "ViPER4Android"

    const-string v7, "<++++++++++++++++++++++++++++++++++++++++++++++++++++>"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1632
    const-string v6, "ViPER4Android"

    const-string v7, "<+++++++++++++++ Update local effect +++++++++++++++>"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1633
    invoke-virtual {p0, v5, v2, p1, v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem_Local(Landroid/content/SharedPreferences;IZZ)V

    .line 1634
    const-string v6, "ViPER4Android"

    const-string v7, "<+++++++++++++++++++++++++++++++++++++++++++++++++++>"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1635
    return-void

    .line 1610
    .end local v0    # "mCompatibleMode":Ljava/lang/String;
    .end local v1    # "mFXInLocalMode":Z
    .end local v4    # "prefSettings":Landroid/content/SharedPreferences;
    :cond_2
    const-string v6, "bluetooth"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1611
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const-string v7, "text_bluetooth"

    const-string v8, "string"

    .line 1612
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget-object v9, v9, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1611
    invoke-virtual {v6, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->showNotification(Ljava/lang/String;)V

    goto :goto_0

    .line 1613
    :cond_3
    const-string v6, "usb"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1614
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const-string v7, "text_usb"

    const-string v8, "string"

    .line 1615
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget-object v9, v9, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1614
    invoke-virtual {v6, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->showNotification(Ljava/lang/String;)V

    goto :goto_0

    .line 1617
    :cond_4
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const-string v7, "text_speaker"

    const-string v8, "string"

    .line 1618
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget-object v9, v9, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1617
    invoke-virtual {v6, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->showNotification(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1626
    .restart local v0    # "mCompatibleMode":Ljava/lang/String;
    .restart local v4    # "prefSettings":Landroid/content/SharedPreferences;
    :cond_5
    const/4 v1, 0x1

    goto/16 :goto_1
.end method

.method updateSystem_Global(Landroid/content/SharedPreferences;IZZ)V
    .locals 7
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "mFXType"    # I
    .param p3, "mRequireReset"    # Z
    .param p4, "mLocalFX"    # Z

    .prologue
    .line 1639
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    iget-object v0, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mDriverIsReady:Z

    if-nez v0, :cond_1

    .line 1640
    :cond_0
    const-string v0, "ViPER4Android"

    const-string v1, "updateSystem(): Effects is invalid!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1658
    :goto_0
    return-void

    .line 1645
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    iget-object v0, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    invoke-virtual {v0}, Landroid/media/audiofx/AudioEffect;->hasControl()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1646
    const-string v0, "ViPER4Android"

    const-string v1, "The effect is controlling by system now"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1649
    :catch_0
    move-exception v6

    .line 1650
    .local v6, "e":Ljava/lang/Exception;
    const-string v0, "ViPER4Android"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "updateSystem_Global(), Exception = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1654
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_2
    if-eqz p4, :cond_3

    .line 1655
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem_Module(Landroid/content/SharedPreferences;ILcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;ZZ)V

    goto :goto_0

    .line 1657
    :cond_3
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFX:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem_Module(Landroid/content/SharedPreferences;ILcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;ZZ)V

    goto :goto_0
.end method

.method updateSystem_Local(Landroid/content/SharedPreferences;IZZ)V
    .locals 11
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "mFXType"    # I
    .param p3, "mRequireReset"    # Z
    .param p4, "mLocalFX"    # Z

    .prologue
    .line 1662
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    invoke-virtual {v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->acquire()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1663
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 1664
    .local v10, "v4aUnderControl":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v8, 0x0

    .local v8, "idx":I
    :goto_0
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-lt v8, v0, :cond_0

    .line 1680
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4

    .line 1683
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mV4AMutex:Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;

    invoke-virtual {v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$ResourceMutex;->release()V

    .line 1686
    .end local v8    # "idx":I
    .end local v10    # "v4aUnderControl":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_2
    return-void

    .line 1665
    .restart local v8    # "idx":I
    .restart local v10    # "v4aUnderControl":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_0
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;

    invoke-virtual {v0, v8}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 1666
    .local v9, "sessionId":Ljava/lang/Integer;
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;

    invoke-virtual {v0, v8}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;

    .line 1667
    .local v3, "v4aModule":Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ltz v0, :cond_1

    if-nez v3, :cond_2

    .line 1664
    :cond_1
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1670
    :cond_2
    if-nez p4, :cond_3

    .line 1671
    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    :try_start_0
    invoke-virtual/range {v0 .. v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem_Module(Landroid/content/SharedPreferences;ILcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;ZZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 1674
    :catch_0
    move-exception v7

    .line 1675
    .local v7, "e":Ljava/lang/Exception;
    const-string v0, "ViPER4Android"

    const-string v1, "Trouble trying to manage session %d, removing..."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 1676
    aput-object v9, v2, v4

    .line 1675
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1677
    invoke-interface {v10, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 1673
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_3
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    :try_start_1
    invoke-virtual/range {v0 .. v5}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->updateSystem_Module(Landroid/content/SharedPreferences;ILcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;ZZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 1680
    .end local v3    # "v4aModule":Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    .end local v9    # "sessionId":Ljava/lang/Integer;
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 1681
    .local v6, "aV4aUnderControl":Ljava/lang/Integer;
    iget-object v1, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mGeneralFXList:Landroid/util/SparseArray;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_1

    .line 1685
    .end local v6    # "aV4aUnderControl":Ljava/lang/Integer;
    .end local v8    # "idx":I
    .end local v10    # "v4aUnderControl":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_5
    const-string v0, "ViPER4Android"

    const-string v1, "Semaphore accquire failed."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method updateSystem_Module(Landroid/content/SharedPreferences;ILcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;ZZ)V
    .locals 15
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "mFXType"    # I
    .param p3, "v4aModule"    # Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;
    .param p4, "requireReset"    # Z
    .param p5, "mMasterSwitchOff"    # Z

    .prologue
    .line 1690
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Commiting effects type"

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1691
    const v12, 0x10001

    move-object/from16 v0, p3

    move/from16 v1, p2

    invoke-virtual {v0, v12, v1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1694
    const/4 v12, 0x1

    move/from16 v0, p2

    if-ne v0, v12, :cond_1f

    .line 1695
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Commiting headphone-fx parameters"

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1698
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating ViPER-DDC."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1699
    invoke-virtual/range {p0 .. p1}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->extractDDCCoeffs(Landroid/content/SharedPreferences;)[F

    move-result-object v3

    .line 1700
    .local v3, "ddcCoeffs":[F
    if-eqz v3, :cond_0

    const v12, 0x1000b

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v3}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx1x1024(I[F)V

    .line 1701
    :cond_0
    const-string v12, "viper4android.headphonefx.viperddc.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 1702
    const v12, 0x1000a

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1707
    :goto_0
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Spectrum Extension."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1708
    const-string v12, "viper4android.headphonefx.vse.value"

    const-string v13, "0.1"

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    const v13, 0x40b33333

    mul-float/2addr v12, v13

    const/high16 v13, 0x42c80000

    mul-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v11

    .line 1709
    .local v11, "nSEValue":I
    const v12, 0x1000e

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v11}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1710
    const v12, 0x1000d

    const/16 v13, 0x1db0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1711
    const-string v12, "viper4android.headphonefx.vse.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 1712
    const v12, 0x1000c

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1717
    :goto_1
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating FIR Equalizer."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1718
    iget-boolean v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mWorkingWith3rd:Z

    if-nez v12, :cond_c

    .line 1719
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mOverriddenEqualizerLevels:[F

    if-eqz v12, :cond_a

    .line 1720
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mOverriddenEqualizerLevels:[F

    array-length v12, v12

    if-lt v7, v12, :cond_9

    .line 1732
    .end local v7    # "i":I
    :cond_1
    const-string v12, "viper4android.headphonefx.fireq.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_b

    .line 1733
    const v12, 0x1000f

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1749
    :goto_3
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Convolver."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1751
    const-string v12, "viper4android.headphonefx.convolver.kernel"

    const-string v13, ""

    .line 1750
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1752
    .local v9, "mConvIRFileName":Ljava/lang/String;
    const/4 v12, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v9, v12}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setConvIRFile(Ljava/lang/String;Z)V

    .line 1753
    const v12, 0x10007

    .line 1754
    const-string v13, "viper4android.headphonefx.convolver.crosschannel"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1753
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1755
    const-string v12, "viper4android.headphonefx.convolver.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_10

    .line 1756
    const v12, 0x10002

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1761
    :goto_4
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Field Surround (Colorful Music)."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1763
    const-string v12, "viper4android.headphonefx.colorfulmusic.coeffs"

    const-string v13, "120;200"

    .line 1762
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1764
    const-string v13, ";"

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 1765
    .local v2, "colorfulMusic":[Ljava/lang/String;
    array-length v12, v2

    const/4 v13, 0x2

    if-ne v12, v13, :cond_2

    .line 1766
    const v12, 0x10012

    const/4 v13, 0x0

    aget-object v13, v2, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1767
    const v12, 0x10014

    const/4 v13, 0x1

    aget-object v13, v2, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1769
    :cond_2
    const v12, 0x10013

    .line 1770
    const-string v13, "viper4android.headphonefx.colorfulmusic.midimage"

    const-string v14, "150"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1769
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1771
    const-string v12, "viper4android.headphonefx.colorfulmusic.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_11

    .line 1772
    const v12, 0x10011

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1776
    :goto_5
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Diff Surround."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1777
    const v12, 0x10016

    .line 1778
    const-string v13, "viper4android.headphonefx.diffsurr.delay"

    const-string v14, "500"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1777
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1779
    const-string v12, "viper4android.headphonefx.diffsurr.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_12

    .line 1780
    const v12, 0x10015

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1784
    :goto_6
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating ViPER\'s Headphone Surround Engine +."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1785
    const v12, 0x10009

    .line 1786
    const-string v13, "viper4android.headphonefx.vhs.qual"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1785
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1787
    const-string v12, "viper4android.headphonefx.vhs.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_13

    .line 1788
    const v12, 0x10008

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1792
    :goto_7
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Reverberation."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1793
    const v12, 0x10018

    .line 1794
    const-string v13, "viper4android.headphonefx.reverb.roomsize"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1793
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1795
    const v12, 0x10019

    .line 1796
    const-string v13, "viper4android.headphonefx.reverb.roomwidth"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1795
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1797
    const v12, 0x1001a

    .line 1798
    const-string v13, "viper4android.headphonefx.reverb.damp"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1797
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1799
    const v12, 0x1001b

    .line 1800
    const-string v13, "viper4android.headphonefx.reverb.wet"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1799
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1801
    const v12, 0x1001c

    .line 1802
    const-string v13, "viper4android.headphonefx.reverb.dry"

    const-string v14, "50"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1801
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1803
    const-string v12, "viper4android.headphonefx.reverb.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_14

    .line 1804
    const v12, 0x10017

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1808
    :goto_8
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Playback AGC."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1809
    const v12, 0x1001e

    .line 1810
    const-string v13, "viper4android.headphonefx.playbackgain.ratio"

    const-string v14, "50"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1809
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1811
    const v12, 0x1001f

    .line 1812
    const-string v13, "viper4android.headphonefx.playbackgain.volume"

    const-string v14, "80"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1811
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1813
    const v12, 0x10020

    .line 1814
    const-string v13, "viper4android.headphonefx.playbackgain.maxscaler"

    const-string v14, "400"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1813
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1815
    const-string v12, "viper4android.headphonefx.playbackgain.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_15

    .line 1816
    const v12, 0x1001d

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1822
    :goto_9
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Dynamic System."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1824
    const-string v12, "viper4android.headphonefx.dynamicsystem.coeffs"

    .line 1825
    const-string v13, "100;5600;40;40;50;50"

    .line 1823
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1825
    const-string v13, ";"

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 1826
    .local v5, "dsParameter":[Ljava/lang/String;
    array-length v12, v5

    const/4 v13, 0x6

    if-ne v12, v13, :cond_3

    .line 1827
    const v12, 0x10022

    .line 1828
    const/4 v13, 0x0

    aget-object v13, v5, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    const/4 v14, 0x1

    aget-object v14, v5, v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 1827
    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13, v14}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x2(III)V

    .line 1829
    const v12, 0x10023

    .line 1830
    const/4 v13, 0x2

    aget-object v13, v5, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    const/4 v14, 0x3

    aget-object v14, v5, v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 1829
    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13, v14}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x2(III)V

    .line 1831
    const v12, 0x10024

    .line 1832
    const/4 v13, 0x4

    aget-object v13, v5, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    const/4 v14, 0x5

    aget-object v14, v5, v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 1831
    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13, v14}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x2(III)V

    .line 1835
    :cond_3
    const-string v12, "viper4android.headphonefx.dynamicsystem.bass"

    const-string v13, "0"

    .line 1834
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 1836
    .local v4, "dsBass":I
    mul-int/lit8 v12, v4, 0x14

    add-int/lit8 v4, v12, 0x64

    .line 1837
    const v12, 0x10025

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v4}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1838
    const-string v12, "viper4android.headphonefx.dynamicsystem.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_16

    .line 1839
    const v12, 0x10021

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1845
    :goto_a
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Fidelity Control."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1846
    const v12, 0x10027

    .line 1847
    const-string v13, "viper4android.headphonefx.fidelity.bass.mode"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1846
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1848
    const v12, 0x10028

    .line 1849
    const-string v13, "viper4android.headphonefx.fidelity.bass.freq"

    const-string v14, "40"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1848
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1850
    const v12, 0x10029

    .line 1851
    const-string v13, "viper4android.headphonefx.fidelity.bass.gain"

    const-string v14, "50"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1850
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1852
    const-string v12, "viper4android.headphonefx.fidelity.bass.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_17

    .line 1853
    const v12, 0x10026

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1857
    :goto_b
    const v12, 0x1002b

    .line 1858
    const-string v13, "viper4android.headphonefx.fidelity.clarity.mode"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1857
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1859
    const v12, 0x1002c

    .line 1861
    const-string v13, "viper4android.headphonefx.fidelity.clarity.gain"

    const-string v14, "50"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1859
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1863
    const-string v12, "viper4android.headphonefx.fidelity.clarity.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_18

    .line 1864
    const v12, 0x1002a

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1870
    :goto_c
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Cure System."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1871
    const v12, 0x1002e

    .line 1872
    const-string v13, "viper4android.headphonefx.cure.crossfeed"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1871
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1873
    const-string v12, "viper4android.headphonefx.cure.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_19

    .line 1874
    const v12, 0x1002d

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1880
    :goto_d
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Tube Simulator."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1881
    const-string v12, "viper4android.headphonefx.tube.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_1a

    .line 1882
    const v12, 0x1002f

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1888
    :goto_e
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Shutting down speaker optimizer."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1889
    const v12, 0x10041

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1892
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Limiter."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1893
    const v12, 0x10030

    .line 1894
    const-string v13, "viper4android.headphonefx.outvol"

    const-string v14, "100"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1893
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1895
    const v12, 0x10031

    .line 1896
    const-string v13, "viper4android.headphonefx.channelpan"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1895
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1897
    const v12, 0x10032

    .line 1898
    const-string v13, "viper4android.headphonefx.limiter"

    const-string v14, "100"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1897
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1901
    iget-boolean v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mWorkingWith3rd:Z

    if-nez v12, :cond_1d

    .line 1903
    const-string v12, "viper4android.global.forceenable.enable"

    const/4 v13, 0x0

    .line 1902
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    .line 1904
    .local v6, "forceEnable":Z
    if-eqz v6, :cond_1b

    .line 1905
    const v12, 0x9005

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1911
    :goto_f
    const-string v12, "viper4android.headphonefx.enable"

    const/4 v13, 0x0

    .line 1910
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    .line 1912
    .local v10, "masterControl":Z
    if-eqz p5, :cond_4

    .line 1913
    const/4 v10, 0x0

    .line 1915
    :cond_4
    if-eqz v10, :cond_1c

    .line 1916
    const v12, 0x9004

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1920
    :goto_10
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    invoke-virtual {v12, v10}, Landroid/media/audiofx/AudioEffect;->setEnabled(Z)I

    .line 2078
    .end local v2    # "colorfulMusic":[Ljava/lang/String;
    .end local v3    # "ddcCoeffs":[F
    .end local v4    # "dsBass":I
    .end local v5    # "dsParameter":[Ljava/lang/String;
    .end local v6    # "forceEnable":Z
    .end local v9    # "mConvIRFileName":Ljava/lang/String;
    .end local v10    # "masterControl":Z
    .end local v11    # "nSEValue":I
    :cond_5
    :goto_11
    if-eqz p4, :cond_6

    .line 2079
    const v12, 0x9003

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2081
    :cond_6
    const-string v12, "ViPER4Android"

    const-string v13, "System updated."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2082
    return-void

    .line 1704
    .restart local v3    # "ddcCoeffs":[F
    :cond_7
    const v12, 0x1000a

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_0

    .line 1714
    .restart local v11    # "nSEValue":I
    :cond_8
    const v12, 0x1000c

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_1

    .line 1721
    .restart local v7    # "i":I
    :cond_9
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mOverriddenEqualizerLevels:[F

    aget v12, v12, v7

    const/high16 v13, 0x42c80000

    mul-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v12

    .line 1722
    const/4 v13, 0x1

    .line 1721
    move-object/from16 v0, p3

    invoke-virtual {p0, v7, v12, v13, v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->setV4AEqualizerBandLevel(IIZLcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)V

    .line 1720
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_2

    .line 1725
    .end local v7    # "i":I
    :cond_a
    const-string v12, "viper4android.headphonefx.fireq.custom"

    .line 1726
    const-string v13, "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;"

    .line 1724
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1726
    const-string v13, ";"

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 1727
    .local v8, "levels":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "i":S
    :goto_12
    array-length v12, v8

    if-ge v7, v12, :cond_1

    .line 1728
    aget-object v12, v8, v7

    invoke-static {v12}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    const/high16 v13, 0x42c80000

    mul-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v12

    .line 1729
    const/4 v13, 0x1

    .line 1728
    move-object/from16 v0, p3

    invoke-virtual {p0, v7, v12, v13, v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->setV4AEqualizerBandLevel(IIZLcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)V

    .line 1727
    add-int/lit8 v12, v7, 0x1

    int-to-short v7, v12

    goto :goto_12

    .line 1735
    .end local v7    # "i":S
    .end local v8    # "levels":[Ljava/lang/String;
    :cond_b
    const v12, 0x1000f

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_3

    .line 1737
    :cond_c
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerLevels:[F

    if-eqz v12, :cond_d

    .line 1738
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_13
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerLevels:[F

    array-length v12, v12

    if-lt v7, v12, :cond_e

    .line 1742
    .end local v7    # "i":I
    :cond_d
    iget-boolean v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerEnabled:Z

    if-eqz v12, :cond_f

    .line 1743
    const v12, 0x1000f

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_3

    .line 1739
    .restart local v7    # "i":I
    :cond_e
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerLevels:[F

    aget v12, v12, v7

    const/high16 v13, 0x42c80000

    mul-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v12

    .line 1740
    const/4 v13, 0x1

    .line 1739
    move-object/from16 v0, p3

    invoke-virtual {p0, v7, v12, v13, v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->setV4AEqualizerBandLevel(IIZLcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)V

    .line 1738
    add-int/lit8 v7, v7, 0x1

    goto :goto_13

    .line 1745
    .end local v7    # "i":I
    :cond_f
    const v12, 0x1000f

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_3

    .line 1758
    .restart local v9    # "mConvIRFileName":Ljava/lang/String;
    :cond_10
    const v12, 0x10002

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_4

    .line 1773
    .restart local v2    # "colorfulMusic":[Ljava/lang/String;
    :cond_11
    const v12, 0x10011

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_5

    .line 1781
    :cond_12
    const v12, 0x10015

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_6

    .line 1789
    :cond_13
    const v12, 0x10008

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_7

    .line 1805
    :cond_14
    const v12, 0x10017

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_8

    .line 1818
    :cond_15
    const v12, 0x1001d

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_9

    .line 1841
    .restart local v4    # "dsBass":I
    .restart local v5    # "dsParameter":[Ljava/lang/String;
    :cond_16
    const v12, 0x10021

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_a

    .line 1855
    :cond_17
    const v12, 0x10026

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_b

    .line 1866
    :cond_18
    const v12, 0x1002a

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_c

    .line 1876
    :cond_19
    const v12, 0x1002d

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_d

    .line 1884
    :cond_1a
    const v12, 0x1002f

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_e

    .line 1907
    .restart local v6    # "forceEnable":Z
    :cond_1b
    const v12, 0x9005

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_f

    .line 1918
    .restart local v10    # "masterControl":Z
    :cond_1c
    const v12, 0x9004

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_10

    .line 1922
    .end local v6    # "forceEnable":Z
    .end local v10    # "masterControl":Z
    :cond_1d
    iget-boolean v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEnabled:Z

    if-eqz v12, :cond_1e

    .line 1923
    const v12, 0x9004

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1924
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Landroid/media/audiofx/AudioEffect;->setEnabled(Z)I

    goto/16 :goto_11

    .line 1926
    :cond_1e
    const v12, 0x9004

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1927
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/media/audiofx/AudioEffect;->setEnabled(Z)I

    goto/16 :goto_11

    .line 1933
    .end local v2    # "colorfulMusic":[Ljava/lang/String;
    .end local v3    # "ddcCoeffs":[F
    .end local v4    # "dsBass":I
    .end local v5    # "dsParameter":[Ljava/lang/String;
    .end local v9    # "mConvIRFileName":Ljava/lang/String;
    .end local v11    # "nSEValue":I
    :cond_1f
    const/4 v12, 0x2

    move/from16 v0, p2

    if-ne v0, v12, :cond_5

    .line 1934
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Commiting speaker-fx parameters"

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1937
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating ViPER-DDC."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1938
    const v12, 0x1000a

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1941
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Spectrum Extension."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1942
    const v12, 0x1000c

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1945
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating FIR Equalizer."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1946
    iget-boolean v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mWorkingWith3rd:Z

    if-nez v12, :cond_25

    .line 1947
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mOverriddenEqualizerLevels:[F

    if-eqz v12, :cond_23

    .line 1948
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_14
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mOverriddenEqualizerLevels:[F

    array-length v12, v12

    if-lt v7, v12, :cond_22

    .line 1961
    .end local v7    # "i":I
    :cond_20
    const-string v12, "viper4android.headphonefx.fireq.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_24

    .line 1962
    const v12, 0x10039

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1981
    :goto_15
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Reverberation."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1982
    const v12, 0x1003c

    .line 1983
    const-string v13, "viper4android.headphonefx.reverb.roomsize"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1982
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1984
    const v12, 0x1003d

    .line 1985
    const-string v13, "viper4android.headphonefx.reverb.roomwidth"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1984
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1986
    const v12, 0x1003e

    .line 1987
    const-string v13, "viper4android.headphonefx.reverb.damp"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1986
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1988
    const v12, 0x1003f

    .line 1989
    const-string v13, "viper4android.headphonefx.reverb.wet"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1988
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1990
    const v12, 0x10040

    .line 1991
    const-string v13, "viper4android.headphonefx.reverb.dry"

    const-string v14, "50"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1990
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1992
    const-string v12, "viper4android.headphonefx.reverb.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_29

    .line 1993
    const v12, 0x1003b

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 1999
    :goto_16
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Convolver."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2001
    const-string v12, "viper4android.headphonefx.convolver.kernel"

    const-string v13, ""

    .line 2000
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2002
    .restart local v9    # "mConvIRFileName":Ljava/lang/String;
    const/4 v12, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v9, v12}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setConvIRFile(Ljava/lang/String;Z)V

    .line 2003
    const v12, 0x10038

    .line 2004
    const-string v13, "viper4android.headphonefx.convolver.crosschannel"

    const-string v14, "0"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 2003
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2005
    const-string v12, "viper4android.headphonefx.convolver.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_2a

    .line 2006
    const v12, 0x10033

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2012
    :goto_17
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Shutting down tube simulator."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2013
    const v12, 0x1002f

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2016
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Speaker Optimizer."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2017
    const-string v12, "viper4android.speakerfx.spkopt.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_2b

    .line 2018
    const v12, 0x10041

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2024
    :goto_18
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating eXtraLoud."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2025
    const v12, 0x10043

    .line 2026
    const-string v13, "viper4android.headphonefx.playbackgain.ratio"

    const-string v14, "50"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 2025
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2027
    const v12, 0x10044

    .line 2028
    const-string v13, "viper4android.headphonefx.playbackgain.volume"

    const-string v14, "80"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 2027
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2029
    const v12, 0x10045

    .line 2030
    const-string v13, "viper4android.headphonefx.playbackgain.maxscaler"

    const-string v14, "400"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 2029
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2031
    const-string v12, "viper4android.headphonefx.playbackgain.enable"

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_2c

    .line 2032
    const v12, 0x10042

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2038
    :goto_19
    const-string v12, "ViPER4Android"

    const-string v13, "updateSystem(): Updating Limiter."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2039
    const v12, 0x10046

    .line 2040
    const-string v13, "viper4android.headphonefx.outvol"

    const-string v14, "100"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 2039
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2041
    const v12, 0x10047

    .line 2042
    const-string v13, "viper4android.speakerfx.limiter"

    const-string v14, "100"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 2041
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2045
    iget-boolean v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mWorkingWith3rd:Z

    if-nez v12, :cond_2f

    .line 2047
    const-string v12, "viper4android.global.forceenable.enable"

    const/4 v13, 0x0

    .line 2046
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    .line 2048
    .restart local v6    # "forceEnable":Z
    if-eqz v6, :cond_2d

    .line 2049
    const v12, 0x9005

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2055
    :goto_1a
    const-string v12, "viper4android.speakerfx.enable"

    const/4 v13, 0x0

    .line 2054
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    .line 2056
    .restart local v10    # "masterControl":Z
    if-eqz p5, :cond_21

    .line 2057
    const/4 v10, 0x0

    .line 2059
    :cond_21
    if-eqz v10, :cond_2e

    .line 2060
    const v12, 0x9004

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2064
    :goto_1b
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    invoke-virtual {v12, v10}, Landroid/media/audiofx/AudioEffect;->setEnabled(Z)I

    goto/16 :goto_11

    .line 1949
    .end local v6    # "forceEnable":Z
    .end local v9    # "mConvIRFileName":Ljava/lang/String;
    .end local v10    # "masterControl":Z
    .restart local v7    # "i":I
    :cond_22
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->mOverriddenEqualizerLevels:[F

    aget v12, v12, v7

    const/high16 v13, 0x42c80000

    mul-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v12

    .line 1950
    const/4 v13, 0x0

    .line 1949
    move-object/from16 v0, p3

    invoke-virtual {p0, v7, v12, v13, v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->setV4AEqualizerBandLevel(IIZLcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)V

    .line 1948
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_14

    .line 1954
    .end local v7    # "i":I
    :cond_23
    const-string v12, "viper4android.headphonefx.fireq.custom"

    .line 1955
    const-string v13, "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;"

    .line 1954
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1955
    const-string v13, ";"

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 1956
    .restart local v8    # "levels":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "i":S
    :goto_1c
    array-length v12, v8

    if-ge v7, v12, :cond_20

    .line 1958
    aget-object v12, v8, v7

    invoke-static {v12}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    const/high16 v13, 0x42c80000

    mul-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v12

    const/4 v13, 0x0

    .line 1957
    move-object/from16 v0, p3

    invoke-virtual {p0, v7, v12, v13, v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->setV4AEqualizerBandLevel(IIZLcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)V

    .line 1956
    add-int/lit8 v12, v7, 0x1

    int-to-short v7, v12

    goto :goto_1c

    .line 1964
    .end local v7    # "i":S
    .end local v8    # "levels":[Ljava/lang/String;
    :cond_24
    const v12, 0x10039

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_15

    .line 1967
    :cond_25
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerLevels:[F

    if-eqz v12, :cond_26

    .line 1968
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1d
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerLevels:[F

    array-length v12, v12

    if-lt v7, v12, :cond_27

    .line 1973
    .end local v7    # "i":I
    :cond_26
    iget-boolean v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerEnabled:Z

    if-eqz v12, :cond_28

    .line 1974
    const v12, 0x10039

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_15

    .line 1969
    .restart local v7    # "i":I
    :cond_27
    iget-object v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEqualizerLevels:[F

    aget v12, v12, v7

    const/high16 v13, 0x42c80000

    mul-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v12

    .line 1970
    const/4 v13, 0x0

    .line 1969
    move-object/from16 v0, p3

    invoke-virtual {p0, v7, v12, v13, v0}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->setV4AEqualizerBandLevel(IIZLcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;)V

    .line 1968
    add-int/lit8 v7, v7, 0x1

    goto :goto_1d

    .line 1976
    .end local v7    # "i":I
    :cond_28
    const v12, 0x10039

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_15

    .line 1995
    :cond_29
    const v12, 0x1003b

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_16

    .line 2008
    .restart local v9    # "mConvIRFileName":Ljava/lang/String;
    :cond_2a
    const v12, 0x10033

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_17

    .line 2020
    :cond_2b
    const v12, 0x10041

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_18

    .line 2034
    :cond_2c
    const v12, 0x10042

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_19

    .line 2051
    .restart local v6    # "forceEnable":Z
    :cond_2d
    const v12, 0x9005

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_1a

    .line 2062
    .restart local v10    # "masterControl":Z
    :cond_2e
    const v12, 0x9004

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    goto/16 :goto_1b

    .line 2066
    .end local v6    # "forceEnable":Z
    .end local v10    # "masterControl":Z
    :cond_2f
    iget-boolean v12, p0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService;->m3rdEnabled:Z

    if-eqz v12, :cond_30

    .line 2067
    const v12, 0x9004

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2068
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Landroid/media/audiofx/AudioEffect;->setEnabled(Z)I

    goto/16 :goto_11

    .line 2070
    :cond_30
    const v12, 0x9004

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13}, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->setParameter_px4_vx4x1(II)V

    .line 2071
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/vipercn/viper4android_v2/service/ViPER4AndroidService$V4ADSPModule;->mInstance:Landroid/media/audiofx/AudioEffect;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/media/audiofx/AudioEffect;->setEnabled(Z)I

    goto/16 :goto_11
.end method
