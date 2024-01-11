# Experimental!

JsonParse ← &i "json.ua" "JsonParse"

ExpandSlice ← +⊙⇡ °⊟

Log ← &p

# map -- pairs
MapPairs ← ⍉⊟°map

EmptyStack ← {}

# runtime = { callstack stack tempstacks arraystack }

# callstack -- runtime
MakeRuntime ← {⊃(∘|EmptyStack|{EmptyStack EmptyStack}|[])}

RtCallStack ← °□⊢
RtStack ← °□⊡1
RtTempStacks ← °□⊡2
RtArrayStack ← °□⊡3

# count runtime -- runtime'
RtTouchStack ← (|2
  - ⊙(⧻RtStack.) # compute stacklength if count values were popped
  # -- newlength runtime
  ⍜⊙RtArrayStack ↧ # lower arraystack entries if above newlength

)

# count runtime -- values runtime'
RtPop ← (
  ⊃(∘|RtTouchStack)
  # -- count runtime'
  ⍜⊙RtStack ⊃↙↘
)

# value(s) runtime -- runtime'
RtPush ← ⍜⊙RtStack ⊂

FrameTypePlain ← 0
FrameTypeRepeat ← 1

# frame = { frametype ({ pc addrs } | { counter count fn }) }

# slice -- frame
MakePlainFrame ← (|1
  ExpandSlice
  0 # pc
  {⊙∘}
  {FrameTypePlain ∘}
)

# count [fnsig fnslice] -- frame
MakeRepeatFrame ← (|2
  ⊙(⊢⇌) # keep only fnslice
  0     # pc
  {⊙⊙∘}
  {FrameTypeRepeat ∘}
)

FrameType ← °□⊡0

ToDo ← ⍤⊙0 $"_ is not implemented"

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
  "trace"
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
  Trace
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
| ∘ ToDo "acos"
| ∘ ToDo "asin"
| ∘ ToDo "cos"
| ∘ ToDo "first_max_index"
| ∘ ToDo "first_min_index"
| ∘ ToDo "first_where"
| ∘ ToDo "inv_fix"
| ∘ ToDo "inv_parse"
| ∘ ToDo "inv_trace"
| ∘ ToDo "inv_utf"
| °⊚
| °⋯
| Last
| ∘ ToDo "last_max_index"
| ∘ ToDo "last_min_index"
| ∘ ToDo "sort_down"
| ∘ ToDo "sort_up"
)

MonadicTwoOutputNames ← {"dup" "gen" "inv_atan" "inv_complex" "inv_couple" "inv_map"}
MonadicTwoOutputFns ← (
  .
| gen
| . ToDo "inv_atan"
| . ToDo "inv_complex"
| . ToDo "inv_couple"
| . ToDo "inv_map"
)

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
| ⋅∘ ToDo "unlast"
| ⋅∘ ToDo "unreshape"
)

DyadicTwoOutputNames ← {"flip"}
DyadicTwoOutputFns ← (:|⍤"bad prim id"0)

DyadicThreeOutputNames ← {"over"}
DyadicThreeOutputFns ← (,|⍤"bad prim id"0 ,)

TriadicOneOutputNames ← {
  "insert"
  "undrop"
  "unkeep"
  "unpick"
  "unrerank"
  "unselect"
  "untake"}
TriadicOneOutputFns ← (
  insert
| ⋅⋅∘ ToDo "undrop"
| ⋅⋅∘ ToDo "unkeep"
| ⋅⋅∘ ToDo "unpick"
| ⋅⋅∘ ToDo "unrerank"
| ⋅⋅∘ ToDo "unselect"
| ⋅⋅∘ ToDo "untake"
)

# runtime -- runtime'
Identity ← (|1
  RtTouchStack 1
)

# runtime -- runtime'
Repeat ← (|1
  °{⊙∘} RtPop 2 # get fn and repeat count from stack
  # -- fn count runtime'
  ⊃(⋅±|MakeRepeatFrame :)
  (
    # special case 0 count: do nothing (return runtime)
    ⋅∘
  | # -- newframe runtime
    ⍜⊙RtCallStack ⊂
  )
)

SpecialNames ← {
  "identity" "reduce" "fold" "scan" "each" "rows" "table" "cross" "repeat" "group" "partition" "unpack"
  "do" "fill" "try" "this" "recur" "bind" "memo" "spawn" "wait" "send" "recv" "tryrecv" "dump"
  "inv_dump" "inv_scan" "ungroup" "unpartition"}
