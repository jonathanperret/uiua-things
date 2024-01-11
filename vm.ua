# Experimental!

JsonParse ← &i "json.ua" "JsonParse"

ExpandSlice ← +⊙⇡ °⊟

Log ← &p

# map -- keys
MapKeys ← ▽ ≡(¬≍NaN °□). °□⊢

# map -- pairs
MapPairs ← ⍉⊟°map

EmptyStack ← {}

# runtime = { callstack stack tempstacks }

# callstack -- runtime
MakeRuntime ← {⊃(∘|EmptyStack|{EmptyStack EmptyStack}|[])}

RtCallStack ← °□⊡0
RtStack ← °□⊡1
RtTempStacks ← °□⊡2
RtArrayStack ← °□⊡3

# slice -- frame
MakeFrame ← (|1
  ExpandSlice
  0 # pc
  {⊙∘}
)

# TODO inverse modifiers:
# (0[1], inv_dump),
# (1[1], inv_scan),
# (3[1], ungroup),
# (3[1], unpartition),

Trace ← ⊃∘(&p$"┌╴⸮\n_\n└╴╴╴╴"$"├╴_")

Stack ← ⊃∘(&p$"┌╴?\n_\n└╴╴╴╴"/⊐$"_\n_"≡(□$"├╴_"°□)⇌)

Args ← ↘1 &args

NoadicNoOutputNames ← {"stack" "inv_stack"}
NoadicNoOutputFns ← (Stack|Stack)

NoadicOneOutputNames ← {"tag" "now" "eta" "pi" "tau" "infinity" "scan_line" "rand" "args"}
NoadicOneOutputFns ← (tag|now|η|π|τ|∞|&sc|⚂|Args)

MonadicNoOutputNames ← {"pop" "show" "prin" "print" "change_directory" "im_show"}
MonadicNoOutputFns ← (;|&s|&pf|&p|&cd|&ims)

Last ← (|1
  ⊢⇌
)

MonadicOneOutputNames ← {
  "identity" "trace"
  "not" "sign" "neg" "abs" "sqrt" "sin" "floor" "ceil" "round"
  "len" "shape" "range" "first" "reverse" "deshape" "fix" "bits" "transpose" "rise" "fall"
  "where" "classify" "deduplicate" "box" "unbox" "parse"
  "utf" "type" "f_read_all_bytes" "f_read_all_str"
  "acos" "asin" "cos"
  "first_max_index" "first_min_index" "first_where"
  "inv_fix" "inv_parse" "inv_trace" "inv_utf" "inv_where"
  "inverse_bits"
  "last" "last_max_index" "last_min_index"
  "sort_down" "sort_up"}
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
| ⍤"acos"0∘
| ⍤"asin"0∘
| ⍤"cos"0∘
| ⍤"first_max_index"0∘
| ⍤"first_min_index"0∘
| ⍤"first_where"0∘
| ⍤"inv_fix"0∘
| ⍤"inv_parse"0∘
| ⍤"inv_trace"0∘
| ⍤"inv_utf"0∘
| ⍤"inv_where"0∘
| ⍤"inverse_bits"0∘
| Last
| ⍤"last_max_index"0∘
| ⍤"last_min_index"0∘
| ⍤"sort_down"0∘
| ⍤"sort_up"0∘
)

MonadicTwoOutputNames ← {
  "dup" "gen"
  "inv_atan"
  "inv_complex"
  "inv_couple"
  "inv_map"}
MonadicTwoOutputFns ← (.|gen|⍤"inv_atan"0.|⍤"inv_complex"0.|⍤"inv_couple"0.|⍤"inv_map"0.)

DyadicNoOutputNames ← {"assert" "f_write_all"}
DyadicNoOutputFns ← (⍤|&fwa)

Unfirst ← (|2
  ⍜⊢(⋅∘)
)

DyadicOneOutputNames ← {
  "eq" "ne" "lt" "le" "gt" "ge" "add" "sub" "mul" "div" "mod" "pow" "log" "min" "max" "atan" "complex"
  "match" "couple" "join" "select" "pick" "reshape" "rerank" "take" "drop" "rotate" "windows" "keep" "find" "member" "index_of"
  "deal" "map" "has" "get" "remove" "regex"
  "unfirst" "unlast" "unreshape"}
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
| Unfirst
| ⍤"unlast"0⋅∘
| ⍤"unreshape"0⋅∘
)

