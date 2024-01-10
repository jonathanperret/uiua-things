# Experimental!

JsonParse ← &i "json.ua" "JsonParse"

ExpandSlice ← +⊙⇡ °⊟

Log ← &p

# map -- keys
MapKeys ← ▽ ≡(¬≍NaN °□). °□⊢

# map -- pairs
MapPairs ← ⍉⊟°map

EmptyStack ← {}

# slice -- frame
MakeFrame ← (|1
  ExpandSlice
  0 # pc
  {⊙∘}
)

# fn on stack = [ sig slice ]

Trace ← ⊃∘(&p$"┌╴⸮\n_\n└╴╴╴╴"$"├╴_")

Stack ← ⊃∘(&p$"┌╴?\n_\n└╴╴╴╴"/⊐$"_\n_"≡(□$"├╴_"°□)⇌)

Args ← ↘1 &args

NoadicNoOutputNames ← {"stack"}
NoadicNoOutputFns ← (Stack|⍤"bad prim id"0)

NoadicOneOutputNames ← {"tag" "now" "eta" "pi" "tau" "infinity" "scan_line" "rand" "args"}
NoadicOneOutputFns ← (tag|now|η|π|τ|∞|&sc|⚂|Args)

MonadicNoOutputNames ← {"pop" "show" "prin" "print" "change_directory" "im_show"}
MonadicNoOutputFns ← (;|&s|&pf|&p|&cd|&ims)

MonadicOneOutputNames ← {
  "identity" "trace"
  "not" "sign" "neg" "abs" "sqrt" "sin" "floor" "ceil" "round"
  "len" "shape" "range" "first" "reverse" "deshape" "fix" "bits" "transpose" "rise" "fall"
  "where" "classify" "deduplicate" "box" "unbox" "parse"
  "utf" "type" "f_read_all_bytes" "f_read_all_str"}
MonadicOneOutputFns ← (
  ∘
| Trace
| ¬
| ±
| ¯
| ⌵
| √
| ○
| ⌊
| ⌈
| ⁅
| ⧻
| △
| ⇡
| ⊢
| ⇌
| ♭
| ¤
| ⋯
| ⍉
| ⍏
| ⍖
| ⊚
| ⊛
| ⊝
| □
| °□
| ⋕
| utf
| type
| &frab
| &fras
)

MonadicTwoOutputNames ← {"dup" "gen"}
MonadicTwoOutputFns ← (.|gen)

DyadicNoOutputNames ← {"assert" "f_write_all"}
DyadicNoOutputFns ← (⍤|&fwa)

DyadicOneOutputNames ← {
  "eq" "ne" "lt" "le" "gt" "ge" "add" "sub" "mul" "div" "mod" "pow" "log" "min" "max" "atan" "complex"
  "match" "couple" "join" "select" "pick" "reshape" "rerank" "take" "drop" "rotate" "windows" "keep" "find" "member" "index_of"
  "deal" "map" "has" "get" "remove" "regex"}
DyadicOneOutputFns ← (
  =
| ≠
| <
| ≤
| >
| ≥
| +
| -
| ×
| ÷
| ◿
| ⁿ
| ₙ
| ↧
| ↥
| ∠
| ℂ
| ≍
| ⊟
| ⊂
| ⊏
| ⊡
| ↯
| ☇
| ↙
| ↘
| ↻
| ◫
| ▽
| ⌕
| ∊
| ⊗
| deal
| map
| has
| get
| remove
| regex
)

DyadicTwoOutputNames ← {"flip"}
DyadicTwoOutputFns ← (:|⍤"bad prim id"0)

DyadicThreeOutputNames ← {"over"}
DyadicThreeOutputFns ← (,|⍤"bad prim id"0 ,)

TriadicNoOutputNames ← {"insert"}
TriadicOneOutputFns ← (insert|⍤"bad prim id"0 ⋅⋅∘)

PrimNameLists ← {
  NoadicNoOutputNames
  NoadicOneOutputNames
  MonadicNoOutputNames
  MonadicOneOutputNames
  MonadicTwoOutputNames
  DyadicNoOutputNames
  DyadicOneOutputNames
  DyadicTwoOutputNames
  DyadicThreeOutputNames
  TriadicNoOutputNames}

PrimIds ← ≡(□≡⊂⊙°□) ⊃(⇡⧻|≡(□⇡⧻)) PrimNameLists

PrimNamesToIds ← map ∩⊐/⊂ PrimNameLists PrimIds

