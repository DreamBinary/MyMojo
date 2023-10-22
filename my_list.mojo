from utils.list import Dim

# Dim
# A static or dynamic dimension modeled with an optional integer.

fn main():
    var num = 10
    let dim10 = Dim(num)
    let dim5 = Dim(5)
    let dim = dim10 * dim5
    DType.
    print(dim.get())
    print(dim.has_value()) # Whether the dimension has a static value.
    print(dim.is_dynamic()) # Whether the dimension is dynamic.

    