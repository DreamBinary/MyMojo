from utils.index import StaticTuple
from math import sqrt
from benchmark import Benchmark

alias PI = 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679
alias SOLAE_MASS = 4 * PI * PI
alias DAYS_PER_YEAR = 365.24
alias NUM_BODIES = 5

@value
struct Planet:
    var pos: SIMD[DType.float64, 4]
    var vel: SIMD[DType.float64, 4]
    var mass: Float64


fn offset_momentum(inout bodies: StaticTuple[NUM_BODIES, Planet]):
    var p = SIMD[DType.float64, 4]()

    @unroll
    for i in range(NUM_BODIES):
        p += bodies[i].vel * bodies[i].mass