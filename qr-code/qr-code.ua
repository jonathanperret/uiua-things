Load ← ±⊢ °⍉ &imd &frab
Trim ← ⍥(▽¬↥⍜⇌∩\×.=≡⊃/↧/↥.⍉)2
Diagonal ← ⊡⍉⊟.⇡⧻.
PixelSize ← ÷7/+↙5▽>1.⊜⧻+1. Diagonal
Subsample ← ⊡⁅+×⇡⊃(⁅÷|∘|÷2) ⊙(△.)
Upscale ← ⍥(▽▽:⊃(⋅∘|⧻.⍉))2 ⊃:∘
GetMatrix ← ¬Subsample ⊃(PixelSize|∘)
DropTiming ← ⍜(↙7|↘¯1) ⍜(↙7⍉|↘¯1)
YCoords ← ↯ ⊃(¤×.|⊂:⇌.♭⍉⊟.⇌⇡)
XCoords ← ♭⊞+⇌×2⇡ ÷2 ⊃(∘|↯ [×2]:[1 0])
ZigZagCoords ← ⍉⊟⊃(YCoords|XCoords)
DrawLine ← ⁅+⊃(¤⊢|≡× ⊃(⇡|¤÷) ⊃(/↥⌵|∘)/-)
# DebugCoords ← °⊚☇1 /°□⊂ ≡(□DrawLine)◫2 ×⊙(+0.5)
Mirror ← ⊂⊃(≡⇌|∘)
FinderPatterns ← ±°⊚ Mirror ⊂⊃∘(+¤⊟0:) ☇1⇡⊟.8 -8
FormatInfoAreas ← ±°⊚ Mirror ≡⊟8 ⊂⇡9+⇡8 -8
AlignmentPatterns ← ([]|°⊚+ ☇1⇡⊟.5 ¤-9) ≥25.
Excluded ← ⬚0(↥↥)⊃(AlignmentPatterns|FinderPatterns|FormatInfoAreas)⧻
DataCoords ← |1 ▽⊃(¬⊡|∘) ZigZagCoords ⧻. DropTiming Excluded
DataBits ← ⊡ ⊃(DataCoords|DropTiming)
FormatStringMask ← ⋯ 9237
FormatBits ← (
  ⊂⊂⊃(↙6|⊡7|↙¯8)⊡8
  ↙ 5 ⬚0≠FormatStringMask
)
MaskNumber ← °⋯⇌↙3↘2 FormatBits
ApplyMaskToCoord ← |2 =0(
  ◿2/+            # (row + column) mod 2
| ◿2⊢             # (row) mod 2
| ◿3⊢⇌            # (column) mod 3
| ◿3/+            # (row + column) mod 3
| ◿2/+⌊÷2_3       # ( floor(row / 2) + floor(column / 3) ) mod 2
| /+◿2_3/×        # ((row * column) mod 2) + ((row * column) mod 3)
| ◿2/+◿2_3/×      # ( ((row * column) mod 2) + ((row * column) mod 3) ) mod 2
| ◿2+⊃(◿2/+|◿3/×) # ( ((row + column) mod 2) + ((row * column) mod 3) ) mod 2
)
MakeMask ← ⍜(☇1)≡(ApplyMaskToCoord:) ⇡⊟.
ApplyMask ← ≠ MakeMask ⧻ , MaskNumber.
ExtractMode ← ⊃(⊗:1_2_4_8_7°⋯⇌↙|↘)4
AlphaNumTable ← ⊂⊂ +@0⇡10 +@A⇡26 " $%*+-./:"
Log ← ◌ # &p
AlphaNumDecode ← (
  ⊃(°⋯⇌↙|↘)9
  Log$"length=_".
  ⊃(∘|⊃↙↘ ×11⌊÷2)
  ⊂⊃(
    ♭≡(⊟⊃(⌊÷|◿)45 °⋯⇌)↯¯1_11 ⋅∘
  | ([]|[°⋯⇌↙6]) ±◿2 ⊙⋅∘
  )
  ⊏:AlphaNumTable
)
ByteDecode ← (
  ⊃(°⋯⇌↙|↘)8
  Log$"length=_".
  °utf °⋯≡⇌↯¯1_8↙×8
)
Decode ← (
  GetMatrix Trim &ims. Load &p.
  ApplyMask
  DataBits
  Log$"databits=_".
  ExtractMode
  Log$"mode=_".
  (
    ⍤"numeric"0
  | AlphaNumDecode
  | ByteDecode
  | ⍤"kanji"0
  | ⍤"eci"0
  )
)
≡(&p Decode) ▽≡(≍".png"°□⬚@.↙¯4°□). &fld "."
