.class Lcom/vipercn/viper4android_v2/preference/Biquad;
.super Ljava/lang/Object;
.source "Biquad.java"


# instance fields
.field private mA0:Lcom/vipercn/viper4android_v2/preference/Complex;

.field private mA1:Lcom/vipercn/viper4android_v2/preference/Complex;

.field private mA2:Lcom/vipercn/viper4android_v2/preference/Complex;

.field private mB0:Lcom/vipercn/viper4android_v2/preference/Complex;

.field private mB1:Lcom/vipercn/viper4android_v2/preference/Complex;

.field private mB2:Lcom/vipercn/viper4android_v2/preference/Complex;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected evaluateTransfer(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;
    .locals 5
    .param p1, "z"    # Lcom/vipercn/viper4android_v2/preference/Complex;

    .prologue
    .line 25
    invoke-virtual {p1, p1}, Lcom/vipercn/viper4android_v2/preference/Complex;->mul(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v2

    .line 26
    .local v2, "zSquared":Lcom/vipercn/viper4android_v2/preference/Complex;
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mB0:Lcom/vipercn/viper4android_v2/preference/Complex;

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mB1:Lcom/vipercn/viper4android_v2/preference/Complex;

    invoke-virtual {v4, p1}, Lcom/vipercn/viper4android_v2/preference/Complex;->div(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vipercn/viper4android_v2/preference/Complex;->add(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v3

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mB2:Lcom/vipercn/viper4android_v2/preference/Complex;

    invoke-virtual {v4, v2}, Lcom/vipercn/viper4android_v2/preference/Complex;->div(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vipercn/viper4android_v2/preference/Complex;->add(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v1

    .line 27
    .local v1, "nom":Lcom/vipercn/viper4android_v2/preference/Complex;
    iget-object v3, p0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mA0:Lcom/vipercn/viper4android_v2/preference/Complex;

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mA1:Lcom/vipercn/viper4android_v2/preference/Complex;

    invoke-virtual {v4, p1}, Lcom/vipercn/viper4android_v2/preference/Complex;->div(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vipercn/viper4android_v2/preference/Complex;->add(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v3

    iget-object v4, p0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mA2:Lcom/vipercn/viper4android_v2/preference/Complex;

    invoke-virtual {v4, v2}, Lcom/vipercn/viper4android_v2/preference/Complex;->div(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vipercn/viper4android_v2/preference/Complex;->add(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v0

    .line 28
    .local v0, "den":Lcom/vipercn/viper4android_v2/preference/Complex;
    invoke-virtual {v1, v0}, Lcom/vipercn/viper4android_v2/preference/Complex;->div(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v3

    return-object v3
.end method

.method protected setHighShelf(DDD)V
    .locals 19
    .param p1, "centerFrequency"    # D
    .param p3, "samplingFrequency"    # D
    .param p5, "dbGain"    # D

    .prologue
    .line 12
    const-wide v8, 0x401921fb54442d18L

    mul-double v8, v8, p1

    div-double v6, v8, p3

    .line 13
    .local v6, "w0":D
    const-wide/high16 v8, 0x4024000000000000L

    const-wide/high16 v10, 0x4044000000000000L

    div-double v10, p5, v10

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    .line 14
    .local v2, "a":D
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    const-wide/high16 v10, 0x4000000000000000L

    div-double/2addr v8, v10

    const-wide/high16 v10, 0x3ff0000000000000L

    div-double/2addr v10, v2

    add-double/2addr v10, v2

    const-wide/16 v12, 0x0

    mul-double/2addr v10, v12

    const-wide/high16 v12, 0x4000000000000000L

    add-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    mul-double v4, v8, v10

    .line 16
    .local v4, "alpha":D
    new-instance v8, Lcom/vipercn/viper4android_v2/preference/Complex;

    const-wide/high16 v10, 0x3ff0000000000000L

    add-double/2addr v10, v2

    const-wide/high16 v12, 0x3ff0000000000000L

    sub-double v12, v2, v12

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    mul-double/2addr v12, v14

    add-double/2addr v10, v12

    const-wide/high16 v12, 0x4000000000000000L

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v14

    mul-double/2addr v12, v14

    mul-double/2addr v12, v4

    add-double/2addr v10, v12

    mul-double/2addr v10, v2

    const-wide/16 v12, 0x0

    invoke-direct {v8, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mB0:Lcom/vipercn/viper4android_v2/preference/Complex;

    .line 17
    new-instance v8, Lcom/vipercn/viper4android_v2/preference/Complex;

    const-wide/high16 v10, -0x4000000000000000L

    mul-double/2addr v10, v2

    const-wide/high16 v12, 0x3ff0000000000000L

    sub-double v12, v2, v12

    const-wide/high16 v14, 0x3ff0000000000000L

    add-double/2addr v14, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v16

    mul-double v14, v14, v16

    add-double/2addr v12, v14

    mul-double/2addr v10, v12

    const-wide/16 v12, 0x0

    invoke-direct {v8, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mB1:Lcom/vipercn/viper4android_v2/preference/Complex;

    .line 18
    new-instance v8, Lcom/vipercn/viper4android_v2/preference/Complex;

    const-wide/high16 v10, 0x3ff0000000000000L

    add-double/2addr v10, v2

    const-wide/high16 v12, 0x3ff0000000000000L

    sub-double v12, v2, v12

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    mul-double/2addr v12, v14

    add-double/2addr v10, v12

    const-wide/high16 v12, 0x4000000000000000L

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v14

    mul-double/2addr v12, v14

    mul-double/2addr v12, v4

    sub-double/2addr v10, v12

    mul-double/2addr v10, v2

    const-wide/16 v12, 0x0

    invoke-direct {v8, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mB2:Lcom/vipercn/viper4android_v2/preference/Complex;

    .line 19
    new-instance v8, Lcom/vipercn/viper4android_v2/preference/Complex;

    const-wide/high16 v10, 0x3ff0000000000000L

    add-double/2addr v10, v2

    const-wide/high16 v12, 0x3ff0000000000000L

    sub-double v12, v2, v12

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    mul-double/2addr v12, v14

    sub-double/2addr v10, v12

    const-wide/high16 v12, 0x4000000000000000L

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v14

    mul-double/2addr v12, v14

    mul-double/2addr v12, v4

    add-double/2addr v10, v12

    const-wide/16 v12, 0x0

    invoke-direct {v8, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mA0:Lcom/vipercn/viper4android_v2/preference/Complex;

    .line 20
    new-instance v8, Lcom/vipercn/viper4android_v2/preference/Complex;

    const-wide/high16 v10, 0x4000000000000000L

    const-wide/high16 v12, 0x3ff0000000000000L

    sub-double v12, v2, v12

    const-wide/high16 v14, 0x3ff0000000000000L

    add-double/2addr v14, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v16

    mul-double v14, v14, v16

    sub-double/2addr v12, v14

    mul-double/2addr v10, v12

    const-wide/16 v12, 0x0

    invoke-direct {v8, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mA1:Lcom/vipercn/viper4android_v2/preference/Complex;

    .line 21
    new-instance v8, Lcom/vipercn/viper4android_v2/preference/Complex;

    const-wide/high16 v10, 0x3ff0000000000000L

    add-double/2addr v10, v2

    const-wide/high16 v12, 0x3ff0000000000000L

    sub-double v12, v2, v12

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    mul-double/2addr v12, v14

    sub-double/2addr v10, v12

    const-wide/high16 v12, 0x4000000000000000L

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v14

    mul-double/2addr v12, v14

    mul-double/2addr v12, v4

    sub-double/2addr v10, v12

    const-wide/16 v12, 0x0

    invoke-direct {v8, v10, v11, v12, v13}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/vipercn/viper4android_v2/preference/Biquad;->mA2:Lcom/vipercn/viper4android_v2/preference/Complex;

    .line 22
    return-void
.end method
