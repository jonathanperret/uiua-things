# Experimental!

JsonParse ← &i "json.ua" "JsonParse"

ExpandSlice ← +⊙⇡ °⊟

Log ← &p

Noadic! ← (
  ^0
  ⊂□
)

Monadic! ← (
  ⊃⊢(↘1)
  °□
  ^1
  ⊂□
)

MonadicNoOutput! ← (
  ⊃⊢(↘1)
  °□
  ^1.0
)

MonadicTwoOutput! ← (
  ⊃⊢(↘1)
  °□
  ^1.2
  ⊂{⊙∘}
)

Dyadic! ← (
  ⊃↙↘ 2
  °{⊙∘}
  ^2
  ⊂□
)

DyadicNoOutput! ← (
  ⊃↙↘ 2
  °{⊙∘}
  ^2.0
)

Triadic! ← (
  ⊃↙↘ 3
  °{⊙⊙∘}
  ^3
  ⊂□
)

# instr stack -- stack
ExecuteInstruction ← (
  type.
  (
    ⊂□ # number literal
  | ⍤$"complex in JSON? _"⊙0
  | ⊂□ # string literal
  | type°□⊢.
    (
      # array literal: [ type shape elements ]
      ⊙(⊐≡∘) °{⊙⊙∘}
      (
        # number array
        ⊙≡°□
        | # complex array
        ⊙≡(ℂ°{:}°□)
        | # char array
        ⊙≡°□
        | # box array
        ⊙∘
      )
      # -- shape elements
      ±⧻.
      (
        # scalar (used for char literals)
        ⊂□ ⊢⊢ ;
        | # regular array: apply shape
        ⊂□ ↯
      )
    | ⍤$"complex in JSON? _"⊙0
    | ⊗: {"dup" "pop" "over" "flip" "identity"
          "not" "sign" "neg" "abs" "sqrt" "sin" "floor" "ceil" "round"
          "eq" "ne" "lt" "le" "gt" "ge" "add" "sub" "mul" "div" "mod" "pow" "log" "min" "max" "atan" "complex"
          "len" "shape" "range" "first" "reverse" "deshape" "fix" "bits" "transpose" "rise" "fall" "where" "classify" "deduplicate" "box" "unbox" "parse"
          "match" "couple" "join" "select" "pick" "reshape" "rerank" "take" "drop" "rotate" "windows" "keep" "find" "member" "index_of"
          "assert"
          "gen"
          "deal" "regex" "utf" "tag" "type" "now"
          "eta" "pi" "tau" "infinity"
          "map" "insert" "has" "get" "remove" "stack" "trace"
          "show" "prin" "print" "scan_line"
          "rand"
          "change_directory" "f_read_all_bytes" "f_read_all_str" "f_write_all"
          "args"
          "im_show"} ⊢.
      (
        ⋅(⊂⊢.)    # dup
        | ⋅(↘1)   # pop
        | ⋅(⊂⊡1.) # over
        | ⋅⍜(↙2)⇌ # flip
        | ⋅(↘0)   # identity
        | ⋅Monadic!¬
        | ⋅Monadic!±
        | ⋅Monadic!¯
        | ⋅Monadic!⌵
        | ⋅Monadic!√
        | ⋅Monadic!○
        | ⋅Monadic!⌊
        | ⋅Monadic!⌈
        | ⋅Monadic!⁅
        | ⋅Dyadic!=
        | ⋅Dyadic!≠
        | ⋅Dyadic!<
        | ⋅Dyadic!≤
        | ⋅Dyadic!>
        | ⋅Dyadic!≥
        | ⋅Dyadic!+
        | ⋅Dyadic!-
        | ⋅Dyadic!×
        | ⋅Dyadic!÷
        | ⋅Dyadic!◿
        | ⋅Dyadic!ⁿ
        | ⋅Dyadic!ₙ
        | ⋅Dyadic!↧
        | ⋅Dyadic!↥
        | ⋅Dyadic!∠
        | ⋅Dyadic!ℂ
        | ⋅Monadic!⧻
        | ⋅Monadic!△
        | ⋅Monadic!⇡
        | ⋅Monadic!⊢
        | ⋅Monadic!⇌
        | ⋅Monadic!♭
        | ⋅Monadic!¤
        | ⋅Monadic!⋯
        | ⋅Monadic!⍉
        | ⋅Monadic!⍏
        | ⋅Monadic!⍖
        | ⋅Monadic!⊚
        | ⋅Monadic!⊛
        | ⋅Monadic!⊝
        | ⋅Monadic!□
        | ⋅Monadic!°□
        | ⋅Monadic!⋕
        | ⋅Dyadic!≍
        | ⋅Dyadic!⊟
        | ⋅Dyadic!⊂
        | ⋅Dyadic!⊏
        | ⋅Dyadic!⊡
        | ⋅Dyadic!↯
        | ⋅Dyadic!☇
        | ⋅Dyadic!↙
        | ⋅Dyadic!↘
        | ⋅Dyadic!↻
        | ⋅Dyadic!◫
        | ⋅Dyadic!▽
        | ⋅Dyadic!⌕
        | ⋅Dyadic!∊
        | ⋅Dyadic!⊗
        | ⋅DyadicNoOutput!⍤
        | ⋅MonadicTwoOutput!gen
        | ⋅Dyadic!deal
        | ⋅Dyadic!regex
        | ⋅Monadic!utf
        | ⋅Noadic!tag
        | ⋅Monadic!type
        | ⋅Noadic!now
        | ⋅Noadic!η
        | ⋅Noadic!π
        | ⋅Noadic!τ
        | ⋅Noadic!∞
        | ⋅Dyadic!map
        | ⋅Triadic!insert
        | ⋅Dyadic!has
        | ⋅Dyadic!get
        | ⋅Dyadic!remove
        | ⋅(&p$"┌╴?\n_\n└╴╴╴╴"/⊐$"_\n_"≡(□$"├╴_"°□)⇌.) # stack
        | ⋅(&p$"┌╴⸮\n_\n└╴╴╴╴"$"├╴_"°□⊢.)              # trace
        | ⋅MonadicNoOutput!&s
        | ⋅MonadicNoOutput!&pf
        | ⋅MonadicNoOutput!&p
        | ⋅Noadic!&sc
        | ⋅Noadic!⚂
        | ⋅MonadicNoOutput!&cd
        | ⋅Monadic!&frab
        | ⋅Monadic!&fras
        | ⋅DyadicNoOutput!&fwa
        | ⋅Noadic!(↘1 &args)
        | ⋅MonadicNoOutput!&ims
        | ⍤$"unknown instr: _"⊙0
      )
    )
  )
)

