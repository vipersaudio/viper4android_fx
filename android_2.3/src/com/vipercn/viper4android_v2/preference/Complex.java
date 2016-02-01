package com.vipercn.viper4android_v2.preference;

import android.util.FloatMath;

class Complex
{
	float re, im;

	protected Complex()
	{
		this.re = 0;
		this.im = 0;
	}

	protected Complex(float re, float im)
	{
		this.re = re;
		this.im = im;
	}

	protected void SetValue(float re, float im)
	{
		this.re = re;
		this.im = im;
	}

	protected float rho()
	{
		return (float) FloatMath.sqrt(re * re + im * im);
	}

	protected float theta()
	{
		return (float) Math.atan2(im, re);
	}

	protected Complex con()
	{
		return new Complex(re, -im);
	}

	protected Complex add(Complex other)
	{
		return new Complex(re + other.re, im + other.im);
	}

	protected Complex mul(Complex other)
	{
		return new Complex(re * other.re - im * other.im, re * other.im + im * other.re);
	}

	protected Complex mul(float a)
	{
		return new Complex(re * a, im * a);
	}

	protected Complex div(Complex other)
	{
	    float lengthSquared = other.re * other.re + other.im * other.im;
	    return mul(other.con()).div(lengthSquared);
	}

	protected Complex div(float a)
	{
		return new Complex(re / a, im / a);
	}
}