ExecPrimitive ← (
  °⊟
  (
    NoadicNoOutputFns
  | ⊂□ NoadicOneOutputFns
  | MonadicNoOutputFns ⊙⊃(°□⊢|↘1)
  | ⊂□ MonadicOneOutputFns ⊙⊃(°□⊢)(↘1)
  | ⊂{⊙∘} MonadicTwoOutputFns ⊙⊃(°□⊢)(↘1)
  | DyadicNoOutputFns ⊙⊃(°{⊙∘}↙2|↘2)
  | ⊂□ DyadicOneOutputFns ⊙⊃(°{⊙∘}↙2|↘2)
  | ⊂{⊙∘} DyadicTwoOutputFns ⊙⊃(°{⊙∘}↙2|↘2)
  | ⊂{⊙⊙∘} DyadicThreeOutputFns ⊙⊃(°{⊙∘}↙2|↘2)
  | ⊂□ TriadicOneOutputFns ⊙⊃(°{⊙⊙∘}↙3|↘3)
  )
  ⊙[] # no new frame

)

NotImplemented ← |3.2 ⊙∘ ⍤⊙0 $"_ is not implemented"

# {ident} stack -- stack' newframe?
Comment ← NotImplemented "Comment"
# {index call sig} stack -- stack' newframe?
CallGlobal ← NotImplemented "CallGlobal"
# {span index} stack -- stack' newframe?
BindGlobal ← NotImplemented "BindGlobal"
# { } stack -- stack' newframe?
BeginArray ← NotImplemented "BeginArray"
# {boxed span} stack -- stack' newframe?
EndArray ← NotImplemented "EndArray"
# {index} stack -- stack' newframe?
Call ← NotImplemented "Call"

# { id  sig  slice } stack -- stack' newframe?
PushFunc ← (
  ;°{⊙⊙∘} # get slice and sig
  ∩⊐≡∘    # clean them up
  ⊟       # couple them
  ⊂□      # push fn
  ⊙[]     # no new frame

)

# { count sig span } stack -- stack' newframe?
Switch ← (|2.2
  ⊙(⊐≡∘) °{⊙∘}↙2 # get fncount, cleaned sig
  # -- fncount sig stack
  ⊃(
    °□⊡ ⊙⋅∘ # selector: after fns

  | ⇌↙ ⊙⋅∘ # fns, reversed

  | ⋅∘ # keep sig

  | ↘ +1 ⊙⋅∘ # drop fns and selector from stack

  )
  # -- selector fns sig stack'
  °□⊡ # pick selected fn # TODO: array selectors
  # -- fn sig stack
  °⊟ # extract fnsig and fnslice

  # -- fnsig fnslice sig stack
  ⊃(
    ⊙; # drop fnslice
    # compute args to discard
    ⊃(⋅⊢|⋅⋅∘|/-⇌ -) # sig.args stack ((sig.args - f.sig.args) - (sig.outputs - f.sig.outputs))
    ⍜↙(↘ ¯:)        # discard extra args

  | [MakeFrame] ⋅∘
  )
  # -- stack [newframe]

)

# {parts span} stack -- stack' newframe?
Format ← (|2.2
  °□⊢                   # -- parts stack
  ⊃(∘|≡⍜°□$"_" ⊃↙↘ -1⧻) # take (parts-1) values from stack, stringify them
  ♭⍉⬚(□"")⊟             # alternate fragments and values
  ⊐/⊂                   # join everything up
  ⊂□                    # push resulting string
  ⊙[]                   # no new frame

)

# {func} stack -- stack' newframe?
Dynamic ← NotImplemented "Dynamic"
# {count span} stack -- stack' newframe?
PushLocals ← NotImplemented "PushLocals"
# {} stack -- stack' newframe?
PopLocals ← NotImplemented "PopLocals"
# {index span} stack -- stack' newframe?
GetLocal ← NotImplemented "GetLocal"
# {count span unbox} stack -- stack' newframe?
Unpack ← NotImplemented "Unpack"
# {count} stack -- stack' newframe?
PushTempFunctions ← NotImplemented "PushTempFunctions"
# {count} stack -- stack' newframe?
PopTempFunctions ← NotImplemented "PopTempFunctions"
# {offset sig span} stack -- stack' newframe?
GetTempFunction ← NotImplemented "GetTempFunction"
# {count span} stack -- stack' newframe?
TouchStack ← NotImplemented "TouchStack"
# {stack count span} stack -- stack' newframe?
PushTemp ← NotImplemented "PushTemp"
# {stack count span} stack -- stack' newframe?
PopTemp ← NotImplemented "PopTemp"
# {stack count span} stack -- stack' newframe?
CopyToTemp ← NotImplemented "CopyToTemp"
# {stack offset count span} stack -- stack' newframe?
CopyFromTemp ← NotImplemented "CopyFromTemp"
# {stack count span} stack -- stack' newframe?
DropTemp ← NotImplemented "DropTemp"
# {sig} stack -- stack' newframe?
PushSig ← NotImplemented "PushSig"
# {} stack -- stack' newframe?
PopSig ← NotImplemented "PopSig"
# {i n} stack -- stack' newframe?
SetOutputComment ← NotImplemented "SetOutputComment"

