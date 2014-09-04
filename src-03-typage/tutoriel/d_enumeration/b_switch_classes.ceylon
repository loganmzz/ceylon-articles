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

class Racine() {}
class Enfant1() {}
class Enfant2() {}
class Feuille1() extends Racine() {}
class Feuille2() extends Enfant1() {}
class Feuille3() extends Enfant1() {}
class Feuille4() extends Enfant2() {}
class PetitEnfant() extends Enfant2() {}
class Feuille5() extends PetitEnfant() {}
class Feuille6() extends Enfant2() {}

void switch_sur_classes() {
  {Object+} liste = {
     Racine(), Enfant1(), Enfant2(), Feuille1(), Feuille2(), Feuille3(),
     Feuille4(), PetitEnfant(), Feuille5(), Feuille6()
  };
  for (Object objet in liste) {
    String type;
    switch (objet)
      // case (is Racine) {}
      case (is Enfant1)  { type = "le premier enfant";    }
      // case (is Enfant2) {}
      case (is Feuille1) { type = "la première feuille";  }
      // case (is Feuille2) {}
      // case (is Feuille3) {}
      case (is Feuille4) { type = "la sixième feuille";   }
      // case (is PetitEnfant) {}
      case (is Feuille5) { type = "la cinquième feuille"; }
      case (is Feuille6) { type = "la sixième feuille";   }
      else               { type = "un inconnu";           }
    print("Je suis ``type``");
  }
}
