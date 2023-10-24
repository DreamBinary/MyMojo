"""
The default model for working with values is they live in memory, so they have an identity, which means they are passed indirectly to and from functions (equivalently, they are passed "by reference" at the machine level). This is great for types that cannot be moved, and is a safe default for large objects or things with expensive copy operations. However, it is inefficient for tiny things like a single integer or floating point number.
"""
# To solve this, Mojo allows structs to opt-in to being passed in a register instead of passing through memory with the @register_passable decorator. 


@value
@register_passable("trivial")
struct Pet:
    # var name: String
    var name: Int
    var age: Int

fn main():
    let pet = Pet(name=1111, age= 3)
    print(pet.name, pet.age)