ExpandTopSlices ← (
  ⊃(
    ⊐≡≡∘°□get "top_slices"
    ⊐/⊂ ≡(□ExpandSlice)
  | °□get "instrs"
  )
  ⊏
)

InitialStack ← ⊙{}

# jsonasm -- finalstack
Run ← (
  ExpandTopSlices
  ∧(ExecuteInstruction °□) InitialStack
)

GetProgramPath ← ⍣(°□⊢&args|⋅"")
EndsWith ← ≍ ⊃∘(↙¯⧻)
IsImported ← ¬EndsWith "vm.ua" GetProgramPath

StackColors ← +200×55⋯5_4_6_2_3_1

DumpColoredStack ← (
  ≡(&pf "\x1b[m" &s°□ &pf $"\x1b[38;2;_;_;_m" °[⊙⊙∘]) ↯: StackColors ⊂:3 ⧻. ⇌
)

Main ← (
  &fras °□ ⊡1 &args
  JsonParse
  Run
  DumpColoredStack
)

# *** Tests support ***

MkTemp ← (⍤⊃(:¬⊙⋅∘|▽≠@\n.;) &runc "mktemp") # keep the parentheses!

# contents -- …
WithTempFile ← setund(
  ⊃∘ &fwa MkTemp
| MkTemp
  ⊃&fwa .
| &fde
)

CompileAndRun ← (
  ⊂"# Experimental!\n"
  ⍜WithTempFile (⋅⊙; &runc {"uiua" "build" "-o" "/dev/stdout" ∘})
  JsonParse
  Run
)
Aeq ← ⍤⊃($"\nexpected\n_\ngot\n_")≍
Check ← Aeq ⊙CompileAndRun

---
Escape ← ↘¯1 ⊐/⊂ ↘1♭≡⊂ ⊃(□⊂@\\|⊕□⍜▽¯:\+.=, ⊙(⊂:@.))
⍤⊃⋅∘≍ "a\\b\\\"c" Escape @" "a\\b\"c"
⍤⊃⋅∘≍ "a\\\\b\"c" Escape @\\ "a\\b\"c"

