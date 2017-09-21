//Quadratic
var quad_in =		Fn.new{ |t| t.pow(2) }
var quad_out =		Fn.new{ |t| -t * (t - 2) }
var quad_inout =	Fn.new{ |t| t < 0.5 ? 2 * t.pow(2) : -2 * t.pow(2) + 4 * t - 1 }

//Cubic
var cubic_in =		Fn.new{ |t| t.pow(3) }
var cubic_out =		Fn.new{ |t| (t - 1).pow(3) + 1 }
var cubic_inout =	Fn.new{ |t| t < 0.5 ? 4 * t.pow(3) : 0.5 * (2 * t - 2).pow(3) + 1 }

//Quartic
var quart_in =		Fn.new{ |t| t.pow(4) }
var quart_out =		Fn.new{ |t| (t - 1).pow(3) * (1 - t) + 1 }
var quart_inout =	Fn.new{ |t| t < 0.5 ? 8 * t.pow(4) : -8 * (t - 1).pow(4) + 1 }

//Quintic
var quint_in =		Fn.new{ |t| t.pow(5) }
var quint_out =		Fn.new{ |t| (t - 1).pow(5) + 1 }
var quint_inout =	Fn.new{ |t| t < 0.5 ? 16 * t.pow(5) : 0.5 * (2 * t - 2).pow(5) + 1 }

//Sine
var sine_in =		Fn.new{ |t| ((t - 1) * (Num.pi / 2)).sin + 1 }
var sine_out =		Fn.new{ |t| (t * (Num.pi / 2)).sin }
var sine_inout =	Fn.new{ |t| 0.5 * (1 - (t * Num.pi).cos) }

//Exponential
var expo_in =		Fn.new{ |t| t == 0 ? 0 : 2.pow(10 * (t -1)) }
var expo_out =		Fn.new{ |t| t == 1 ? 1 : 1 - 2.pow(-10 * t) }
var expo_inout =	Fn.new{ |t|
						if (t == 0 || t == 1) return t
						if (t < 0.5) {
							return 0.5 * 2.pow(20 * t - 10)
						} else {
							return -0.5 * 2.pow(-20 * t + 10) + 1
						}
					}

//Circle
var circ_in =		Fn.new{ |t| 1 - (1 - t.pow(2)).sqrt }
var circ_out =		Fn.new{ |t| ((2 - t) * t).sqrt }
var circ_inout =	Fn.new{ |t|
						if (t < 0.5) {
							return 0.5 * (1 - (1 - 4 * t.pow(2)).sqrt)
						} else {
							return 0.5 * ((-(2 * t - 3) * (2 * t - 1)).sqrt + 1)
						}
					}

//Elastic
var elastic_in =	Fn.new{ |t| (13 * (Num.pi / 2) * t).sin * 2.pow(10 * (t - 1)) }
var elastic_out =	Fn.new{ |t| (-13 * (Num.pi / 2) * (t + 1)).sin * 2.pow(-10 * t) + 1 }
var elastic_inout =	Fn.new{ |t|
						if (t < 0.5) {
							return 0.5 * (13 * (Num.pi / 2) * 2 * t).sin * 2.pow(10 * (2 * t - 1))
						} else {
							return 0.5 * ((-13 * (Num.pi / 2) * 2 * t).sin * 2.pow(-10 * (2 * t - 1)) + 2)
						}
					}

//Back
var back_in =		Fn.new{ |t| t.pow(3) - t * (t * Num.pi).sin }
var back_out =		Fn.new{ |t|
						t = 1 - t
						return 1 - t.pow(3) + t * (t * Num.pi).sin
					}
var back_inout =	Fn.new{ |t|
						if (t < 0.5) {
							t = 2 * t
							return 0.5 * (t.pow(3) - t * (t * Num.pi).sin)
						} else {
							t = 2 - 2 * t
							return 0.5 * (1 - (t.pow(3) - t * (t * Num.pi).sin)) + 0.5
						}
					}

//Bounce
var bounce_in =		Fn.new{ |t|
						t = 1 - t
						if (t < (1 / 2.75)) {
							return 1 - (7.5625 * t.pow(2))
						} else if (t < (2 / 2.75)) {
							t = t - (1.5 / 2.75)
							return 1 - (7.5625 * t.pow(2) + 0.75)
						} else if (t < (2.5 / 2.75)) {
							t = t - (2.25 / 2.75)
							return 1 - (7.5625 * t.pow(2) + 0.9375)
						} else {
							t = t - (2.625 / 2.75)
							return 1 - (7.5625 * t.pow(2) + 0.984375)
						}
					}
var bounce_out =	Fn.new{ |t|
						if (t < (1 / 2.75)) {
							return 7.5625 * t.pow(2)
						} else if (t < (2 / 2.75)) {
							t = t - (1.5 / 2.75)
							return 7.5625 * t.pow(2) + 0.75
						} else if (t < (2.5 / 2.75)) {
							t = t - (2.25 / 2.75)
							return 7.5625 * t.pow(2) + 0.9375
						} else {
							t = t - (2.625 / 2.75)
							return 7.5625 * t.pow(2) + 0.984375
						}
					}
var bounce_inout =	Fn.new{ |t|
						if (t < 0.5) {
							return 0.5 * bounce_in.call(t * 2)
						} else {
							return 0.5 * bounce_out.call(t * 2 - 1) + 0.5
						}
					}

class Easing {
	static lerp(t, b, c, d, fn) {
		return c * fn.call(t / d) + b
	}
}