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

void demoCurryfication() {
  // Fonction String(String,Integer)
  String repeter(String chaine, Integer repetition) => chaine.repeat(repetition); 
  // Figeons un paramètre
  String repeterUneFois(String chaine)     => repeter(chaine, 1);
  String repeterFoobar(Integer repetition) => repeter("Foobar", repetition);
  // Utilisation
  print(repeter("foobar", 1));
  print(repeterUneFois("raboof"));
  print(repeterFoobar(2));
  

  // Avec la curryfication
  String                  repeterCurryfie(String chaine)(Integer repetition) => repeter(chaine, repetition);
  String(Integer)(String) repeterCurryfieRef                                 =  repeterCurryfie;
  String(Integer)  repeterFoobarCurryfie                                     =  repeterCurryfie("Foobar");

  // Appels
  print(repeterCurryfie("foobar")(1));
  print(repeterFoobarCurryfie(2));
}
