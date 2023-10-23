
# @unroll: Fully unroll a loop.

# @unroll(n): Unroll a loop by factor of n, where n is a positive integer.

# Unroll decorator requires loop bounds and iteration step to be compiler time constant value, otherwise unrolling will fail with compilation error. This also doesn’t make loop induction variable a parameter.
fn main():
    # Fully unroll the loop's 10 iterations into 10 `do_something` calls and remove the for-loop.
    @unroll 
    for i in range(10):
        print(i)

    # Unroll every 2 iterations and loop over 5 times.
    @unroll(2)
    for i in range (10):
        print(i)