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

interface Noeud of Fichier | Repertoire | Lien {
  shared formal String nom;
}
interface Fichier    satisfies Noeud {}
interface Repertoire satisfies Noeud {
  shared formal {Noeud*} noeuds;
}
interface Lien       satisfies Noeud {
  shared formal Noeud cible;
} 

class FichierImpl   (shared actual String nom                              ) satisfies Fichier {}
class RepertoireImpl(shared actual String nom, shared actual Noeud[] noeuds) satisfies Repertoire {}
class LienImpl      (shared actual String nom, shared actual Noeud cible   ) satisfies Lien {}

"
  racine
    noeud_1/
      noeud_1_1
      noeud_1_2
      noeud_1_3/
    noeud_2/
      noeud_2_1 -> noeud_1
"
void switch_sur_interfaces() {
  Noeud noeud_1_1 = FichierImpl("noeud_1_1");
  Noeud noeud_1_2 = FichierImpl("noeud_1_2");
  Noeud noeud_1_3 = RepertoireImpl("noeud_1_3", []);
  Noeud noeud_1   = RepertoireImpl("noeud_1", [noeud_1_1, noeud_1_2, noeud_1_3]);
  Noeud noeud_2_1 = LienImpl("noeud_2_1", noeud_1);
  Noeud noeud_2   = RepertoireImpl("noeud_2", [noeud_2_1]);
  Noeud racine    = RepertoireImpl("racine", [noeud_1, noeud_2]);
  parcourir("", racine);
}

void parcourir(String prefixe, Noeud courant) {
  switch (courant)
    case (is Fichier) {
      print(prefixe + courant.nom);
    }
    case (is Repertoire) {
      print(prefixe + courant.nom + "/");
      String sousPrefixe = prefixe + "  ";
      for (Noeud noeud in courant.noeuds) {
        parcourir(sousPrefixe, noeud);
      }
    }
    case (is Lien) {
      print(prefixe + courant.nom + " -> " + courant.cible.nom);
    }
    else {}
}
