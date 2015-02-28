.class public Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;
.super Landroid/view/SurfaceView;
.source "EqualizerSurface.java"


# static fields
.field public static final MAX_DB:I = 0xc

.field private static final MAX_FREQ:I = 0x5208

.field public static final MIN_DB:I = -0xc

.field private static final MIN_FREQ:I = 0xa

.field private static final SAMPLING_RATE:I = 0xac44


# instance fields
.field private final mControlBar:Landroid/graphics/Paint;

.field private final mControlBarKnob:Landroid/graphics/Paint;

.field private final mControlBarText:Landroid/graphics/Paint;

.field private final mFrequencyResponseBg:Landroid/graphics/Paint;

.field private final mFrequencyResponseHighlight:Landroid/graphics/Paint;

.field private final mFrequencyResponseHighlight2:Landroid/graphics/Paint;

.field private final mGridLines:Landroid/graphics/Paint;

.field private mHeight:I

.field private mLevels:[F

.field private final mWhite:Landroid/graphics/Paint;

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    const v7, 0x7f060004

    const/high16 v6, 0x7f060000

    const/high16 v5, 0x40000000

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 36
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    const/16 v0, 0xa

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    .line 37
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->setWillNotDraw(Z)V

    .line 39
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWhite:Landroid/graphics/Paint;

    .line 40
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWhite:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 41
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWhite:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 42
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWhite:Landroid/graphics/Paint;

    const/high16 v1, 0x41500000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 43
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWhite:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 45
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mGridLines:Landroid/graphics/Paint;

    .line 46
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mGridLines:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060003

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 47
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mGridLines:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 49
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWhite:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarText:Landroid/graphics/Paint;

    .line 50
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarText:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 51
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarText:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v5, v4, v4, v1}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 53
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBar:Landroid/graphics/Paint;

    .line 54
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBar:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 55
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBar:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 56
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBar:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 57
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBar:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 58
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBar:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060002

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v5, v4, v4, v1}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 60
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarKnob:Landroid/graphics/Paint;

    .line 61
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarKnob:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 62
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarKnob:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 63
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarKnob:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 65
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseBg:Landroid/graphics/Paint;

    .line 66
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseBg:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 67
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseBg:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 69
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight:Landroid/graphics/Paint;

    .line 70
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 71
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight:Landroid/graphics/Paint;

    const/high16 v1, 0x40c00000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 72
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060005

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 75
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight2:Landroid/graphics/Paint;

    .line 76
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight2:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 77
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight2:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 78
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight2:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060006

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 79
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight2:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 80
    return-void
.end method

.method private lin2dB(D)D
    .locals 5
    .param p1, "rho"    # D

    .prologue
    .line 287
    const-wide/16 v0, 0x0

    cmpl-double v0, p1, v0

    if-eqz v0, :cond_0

    invoke-static {p1, p2}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4024000000000000L

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    const-wide/high16 v2, 0x4034000000000000L

    mul-double/2addr v0, v2

    :goto_0
    return-wide v0

    :cond_0
    const-wide v0, -0x3fa7066666666666L

    goto :goto_0
.end method

.method private projectX(D)F
    .locals 11
    .param p1, "freq"    # D

    .prologue
    .line 269
    invoke-static {p1, p2}, Ljava/lang/Math;->log(D)D

    move-result-wide v4

    .line 270
    .local v4, "pos":D
    const-wide/high16 v6, 0x4024000000000000L

    invoke-static {v6, v7}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    .line 271
    .local v2, "minPos":D
    const-wide v6, 0x40d4820000000000L

    invoke-static {v6, v7}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    .line 272
    .local v0, "maxPos":D
    sub-double v6, v4, v2

    sub-double v8, v0, v2

    div-double/2addr v6, v8

    double-to-float v6, v6

    return v6
.end method

.method private projectY(D)F
    .locals 7
    .param p1, "dB"    # D

    .prologue
    .line 282
    const-wide/high16 v2, -0x3fd8000000000000L

    sub-double v2, p1, v2

    const-wide/high16 v4, 0x4038000000000000L

    div-double v0, v2, v4

    .line 283
    .local v0, "pos":D
    const-wide/high16 v2, 0x3ff0000000000000L

    sub-double/2addr v2, v0

    double-to-float v2, v2

    return v2
.end method

