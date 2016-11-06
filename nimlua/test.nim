#TO INSTALL
#link
#ON MACOSX
#brew install homebrew/versions/lua53

import nimLua,os

proc abc(a, b: int): int =
  result = a + b


type
    FRUIT = enum
      APPLE, BANANA, PEACH, PLUM
    SUBATOM = enum
      ELECTRON, PROTON, NEUTRON
    GENE = enum
      ADENINE, CYTOSINE, GUANINE, THYMINE


proc test(L: PState, fileName: string) =
    if L.doFile(fileName) != 0.cint:
      echo L.toString(-1)
      L.pop(1)
    else:
      echo fileName & " .. OK"

var L = newNimLua()
L.bindEnum(FRUIT, SUBATOM, GENE)
L.bindFunction(abc)
L.test("test.lua")
L.close()
