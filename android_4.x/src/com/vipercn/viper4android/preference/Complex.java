package com.vipercn.viper4android.preference;


class Complex
{
	private final double re, im;

	protected Complex(double re, double im)
	{
		this.re = re;
		this.im = im;
	}

	protected double rho()
	{
		return Math.sqrt(re * re + im * im);
	}

	protected double theta()
	{
		return Math.atan2(im, re);
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

	protected Complex mul(double a)
	{
		return new Complex(re * a, im * a);
	}

	protected Complex div(Complex other)
	{
	    double lengthSquared = other.re * other.re + other.im * other.im;
	    return mul(other.con()).div(lengthSquared);
	}

	protected Complex div(double a)
	{
		return new Complex(re / a, im / a);
	}
}