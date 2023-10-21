from python import Python

# fn main():
#     try:
#         let np = Python.import_module("numpy")
#         let ar = np.arange(15).reshape(3, 5)
#         print(ar)
#         print(ar.shape)
#     except :
#         print("error")

from python import Python
from python.object import PythonObject


fn dict_test():
    try:
        var dictionary = Python.dict()
        dictionary["fruit"] = "apple"
        dictionary["starch"] = "potato"
        print(dictionary.items())
        print(dictionary.keys())
        print(dictionary.values())
        print(dictionary["fruit"])
        let keys: PythonObject = ["fruit", "starch", "protein"]
        let N: Int = keys.__len__().__index__()
        print(N, "items")

        for i in range(N):
            if Python.is_type(dictionary.get(keys[i]), Python.none()):
                print(keys[i], "is not in dictionary")
            else:
                print(keys[i], "is included")
    except:
        print("error")


def main():
    dict_test()
    try:
        let np = Python.import_module("numpy")
        let ar = np.arange(15).reshape(3, 5)
        print(ar)
        print(ar.shape)
    except:
        print("error")
