/* Hangman
  _ _ _
 |
 o
/|\
/
M A _ A
M A C A

*/
  var man = [
    [" ", "|", " "],
    [" ", " ", " "],
    [" ", " ", " "],
    [" ", " ", " "]
  ]
var fjala = ["_", "_", "_", "_"]
var gabime = 0


print("Shkruaj numrin e shkronjave qe deshiron ti kete fjala: ")
var nrShkronjave = Int(readLine()!)!

printoFjalen(fjala)

// MACA, QENI, TOKA, HANA, MAMA

while(!isGameWon() && gabime != 6) {
  shkruajNjeShkronje()
}

func isGameWon() -> Bool {
  for shkronja in fjala {
    if(shkronja == "_") {
      return false
    }
  }

  return true
}


func shkruajNjeShkronje() {
  print("Shkruaj nje shkronje: ")
  let shkronja = readLine()!
  if(shkronja == "M") {
    fjala[0] = shkronja
  } else if(shkronja == "A") {
    fjala[1] = shkronja
    fjala[3] = shkronja
  } else if(shkronja == "C") {
    fjala[2] = shkronja
  } else {
    shkronjaGabim()
  }

  printoMan(man)
  printoFjalen(fjala)
}

func printoMan(_ man: Array<Array<String>>) {
  // [[" ", "|", " "], [" ", "o", " "], [" ", " ", " "], [" ", " ", " "]]+
/*
 | 
 o
/|\
/ \
  */
  for man1 in man { 
    for gjymtyr in man1 { 
      print(gjymtyr + "", terminator: "")
    }
    print()
  }
}

func shkronjaGabim() {


  gabime = gabime + 1
  if(gabime == 1) {
     man[1][1] = "o"
  } else if( gabime == 2) {
   man[2][0] = "/"
  } else if( gabime == 3) {
   man[2][1] = "|"
  } else if(gabime == 4) {
   man[2][2] = "\\"
  } else if(gabime == 5) {
    man[3][0] = "/"
  } else if(gabime == 6) {
    man[3][1] = " "
    man[3][2] = "\\"
    print("Ju keni humbur lojen!")
  }
}

func printoFjalen(_ fjala: Array<String>) {
  for shkronja in fjala {
    print(shkronja + " ", terminator: "")
  }
  print()
}