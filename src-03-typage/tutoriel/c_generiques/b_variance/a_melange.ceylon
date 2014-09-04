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

import tutoriel.c_generiques.a_definition { Liste, Singleton }

interface Animal {
  shared default actual String string => "Animal";
}
interface Mouton satisfies Animal {
  shared default actual String string => super.string + "/Mouton";
}
class Dorset() satisfies Mouton {
  shared default actual String string => super.string + "/Dorset";
}
class Soay() satisfies Mouton {
  shared default actual String string => super.string + "/Soay";
}
class Loup() satisfies Animal {
  shared default actual String string => super.string + "/Loup";
}

void demoVarianceInvalide() {
  Liste<Mouton> bergerie      = Singleton<Mouton>(Dorset());
  Liste<Dorset> cheptelDorset = bergerie;  // Et si j'avais une Soay ?
  Liste<Animal> refuge        = bergerie;  // Supposé bon
  refuge.add(Loup());                      // Un loup dans la bergerie ! 
}