InstrTypePush ← 0
InstrTypePrim ← 1
InstrTypeOther ← 2

InstrNames ← {
  "Comment"
  "CallGlobal"
  "BindGlobal"
  "BeginArray"
  "EndArray"
  "Call"
  "PushFunc"
  "Switch"
  "Format"
  "Dynamic"
  "PushLocals"
  "PopLocals"
  "GetLocal"
  "Unpack"
  "PushTempFunctions"
  "PopTempFunctions"
  "GetTempFunction"
  "TouchStack"
  "PushTemp"
  "PopTemp"
  "CopyToTemp"
  "CopyFromTemp"
  "DropTemp"
  "PushSig"
  "PopSig"
  "SetOutputComment"}

InstrFns ← (
  Comment
| CallGlobal
| BindGlobal
| BeginArray
| EndArray
| Call
| PushFunc
| Switch
| Format
| Dynamic
| PushLocals
| PopLocals
| GetLocal
| Unpack
| PushTempFunctions
| PopTempFunctions
| GetTempFunction
| TouchStack
| PushTemp
| PopTemp
| CopyToTemp
| CopyFromTemp
| DropTemp
| PushSig
| PopSig
| SetOutputComment
)

InstrNamesToIds ← map ⊃(∘|⇡⧻) InstrNames

# instr = { (push|prim|other) (value|primid|{ instrid args }) }

# jsoninstr -- instr
AnalyzeInstr ← (
  type.
  (
    {InstrTypePush ∘} # number literal

  | [] ⍤$"complex in JSON? _"⊙0
  | {InstrTypePush ∘} # string literal

  | type°□⊢.
    (
      |1       # array literal: [ type shape elements ]
      : °{⊙⊙∘} # -- shape type elements
      ⊓(
        ⊐≡∘ # unbox shape

        | # unbox elements
        (
          # number array
          ≡°□
            | # complex array
          ≡(ℂ°{:}°□)
            | # char array
          ≡°□
            | # box array
          ∘
        )
      )
      # -- shape elements
      ±⧻.
      (
        # scalar (used for char literals)
        ⊢⊢ ;
        | # regular array: apply shape
        ↯
      )
      {InstrTypePush ∘}
    | [] ⍤$"complex in JSON? _"⊙0
    | #  [ "prim", … ]
      {InstrTypePrim ∘} get: PrimNamesToIds ⊢
    | # { "Instr": [ args… ] }
      °[{⊙∘}] MapPairs
      {InstrTypeOther {⊙∘}} get: InstrNamesToIds
    )
  )
)

# instr stack -- stack' newframe?
ExecuteInstr ← (|2.2
  °{⊙∘} # -- instrtype data
  (
    ⊂□  # push
    ⊙[] # no new frame

  | ExecPrimitive
  | # jsoninstrid jsoninstr
    °{⊙∘}
    InstrFns
  )
)

# frame = { pc addrs }

# frame -- bool
FrameDone ← ≤ ⊙⧻ °{⊙∘}

# frame instrs -- instr
FrameGetInstr ← °□⊡⊡ °{⊙∘}

# callstack stack instrs -- callstack' stack'
Advance ← (|3.2
  ⍜⊢(
    ⊙:         # -- frame instrs stack
    FrameDone. # reached end of top frame?
    (
      # no, go on
      ⊃(
        ⍜⊢ (+1) # bump pc

        | : ExecuteInstr FrameGetInstr
        # -- newframe? stack'

      )
      # -- frame newframe?  stack
      ⊂: # push new frame (if it exists) on top of callstack

    | []⋅⋅∘ # yes: destroy it, keep stack

    )
  )
)

# callstack -- bool
CallStackActive ← (
  (¬FrameDone °[∘]|1) >1⧻.
)

