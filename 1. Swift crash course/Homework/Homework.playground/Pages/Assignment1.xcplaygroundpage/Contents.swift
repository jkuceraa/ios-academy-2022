import Foundation

func merge(dictionaries: [[String: Int]]) -> [String: Int] {
    // Implement merging of multiple dictionaries
    // The method returns a resulting dictionary
    // If there is a conflict of keys add the two values
    // Example 1: Merge of ["one": 1, "two": 2] and ["three": 3] results in ["one": 1, "two": 2, "three": 3]
    // Example 2: Merge of ["one": 1, "two": 2] and ["one": 3] results in ["one": 4, "two": 2]
    var finaldict: [String: Int] = [:]
    var added: [String] = []
    for dictionary in dictionaries{
        for item in dictionary.keys{
            var result: Int = 0
            for dictionary2 in dictionaries{
                if dictionary2.keys.contains(item) && !added.contains(item){
                    result+=dictionary2[item]!
                }
            }
            if(!added.contains(item)){
                finaldict[item]=result
            }
                added.append(item)
            }
        }
    return finaldict
    }

func intersect(dictionaries: [[String: Int]]) -> [String: Int] {
    // Implement intersection of multiple dictionaries
    // The method returns a resulting dictionary
    // Take the least value from the intersecting keys
    // Example 1: Intersection of ["one": 1, "two": 2] and ["three": 3] results in [:] (empty dictionary)
    // Example 2: Intersection of ["one": 1, "two": 2] and ["one": 3, "four": 4] results in ["one": 1]
    var finaldict: [String:Int]=[:]
    for dictionary in dictionaries{
        for item in dictionary.keys{
            var isfound = true
            for dictionary2 in dictionaries{
                if !dictionary2.keys.contains(item){
                    isfound = false
                }
            }
            if(isfound){
                var min: Int = dictionaries[0][item]!
                for dictionary3 in dictionaries{
                    if (dictionary3[item]!<min){
                        min = dictionary3[item]!
                    }
                }
                finaldict[item]=min
            }
        }
    }
    
    return finaldict
}



extension Dictionary where Key == String, Value == Int {
    func filterPalindromeKeys() -> [String: Value] {
        // Palindrome is a string that reads the same backward as forward e.g. "radar"
        // Implement filtering of just those keys that are palindromes
        // The method returns a resulting dictionary
        // Example1: ["one": 1, "radar": 2] results in ["radar": 2]
        // Example2: ["wasitacaroracatisaw": 1, "two": 2] results in ["wasitacaroracatisaw": 1]
        var finaldict: [String:Int] = [:]
        for (key, value) in self{
            if(key==String(key.reversed())){
                finaldict[key]=value
            }
        }
        return finaldict
    }
}