DyadicTwoOutputNames ← {"flip"}
DyadicTwoOutputFns ← (:|⍤"bad prim id"0)

DyadicThreeOutputNames ← {"over"}
DyadicThreeOutputFns ← (,|⍤"bad prim id"0 ,)

TriadicNoOutputNames ← {
  "insert"
  "undrop"
  "unkeep"
  "unpick"
  "unrerank"
  "unselect"
  "untake"}
TriadicOneOutputFns ← (
  insert
| ⍤"undrop"0⋅⋅∘
| ⍤"unkeep"0⋅⋅∘
| ⍤"unpick"0⋅⋅∘
| ⍤"unrerank"0⋅⋅∘
| ⍤"unselect"0⋅⋅∘
| ⍤"untake"0⋅⋅∘
)

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

# primid stack -- stack'
ExecPrimitive ← (
  °⊟
  (
    NoadicNoOutputFns
  | ⊂□ NoadicOneOutputFns
  | MonadicNoOutputFns ⊙⊃(°□⊢|↘1)
  | ⊂□ MonadicOneOutputFns ⊙⊃(°□⊢|↘1)
  | ⊂{⊙∘} MonadicTwoOutputFns ⊙⊃(°□⊢|↘1)
  | DyadicNoOutputFns ⊙⊃(°{⊙∘}↙2|↘2)
  | ⊂□ DyadicOneOutputFns ⊙⊃(°{⊙∘}↙2|↘2)
  | ⊂{⊙∘} DyadicTwoOutputFns ⊙⊃(°{⊙∘}↙2|↘2)
  | ⊂{⊙⊙∘} DyadicThreeOutputFns ⊙⊃(°{⊙∘}↙2|↘2)
  | ⊂□ TriadicOneOutputFns ⊙⊃(°{⊙⊙∘}↙3|↘3)
  )
)

NotImplemented ← |2 ∘ ⍤⊙0 $"_ is not implemented"

# {ident} runtime -- runtime'
Comment ← NotImplemented "Comment"

# {index call sig} runtime -- runtime'
CallGlobal ← NotImplemented "CallGlobal"

# {span index} runtime -- runtime'
BindGlobal ← NotImplemented "BindGlobal"

# [] runtime -- runtime'
BeginArray ← (|2
  ; # drop dummy arg
  # -- runtime
  # get current stack len
  ⧻RtStack.
  # push it onto arraystack
  # -- stacklen runtime
  ⍜⊙RtArrayStack ⊂
)

# boxed runtime -- runtime'
EndArray ← (|2
  # pop current stack contents
  # -- boxed runtime
  ⊙(
    # -- runtime
    ⍜RtArrayStack (
      ⊃(↘1|¯°□⊢)
    )
    # -- runtime -startlevel
    ⍜RtStack(⊃↙↘ :) # take and drop from bottom of stack

  )
  # -- boxed runtime' values
  (
    # unboxed: need to unbox stack values
    ⊙(
      ±⧻.
      (
        [] # special case for empty array

        | ⊐≡∘
      )
    )
  | # boxed: nothing to do

  )
  # -- runtime' value
  ⍜RtStack (⊂□:) # push array to stack

)

# fn on stack = [ sig slice ]

# [] runtime -- runtime'
Call ← (|2
  ⋅⍜RtStack (
    # -- stack index
    ⊃(↘1|⊡1°□⊢)
    # -- stack'

  )
  # -- runtime fnslice
  ⍜RtCallStack(⊂ MakeFrame :) # push new frame onto callstack

)

# [ sig slice ] runtime -- runtime'
PushFunc ← (
  ⍜⊙RtStack(⊂□) # push fn

)

# {fncount sig} runtime -- runtime'
Switch ← (|2
  :
  ⍜RtStack (
    :
    °{⊙∘} # get fncount, sig
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

    | ⋅∘ # keep fnslice

    )
    # -- stack fnslice

  )
  # -- runtime fnslice
  ⍜RtCallStack(⊂ MakeFrame :) # push new frame onto callstack

)

