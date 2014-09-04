/*
 * The MIT License (MIT)
 * 
 * Copyright (c) 2014 Logan Mauzaize
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

class ClassUnion(String|Integer soi) {
  shared String s;
  shared Integer i;

  if (is String ts = soi)       { s = ts; i = 0;  }
  else if (is Integer ti = soi) { s = ""; i = ti; }
  else                          { s = ""; i = 0;  }

  shared actual String string => "``s``;``i``";
  
  void afficherString(String s) {
    print("afficherString  : " + s);
  }
  void afficherInteger(Integer i) {
    print("afficherInteger : ``i``");
  }
  shared void afficher(String|Integer soi) {
    switch (soi)
    case (is String)  { afficherString(soi);  }
    case (is Integer) { afficherInteger(soi); }
  }
}

void demoClassUnion() {
  ClassUnion s = ClassUnion("foo");
  ClassUnion i = ClassUnion(1);
  print(s);
  print(i);
  s.afficher("bar");
  s.afficher(2);
}
