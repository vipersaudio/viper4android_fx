package com.vipercn.viper4android_v2.preference;

class Complex {
    private final double mReal, mIm;

    protected Complex(double real, double im) {
        mReal = real;
        mIm = im;
    }

    protected double rho() {
        return Math.sqrt(mReal * mReal + mIm * mIm);
    }

    protected double theta() {
        return Math.atan2(mIm, mReal);
    }

    protected Complex con() {
        return new Complex(mReal, -mIm);
    }

    protected Complex add(Complex other) {
        return new Complex(mReal + other.mReal, mIm + other.mIm);
    }

    protected Complex mul(Complex other) {
        return new Complex(mReal * other.mReal - mIm * other.mIm,
                mReal * other.mIm + mIm * other.mReal);
    }

    protected Complex mul(double a) {
        return new Complex(mReal * a, mIm * a);
    }

    protected Complex div(Complex other) {
        double lengthSquared = other.mReal * other.mReal + other.mIm * other.mIm;
        return mul(other.con()).div(lengthSquared);
    }

    protected Complex div(double a) {
        return new Complex(mReal / a, mIm / a);
    }
}