SpecialFns ← (
  Identity
| ToDo "reduce"
| ToDo "fold"
| ToDo "scan"
| ToDo "each"
| ToDo "rows"
| ToDo "table"
| ToDo "cross"
| Repeat
| ToDo "group"
| ToDo "partition"
| ToDo "unpack"
| ToDo "do"
| ToDo "fill"
| ToDo "try"
| ToDo "this"
| ToDo "recur"
| ToDo "bind"
| ToDo "memo"
| ToDo "spawn"
| ToDo "wait"
| ToDo "send"
| ToDo "recv"
| ToDo "tryrecv"
| ToDo "dump"
| ToDo "inv_dump"
| ToDo "inv_scan"
| ToDo "ungroup"
| ToDo "unpartition"
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
  TriadicOneOutputNames
  SpecialNames}

PrimIds ← ≡(□≡⊂⊙°□) ⊃(⇡⧻|≡(□⇡⧻)) PrimNameLists

PrimNamesToIds ← map ∩⊐/⊂ PrimNameLists PrimIds

# primid runtime -- runtime'
ExecPrimitive ← (
  °⊟
  # -- primtype primsubid runtime
  (
    NoadicNoOutputFns
  | RtPush □ NoadicOneOutputFns
  | MonadicNoOutputFns ⊙(°{∘}RtPop 1)
  | RtPush □ MonadicOneOutputFns ⊙(°{∘}RtPop 1)
  | RtPush {⊙∘} MonadicTwoOutputFns ⊙(°{∘}RtPop 1)
  | DyadicNoOutputFns ⊙(°{⊙∘}RtPop 2)
  | RtPush □ DyadicOneOutputFns ⊙(°{⊙∘}RtPop 2)
  | RtPush {⊙∘} DyadicTwoOutputFns ⊙(°{⊙∘}RtPop 2)
  | RtPush {⊙⊙∘} DyadicThreeOutputFns ⊙(°{⊙∘}RtPop 2)
  | RtPush □ TriadicOneOutputFns ⊙(°{⊙⊙∘}RtPop 3)
  | SpecialFns
  )
)

# {ident} runtime -- runtime'
Comment ← ∘ToDo "Comment"

# {index call sig} runtime -- runtime'
CallGlobal ← ∘ToDo "CallGlobal"

# {span index} runtime -- runtime'
BindGlobal ← ∘ToDo "BindGlobal"

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
  RtPush □:
)

# fn on stack = [ sig slice ]

# [] runtime -- runtime'
Call ← (|2
  MakePlainFrame ⊡1°{∘} RtPop 1 ;
  ⍜⊙RtCallStack ⊂ # push new frame onto callstack

)

# [ sig slice ] runtime -- runtime'
PushFunc ← RtPush □

# {fncount sig} runtime -- runtime'
Switch ← (|2
  °{⊙∘} # get fncount, sig
  # -- fncount sig runtime
  ⊃(⋅∘|RtPop +1 ⊙⋅∘) # pop fns and selector
  # -- sig values runtime'
  ⊙(°□⊡ -2 ¯°□⊢⇌.) # pick selected fn # TODO: array selectors
  # -- sig fn runtime
  ⊃(:°⊟ ⋅∘|⊙⋅∘)
  # -- fnslice fnsig sig runtime
  ⊓(
    MakePlainFrame
  |                 # compute args to discard
    ⊃(⋅⊢|⋅⋅∘|/-⇌ -) # -- sig.args runtime discardcount=((sig.args - f.sig.args) - (sig.outputs - f.sig.outputs))
    ⍜⊙RtStack (
      # -- takecount stack discardcount
      ⍜↙(↘ ¯:) # discard extra args

    )
    # --runtime

  )
  # -- newframe runtime
  ⍜⊙RtCallStack ⊂ # push new frame onto callstack

)

# parts runtime -- runtime'
Format ← (|2
  ⊃(-1⧻|⋅∘|∘)
  # -- runtime placeholdercount parts
  :RtPop
  # -- runtime' values parts
  ⊙(
    ≡(⍜°□$"_") # stringify values
    # -- strings parts
    ♭⍉⬚(□"")⊟: # alternate fragments and values
    # -- strings
    ⊐/⊂ # join everything up

  )
  # -- runtime result
  RtPush □ : # push resulting string

)

