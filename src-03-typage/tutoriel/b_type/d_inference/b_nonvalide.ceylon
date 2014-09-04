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

// Déclarations de haut niveau
value demoInferenceReferenceDeHautNiveau = "a";
function demoInferenceFonctionDeHautNiveau(Integer a, Integer b) => a+b;

// Déclarations partagées
class DemoInferenceReferencePartagee() {
  shared value reference = "a";
}
class DemoInferenceFonctionPartagee() {
  shared function fonction() {
    return print("a");
  }
}

// Paramètre
class DemoInteferenceParametre() {
  void fonction(value a) {
    print(a);
  }
}

// Déclarations abstraites
abstract class DemoInferenceReferenceAbstraite() {
  formal value reference;
}
abstract class DemoInferenceFonctionAbstraite() {
  formal function fonction();
}

// Initialisation retardée
void demoInferenceInitialisation() {
  value reference;
  reference = "a";
}