# jsonasm -- finalstack
Run ← (|1
  ⊃(
    ⊐≡≡∘°□get "top_slices"
    ≡MakeFrame # initial callstack from top_slices

  | °□get "instrs"
    ≡(AnalyzeInstr °□)
  )
  # -- callstack instrs
  ⊙EmptyStack # stack
  # -- callstack stack instrs
  ⍢(
    |3.3 ⊃Advance⋅⋅∘ # keep instrs

  | CallStackActive ⊙⋅∘
  )
  # -- callstack stack instrs
  ⋅⊙; # drop callstack and instrs

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
Replace ← ⊐/⊂ ↘1 ♭≡⊂ {∘}: ⊢⇌⍉ regex ⊃(⊂"(.*?)"|⊂: ⊙⋅∘|⋅∘)
⍤⊃⋅∘≍ "azzbzz" Replace "cc" "zz" "accbcc"

Escape ← ↘¯1 ⊐/⊂ ↘1♭≡⊂ ⊃(□⊂@\\|⊕□⍜▽¯:\+.=, ⊙(⊂:@.))
⍤⊃⋅∘≍ "a\\b\\\"c" Escape @" "a\\b\"c"
⍤⊃⋅∘≍ "a\\\\b\"c" Escape @\\ "a\\b\"c"

MakeCheckProgram ← (
  ⊃(
    ⍤"must run with absolute path for tests"=@/⊢. GetProgramPath
  | ⊜□≠@\t.
    ⊃(
      (""|⊐/$"_\n_") ±⧻. ↘¯1
    | °□⊢⇌
    )
  | $"\"_\"" Replace @\t "\\n" Escape @" Escape @\\ Escape @\\
  )
  $ # Experimental!
  $ Check ← &i "_" "Check"
  $ _
  $ {
  $ _
  $ }
  $ Check: _
  # &p$"---\n_\n---" .

)

# expr -- success
AutoCheck ← (|1
  MakeCheckProgram.
  # programtext expr
  ⍜WithTempFile (&runc {"uiua" "run" "--no-format" ∘})
  # -- exitcode stdout stderr
  ⊃(
    ↧ ∩(=0) ⊙⋅⧻ # success is exitcode=0 && empty stderr

  | ⋅⊂ # join stderr to stdout

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

RunTests ← &p⍜now(
  {
    $ 123
    $ "hello"
    $ @x
    $ @😇
    $ []
    $ [i 0 1 2]
    $ {}
    $ [[4 5 6][7 8 9]]
    $ ["x" "y"]
    $ {"x" "yz"}

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

    $ ⧻5
    $ △5
    $ ⇡5
    $ ⊢[1 2 3]
    $ ⇌[1 2 3]
    $ ♭5
    $ ¤5
    $ ⋯27
    $ ⍉.[[1 2] [3 4] [5 6]]
    $ ⍏[6 2 7 0 ¯1 5]
    $ ⍖[6 2 7 0 ¯1 5]
    $ ⊚ [1 0 0 1 0 1 1 0]
    $ ⊛[7 7 8 0 1 2 0]
    $ ⊝[7 7 8 0 1 2 0]
    $ ⊔□5
    $ ⋕ "17"

    $ ≍ [0 1 2] [0 1 2]
    $ ⊟ 1 2
    $ ⊂ 1 2
    $ ⊏ 2 [8 3 9 2 0]
    $ ⊡ 2 [8 3 9 2 0]
    $ ↯ [2 3] [1 2 3 4 5 6]
    $ ☇ 0 ↯[2 3 3]⇡18
    $ ↙ 3 [8 3 9 2 0]
    $ ↘ 3 [8 3 9 2 0]
    $ ↻1 ⇡5
    $ ◫2 .⇡4
    $ ▽ [1 0 2 3 1] [8 3 9 2 0]
    $ ⌕ 5 [1 8 5 2 3 5 4 5 6 7]
    $ ∊ 2 [1 2 3]
    $ ⊗ 2 [1 2 3]

    $ ⍤"ok" 1
    $ gen0
    $ deal0 [1 2 3 4 5]
    $ regex "h([io])" "hihaho"
    $ utf "hello!"
    $ ≥0 tag
    $ type 5
    $ ±now

    $ η
    $ π
    $ τ
    $ ∞

    $ map 1\_2 3\_4
    $ insert 1 2 {}
    $ has 1 map 1\_2 3\_4
    $ get 1 1\_2 3\_4
    $ remove 3 map 1\_2 3\_4

    $ - . ⚂

    $ &sc
    $ &cd "/tmp"
    $ &fras "/tmp/data1.tmp" &fwa "/tmp/data1.tmp" "data"
    $ &frab "/tmp/data2.tmp" &fwa "/tmp/data2.tmp" "data"
    $ &ims [[1 0][0 1]]
    $ type &args

    $ (10|20)0
    $ (10 20|20 30)1
    $ (*2|*4+)1 10 90
    $ (*2|*4+)0 10 90
    $ (*2|*4+)0 10 90 99
    $ (|4.3 1 2 3 ⋅⋅⋅;||3.2 5 6 ⋅⋅;)0 10 20 30 40
    $ (|4.3 1 2 3 ⋅⋅⋅;||3.2 5 6 ⋅⋅;)1 10 20 30 40

    $ F=+123\tF 4

    $ $"\_" 100
    $ $"[x=\_ y=\_]" 100 200
  }

  ⊐/⊂ ≡(⍜°□(⊜□ ≠@\n.))
  Parallel!(AutoCheck °□)
  # ≡(AutoCheck °□)
  &p⊡:"😭🎉" /↧
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