# {func} runtime -- runtime'
Dynamic ← ∘ToDo "Dynamic"

# {count span} runtime -- runtime'
PushLocals ← ∘ToDo "PushLocals"

# {} runtime -- runtime'
PopLocals ← ∘ToDo "PopLocals"

# {index span} runtime -- runtime'
GetLocal ← ∘ToDo "GetLocal"

# {count span unbox} runtime -- runtime'
Unpack ← ∘ToDo "Unpack"

# {count} runtime -- runtime'
PushTempFunctions ← ∘ToDo "PushTempFunctions"

# {count} runtime -- runtime'
PopTempFunctions ← ∘ToDo "PopTempFunctions"

# {offset sig span} runtime -- runtime'
GetTempFunction ← ∘ToDo "GetTempFunction"

TouchStack ← RtTouchStack

# [stackid count] runtime -- runtime'
PushTemp ← (|2
  °⊟
  # -- stackid count runtime
  ⊙(:RtPop)
  # -- stackid runtime values
  ⍜(°□⊡⊙RtTempStacks) (⊂⇌:)
)

# [stackid count] runtime -- runtime'
PopTemp ← (|2
  : °⊟
  # -- count stackid runtime
  ⍜(⊙(°□⊡) ⊙⊙RtTempStacks) ⊃↙↘
  # -- runtime values
  RtPush ⇌ # push to stack

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
  RtPush⇌ # push to stack

)

# [stackid count] runtime -- runtime'
DropTemp ← (|2
  :°⊟
  # -- count stackid runtime
  ⍜⊙⊙RtTempStacks ⍜⊙(°□⊡) ↘
)

# {sig} runtime -- runtime'
PushSig ← ∘ToDo "PushSig"

# {} runtime -- runtime'
PopSig ← ∘ToDo "PopSig"

# {i n} runtime -- runtime'
SetOutputComment ← ∘ToDo "SetOutputComment"

# count runtime -- runtime'
TransposeN ← (|2
  ⊙(°{∘}RtPop 1)
  # -- count array runtime
  (⍥⍉|⍥°⍉¯) <0. # repeat transpose
  RtPush □      # push result

)

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
  "SetOutputComment"
  "transpose_n"}

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
| TransposeN
)

InstrNamesToIds ← map ⊃(∘|⇡⧻) InstrNames

# instr = { (push|prim|other) (value|primid|{ instrid args }) }

NullToNaN ← (∘|NaN) ≍[].

DeserializeArray ← ↬(
  : °{⊙⊙∘} # -- shape type elements
  ⊓(
    ⊐≡∘ # unbox shape

  | # unbox elements
    (
      ≡(NullToNaN °□) # number array: replace nulls with NaN

    | ℂ≡(∩NullToNaN °{:} °□) # complex array

    | ♭≡°□ # char array

    | # box array
      ≡(
        ⍜°□ (
          type.
          (
            NullToNaN
                | ⍤"complex in JSON?"0
                | ∘
                | |1 ↫ # nested array literal

          )
        )
      )
    )
  )
  # -- shape elements
  ±⧻.
  (
    # scalar (used for char literals)
    ⊢ ;
  | # regular array: apply shape
    ↯
  )
)

