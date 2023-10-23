
fn test[isMojo: Bool]() -> String:
    @parameter
    if isMojo:
        return "Hello Mojo"
    else:
        return "Hello World"

# fn bar[in: Bool -> out: Int]():
#     @parameter
#     if in:
#         param_return[1]
#     else:
#         param_return[2]
    
fn main():
    print(test[True]())
    print(test[False]())
    # bar[True]()