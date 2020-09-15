import PlaygroundSupport

var myName = "Gallaugher"
var smallerString = "laugh"

// contains
if myName.contains(smallerString) {
    print("\(myName) contains \(smallerString)")
} else {
    print("There is no \(smallerString) in \(myName)")
}


// hasPrefic + hasSuffix

var occupation = "Swift Developer"
var searchString = "Swift"

print("\nPREFIX SEARCH")

if occupation.hasPrefix(searchString) {
    print("You're Hired!")
} else {
    print("No job for you")
}

print("\nSUFFIX SEARCH")
occupation = "iOS Developer"
searchString = "Developer"

if occupation.hasSuffix(searchString) {
    print("You're Hired! We need more \(occupation)s")
} else {
    print("No job for you. no one neads any \(occupation)s")
}

// .removeLast()
print("\nREMOVE")
var bandName = "The White Stripes"
let lastChar = bandName.removeLast()
print("After we remove \(lastChar) the band is just \(bandName).")

// .removeFirst(k: Int)
print("\nREMOVE FIRST #")
var person = "Dr. Nick"
let title = "DR."
person.removeFirst(title.count + 1)
print(person)

// .replacingOccurances(of: with:)
print("\nREPLACING OCCURANCE OF")

// 123 James St.
// 123 James ST
// 123 James Street

var address = "123 James St."
var streetString = "St."
var replacementString = "Street"

var standardAddress = address.replacingOccurrences(of: streetString, with: replacementString)
print(standardAddress, address)

// What would you do if we had 123 St. James St.? see excercises after chapter...

// Iterate through a string
print("\nBACKWARDS STRING")

var name = "Gallaugher"
var backwardsName = ""
for letter in name {
    backwardsName = String(letter) + backwardsName
}
print("\(name), \(backwardsName)")

// capitalization
print("\nPLAYING WITH CAPS")
var crazyCaps = "SwIFt DeVEloPEr"
var uppercased = crazyCaps.uppercased()
var lowercased = crazyCaps.lowercased()
var capitalized = crazyCaps.capitalized

print(crazyCaps)
print(uppercased, lowercased, capitalized)

var wordToGuess = "SWIFT"
var revealedWord = "_"

for _ in 1...wordToGuess.count - 1 {
    revealedWord = revealedWord + " _"
}
//revealedWord.removeLast()
print("\(wordToGuess) will show as '\(revealedWord)'")

// create  a string form a repeating value
var repeatingRevealedWord = "_" + String(repeating: " _", count: wordToGuess.count-1)
print("Using repeating string: '\(repeatingRevealedWord)'")

// REVEAL THE WORD
print("\nREVEAL THE WORD")

wordToGuess = "STARWARS"
var lettersGuessed = "SQFTXW"
revealedWord = ""

// loop through all the letters in wordToGuess
for letter in wordToGuess {
    // check if letter in wordToGuess is in lettersGuessed (i.e. did you guess this letter already?
    if lettersGuessed.contains(letter) {
        // if so, add this letter + a blank space, to revealWord
        revealedWord = revealedWord + "\(letter) "
    } else {
        // if not, add anunderscore + a blank space, to revealedWord
        revealedWord = revealedWord + "_ "
    }
}
// remove the extra space at the end of revealedWord
revealedWord.removeLast()

print("wordToGuess = \(wordToGuess)")
print("lettersGuessed = \(lettersGuessed)")
print("revealedWord = \(revealedWord)")

