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

void demoSurcharge() {
  // Constructeur
  class Valeur(String? s = null, Integer? i = null) {
    Integer entier;
    String chaine;
    if (exists s) {
      "s et i ne doivent pas être définis tous les deux"
      assert (i is Null);
      chaine = s;
      Integer? parse = parseInteger(chaine);
      assert(exists parse);
      entier = parse;
    } else {
      entier = i else 0;
      chaine = entier.string;
    }
    
    
    shared actual String string => "{chaine: '``chaine``'; entier: ``entier`` }";
  }
  
  Valeur vide   = Valeur {};
  Valeur chaine = Valeur { s = "10_000"; };
  Valeur entier = Valeur { i = 10; };
  
  print("vide   : ``vide``");
  print("chaine : ``chaine``");
  print("entier : ``entier``");
}
