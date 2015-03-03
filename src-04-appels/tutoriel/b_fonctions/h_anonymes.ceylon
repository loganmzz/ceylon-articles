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

void demoAnonymes()  {
  // Fonction "fonction"
  String applique(String(String) fn) {
    return fn("foo");
  }

  // Anonyme - sans type de retour - expression
  print("fonction1: ``applique((String a) => a.uppercased)``");

  // Anonyme - sans type de retour - bloc
  print("fonction2: ``applique(
    (String a) { return a.reversed; })``");

  // Anonyme - function - expression
  print("fonction3: ``applique(function (String a) => a.repeat(2))``");

  // (ERREUR) Anonyme - String - expression
  print("fonction4: ``applique(String (String a) => a.repeat(2))``");

  // Anonyme - void - expression
  void fait(Anything(String) fn) => fn("fonction 5: void");
  fait(void (String a) => print(a));

  // Référence sur fonction anonyme
  String(String) fonction6 = (String a) => a.rest;
  print("fonction6: ``applique(fonction6)``");
}