.method private reverseProjectX(F)D
    .locals 8
    .param p1, "pos"    # F

    .prologue
    .line 276
    const-wide/high16 v4, 0x4024000000000000L

    invoke-static {v4, v5}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    .line 277
    .local v2, "minPos":D
    const-wide v4, 0x40d4820000000000L

    invoke-static {v4, v5}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    .line 278
    .local v0, "maxPos":D
    float-to-double v4, p1

    sub-double v6, v0, v2

    mul-double/2addr v4, v6

    add-double/2addr v4, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->exp(D)D

    move-result-wide v4

    return-wide v4
.end method


# virtual methods
.method public findClosest(F)I
    .locals 14
    .param p1, "px"    # F

    .prologue
    .line 297
    const/4 v6, 0x0

    .line 298
    .local v6, "idx":I
    const v0, 0x4e6e6b28

    .line 299
    .local v0, "best":F
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v7, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    array-length v7, v7

    if-lt v3, v7, :cond_0

    .line 310
    return v6

    .line 300
    :cond_0
    const-wide v8, 0x402f400000000000L

    const-wide/high16 v10, 0x4000000000000000L

    add-int/lit8 v7, v3, 0x1

    int-to-double v12, v7

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    mul-double v4, v8, v10

    .line 301
    .local v4, "freq":D
    invoke-direct {p0, v4, v5}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->projectX(D)F

    move-result v7

    iget v8, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWidth:I

    int-to-float v8, v8

    mul-float v1, v7, v8

    .line 302
    .local v1, "cx":F
    sub-float v7, v1, p1

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 304
    .local v2, "distance":F
    cmpg-float v7, v2, v0

    if-gez v7, :cond_1

    .line 305
    move v6, v3

    .line 306
    move v0, v2

    .line 299
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public getBand(I)F
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 155
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    aget v0, v0, p1

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 99
    invoke-super {p0}, Landroid/view/SurfaceView;->onAttachedToWindow()V

    .line 100
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->setLayerType(ILandroid/graphics/Paint;)V

    .line 101
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->buildLayer()V

    .line 102
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 36
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 161
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v4, v5}, Landroid/graphics/Canvas;->drawRGB(III)V

    .line 163
    const/16 v2, 0x9

    new-array v10, v2, [Lcom/vipercn/viper4android_v2/preference/Biquad;

    const/4 v2, 0x0

    .line 164
    new-instance v4, Lcom/vipercn/viper4android_v2/preference/Biquad;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/preference/Biquad;-><init>()V

    aput-object v4, v10, v2

    const/4 v2, 0x1

    .line 165
    new-instance v4, Lcom/vipercn/viper4android_v2/preference/Biquad;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/preference/Biquad;-><init>()V

    aput-object v4, v10, v2

    const/4 v2, 0x2

    .line 166
    new-instance v4, Lcom/vipercn/viper4android_v2/preference/Biquad;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/preference/Biquad;-><init>()V

    aput-object v4, v10, v2

    const/4 v2, 0x3

    .line 167
    new-instance v4, Lcom/vipercn/viper4android_v2/preference/Biquad;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/preference/Biquad;-><init>()V

    aput-object v4, v10, v2

    const/4 v2, 0x4

    .line 168
    new-instance v4, Lcom/vipercn/viper4android_v2/preference/Biquad;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/preference/Biquad;-><init>()V

    aput-object v4, v10, v2

    const/4 v2, 0x5

    .line 169
    new-instance v4, Lcom/vipercn/viper4android_v2/preference/Biquad;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/preference/Biquad;-><init>()V

    aput-object v4, v10, v2

    const/4 v2, 0x6

    .line 170
    new-instance v4, Lcom/vipercn/viper4android_v2/preference/Biquad;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/preference/Biquad;-><init>()V

    aput-object v4, v10, v2

    const/4 v2, 0x7

    .line 171
    new-instance v4, Lcom/vipercn/viper4android_v2/preference/Biquad;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/preference/Biquad;-><init>()V

    aput-object v4, v10, v2

    const/16 v2, 0x8

    .line 172
    new-instance v4, Lcom/vipercn/viper4android_v2/preference/Biquad;

    invoke-direct {v4}, Lcom/vipercn/viper4android_v2/preference/Biquad;-><init>()V

    aput-object v4, v10, v2

    .line 181
    .local v10, "biquads":[Lcom/vipercn/viper4android_v2/preference/Biquad;
    const-wide/high16 v4, 0x4024000000000000L

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    const/4 v7, 0x0

    aget v2, v2, v7

    const/high16 v7, 0x41a00000

    div-float/2addr v2, v7

    float-to-double v8, v2

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v18

    .line 182
    .local v18, "gain":D
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_0
    array-length v2, v10

    move/from16 v0, v20

    if-lt v0, v2, :cond_0

    .line 187
    new-instance v11, Landroid/graphics/Path;

    invoke-direct {v11}, Landroid/graphics/Path;-><init>()V

    .line 188
    .local v11, "freqResponse":Landroid/graphics/Path;
    const/16 v20, 0x0

    :goto_1
    const/16 v2, 0x47

    move/from16 v0, v20

    if-lt v0, v2, :cond_1

    .line 220
    new-instance v16, Landroid/graphics/Path;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/Path;-><init>()V

    .line 221
    .local v16, "freqResponseBg":Landroid/graphics/Path;
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 222
    const/4 v2, 0x0

    const/high16 v4, -0x3f800000

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v4}, Landroid/graphics/Path;->offset(FF)V

    .line 223
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWidth:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    int-to-float v4, v4

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 224
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    int-to-float v4, v4

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 225
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Path;->close()V

    .line 226
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseBg:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 228
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 229
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseHighlight2:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 232
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWidth:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v5, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWhite:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 235
    const/16 v14, 0xa

    .local v14, "freq":I
    :goto_2
    const/16 v2, 0x5208

    if-lt v14, v2, :cond_3

    .line 248
    const/16 v12, -0x9

    .local v12, "dB":I
    :goto_3
    const/16 v2, 0x9

    if-le v12, v2, :cond_7

    .line 254
    const/16 v20, 0x0

    .end local v14    # "freq":I
    :goto_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    array-length v2, v2

    move/from16 v0, v20

    if-lt v0, v2, :cond_8

    .line 266
    return-void

    .line 183
    .end local v11    # "freqResponse":Landroid/graphics/Path;
    .end local v12    # "dB":I
    .end local v16    # "freqResponseBg":Landroid/graphics/Path;
    :cond_0
    const-wide v4, 0x402f400000000000L

    const-wide/high16 v8, 0x4000000000000000L

    add-int/lit8 v2, v20, 0x1

    int-to-double v0, v2

    move-wide/from16 v34, v0

    move-wide/from16 v0, v34

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    mul-double v14, v4, v8

    .line 184
    .local v14, "freq":D
    aget-object v3, v10, v20

    const-wide/high16 v4, 0x4000000000000000L

    mul-double/2addr v4, v14

    const-wide v6, 0x40e5888000000000L

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    add-int/lit8 v8, v20, 0x1

    aget v2, v2, v8

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    aget v8, v8, v20

    sub-float/2addr v2, v8

    float-to-double v8, v2

    invoke-virtual/range {v3 .. v9}, Lcom/vipercn/viper4android_v2/preference/Biquad;->setHighShelf(DDD)V

    .line 182
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_0

    .line 189
    .end local v14    # "freq":D
    .restart local v11    # "freqResponse":Landroid/graphics/Path;
    :cond_1
    move/from16 v0, v20

    int-to-float v2, v0

    const/high16 v4, 0x428c0000

    div-float/2addr v2, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->reverseProjectX(F)D

    move-result-wide v14

    .line 190
    .restart local v14    # "freq":D
    const-wide v4, 0x40e5888000000000L

    div-double v4, v14, v4

    const-wide v8, 0x400921fb54442d18L

    mul-double/2addr v4, v8

    const-wide/high16 v8, 0x4000000000000000L

    mul-double v22, v4, v8

    .line 191
    .local v22, "omega":D
    new-instance v21, Lcom/vipercn/viper4android_v2/preference/Complex;

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    move-object/from16 v0, v21

    invoke-direct {v0, v4, v5, v8, v9}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    .line 196
    .local v21, "z":Lcom/vipercn/viper4android_v2/preference/Complex;
    const/4 v2, 0x0

    aget-object v2, v10, v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/vipercn/viper4android_v2/preference/Biquad;->evaluateTransfer(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v25

    .line 197
    .local v25, "z2":Lcom/vipercn/viper4android_v2/preference/Complex;
    const/4 v2, 0x1

    aget-object v2, v10, v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/vipercn/viper4android_v2/preference/Biquad;->evaluateTransfer(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v26

    .line 198
    .local v26, "z3":Lcom/vipercn/viper4android_v2/preference/Complex;
    const/4 v2, 0x2

    aget-object v2, v10, v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/vipercn/viper4android_v2/preference/Biquad;->evaluateTransfer(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v27

    .line 199
    .local v27, "z4":Lcom/vipercn/viper4android_v2/preference/Complex;
    const/4 v2, 0x3

    aget-object v2, v10, v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/vipercn/viper4android_v2/preference/Biquad;->evaluateTransfer(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v28

    .line 200
    .local v28, "z5":Lcom/vipercn/viper4android_v2/preference/Complex;
    const/4 v2, 0x4

    aget-object v2, v10, v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/vipercn/viper4android_v2/preference/Biquad;->evaluateTransfer(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v29

    .line 201
    .local v29, "z6":Lcom/vipercn/viper4android_v2/preference/Complex;
    const/4 v2, 0x5

    aget-object v2, v10, v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/vipercn/viper4android_v2/preference/Biquad;->evaluateTransfer(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v30

    .line 202
    .local v30, "z7":Lcom/vipercn/viper4android_v2/preference/Complex;
    const/4 v2, 0x6

    aget-object v2, v10, v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/vipercn/viper4android_v2/preference/Biquad;->evaluateTransfer(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v31

    .line 203
    .local v31, "z8":Lcom/vipercn/viper4android_v2/preference/Complex;
    const/4 v2, 0x7

    aget-object v2, v10, v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/vipercn/viper4android_v2/preference/Biquad;->evaluateTransfer(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v32

    .line 204
    .local v32, "z9":Lcom/vipercn/viper4android_v2/preference/Complex;
    const/16 v2, 0x8

    aget-object v2, v10, v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/vipercn/viper4android_v2/preference/Biquad;->evaluateTransfer(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v24

    .line 207
    .local v24, "z10":Lcom/vipercn/viper4android_v2/preference/Complex;
    invoke-virtual/range {v25 .. v25}, Lcom/vipercn/viper4android_v2/preference/Complex;->rho()D

    move-result-wide v4

    mul-double v4, v4, v18

    invoke-virtual/range {v26 .. v26}, Lcom/vipercn/viper4android_v2/preference/Complex;->rho()D

    move-result-wide v8

    mul-double/2addr v4, v8

    invoke-virtual/range {v27 .. v27}, Lcom/vipercn/viper4android_v2/preference/Complex;->rho()D

    move-result-wide v8

    mul-double/2addr v4, v8

    invoke-virtual/range {v28 .. v28}, Lcom/vipercn/viper4android_v2/preference/Complex;->rho()D

    move-result-wide v8

    mul-double/2addr v4, v8

    invoke-virtual/range {v29 .. v29}, Lcom/vipercn/viper4android_v2/preference/Complex;->rho()D

    move-result-wide v8

    mul-double/2addr v4, v8

    .line 208
    invoke-virtual/range {v30 .. v30}, Lcom/vipercn/viper4android_v2/preference/Complex;->rho()D

    move-result-wide v8

    mul-double/2addr v4, v8

    invoke-virtual/range {v31 .. v31}, Lcom/vipercn/viper4android_v2/preference/Complex;->rho()D

    move-result-wide v8

    mul-double/2addr v4, v8

    invoke-virtual/range {v32 .. v32}, Lcom/vipercn/viper4android_v2/preference/Complex;->rho()D

    move-result-wide v8

    mul-double/2addr v4, v8

    invoke-virtual/range {v24 .. v24}, Lcom/vipercn/viper4android_v2/preference/Complex;->rho()D

    move-result-wide v8

    mul-double/2addr v4, v8

    .line 207
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->lin2dB(D)D

    move-result-wide v12

    .line 209
    .local v12, "dB":D
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->projectX(D)F

    move-result v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWidth:I

    int-to-float v4, v4

    mul-float v3, v2, v4

    .line 210
    .local v3, "x":F
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->projectY(D)F

    move-result v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    int-to-float v4, v4

    mul-float v6, v2, v4

    .line 213
    .local v6, "y":F
    if-nez v20, :cond_2

    .line 214
    invoke-virtual {v11, v3, v6}, Landroid/graphics/Path;->moveTo(FF)V

    .line 188
    :goto_5
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_1

    .line 216
    :cond_2
    invoke-virtual {v11, v3, v6}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_5

    .line 236
    .end local v3    # "x":F
    .end local v6    # "y":F
    .end local v12    # "dB":D
    .end local v21    # "z":Lcom/vipercn/viper4android_v2/preference/Complex;
    .end local v22    # "omega":D
    .end local v24    # "z10":Lcom/vipercn/viper4android_v2/preference/Complex;
    .end local v25    # "z2":Lcom/vipercn/viper4android_v2/preference/Complex;
    .end local v26    # "z3":Lcom/vipercn/viper4android_v2/preference/Complex;
    .end local v27    # "z4":Lcom/vipercn/viper4android_v2/preference/Complex;
    .end local v28    # "z5":Lcom/vipercn/viper4android_v2/preference/Complex;
    .end local v29    # "z6":Lcom/vipercn/viper4android_v2/preference/Complex;
    .end local v30    # "z7":Lcom/vipercn/viper4android_v2/preference/Complex;
    .end local v31    # "z8":Lcom/vipercn/viper4android_v2/preference/Complex;
    .end local v32    # "z9":Lcom/vipercn/viper4android_v2/preference/Complex;
    .local v14, "freq":I
    .restart local v16    # "freqResponseBg":Landroid/graphics/Path;
    :cond_3
    int-to-double v4, v14

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->projectX(D)F

    move-result v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWidth:I

    int-to-float v4, v4

    mul-float v3, v2, v4

    .line 237
    .restart local v3    # "x":F
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mGridLines:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    move v5, v3

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 238
    const/16 v2, 0x64

    if-ge v14, v2, :cond_4

    .line 239
    add-int/lit8 v14, v14, 0xa

    .line 240
    goto/16 :goto_2

    :cond_4
    const/16 v2, 0x3e8

    if-ge v14, v2, :cond_5

    .line 241
    add-int/lit8 v14, v14, 0x64

    .line 242
    goto/16 :goto_2

    .line 243
    :cond_5
    const/16 v2, 0x2710

    if-ge v14, v2, :cond_6

    const/16 v2, 0x3e8

    :goto_6
    add-int/2addr v14, v2

    goto/16 :goto_2

    :cond_6
    const/16 v2, 0x2710

    goto :goto_6

    .line 249
    .end local v3    # "x":F
    .local v12, "dB":I
    :cond_7
    int-to-double v4, v12

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->projectY(D)F

    move-result v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    int-to-float v4, v4

    mul-float v6, v2, v4

    .line 250
    .restart local v6    # "y":F
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWidth:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v7, v2

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mGridLines:Landroid/graphics/Paint;

    move-object/from16 v4, p1

    move v8, v6

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 251
    const-string v2, "%+d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v5

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/high16 v4, 0x3f800000

    const/high16 v5, 0x3f800000

    sub-float v5, v6, v5

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWhite:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v4, v5, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 248
    add-int/lit8 v12, v12, 0x3

    goto/16 :goto_3

    .line 255
    .end local v6    # "y":F
    .end local v14    # "freq":I
    :cond_8
    const-wide v4, 0x402f400000000000L

    const-wide/high16 v8, 0x4000000000000000L

    add-int/lit8 v2, v20, 0x1

    int-to-double v0, v2

    move-wide/from16 v34, v0

    move-wide/from16 v0, v34

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    mul-double v14, v4, v8

    .line 256
    .local v14, "freq":D
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->projectX(D)F

    move-result v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWidth:I

    int-to-float v4, v4

    mul-float v3, v2, v4

    .line 257
    .restart local v3    # "x":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    aget v2, v2, v20

    float-to-double v4, v2

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->projectY(D)F

    move-result v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    int-to-float v4, v4

    mul-float v6, v2, v4

    .line 258
    .restart local v6    # "y":F
    const-wide v4, 0x408f400000000000L

    cmpg-double v2, v14, v4

    if-gez v2, :cond_9

    const-string v2, "%.0f"

    :goto_7
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 259
    const-wide v8, 0x408f400000000000L

    cmpg-double v7, v14, v8

    if-gez v7, :cond_a

    .end local v14    # "freq":D
    :goto_8
    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    aput-object v7, v4, v5

    .line 258
    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    .line 261
    .local v17, "frequencyText":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    int-to-float v4, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBar:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    move v5, v3

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 262
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBar:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v2

    const v4, 0x3f28f5c3

    mul-float/2addr v2, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarKnob:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v6, v2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 263
    const-string v2, "%+1.1f"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    aget v7, v7, v20

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v4, v5

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    add-int/lit8 v4, v4, -0x2

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarText:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 264
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWhite:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getTextSize()F

    move-result v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarText:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 254
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_4

    .line 258
    .end local v17    # "frequencyText":Ljava/lang/String;
    .restart local v14    # "freq":D
    :cond_9
    const-string v2, "%.0fk"

    goto :goto_7

    .line 259
    :cond_a
    const-wide v8, 0x408f400000000000L

    div-double/2addr v14, v8

    goto :goto_8
.end method

.method protected onLayout(ZIIII)V
    .locals 18
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 106
    invoke-super/range {p0 .. p5}, Landroid/view/SurfaceView;->onLayout(ZIIII)V

    .line 108
    invoke-virtual/range {p0 .. p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    .line 109
    .local v17, "res":Landroid/content/res/Resources;
    sub-int v1, p4, p2

    move-object/from16 v0, p0

    iput v1, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mWidth:I

    .line 110
    sub-int v1, p5, p3

    move-object/from16 v0, p0

    iput v1, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    .line 112
    const/high16 v1, 0x7f080000

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v16

    .line 113
    .local v16, "barWidth":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBar:Landroid/graphics/Paint;

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 114
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBarKnob:Landroid/graphics/Paint;

    const/high16 v2, 0x3f000000

    mul-float v2, v2, v16

    const/4 v3, 0x0

    const/4 v4, 0x0

    const v5, 0x7f060001

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 123
    const/4 v1, 0x5

    new-array v6, v1, [I

    const/4 v1, 0x0

    .line 124
    const v2, 0x7f060007

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    aput v2, v6, v1

    const/4 v1, 0x1

    .line 125
    const v2, 0x7f060008

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    aput v2, v6, v1

    const/4 v1, 0x2

    .line 126
    const v2, 0x7f060009

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    aput v2, v6, v1

    const/4 v1, 0x3

    .line 127
    const v2, 0x7f06000a

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    aput v2, v6, v1

    const/4 v1, 0x4

    .line 128
    const v2, 0x7f06000b

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    aput v2, v6, v1

    .line 130
    .local v6, "responseColors":[I
    const/4 v1, 0x5

    new-array v7, v1, [F

    fill-array-data v7, :array_0

    .line 134
    .local v7, "responsePositions":[F
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mFrequencyResponseBg:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/LinearGradient;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget v5, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    int-to-float v5, v5

    .line 135
    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 134
    invoke-virtual {v9, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 137
    const/4 v1, 0x2

    new-array v13, v1, [I

    const/4 v1, 0x0

    .line 138
    const v2, 0x7f06000c

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    aput v2, v13, v1

    const/4 v1, 0x1

    .line 139
    const v2, 0x7f06000d

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    aput v2, v13, v1

    .line 141
    .local v13, "barColors":[I
    const/4 v1, 0x2

    new-array v14, v1, [F

    fill-array-data v14, :array_1

    .line 145
    .local v14, "barPositions":[F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mControlBar:Landroid/graphics/Paint;

    new-instance v8, Landroid/graphics/LinearGradient;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mHeight:I

    int-to-float v12, v2

    .line 146
    sget-object v15, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v8 .. v15}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 145
    invoke-virtual {v1, v8}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 147
    return-void

    .line 130
    nop

    :array_0
    .array-data 4
        0x0
        0x3e4ccccd
        0x3ee66666
        0x3f19999a
        0x3f800000
    .end array-data

    .line 141
    :array_1
    .array-data 4
        0x0
        0x3f800000
    .end array-data
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2
    .param p1, "p"    # Landroid/os/Parcelable;

    .prologue
    .line 92
    move-object v0, p1

    check-cast v0, Landroid/os/Bundle;

    .line 93
    .local v0, "b":Landroid/os/Bundle;
    const-string v1, "super"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/SurfaceView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 94
    const-string v1, "levels"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getFloatArray(Ljava/lang/String;)[F

    move-result-object v1

    iput-object v1, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    .line 95
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 84
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 85
    .local v0, "b":Landroid/os/Bundle;
    const-string v1, "super"

    invoke-super {p0}, Landroid/view/SurfaceView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 86
    const-string v1, "levels"

    iget-object v2, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    .line 87
    return-object v0
.end method

.method public setBand(IF)V
    .locals 1
    .param p1, "i"    # I
    .param p2, "value"    # F

    .prologue
    .line 150
    iget-object v0, p0, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->mLevels:[F

    aput p2, v0, p1

    .line 151
    invoke-virtual {p0}, Lcom/vipercn/viper4android_v2/preference/EqualizerSurface;->postInvalidate()V

    .line 152
    return-void
.end method
