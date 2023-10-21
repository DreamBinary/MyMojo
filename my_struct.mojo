"""
Mojo is similar to a class in Python: 
they both support methods, fields, operator overloading, decorators for metaprogramming, etc.
 However, Mojo structs are completely static—they are bound at compile-time, 
 so they do not allow dynamic dispatch or any runtime changes to the structure. 
 (Mojo will also support classes in the future.)
"""
from memory.unsafe import Pointer

struct MyPair:
    var first: Int
    var second: Int

    fn __init__(inout self, first: Int, second: Int):
        self.first = first
        self.second = second
    
    fn dump(self):
        print(self.first, self.second)

struct HeapArray:
    var data: Pointer[Int]
    var size: Int

    fn __init__(inout self, size: Int, val: Int):
        self.size = size
        self.data = Pointer[Int].alloc(self.size)
        for i in range(self.size):
            self.data.store(i, val)
     
    fn __del__(owned self):
        self.data.free()

    fn dump(self):
        print_no_newline("[")
        for i in range(self.size):
            if i > 0:
                print_no_newline(", ")
            print_no_newline(self.data.load(i))
        print("]")

fn main():
    let mine = MyPair(2, 4)
    mine.dump()
    let arr = HeapArray(10, 42)
    arr.dump()