# jsoninstr -- instr
AnalyzeInstr ← (
  type.
  (
    # number literal
    {InstrTypePush NullToNaN}
  | ⍤$"complex in JSON?"0
  | ∊: {"BeginArray" "PopLocals"}□. # match instructions disguised as string literals
    (
      {InstrTypePush ∘} # nope, just a regular string literal

    | {InstrTypeOther {⊙[]}} get: InstrNamesToIds # yep, a no-arg instr

    )
  | type°□⊢.
    (
      DeserializeArray # array literal
      {InstrTypePush ∘}
    | ⍤$"complex in JSON?"0
    | #  [ "prim", span ]
      {InstrTypePrim ∘} get: PrimNamesToIds ⊢
    |                     # { "Instr": [ args… ] }
      =3⍣(type°□⊢°□⊢)⋅⋅0. # detect [ { "transpose_n": n } ]
      (
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
        | # other
        °{⊙∘}⊢MapPairs°□⊢
        get: InstrNamesToIds
        {InstrTypeOther {⊙∘}}
      )
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
    RtPush □ # push onto stack

  | # prim
    # -- primid runtime
    ExecPrimitive
  | # other
    # -- instr runtime
    °{⊙∘} # -- instrid instrargs runtime
    InstrFns
  )
)

# { frametype { pc addrs } } -- bool
PlainFrameDone ← ≤ ⊙⧻ °{⊙∘} °□⊢⇌

# { frametype { pc addrs } } instrs -- instr
PlainFrameGetInstr ← °□⊡⊡ °{⊙∘} °□⊢⇌

# { frametype { pc addrs } } -- pc
PlainFramePc ← °□⊢°□⊢⇌

# { frametype { counter count fn } } -- counter
RepeatFrameCounter ← °□⊢°□⊢⇌

# { frametype { counter count fn } } -- bool
RepeatFrameDone ← /≤ ↙2 °□⊢⇌

# { frametype { counter count fn } } -- fn
RepeatFrameFn ← °□⊡2 °□⊢⇌

# runtime instrs -- runtime'
Advance ← (|2
  # -- runtime instrs
  FrameType ⊢RtCallStack. # switch on top frame type
  (
    # plain frame
    ⍜(⊢RtCallStack)(|2.2
      # -- topframe instrs
      ⊃(
        ⍜PlainFramePc (+1) # bump pc
        PlainFrameDone.    # done?
        (
          # no: keep frame

            | ⋅[] # yes: destroy frame

        )
        | PlainFrameGetInstr # fetch next instr

      )
    )
    # -- runtime' instr
    ExecInstr
    # -- runtime

  | # repeat frame

    ⍜(⊢RtCallStack)(|1.2
      # -- topframe
      ⊃(
        ⍜RepeatFrameCounter (+1) # bump counter
        RepeatFrameDone.         # done?
        (
          # no: keep frame

            | ⋅[] # yes: destroy frame

        )
        | RepeatFrameFn
      )
    )
    # -- runtime'  fnslice
    ⊙(MakePlainFrame) # make frame from fn
    # -- runtime newframe
    ⍜RtCallStack(⊂ :) # push new frame onto callstack
    # -- runtime

  )
)

# jsonasm -- finalstack
Run ← (|1
  ⊃(
    ⊐≡≡∘°□get "top_slices"
    ▽ ≡(±⊢⇌).       # drop empty slices
    ≡MakePlainFrame # initial callstack from top_slices
    MakeRuntime     # initial runtime from callstack

  | ≡(AnalyzeInstr °□)°□get "instrs"
  )
  # -- runtime instrs
  ⍢(
    |2.2 Advance ⊙. # keep instrs

  | ±⧻ RtCallStack # until callstack is empty

  )
  # -- runtime instrs
  ⊙;      # drop instrs
  RtStack # extract stack

)

GetProgramPath ← ⍣(°□⊢&args|⋅"")
EndsWith ← ≍ ⊃∘(↙¯↧∩⧻⊙.)
IsImported ← ¬/↥[⊃(EndsWith "vm.ua"|EndsWith "vm.uasm"|=0⧻)] GetProgramPath

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
  | ⊜□≠@§.
    ⊃(
      (""|⊐/$"_\n_") ±⧻. ↘¯1
    | °□⊢⇌
    )
  | $"\"_\"" Replace @§ "\\n" Escape @" Escape @\\
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
    $ i
    $ NaN
    $ [NaN]
    $ {NaN}
    $ comptime(ℂ NaN NaN)
    $ [{}]
    $ {[]}
    $ @\\t
    $ -@\\x00 @Z

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
    $ F ← ⍤.1 § F

    # BeginArray, EndArray, TouchStack
    $ {. "hello"}
    $ [. 123]
    $ [. {. 123}]
    $ [. 123 456] 789
    $ {;1} 789
    $ [;1] 789
    $ {⊙∘} 1 2 3
    $ [∘] 1
    $ [=] 1 2
    $ [:] 1 2
    $ [,] 1 2
    $ [insert 5 6] map [1 2] [3 4]
    $ [.] 1
    $ [$"hello \_"] 123

    # inv_where
    $ °⊚[0 3 5 6]

    # inverse_bits
    $ °⋯ [1 0 1]

    # unrerank
    # $ ⍜(☇0)∘ [[2 3][4 5]]

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
    $ ⍥(+2)5 99 200
    $ ⍥(+2)0 99 200
    $ ⍥(⊂2)5 []
    $ ⍥⊂3 [] 1 2 3

    # transpose_n
    $ ⍉⍉[1 2]
    $ °(⍉⍉)[1 2]

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
