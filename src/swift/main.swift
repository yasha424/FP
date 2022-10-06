func Singletone(_ arg: Any) -> [Any] {
    return [arg]
}

func Null(_ arr: [Any]) -> Bool {
    return arr.isEmpty
}

func Snoc(_ arr: [Any], _ el: Any) -> [Any] {
    return (arr + [el])
}

func Length(_ arr: [Any]) -> Int {
    var count = 0
    for _ in arr {
        count += 1
    }
    return count
}

print(Singletone(1))
print(Null([1]))
print(Snoc([1, 2], "3"))
print(Length([1, 2, 3, 4]))
