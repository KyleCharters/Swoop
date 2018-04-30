//Quadratic
class Quad {
    static ease_in(t) {
        return t.pow(2)
    }

    static ease_out(t) {
        return -t * (t - 2)
    }

    static ease_inout(t) {
        return t < 0.5 ? 2 * t.pow(2) : -2 * t.pow(2) + 4 * t - 1
    }
}

//Cubic
class Cubic {
    static ease_in(t) {
        return t.pow(3)
    }

    static ease_out(t){
        return (t - 1).pow(3) + 1
    }

    static ease_inout(t) {
        return t < 0.5 ? 4 * t.pow(3) : 0.5 * (2 * t - 2).pow(3) + 1
    }
}

//Quartic
class Quart {
    static ease_in(t) {
        return t.pow(4)
    }

    static ease_out(t) {
        return (t - 1).pow(3) * (1 - t) + 1
    }

    static ease_inout(t) {
        return t < 0.5 ? 8 * t.pow(4) : -8 * (t - 1).pow(4) + 1
    }
}

//Quintic
class Quint {
    static ease_in(t) {
        return t.pow(5)
    }

    static ease_out(t) {
        return (t - 1).pow(5) + 1
    }

    static ease_inout(t) {
        return t < 0.5 ? 16 * t.pow(5) : 0.5 * (2 * t - 2).pow(5) + 1
    }
}

//Sine
class Sine {
    static ease_in(t) {
        return ((t - 1) * (Num.pi / 2)).sin + 1
    }

    static ease_out(t) {
        return (t * (Num.pi / 2)).sin
    }

    static ease_inout(t) {
        return 0.5 * (1 - (t * Num.pi).cos)
    }
}

//Exponential
class Expo {
    static ease_in(t) {
        return t == 0 ? 0 : 2.pow(10 * (t -1))
    }

    static ease_out(t) {
        return t == 1 ? 1 : 1 - 2.pow(-10 * t)
    }

    static ease_inout(t) {
        if (t == 0 || t == 1) return t
        if (t < 0.5) {
            return 0.5 * 2.pow(20 * t - 10)
        } else {
            return -0.5 * 2.pow(-20 * t + 10) + 1
        }
    }
}

//Circle
class Circ {
    static ease_in(t) {
        return 1 - (1 - t.pow(2)).sqrt
    }

    static ease_out(t) {
        return ((2 - t) * t).sqrt
    }

    static ease_inout(t) {
        if (t < 0.5) {
            return 0.5 * (1 - (1 - 4 * t.pow(2)).sqrt)
        } else {
            return 0.5 * ((-(2 * t - 3) * (2 * t - 1)).sqrt + 1)
        }
    }
}

//Elastic
class Elastic {
    static ease_in(t) {
        return (13 * (Num.pi / 2) * t).sin * 2.pow(10 * (t - 1))
    }

    static ease_out(t) {
        return (-13 * (Num.pi / 2) * (t + 1)).sin * 2.pow(-10 * t) + 1
    }

    static ease_inout(t) {
        if (t < 0.5) {
            return 0.5 * (13 * (Num.pi / 2) * 2 * t).sin * 2.pow(10 * (2 * t - 1))
        } else {
            return 0.5 * ((-13 * (Num.pi / 2) * 2 * t).sin * 2.pow(-10 * (2 * t - 1)) + 2)
        }
    }
}

//Back
class Back {
    static ease_in(t) {
        return t.pow(3) - t * (t * Num.pi).sin
    }

    static ease_out(t) {
        t = 1 - t
        return 1 - t.pow(3) + t * (t * Num.pi).sin
    }

    static ease_inout(t) {
        if (t < 0.5) {
            t = 2 * t
            return 0.5 * (t.pow(3) - t * (t * Num.pi).sin)
        } else {
            t = 2 - 2 * t
            return 0.5 * (1 - (t.pow(3) - t * (t * Num.pi).sin)) + 0.5
        }
    }
}

//Bounce
class Bounce {
    static ease_in(t) {
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

    static ease_out(t) {
        return ease_in(1 - t)
    }

    static ease_inout(t) {
        if (t < 0.5) {
            return 0.5 * ease_in(t * 2)
        } else {
            return 0.5 * ease_out(t * 2 - 1) + 0.5
        }
    }
}