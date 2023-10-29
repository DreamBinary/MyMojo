
# def ls_test():
# 	let ls = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# 	print(type(ls))


fn add(x: Int = 1) -> Float16:
    let y = 2.0
    return x + y


# rexd only
# In fact, as written, the function cannot modify them because fn arguments are immutable references, by default.
fn add(borrowed x: Int, borrowed y: Int) -> Int:
    # x += 3
    return x + y


# If you want the arguments to be mutable, you need to declare the argument convention as inout.
fn add_inout(inout x: Int, inout y: Int) -> Int:
    x += 3
    return x + y


# provides the function full ownership of the value (it’s mutable and guaranteed unique)
# This way, the function can modify the value and not worry about affecting variables outside the function.
# fn set_file(inout text: String) -> String:
# In this case, Mojo makes a copy of a and passes it as the text argument. The original a string is still alive and well.
fn set_file(owned text: String) -> String:
    text += "🔥"
    return text


fn foo[a: Int = 3, msg: StringLiteral = "woof"]():
    print(msg, a)


fn fooo[a: Int = 3, msg: StringLiteral = "woof"](b: Int = 4):
    print(msg, a, b)


# Inferred parameter values take precedence over defaults:
fn foooo[a: Int = 3, msg: StringLiteral = "woof"](b: Int = a):
    print(msg, a, b)


fn main():
    # var a = 2
    # var b = 3
    # print(add(x=2))
    # print(add(x=2, y=3))
    # # print(add_inout(x = 2, y = 3)) error
    # print(add_inout(x=a, y=b))
    # # print(test(), "test", sep="----")
    # let s = "Hello"
    # let ss = set_file(text=s ^)  # ^ ==>> destroy s
    # # print(s)
    # print(ss)
    foo()
    foo[5]()
    foo[msg="meow"]()
    fooo()
    fooo[5]()
    fooo[msg="meow"]()
    fooo(b=6)
    foooo[5]()
    foooo[5](50)
