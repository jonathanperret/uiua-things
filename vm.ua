# Experimental!
JsonParse ← &i "json.ua" "JsonParse"
ExpandSlice ← +⊙⇡ °⊟
Log ← &p
# map -- pairs
MapPairs ← ⍉⊟°map
EmptyStack ← {}
# runtime = { callstack stack tempstacks arraystack thisstack globals memo }
EmptySliceStack ← ↯0_2[]
# callstack -- runtime
MakeRuntime ← {
  ⊃(
    ∘
  | EmptyStack
  | {EmptyStack EmptyStack}
  | []
  | EmptySliceStack
  | {}
  | map {} {}
  )}
RtCallStack ← °□⊢
RtStack ← °□⊡1
RtTempStacks ← °□⊡2
RtArrayStack ← °□⊡3
RtThisStack ← °□⊡4
RtGlobals ← °□⊡5
RtMemo ← °□⊡6
# count runtime -- runtime'
RtTouchStack ← (|2
  - ⊙(⧻RtStack.) # compute stacklength if count values were popped
  # -- newlength runtime
  ⍜⊙RtArrayStack ↧ # lower arraystack entries if above newlength
)
# value(s) runtime -- runtime'
RtPush ← ⍜⊙RtStack (⊂:)
# count runtime -- values runtime'
RtPop ← (
  ⊃(∘|RtTouchStack)
  # -- count runtime'
  ⍜⊙RtStack ⊃↙↘¯
  ⇌
)
# runtime -- topvalue
RtPeek ← °□⊢⇌RtStack
FnId ← °□⊢
FnSig ← °□⊡1
SigInputs ← ⊢
SigOutputs ← ⊢⇌
FnSlice ← °□⊡2
FrameTypePlain ← 0
FrameTypeRepeat ← 1
FrameTypeReduce ← 2
FrameTypeScan ← 3
FrameTypeThis ← 4
FrameTypeMemo ← 5
# frame = { frametype framedetails }
# slice -- { frametype { pc addrs } }
MakePlainFrame ← (|1
  ExpandSlice
  0 # pc
  {⊙∘}
  {FrameTypePlain ∘}
)
# count fn -- { frametype { counter count fnslice } }
MakeRepeatFrame ← (|2
  ⊙FnSlice # keep only fnslice
  0        # counter
  {⊙⊙∘}
  {FrameTypeRepeat ∘}
)
# fn array -- { frametype { counter array fnslice } }
MakeReduceFrame ← (|2
  {
    ⊃(
      1  # counter starts at 1
    | ⋅∘ # array
    | FnSlice # keep only fnslice
    )  }
  {FrameTypeReduce ∘}
)
# fn array acc -- { frametype { counter array fnslice acc }
MakeScanFrame ← (
  {
    ⊃(
      1  # counter starts at 1
    | ⋅∘ # array
    | FnSlice # keep only fnslice
    | ⋅(↙1)
    )  }
  {FrameTypeScan ∘}
)
# -- frame
MakeThisFrame ← (
  {FrameTypeThis []}
)
# key outputcount -- frame
MakeMemoFrame ← (|2
  {FrameTypeMemo {⊙∘}}
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
MonadicNoOutputFns ← (◌|&s|&pf|&p|&cd|&ims)
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
| ◴
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
# runtime -- runtime'
Reduce ← (|1
  °{⊙∘} RtPop 2 # get fn and array from stack
  # -- fn array runtime'
  ↧2⧻, # check for empty or singleton/scalar array
  (
    # empty
    ⋅⋅∘ # drop fn and array
    ⍤"cannot reduce empty array"0
    # RtPush □ # TODO: introspect fn to determine correct default value
  |   # singleton or scalar
    ◌ # drop fn
    ±⧻△.
    (
      # scalar
      RtPush □   # just push it
    |            # singleton
      RtPush □ ⊢ # just push the only element
    )
  | # more than 1
    ⊃(MakeReduceFrame|RtPush □ ⋅⊢)
    # -- newframe runtime'
    ⍜⊙RtCallStack ⊂
  )
)
# runtime -- runtime'
Scan ← (|1
  °{⊙∘} RtPop 2 # get fn and array from stack
  # -- fn array runtime'
  ↧2⧻, # check for empty or singleton/scalar array
  (
    # empty
    ⋅∘       # drop fn
    RtPush □ # re-push empty array
  |          # singleton or scalar
    ◌        # drop fn
    ±⧻△.
    (
      # scalar
      ⍤"Cannot \\ scan rank 0 array" ⋅0
    |          # singleton
      RtPush □ # just push it back
    )
  | # more than 1
    # -- fn array runtime
    ⊃(
      # initialize scan frame: accumulator = 1-prefix of array
      MakeScanFrame
    |   # set up first call with first and second elements
      ◌ # drop fn
      RtPush ⇌ ≡□ ↙2
    | FnSlice
    )
    # -- newframe runtime' fnslice
    :⍜⊙RtCallStack ⊂
    # -- fnslice runtime'
    ⍜⊙RtCallStack ⊂ MakePlainFrame
  )
)
# runtime -- runtime'
This ← (|1
  FnSlice °{∘} RtPop 1
  # -- fnslice runtime
  ⊃(∘|⍜⊙RtThisStack ⊂)
  # -- fnslice runtime'
  ⊙(⍜RtCallStack (⊂ MakeThisFrame))
  ⍜⊙RtCallStack (⊂ MakePlainFrame) # push new frame onto callstack
)
# runtime -- runtime'
Recur ← (|1
  ⊃(⊢RtThisStack|∘)
  # -- fnslice runtime
  MakePlainFrame
  ⍜⊙RtCallStack ⊂ # push new frame onto callstack
)
# runtime -- runtime'
Memo ← (|1
  °{∘} RtPop 1
  # -- fn runtime
  ⊃(∘|RtPop SigInputs FnSig|⋅∘)
  # -- fn args runtime1 runtime0
  ⊃({⊙∘} FnId ⊙⊙⊙∘|∘)
  # -- key runtime1 runtime0 fn
  ⊙(RtMemo.)
  # -- key memo runtime1 runtime0 fn
  has,,
  (
    # not found: setup memoframe and call fn
    ⊃(⋅⋅⋅∘|MakePlainFrame ⋅⋅⋅⋅FnSlice|MakeMemoFrame ⊙⋅⋅⋅(SigOutputs FnSig))
    # -- runtime0 fnframe memoframe
    ⍜RtCallStack (⊂: ⊙⊟)
  | # found: return values
    ⊃(°□get|⋅⋅∘)
    # -- values runtime1
    RtPush ⇌
  )
)
SpecialNames ← {
  "identity" "reduce" "fold" "scan" "each" "rows" "table" "repeat" "group" "partition" "unpack"
  "do" "fill" "try" "this" "recur" "bind" "memo" "spawn" "wait" "send" "recv" "tryrecv" "dump"
  "inv_dump" "inv_scan" "ungroup" "unpartition" "all"}
SpecialFns ← (
  Identity
| Reduce
| ToDo "fold"
| Scan
| ToDo "each"
| ToDo "rows"
| ToDo "table"
| Repeat
| ToDo "group"
| ToDo "partition"
| ToDo "unpack"
| ToDo "do"
| ToDo "fill"
| ToDo "try"
| This
| Recur
| ToDo "bind"
| Memo
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
| ToDo "all"
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
  | RtPush ⇌ {⊙∘} MonadicTwoOutputFns ⊙(°{∘}RtPop 1)
  | DyadicNoOutputFns ⊙(°{⊙∘}RtPop 2)
  | RtPush □ DyadicOneOutputFns ⊙(°{⊙∘}RtPop 2)
  | RtPush ⇌ {⊙∘} DyadicTwoOutputFns ⊙(°{⊙∘}RtPop 2)
  | RtPush ⇌ {⊙⊙∘} DyadicThreeOutputFns ⊙(°{⊙∘}RtPop 2)
  | RtPush □ TriadicOneOutputFns ⊙(°{⊙⊙∘}RtPop 3)
  | SpecialFns
  )
)
# {ident} runtime -- runtime'
Comment ← ∘ToDo "Comment"
# {index call sig} runtime -- runtime'
CallGlobal ← (|2
  °{⊙⊙∘}
  # -- index call sig runtime
  ⊙⋅◌
  # -- index runtime
  ⊙(RtGlobals.)
  # -- index globals runtime
  ⊡
  # -- value runtime
  RtPush
)
# index runtime -- runtime'
BindGlobal ← (|2
  :⊙(°{∘} RtPop1)
  # -- value index runtime
  ⍜⊙⊙RtGlobals (
    # -- value index globals
    # grow globals array
    ⊙(
      # -- index globals
      (⊙∘|⊃∘(⬚(□0)↯[+1])) ≤⊙⧻,,
      # -- index globals'
    )
    # -- value index globals
    ⍜⊙⊡(□⊙◌) # set global entry
  )
)
# [] runtime -- runtime'
BeginArray ← (|2
  ◌ # drop dummy arg
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
      ⊃(↘1|°□⊢)
    )
    # -- runtime startlevel
    ⍜RtStack(⊃↙(⇌↘) :) # take and drop from bottom of stack
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
  MakePlainFrame FnSlice°{∘} RtPop 1 ◌
  ⍜⊙RtCallStack ⊂ # push new frame onto callstack
)
# fn runtime -- runtime'
PushFunc ← RtPush □
# {fncount sig} runtime -- runtime'
Switch ← (|2
  °{⊙∘} # get fncount, sig
  # -- fncount sig runtime
  ⊃(⋅∘|RtPop +1 ⊙⋅∘) # pop fns and selector
  # -- sig values runtime'
  ⊙(°□⊡ -2 ¯°□⊢⇌.) # pick selected fn # TODO: array selectors
  # -- sig fn runtime
  ⊃(⊃FnSlice FnSig ⋅∘|⊙⋅∘)
  # -- fnslice fnsig sig runtime
  ⊓(
    MakePlainFrame
  |                       # compute args to discard
    ⊃(SigInputs⋅⊙∘|/-⇌ -) # -- sig.args runtime discardcount=((sig.args - f.sig.args) - (sig.outputs - f.sig.outputs))
    ⍜⊙RtStack (
      # -- takecount stack discardcount
      ⍜↙(↘ :) ¯ # discard extra args
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
  ⍜(°□⊡⊙RtTempStacks) ⊂
)
# [stackid count] runtime -- runtime'
PopTemp ← (|2
  : °⊟
  # -- count stackid runtime
  ⍜(⊙⊙RtTempStacks) ⍜⊙(°□⊡) ⊃↙↘ ¯
  # -- runtime values
  RtPush ⇌ # push to stack
)
# [stackid count] runtime -- runtime'
CopyToTemp ← (|2
  °⊟
  # -- stackid count runtime
  # copy from stack
  ⊃⋅(↙¯ ⊙RtStack) ⊙⋅∘
  # -- values stackid runtime
  ⍜(⊙⊙RtTempStacks) ⍜⊙(°□⊡) (⊂:)
)
# [stackid offset count] runtime -- runtime'
CopyFromTemp ← (|2
  °[⊙⊙∘]
  # -- stackid offset count runtime
  ⊃(⋅:|°□⊡ ⊙(RtTempStacks ⋅⋅∘)|⋅⋅⋅∘)
  # -- count offset tempstack runtime
  ↙ ⊙↘ ∩¯
  # -- values runtime
  RtPush ⇌ # push to stack
)
# [stackid count] runtime -- runtime'
DropTemp ← (|2
  :°⊟
  # -- count stackid runtime
  ⍜(⊙⊙RtTempStacks) ⍜⊙(°□⊡) ↘ ¯
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
  |     # unbox elements
    (
      ≡(NullToNaN °□)        # number array: replace nulls with NaN
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
    ⊢ ◌
  | # regular array: apply shape
    ↯
  )
)
# instrid jsoninstrargs -- instrargs
PreProcessInstrArgs ← (|2
  (
    ⋅[]         # Comment(ident)
  | {⊙⊙∘}°{⊙⊙∘} # CallGlobal(index, call, sig)
  | ◌°{⊙∘} # BindGlobal(span, index)
  | ⋅[] # BeginArray
  | °□⊢ # EndArray(boxed, span)
  | ⋅[] # Call(span)
  | {⊓(∘|⊐≡∘|⊐≡∘)} °{⊙⊙∘} # PushFunc(id, slice, sig)
  | {⊓(∘|⊐≡∘|◌)} °{⊙⊙∘} # Switch(count, sig, span)
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
  | ⊟ ⊗: {"Inline" "Under"}□ ⊙⊙◌ °{⊙⊙∘} # PushTemp(stack, count, span)
  | ⊟ ⊗: {"Inline" "Under"}□ ⊙⊙◌ °{⊙⊙∘} # PopTemp(stack, count, span)
  | ⊟ ⊗: {"Inline" "Under"}□ ⊙⊙◌ °{⊙⊙∘} # CopyToTemp(stack, count, span)
  | [⊙⊙∘] ⊗: {"Inline" "Under"}□ ⊙⊙⊙◌ °{⊙⊙⊙∘} # CopyFromTemp(stack, offset, count, span)
  | ⊟ ⊗: {"Inline" "Under"}□ ⊙⊙◌ °{⊙⊙∘} # DropTemp(stack, count, span)
  | ∘ # PushSig
  | ∘ # PopSig
  | ∘ # SetOutputComment
  )
)
# jsoninstr -- instr
AnalyzeInstr ← (
  type.
  (
    {InstrTypePush NullToNaN} # number literal
  | ⍤$"complex in JSON?"0
  | {InstrTypePush ∘} # string literal
  | type°□⊢.
    (
      DeserializeArray # array literal
      {InstrTypePush ∘}
    | ⍤$"complex in JSON?"0
    | #  [ "prim", span ]
      {InstrTypePrim ∘} get: PrimNamesToIds ⊢
    | =3⍣(type°□⊢⊢)⋅⋅0. # detect [ { "transpose_n": n } ]
      (
        # regular instr: { "Instr": [ args… ] }
        °[{⊙∘}] MapPairs
        get: InstrNamesToIds
        # -- instrid jsoninstrargs
        ⊃∘ PreProcessInstrArgs
        | # [ { "transpose_n": n } ] # transpose_n
        °{⊙∘}⊢MapPairs°□⊢
        get: InstrNamesToIds
      )
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
    RtPush □ # push onto stack
  |          # prim
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
# runtime instrs -- runtime'
AdvancePlainFrame ← (|2
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
)
# { frametype { counter count fn } } -- counter
RepeatFrameCounter ← °□⊢°□⊢⇌
# { frametype { counter count fn } } -- bool
RepeatFrameDone ← /≤ ↙2 °□⊢⇌
# { frametype { counter count fn } } -- fn
RepeatFrameFn ← °□⊡2 °□⊢⇌
# runtime -- runtime'
AdvanceRepeatFrame ← (|1
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
  ⊙MakePlainFrame # make frame from fn
  # -- runtime newframe
  ⍜RtCallStack(⊂ :) # push new frame onto callstack
)
# { frametype { counter array fnslice } } -- counter
ReduceFrameCounter ← °□⊢°□⊢⇌
# { frametype { counter array fnslice } } -- bool
ReduceFrameDone ← ≤⊙⧻°{⊙∘}↙2°□⊢⇌
---
⍤⊃⋅∘≍ 0 ReduceFrameDone {FrameTypeReduce {0 [123] [1 2]}}
⍤⊃⋅∘≍ 1 ReduceFrameDone {FrameTypeReduce {1 [123] [1 2]}}
---
# { frametype { counter array fnslice } } -- array
ReduceFrameArray ← °□⊡1°□⊢⇌
# { frametype { counter array fnslice } } -- fnslice
ReduceFrameFn ← °□⊡2°□⊢⇌
# runtime -- runtime'
AdvanceReduceFrame ← (|1
  ⍜(⊢RtCallStack)(|1.3
    # -- topframe
    ⊃(
      ⍜ReduceFrameCounter (+1) # bump counter
      ReduceFrameDone.         # done?
      (
        # no: keep frame
        | ⋅[] # yes: destroy frame
      )
    | ⊃(°□⊡⊃(ReduceFrameCounter|ReduceFrameArray)|ReduceFrameFn)
    )
    # -- topframe elt fnslice
  )
  # setup next call
  # -- runtime' elt fnslice
  RtPush □:
  ⍜RtStack ⍜(↙¯2)⇌ # flip elt under acc
  # -- runtime' fnslice
  ⊙MakePlainFrame # make frame from fn
  # -- runtime newframe
  ⍜RtCallStack (⊂:) # push new frame onto callstack
)
# { frametype { counter array fnslice acc } } -- counter
ScanFrameCounter ← ReduceFrameCounter
# { frametype { counter array fnslice acc } } -- array
ScanFrameArray ← ReduceFrameArray
# { frametype { counter array fnslice acc } } -- fnslice
ScanFrameFn ← ReduceFrameFn
# { frametype { counter array fnslice acc } } -- acc
ScanFrameAcc ← °□⊡3°□⊢⇌
# { frametype { counter array fnslice acc } } -- bool
ScanFrameDone ← ReduceFrameDone
# { frametype { key outputcount } } -- key
MemoFrameKey ← °□⊢°□⊡1
# { frametype { key outputcount } } -- outputcount
MemoFrameOutputCount ← °□⊢⇌°□⊡1
---
⍤⊃⋅∘≍ 0 ScanFrameDone {FrameTypeScan {0 [123] [1 2] [10 20]}}
⍤⊃⋅∘≍ 1 ScanFrameDone {FrameTypeScan {1 [123] [1 2] [10 20]}}
---
# runtime -- runtime'
AdvanceScanFrame ← (|1
  ⊃(⊢RtCallStack|RtPeek|∘) # extract scanframe, peek at last result
  # -- scanframe result runtime
  ⍜ScanFrameAcc ⊂ # append result to accumulator
  # -- scanframe runtime
  ⍜ScanFrameCounter (+1) # bump counter
  ScanFrameDone.         # done?
  (
    # no: setup next call, update callstack
    # -- scanframe runtime
    ⊃(°□⊡⊃(ScanFrameCounter|ScanFrameArray)|⋅∘|ScanFrameFn|∘)
    # -- elt runtime fnslice scanframe
    RtPush □
    # -- runtime' fnslice scanframe
    ⍜RtStack ⍜(↙¯2)⇌ # flip elt under acc
    # -- runtime' fnslice scanframe
    ⊙(⊟ MakePlainFrame) # make frame from fn, join scanframe and newframe
    # -- runtime newframes
    ⍜(⊢RtCallStack) ⋅∘ # replace top of callstack
  |                    # yes: destroy frame
    # -- scanframe runtime
    ⊙(◌RtPop 1)           # remove last result from stack
    RtPush □ ScanFrameAcc # push accumulator from frame
    ⍜RtCallStack (↘1)     # remove scanframe from callstack
  )
)
# runtime -- runtime'
AdvanceThisFrame ← (|1
  ⍜RtThisStack (↘1) # remove this context
  ⍜RtCallStack (↘1) # remove thisframe from callstack
)
# runtime -- runtime'
AdvanceMemoFrame ← (|1
  ⍜RtCallStack ⊃(↘1|°□⊢) # remove memoframe from callstack
  # -- runtime' memoframe
  # get outputcount
  ⊙⊃(MemoFrameOutputCount|MemoFrameKey)
  # -- runtime outputcount key
  # copy outputs from stack
  ⊃(⋅⋅∘|⇌↙¯:RtStack|∘)
  # -- runtime key outputs
  # store outputs under key
  ⍜⊙⊙RtMemo (insert ∩□)
)
# runtime instrs -- runtime'
Advance ← (|2
  # -- runtime instrs
  FrameType ⊢RtCallStack. # switch on top frame type
  (
    AdvancePlainFrame
  | AdvanceRepeatFrame
  | AdvanceReduceFrame
  | AdvanceScanFrame
  | AdvanceThisFrame
  | AdvanceMemoFrame
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
  | ±⧻ RtCallStack  # until callstack is empty
  )
  # -- runtime instrs
  ⊙◌       # drop instrs
  ⇌RtStack # extract stack
)
StackColors ← +200×55⋯5_4_6_2_3_1
DumpColoredStack ← (
  ≡(&pf "\x1b[m" &s°□ &pf $"\x1b[38;2;_;_;_m" °[⊙⊙∘]) ↯: StackColors ⊂:3 ⧻. ⇌
)
EndsWith ← ≍ ⊃∘(↙¯↧∩⧻⊙.)
Main ← (
  °□ ⊡1 &args
  EndsWith ".ua".
  (
    &fras
  | ⋅⊙◌ &runc {"uiua" "build" "-o" "/dev/stdout" ∘}
  )
  JsonParse
  Run
  DumpColoredStack
)
GetProgramPath ← ⍣(°□⊢&args|⋅"")
DirName ← ↘ ¯+1⊗@/ ⇌.
BaseName ← ↙ ¯⊗@/ ⇌.
IsImported ← ¬∊:{"vm.ua" "vm.uasm"}□ BaseName GetProgramPath
IsImported
(
  # running
  >1⧻&args
  (
    # run tests
    &p "Running tests…"
    ◌&runi {"uiua" "run" "--no-format" $"_-tests.ua" ↘ ¯3 GetProgramPath}
  | Main
  )
| # imported: do nothing
)