MakeCheckProgram ← (
  ⊃(
    ⍤"must run with absolute path for tests"=@/⊢. GetProgramPath
  | ⊃(∘|$"\"_\"" Escape @" Escape @\\) Escape @\\
  )
  $ # Experimental!
  $ Check ← &i "_" "Check"
  $ Check {_} _
)

# expr -- success
AutoCheck ← (|1
  MakeCheckProgram.
  # programtext expr
  ⍜WithTempFile (&runc {"uiua" "run" "--no-format" ∘})
  # -- exitcode stdout stderr
  ⊃(
    ↧ ∩(=0) ⊙⋅⧻ # success is exitcode=0 && empty stderr
  | ⋅⊂          # join stderr to stdout
  )
  # -- success output expr
  (
    &p$"❌ _\n_":
    0
  | # &p⋅$"✅ _"
    1
  )
)

Parallel! ← (
  ⊐/⊂ ≡(□≡wait ≡spawn^1 ▽≡(¬≍□0).) ⬚(□0)↯ ⊟ NumProcs ¯1
)

RunTests ← (
  $ 123
  $ \"hello\"
  $ @x
  $ @😇
  $ []
  $ [i 0 1 2]
  $ {}
  $ [[4 5 6][7 8 9]]
  $ [\"x\" \"y\"]
  $ {\"x\" \"yz\"}
  $ .2
  $ ,1 2
  $ :1 2
  $ ;1 2 3
  $ ∘3
  $ ¬ 3
  $ ± 3
  $ ¯ 1
  $ ⌵ `1
  $ √ 4
  $ ○ 0
  $ ⌊ 1234.56
  $ ⌈ 1.234
  $ ⁅ 5.678
  $ =1 2
  $ ≠1 2
  $ <1 2
  $ ≤1 2
  $ >1 2
  $ ≥1 2
  $ +2 4
  $ -2 5
  $ *2 4
  $ ÷2 6
  $ ◿2 7
  $ ⁿ2 3
  $ ₙ2 8
  $ ↧3 8
  $ ↥3 8
  $ ∠1 0
  $ ℂ1 2
  $ - . rand
  $ ⧻5
  $ △5
  $ ⇡5
  $ ⊢1\_2\_3
  $ ⇌1\_2\_3\_9
  $ ♭5
  $ ¤5
  $ ⋯27
  $ ⍉.[1\_2 3\_4 5\_6]
  $ ⍏6\_2\_7\_0\_¯1\_5
  $ ⍖6\_2\_7\_0\_¯1\_5
  $ ⊚ [1 0 0 1 0 1 1 0]
  $ ⊛7\_7\_8\_0\_1\_2\_0
  $ ⊝7\_7\_8\_0\_1\_2\_0
  $ ⊔□5
  $ ⋕ "17"
  $ ≍ 1\_2\_3 [1 2 3]
  $ ⊟ 1 2
  $ ⊂ 1 2
  $ ⊏ 2 [8 3 9 2 0]
  $ ⊡ 2 [8 3 9 2 0]
  $ ↯ 2\_3 [1 2 3 4 5 6]
  $ ☇ 0 ↯2\_3\_3⇡18
  $ ↙ 3 [8 3 9 2 0]
  $ ↘ 3 [8 3 9 2 0]
  $ ↻1 ⇡5
  $ ◫2 .⇡4
  $ ▽ [1 0 2 3 1] [8 3 9 2 0]
  $ ⌕ 5 [1 8 5 2 3 5 4 5 6 7]
  $ ∊ 2 [1 2 3]
  $ ⊗ 2 [1 2 3]
  $ ⍤"ok" 1
  $ ±gen0
  $ deal0 [1 2 3 4 5]
  $ regex "h([io])" "hihaho"
  $ utf "hello!"
  $ ≥0tag
  $ type 5
  $ ±now
  $ η
  $ π
  $ τ
  $ ∞
  $ map 1\_2 3\_4
  $ insert 1 2 {}
  $ map 1\_2 3\_4
  $ map 1\_2 3\_4
  $ map 1\_2 3\_4
  $ &sc
  $ &cd "/tmp"
  $ &fras "/tmp/data1.tmp" &fwa "/tmp/data1.tmp" "data"
  $ &frab "/tmp/data2.tmp" &fwa "/tmp/data2.tmp" "data"
  $ &ims [[1 0][0 1]]
  $ type &args

  ⊜□ ≠@\n.
  /↧ Parallel!(AutoCheck °□)
  # /↧ ≡(AutoCheck °□)
  &p⊡:"😭🎉"
)

¬IsImported
(
  # imported: do nothing
| # running
  =1⧻&args
  (
    # do nothing
  | RunTests
  )
)
---

¬IsImported
(
  # imported: do nothing
| # running
  >1⧻&args
  (
    # do nothing
  | Main
  )
)
