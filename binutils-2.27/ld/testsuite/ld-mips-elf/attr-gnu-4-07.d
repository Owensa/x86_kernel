#source: attr-gnu-4-0.s -mips32r2
#source: attr-gnu-4-7.s
#ld: -r
#readelf: -A

Attribute Section: gnu
File Attributes
  Tag_GNU_MIPS_ABI_FP: Hard float compat \(32-bit CPU, 64-bit FPU\)

MIPS ABI Flags Version: 0

ISA: MIPS.*
GPR size: 32
CPR1 size: .*
CPR2 size: 0
FP ABI: Hard float compat \(32-bit CPU, 64-bit FPU\)
ISA Extension: None
ASEs:
	None
FLAGS 1: 0000000.
FLAGS 2: 00000000
