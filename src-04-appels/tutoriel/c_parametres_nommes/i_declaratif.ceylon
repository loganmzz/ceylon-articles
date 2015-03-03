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

void demoDeclaratif() {
  class Expression() {}

  object all extends Expression() {
    shared actual String string => "*";
  }

  Expression nvl(String|Expression+ expressions) {
    object nvl extends Expression() {
      shared actual String string => "nvl(``expressions``)";
    }
    return nvl;
  }

  Expression distance(String|Integer x1, String|Integer y1, String|Integer x2, String|Integer y2) {
    object distance extends Expression() {
      shared actual String string => "distance(``x1``,``y1``,``x2``,``y2``)";
    }
    return distance;
  }

  class Select(shared {String|Expression+} expressions) {
    shared actual String string => "select ``expressions``";
  }
  
  class From(shared {String|Sql+} collections) {
    shared actual String string => "from ``collections``";
  }
  
  class Where(shared {String|Expression+} conditions) {
    shared actual String string => "where ``conditions``";
  }
  
  class OrderBy(shared {String|Expression+} expressions) {
    shared actual String string => "order by ``expressions``";
  }
  
  class Sql(
    shared Select select,
    shared From from,
    shared Where? where = null,
    shared OrderBy? orderBy = null) {
    shared actual String string {
      String whereStr;
      if (exists where) {
        whereStr = "\n``where``";
      } else {
        whereStr = "";
      }
      String orderStr;
      if (exists orderBy) {
        orderStr = "\n``orderBy``";
      } else {
        orderStr = "";
      }
      return "``select``\n``from````whereStr````orderStr``";
    }
  }

  Sql sql = Sql {
    Select  { "x", nvl("y", "Default.y") };
    From    {
      Sql { Select { all }; From { "Coordonnées" }; },
      "Default"
    };
    Where   { "x < 10", "y != 20" };
    OrderBy { distance("x", "y", 0, 0) };
  };
  print(sql);
}
