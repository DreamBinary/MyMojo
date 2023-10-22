# Mojo provides a @value decorator for structs that synthesizes a lot of boilerplate for you.
# You can think of @value as an extension of Python's @dataclass that also handles Mojo's __moveinit__ and __copyinit__ methods.

@value
struct Pet:
    var name: String
    var age: Int

    # fn __init__(inout self, owned name: String, age: Int):
    #     self.name = name^
    #     self.age = age

    fn __copyinit__(inout self, existing: Self):
        self.name = existing.name + " (copied)"
        self.age = existing.age

    fn __moveinit__(inout self, owned existing: Self):
        self.name = existing.name + " (moved)"
        self.age = existing.age

    fn __del__(owned self):
        print("Goodbye, " + self.name)



fn main():
    let pet = Pet(name="Rex", age= 3)
    print(pet.name, pet.age)
    let pet2 = pet  # copy
    print(pet2.name, pet2.age) 
    pet2.__del__()
    let pet3 = pet^  # move
    print(pet3.name, pet3.age)

# Rex 3
# Rex (copied) 3
# Goodbye, Rex (copied)
# Goodbye, Rex (moved)
# Rex (moved) 3