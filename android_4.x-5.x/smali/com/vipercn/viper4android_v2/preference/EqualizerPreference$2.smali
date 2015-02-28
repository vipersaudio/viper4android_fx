.class Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$2;
.super Ljava/lang/Object;
.source "EqualizerPreference.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->onBindDialogView(Landroid/view/View;)V
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
    iput-object p1, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$2;->this$0:Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/high16 v7, -0x3ec00000

    .line 70
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    .line 71
    .local v3, "x":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 73
    .local v4, "y":F
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$2;->this$0:Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;

    iget-object v5, v5, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mDialogEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    invoke-virtual {v5, v3}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->findClosest(F)I

    move-result v0

    .line 75
    .local v0, "band":I
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 76
    .local v2, "wy":I
    int-to-float v5, v2

    div-float v5, v4, v5

    const/high16 v6, -0x3e400000

    mul-float/2addr v5, v6

    sub-float v1, v5, v7

    .line 78
    .local v1, "level":F
    cmpg-float v5, v1, v7

    if-gez v5, :cond_1

    .line 79
    const/high16 v1, -0x3ec00000

    .line 84
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$2;->this$0:Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;

    iget-object v5, v5, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->mDialogEqualizer:Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;

    invoke-virtual {v5, v0, v1}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->setBand(IF)V

    .line 85
    iget-object v5, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference$2;->this$0:Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;

    invoke-virtual {v5}, Lcom/vipercn/viper4android_v2/preference/EqualizerPreference;->updateDspFromDialogEqualizer()V

    .line 86
    const/4 v5, 0x1

    return v5

    .line 80
    :cond_1
    const/high16 v5, 0x41400000

    cmpl-float v5, v1, v5

    if-lez v5, :cond_0

    .line 81
    const/high16 v1, 0x41400000

    goto :goto_0
.end method