# parts runtime -- runtime'
Format ← (|2
  ⍜⊙RtStack (
    # -- parts stack
    ⊃(∘|≡⍜°□$"_" ⊃↙↘ -1⧻) # take (parts-1) values from stack, stringify them
    ♭⍉⬚(□"")⊟             # alternate fragments and values
    ⊐/⊂                   # join everything up
    ⊂□                    # push resulting string

  )
)

# {func} runtime -- runtime'
Dynamic ← NotImplemented "Dynamic"

# {count span} runtime -- runtime'
PushLocals ← NotImplemented "PushLocals"

# {} runtime -- runtime'
PopLocals ← NotImplemented "PopLocals"

# {index span} runtime -- runtime'
GetLocal ← NotImplemented "GetLocal"

# {count span unbox} runtime -- runtime'
Unpack ← NotImplemented "Unpack"

# {count} runtime -- runtime'
PushTempFunctions ← NotImplemented "PushTempFunctions"

# {count} runtime -- runtime'
PopTempFunctions ← NotImplemented "PopTempFunctions"

# {offset sig span} runtime -- runtime'
GetTempFunction ← NotImplemented "GetTempFunction"

# count runtime -- runtime'
TouchStack ← (|2
  ⋅∘ # TODO update arraystack

)

# [stackid count] runtime -- runtime'
PushTemp ← (|2
  °⊟
  # -- stackid count runtime
  ⊙⍜⊙RtStack ⊃↙↘ # take from stack
  # -- stackid values runtime'
  ⊙:
  # -- stackid runtime values
  ⍜(°□⊡⊙RtTempStacks) (⊂⇌:)
)

# [stackid count] runtime -- runtime'
PopTemp ← (|2
  : °⊟
  # -- count stackid runtime
  ⍜(⊙(°□⊡) ⊙⊙RtTempStacks) ⊃↙↘
  # -- runtime values
  ⍜⊙RtStack (⊂⇌) # push to stack

)

# [stackid count] runtime -- runtime'
CopyToTemp ← (|2
  °⊟
  # -- stackid count runtime
  # copy from stack
  ⊃⋅(↙ ⊙RtStack) ⊙⋅∘
  # -- values stackid runtime
  ⍜⊙⊙RtTempStacks ⍜⊙(°□⊡) (⊂⇌)
)

# [stackid offset count] runtime -- runtime'
CopyFromTemp ← (|2
  °[⊙⊙∘]
  # -- stackid offset count runtime
  ⊃(⋅:|°□⊡ ⊙(RtTempStacks ⋅⋅∘)|⋅⋅⋅∘)
  # -- count offset tempstack runtime
  ↙ ⊙↘
  # -- values runtime
  ⍜⊙RtStack (⊂⇌) # push to stack

)

# [stackid count] runtime -- runtime'
DropTemp ← (|2
  :°⊟
  # -- count stackid runtime
  ⍜⊙⊙RtTempStacks ⍜⊙(°□⊡) ↘
)

# {sig} runtime -- runtime'
PushSig ← NotImplemented "PushSig"

# {} runtime -- runtime'
PopSig ← NotImplemented "PopSig"

# {i n} runtime -- runtime'
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
  | ∊: {"BeginArray" "PopLocals"}□. # match instructions disguised as string literals
    (
      {InstrTypePush ∘} # nope, just a regular string literal

    | {InstrTypeOther {⊙[]}} get: InstrNamesToIds # yep, a no-arg instr

    )
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
    | #  [ "prim", span ]
      {InstrTypePrim ∘} get: PrimNamesToIds ⊢
    | # { "Instr": [ args… ] }
      °[{⊙∘}] MapPairs
      get: InstrNamesToIds
      ⊃(⊙∘|∘)
      (
        ⋅[] # Comment(ident)

        | ∘ # CallGlobal

        | ∘ # BindGlobal

        | ⋅[] # BeginArray

        | °□⊢ # EndArray(boxed, span)

        | ⋅[] # Call(span)

        | [⊓(;|⊐≡∘|⊐≡∘)] °{⊙⊙∘} # PushFunc(id, slice, sig)

        | {⊓(∘|⊐≡∘|;)} °{⊙⊙∘} # Switch(count, sig, span)

        | °□⊢ # Format(parts, span)

        | ∘ # Dynamic

        | ∘ # PushLocals

        | ∘ # PopLocals

        | ∘ # GetLocal

        | ∘ # Unpack

        | ∘ # PushTempFunctions

        | ∘ # PopTempFunctions

        | ∘ # GetTempFunction

        | °□⊢ # TouchStack(count, span)

        | ⊟ ⊗: {"Inline" "Under"}□ ⊙⊙; °{⊙⊙∘} # PushTemp(stack, count, span)

        | ⊟ ⊗: {"Inline" "Under"}□ ⊙⊙; °{⊙⊙∘} # PopTemp(stack, count, span)

        | ⊟ ⊗: {"Inline" "Under"}□ ⊙⊙; °{⊙⊙∘} # CopyToTemp(stack, count, span)

        | [⊙⊙∘] ⊗: {"Inline" "Under"}□ ⊙⊙⊙; °{⊙⊙⊙∘} # CopyFromTemp(stack, offset, count, span)

        | ⊟ ⊗: {"Inline" "Under"}□ ⊙⊙; °{⊙⊙∘} # DropTemp(stack, count, span)

        | ∘ # PushSig

        | ∘ # PopSig

        | ∘ # SetOutputComment

      )
      :
      {InstrTypeOther {⊙∘}}
    )
  )
)

