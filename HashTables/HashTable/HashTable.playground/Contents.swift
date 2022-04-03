
struct HashTable<Key: Hashable, Value> {
    typealias Bucket = [(key: Key, value: Value)]
    private var buckets: [Bucket]
    private(set) public var count = 0
    
    init(capacity: Int) {
        assert(capacity > 0)
        buckets = [Bucket](repeatElement([], count: capacity))
    }
    
    subscript(key: Key) -> Value? {
        get {
            return value(key: key)
        }
        set {
            if let value = newValue {
                setValue(key: key, value: value)
            } else {
                delete(key: key)
            }
        }
    }
    
    private func index(key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
    
    public func value(key: Key) -> Value? {
        let i = index(key: key)
        return buckets[i].first { $0.key == key }?.value
    }
    
    private mutating func setValue(key: Key, value: Value) {
        let i = index(key: key)
        if let (j, _) = buckets[i].enumerated().first(where: { $0.1.key == key }) {
            buckets[i][j].value = value
        } else {
            buckets[i].append((key: key, value: value))
            count += 1
        }
    }
    
    private mutating func delete(key: Key) {
        let i = index(key: key)
        if let (j, _) = buckets[i].enumerated().first(where: { $0.1.key == key }) {
            buckets[i].remove(at: j)
            count -= 1
        }
    }
}

var hashTable = HashTable<String, String>(capacity: 5)
let key = "foo"
hashTable[key] = "bar"
assert(hashTable["foo"] == "bar")
hashTable[key] = nil
assert(hashTable["foo"] == nil)
