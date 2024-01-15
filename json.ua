# Experimental!

Log ← ◌$" * _: _"

StringRE ← "\"(?:[^\"\\\\]+|\\\\.)*\""
NumberRE ← "[+-]?\\d+(?:\\.\\d*)?(?:[eE][+-]?\\d+)?"

NumberRE StringRE
$ (?x)
$  _          # number
$ |_          # string
$ |null       # null
$ |true       # true
$ |false      # false
$ |[\\]{}\\[] # braces and brackets
FullRE ←
Lex ← ♭regex FullRE

ParseString ← (
  ↘1↘¯1   # drop quotes
  ∊ @\\ . # check for easy string
  (
    ∘ # nothing to do
  | ♭ regex "[^\\\\]+|\\\\u[0-9a-fA-F]{4}|\\\\."
    ≡(
      =@\\⊢. # is it an escape?
      (
        ∘
        | ⍜°□(
          ↘1
          ⊗: "nrtu" ⊢.
          (
            ⋅"\n"
                | ⋅"\r"
                | ⋅"\t"
                | [+@\0] ∧(+⊙(×16)) ⊙0 ◿16 ⊗:"0123456789abcdef0123456789ABCDEF" ↘1
                | ∘
          )
        )
      )
    )
    ⊐/⊂ # collect parts
  )
)

# ( idx tokens -- value idx tokens )
Parse ← ↬(|2.3
  ⊃(
    °□⊡    # pick next token
  | ⊓(+1)∘ # advance index
  )
  ⊗:"\"ntf{["⊢. # classify token
  (∘|-1)≥5.     # merge [ and {
  (
    # string
    ParseString
  | # null
    ⋅[]
  | # true
    ⋅1
  | # false
    ⋅0
  | # { or [
    ⊙(
      ¬∊:"}]" ⊃(⊢⊡|⊙∘) # peek at next token
      (
        # drop closing brace
        +1
        # return empty object/array
        {}
        | |2.3 ↫ # read first value
        ¤□       # turn first value into array
        1        # -- continue? array-so-far idx tokens
        ⍢(
          ◌ # drop continue-flag
          # -- array-so-far idx tokens
          ¬∊:"}]" ⊃(⊢⊡◌|⊙⊙∘) # peek at next token
          (
            # closing brace: object/array done
            ⊙(+1)      # eat closing brace
            0          # exit loop
                |      # not a closing brace: there's a value next
            ⊙(|2.3 □↫) # read value, box it
            ⊂          # append value
            1          # continue loop
          )
        )∘ # while continue-flag is 1
        # -- continue-flag array tokens'
        ◌ # drop continue-flag
      )
    )
    (∘|map°⊟⍉↯¯1_2)=@{⊢ # make map if object
  | ⋕                   # number
  )
)

JsonParse ← (
  Log "Lex" ⍜now Lex
  Log "tokens" ⧻.
  Log "Parse" ⍜now Parse 0
  ⊙⋅◌ # drop idx, tokens
)

---
# Experimental!
Aeq ← ⍤⊃($"\nexpected\n_\ngot\n_")≍

$ [true,false]
JsonParse
Aeq {1 0}

$ 0.5
Aeq 0.5 JsonParse

$ "hello\\nwor\\\\d"
Aeq "hello\nwor\\d" JsonParse

$ {"x":3, "y":[1, 2, null]}
JsonParse
Aeq {{"x" "y"} {3 {1 2 []}}} {°map}

$ null
Lex
Aeq {"null"}

$ "hello\\nwor\\\\d"
ParseString
Aeq "hello\nwor\\d"

$ "\\u0000"
ParseString
Aeq "\0"

$ "\\u1000"
ParseString
Aeq "\u1000"

$ "\\u20aC"
ParseString
Aeq "€"

$ {"x":3, "y":[1, 2]}
Aeq {{"x" "y"} {3 {1 2}}} {°map} JsonParse

$ {}
Aeq {[] []} {°map} JsonParse

$ []
Aeq {} JsonParse

$ [ [1], [2,3] ]
Aeq {{1} {2 3}} JsonParse

$ [1,2,"xyz",3]
Aeq {1 2 "xyz" 3} JsonParse

$ [1,2]
Aeq {1 2} JsonParse

$ [123]
Aeq {123} JsonParse

$ "hello\\nwor\\"ld"
Aeq [{"\"hello\\nwor\\\"ld\""}] regex StringRE

$ "back\\\\slash"
Aeq [{"\"back\\\\slash\""}] regex StringRE

$ {"hello":"wor\\"ld"}
Lex
Aeq {"{" "\"hello\"" "\"wor\\\"ld\"" "}"}

$ {"x":123}
Lex
Aeq {"{" "\"x\"" "123" "}"}

$ [123]
Lex
Aeq {"[" "123" "]"}

$ [123,456]
Lex
Aeq {"[" "123" "456" "]"}

$ [    123,
$ 456    ]
Lex
Aeq {"[" "123" "456" "]"}

$ 123
Aeq 123 ⊙⋅◌ Parse 0 Lex

$ "x"
Aeq "x" ⊙⋅◌ Parse 0 Lex

# &p "Tests OK."
---

# Input ← &fras "day17.uasm"
# JsonParse &fras "hello.uasm"
# &p$"instrs:_" ⧻⊡1⊢ JsonParse &fras "day17.uasm"
# &p$"big:_" ⧻ JsonParse &fras "big.json"

# ⍜now (&p ⍉⊟ Lex) Input