# runtime instr -- runtime'
ExecInstr ← (|2
  :
  # -- instr runtime
  °{⊙∘} # -- instrtype instrdetail runtime
  (
    # push
    # -- value runtime
    :
    # -- runtime value
    ⍜RtStack(
      :
      ⊂□ # push onto stack

    )
  | # prim
    # -- primid runtime
    :
    # -- runtime primid
    ⍜RtStack(
      :
      ExecPrimitive
    )
  | # other
    # -- instr runtime
    °{⊙∘} # -- instrid instrargs runtime
    InstrFns
  )
)

# frame = { pc addrs }
FramePc ← ⊢

# frame -- bool
FrameDone ← ≤ ⊙⧻ °{⊙∘}

# frame instrs -- instr
FrameGetInstr ← °□⊡⊡ °{⊙∘}

# runtime instrs -- runtime'
Advance ← (|2
  # -- runtime instrs
  ⊃(FrameDone ⊢RtCallStack|∘)
  # reached end of top frame?
  (
    |2 # no, go on
    # -- runtime instrs
    ⍜(⊢RtCallStack)(|2.2
      # -- topframe instrs
      ⊃(
        ⍜FramePc (+1) # bump pc

        | FrameGetInstr # fetch next instr

      )
    )
    # -- runtime' instr
    ExecInstr
    # -- runtime

  | |1 # yes: destroy it, keep stack
    # -- runtime
    ⍜RtCallStack (↘1)
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
  MakeRuntime # -- runtime instrs
  ⍢(
    |2.2 Advance ⊙. # keep instrs

  | CallStackActive °□⊢
  )
  # -- runtime instrs
  ⊙;      # drop instrs
  RtStack # extract stack

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

ThreadCount ← NumProcs

Parallel! ← (
  ⊐/⊂ ▽≡⧻. ≡(□≡wait ≡spawn^1 ▽≡(¬≍□0).) ⬚(□0)↯ ⊟ :ThreadCount ¯1
)

RunTests ← &p⍜now(
  {
    # literals
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

    # stack operations
    $ .2
    $ ,1 2
    $ :1 2
    $ ;1 2 3

    # monadic pervasive
    $ ∘ 3
    $ ¬ 3
    $ ± 3
    $ ¯ 1
    $ ⌵ `1
    $ √ 4
    $ ○ 0
    $ ⌊ 1234.56
    $ ⌈ 1.234
    $ ⁅ 5.678

    # dyadic pervasive
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

    # monadic array
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

    # dyadic array
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

    # misc
    $ ⍤"ok" 1
    $ gen0
    $ deal0 [1 2 3 4 5]
    $ regex "h([io])" "hihaho"
    $ utf "hello!"
    $ ≥0 tag
    $ type 5
    $ ±now
    $ - . ⚂

    # constants
    $ η
    $ π
    $ τ
    $ ∞

    # maps
    $ map 1\_2 3\_4
    $ insert 1 2 {}
    $ has 1 map 1\_2 3\_4
    $ get 1 1\_2 3\_4
    $ remove 3 map 1\_2 3\_4

    # System
    $ &sc
    $ &cd "/tmp"
    $ &fras "/tmp/data1.tmp" &fwa "/tmp/data1.tmp" "data"
    $ &frab "/tmp/data2.tmp" &fwa "/tmp/data2.tmp" "data"
    $ &ims [[1 0][0 1]]
    $ type &args

    # Switch
    $ (10|20)0
    $ (10 20|20 30)1
    $ (*2|*4+)1 10 90
    $ (*2|*4+)0 10 90
    $ (*2|*4+)0 10 90 99
    $ (|4.3 1 2 3 ⋅⋅⋅;||3.2 5 6 ⋅⋅;)0 10 20 30 40
    $ (|4.3 1 2 3 ⋅⋅⋅;||3.2 5 6 ⋅⋅;)1 10 20 30 40

    # Format
    $ $"\_" 100
    $ $"[x=\_ y=\_]" 100 200

    # PushTemp, PopTemp
    $ ⊙100 200
    $ ⊙⊙∘ 100 200 300
    $ ⊙⋅⋅⊙100 200 300 400 500
    $ ⊙⋅⋅⊙∘ 100 200 300 400 500
    $ ⊃(×2|+1) 100
    $ ⊃(×2+|+1) 100 200 300
    $ ⊃(×2|⊙∘) 10 100 1000

    # CopyToTemp, CopyFromTemp, DropTemp
    $ ⍜(×10) ⁅ 1.234
    $ ⍜⊢(×2) [1 2 3]
    $ ⊢⇌[1 2 3]

    # Call
    $ F ← ⍤.1\tF

    # BeginArray, EndArray
    $ {. "hello"}
    $ [. 123]
    $ [. {. 123}]
    $ [. 123 456] 789
    $ {;1} 789
    $ [;1] 789

    # reduce
    # $ /+ [1 2 3 4 5]
    # $ /- [1 2 3 4 5]
    # $ /- [1 2 3 4 5]
    # $ \- [1 2 3 4 5]
    # $ /(×+1) [1 2 3 4 5]
    # $ /⊂ .↯[2 2 4]⇡16
    # $ /+ []
    # $ /× []
    # $ /↥ []
    # $ /↧ []
    # $ /∠ []

    # fold
    # $ ∧+ [1 2 3] 10
    # $ ∧+ [] 10
    # $ ∧(⊃+(×⊙⋅∘)) +1⇡5 0 1
    # $ ∧(⊃+(×⊙⋅∘))⊙(0 1) +1⇡5
    # $ ∧⊃(+⊙⋅∘)(×⋅⊙⋅∘) [1 2 3] [4 5 6] 0 1
    # $ ∧(⊂⊂) [1 2 3] 4 []
    # $ ⇌∧(⊂+⊙(⊢.)) ⊃↘↙1 [1 2 3 4]

    # scan
    # $ \+   [1 2 3 4]
    # $ \-   [1 2 3 4]
    # $ \(-:) [1 2 3 4]
    # $ ▽\↧≠@ . "Hello World!"
    # $ ⊕□\+=@    . "Everyday man's on the block"
    # $ ⊕□\+↻¯1=@ . "Everyday man's on the block"

    # each
    # $ ∵(⊟.) [1 2 3 4]
    # $ ∵⊂ [1 2 3] [4 5 6]
    # $ ∵⊂ [1 2] [[4 5] [6 7]]
    # $  + [1 2 3] [4 5 6]

    # rows
    # $  /+ [[1 2 3] [4 5 6] [7 8 9]]
    # $ ≡/+ [[1 2 3] [4 5 6] [7 8 9]]
    # $ ≡/+ [[1 2] [3 4]] [5 6]
    # $ ≡⊂  [[1 2] [3 4]] [5 6]
    # $ ≡⊂ [1 2 3] 4
    # $ ≡⊂ 1 [2 3 4]
    # $ ≡(⊂⊂) 1 [2 3 4] 5
    # $ ≡⊂ ¤  [1 2 3] [4 5 6]
    # $ ≡⊂ ⊙¤ [1 2 3] [4 5 6]

    # table
    # $ ⊞+ [1 2 3] [4 5 6 7]
    # $ ⊞⊂ [1 2] [3 4]
    # $ △⊞+ [1 2] [3 4 5]
    # $ △⊞⊂ [1 2] [3 4 5]
    # $ △⊞+ [[1 2 3] [4 5 6]] [7 8 9 10]
    # $ △⊞⊂ [[1 2 3] [4 5 6]] [7 8 9 10]

    # cross
    # $ ⊠⊂ ,,[[7 8] [9 10]][[1 2] [3 4] [5 6]]
    # $ ⊠(⊂⊂) [1 2] [3 4] [5 6]
    # $ /⊂ ⊠(⊂⊂) ⊙¤ [1 2] [3 4] [5 6]

    # repeat
    # $ ⍥(+2)5 0
    # $ ⍥(⊂2)5 []
    # $ ⍥⊂3 [] 1 2 3

    # group
    # $ ⊕∘ [0 2 2 1 0 1] [1 2 3 4 5 6]
    # $ ⊕⊂ [] [0 2 2 1 0 1] [1 2 3 4 5 6]
    # $ ⊕□ [0 1 0 2 1 1] [1 2 3 4 5 6]
    # $ ⊕{⊢:⧻.} ⊛.⊏⍏. $ Count the characters is this string
    # $ ⍜⊕□≡⇌ ≠@ . $ These are some words

    # partition
    # $ ⊜∘ [0 0 2 2 1 1 3 3] [1 2 3 4 5 6 7 8]
    # $ ⊜⊂ [] [0 0 2 2 1 1 3 3] [1 2 3 4 5 6 7 8]
    # $ ⊜□ [0 2 3 3 3 0 1 1] [1 2 3 4 5 6 7 8]
    # $ ⊜□ ≠@ . $ Hey there friendo
    # $ ⍜⊜□⇌ ≠@ . $ These are some words

    # unpack
    # $ ⊐/⊂ {"a" "bc" "def"}
    # $ ⊐(¯□3)
    # $ ⊐( □3)

    # do
    # $ ⍢(×2)(<1000) 1
    # $ ⍢⊂(¬∊,,(+1×3|÷2)=0◿2.⊢.) [7]
    # $ ⍢(×3)(<100)  1
    # $ ⍢(×3)(<100.) 1
    # $ ⍢(⊃(×2)⊂)(<100) 1 []

    # fill
    # $ ⬚0↙ 7 [8 3 9 2 1]
    # $ ⬚π↙ ¯6 [1 2 3]
    # $ ⬚42↙ 4 [[1 2 3] [4 5 6]]
    # $ ⬚0⊟ 1 [2 3]
    # $ ⬚0⊟ [1 2] [3 4 5 6]
    # $ ⬚0⊟ [1 2 3] [[4 5] [6 7]]
    # $ ⬚0⊂ 1 [[2 3 4] [5 6 7]]
    # $ ⬚0⊂ [[1 2] [3 4]] [5 6 7]
    # $ ⬚0[1 [2 3] [4 5 6]]
    # $ ⬚0+ [1 2 3] [10 9 8 7 6 5]
    # $ ⬚0\⊂ [1 2 3 4 5]
    # $ ⬚@ ⊜∘≠@ . "No □ needed!"
    # $ ⬚∞⊏ [3 7 0] [8 3 9 2 0]
    # $ ⬚0▽ ≡/>◫2. [1 8 0 2 7 2 3]
    # $ ⬚0↯ [3 5] ⇡9
    # $ ⬚0↻ 2 [1 2 3 4 5]
    # $ ⬚∘+ 100 [1 2 3 4] [5 6]
    # $ ⬚0(↻1 ⇡5 ⬚[]↻3 ⇡5 ↻2 ⇡5)

    # try
    # $ ⍣(+1 2)$"Error:  "
    # $ ⍣(+@a @b)$"Error:  "

    # this
    # recur
    # $ ↬((|1 ×↫-1.|1)<2.) 5

    # bind
    # $ bind(⊂ b + a c) 1 2 3

    # memo
    # $ ∵memo(+⌊×10⚂)[1 1 2 2 3 3]

    # spawn
    # wait
    # $ wait spawn⇡ 10

    # send
    # recv
    # tryrecv

    # dump
    # $ dump⊢ [1 2 3] 4 [5 6 7]
  }

  ⊐/⊂ ≡(⍜°□(⊜□ ≠@\n.))
  Parallel!(AutoCheck °□)
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
