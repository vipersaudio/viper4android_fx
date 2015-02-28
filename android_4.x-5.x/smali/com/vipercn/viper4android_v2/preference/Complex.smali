.class Lcom/vipercn/viper4android_v2/preference/Complex;
.super Ljava/lang/Object;
.source "Complex.java"


# instance fields
.field private final mIm:D

.field private final mReal:D


# direct methods
.method protected constructor <init>(DD)V
    .locals 1
    .param p1, "real"    # D
    .param p3, "im"    # D

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput-wide p1, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    .line 8
    iput-wide p3, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    .line 9
    return-void
.end method


# virtual methods
.method protected add(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;
    .locals 8
    .param p1, "other"    # Lcom/vipercn/viper4android_v2/preference/Complex;

    .prologue
    .line 24
    new-instance v0, Lcom/vipercn/viper4android_v2/preference/Complex;

    iget-wide v2, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    iget-wide v4, p1, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    add-double/2addr v2, v4

    iget-wide v4, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    iget-wide v6, p1, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    add-double/2addr v4, v6

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    return-object v0
.end method

.method protected con()Lcom/vipercn/viper4android_v2/preference/Complex;
    .locals 6

    .prologue
    .line 20
    new-instance v0, Lcom/vipercn/viper4android_v2/preference/Complex;

    iget-wide v2, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    iget-wide v4, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    neg-double v4, v4

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    return-object v0
.end method

.method protected div(D)Lcom/vipercn/viper4android_v2/preference/Complex;
    .locals 7
    .param p1, "a"    # D

    .prologue
    .line 42
    new-instance v0, Lcom/vipercn/viper4android_v2/preference/Complex;

    iget-wide v2, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    div-double/2addr v2, p1

    iget-wide v4, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    div-double/2addr v4, p1

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    return-object v0
.end method

.method protected div(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;
    .locals 8
    .param p1, "other"    # Lcom/vipercn/viper4android_v2/preference/Complex;

    .prologue
    .line 37
    iget-wide v2, p1, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    iget-wide v4, p1, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    mul-double/2addr v2, v4

    iget-wide v4, p1, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    iget-wide v6, p1, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    mul-double/2addr v4, v6

    add-double v0, v2, v4

    .line 38
    .local v0, "lengthSquared":D
    invoke-virtual {p1}, Lcom/vipercn/viper4android_v2/preference/Complex;->con()Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vipercn/viper4android_v2/preference/Complex;->mul(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/vipercn/viper4android_v2/preference/Complex;->div(D)Lcom/vipercn/viper4android_v2/preference/Complex;

    move-result-object v2

    return-object v2
.end method

.method protected mul(D)Lcom/vipercn/viper4android_v2/preference/Complex;
    .locals 7
    .param p1, "a"    # D

    .prologue
    .line 33
    new-instance v0, Lcom/vipercn/viper4android_v2/preference/Complex;

    iget-wide v2, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    mul-double/2addr v2, p1

    iget-wide v4, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    mul-double/2addr v4, p1

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    return-object v0
.end method

.method protected mul(Lcom/vipercn/viper4android_v2/preference/Complex;)Lcom/vipercn/viper4android_v2/preference/Complex;
    .locals 10
    .param p1, "other"    # Lcom/vipercn/viper4android_v2/preference/Complex;

    .prologue
    .line 28
    new-instance v0, Lcom/vipercn/viper4android_v2/preference/Complex;

    iget-wide v2, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    iget-wide v4, p1, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    mul-double/2addr v2, v4

    iget-wide v4, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    iget-wide v6, p1, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    mul-double/2addr v4, v6

    sub-double/2addr v2, v4

    .line 29
    iget-wide v4, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    iget-wide v6, p1, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    mul-double/2addr v4, v6

    iget-wide v6, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    iget-wide v8, p1, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    mul-double/2addr v6, v8

    add-double/2addr v4, v6

    .line 28
    invoke-direct {v0, v2, v3, v4, v5}, Lcom/vipercn/viper4android_v2/preference/Complex;-><init>(DD)V

    return-object v0
.end method

.method protected rho()D
    .locals 6

    .prologue
    .line 12
    iget-wide v0, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    iget-wide v2, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    mul-double/2addr v0, v2

    iget-wide v2, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    iget-wide v4, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    mul-double/2addr v2, v4

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method protected theta()D
    .locals 4

    .prologue
    .line 16
    iget-wide v0, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mIm:D

    iget-wide v2, p0, Lcom/vipercn/viper4android_v2/preference/Complex;->mReal:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    return-wide v0
.end method
