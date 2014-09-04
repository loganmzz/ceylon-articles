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

// Pseudo-graphe dont les éléments impairs sont optionnels.
class OptionnelA(shared OptionnelB b) {}
class OptionnelB(shared OptionnelC? c) {}
class OptionnelC(shared OptionnelD d) {}
class OptionnelD(shared OptionnelE? e) {}
class OptionnelE(shared String? f) {}

void afficherOptionnelA(OptionnelA? a) {
  print(a?.b?.c?.d?.e?.f);
}

void demoGrapheOptionnel() {
  afficherOptionnelA(null);
  afficherOptionnelA(OptionnelA(OptionnelB(null)));
  afficherOptionnelA(OptionnelA(OptionnelB(OptionnelC(OptionnelD(null)))));
  afficherOptionnelA(OptionnelA(OptionnelB(OptionnelC(OptionnelD(OptionnelE(null))))));
  afficherOptionnelA(OptionnelA(OptionnelB(OptionnelC(OptionnelD(OptionnelE("Résultat"))))));
}
