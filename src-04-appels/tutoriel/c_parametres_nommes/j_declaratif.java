package tutoriel.c_parametres_nommes;

import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

public class j_declaratif {
  
  public static interface Expression {}
  public static interface CompoundExpression extends Expression {
    CompoundExpression add(String expression);
    CompoundExpression add(Expression expression);
  }
  
  public static final Expression all = new Expression() {
    public String toString() {
      return "*";
    };
  };
  
  static class Nvl implements CompoundExpression {
    private List<Object> content = new ArrayList<>();
    public final List<Object> expressions = Collections.unmodifiableList(content);
    
    public Nvl add(String expression) {
      content.add(expression);
      return this;
    }
    
    public Nvl add(Expression expression) {
      content.add(expression);
      return this;
    }
    
    @Override
    public String toString() {
      return "nvl(" + expressions + ")";
    }
  }
  public static CompoundExpression nvl() {
    return new Nvl();
  }
  
  static abstract class SqlPart {
    Sql sql;
    
    SqlPart(Sql sql) {
      this.sql = sql;
    }
  }
  
  static class Distance implements Expression {
    public final Object x1, y1, x2, y2;
    
    private Distance(Object x1, Object y1, Object x2, Object y2) {
      this.x1 = x1; this.y1 = y1;
      this.x2 = x2; this.y2 = y2;
    }
    
    @Override
    public String toString() {
      return "distance(" + x1 + "," + y1 + "," + x2 + "," + y2 + ")";
    }
  }
  public static Expression distance(String x1, String y1, String x2, String y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(String x1, String y1, String x2, Integer y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(String x1, String y1, Integer x2, String y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(String x1, String y1, Integer x2, Integer y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(String x1, Integer y1, String x2, String y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(String x1, Integer y1, String x2, Integer y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(String x1, Integer y1, Integer x2, String y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(String x1, Integer y1, Integer x2, Integer y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(Integer x1, String y1, String x2, String y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(Integer x1, String y1, String x2, Integer y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(Integer x1, String y1, Integer x2, String y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(Integer x1, String y1, Integer x2, Integer y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(Integer x1, Integer y1, String x2, String y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(Integer x1, Integer y1, String x2, Integer y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(Integer x1, Integer y1, Integer x2, String y2) {
    return new Distance(x1, y1, x2, y2);
  }
  public static Expression distance(Integer x1, Integer y1, Integer x2, Integer y2) {
    return new Distance(x1, y1, x2, y2);
  }
  
  public static abstract class ExpressionList<T> extends SqlPart {
    private List<Object> content = new ArrayList<>();
    public final List<Object> expressions = Collections.unmodifiableList(content);
    private T self;

    ExpressionList(Sql sql) {
      super(sql);
    }
    
    protected void setSelf(T self) {
      this.self = self;
    }
    
    protected String getKeyword() {
      return getClass().getSimpleName().toLowerCase();
    }
    
    public T add(String expression) {
      content.add(expression);
      return self;
    }
    
    public T add(Expression expression) {
      content.add(expression);
      return self;
    }
    
    @Override
    public String toString() {
      return getKeyword() + " " + expressions;
    }
  }
  
  public static class Select extends ExpressionList<Select> {
    Select(Sql sql) {
      super(sql);
      sql.select = this;
      setSelf(this);
    }
    
    public From from() {
      return new From(sql);
    }
  }
  
  public static class From extends SqlPart {
    private final List<Object> collections = new ArrayList<>();

    From(Sql sql) {
      super(sql);
      sql.from = this;
    }
    
    public From add(String collection) {
      collections.add(collection);
      return this;
    }
    
    public From add(Sql collection) {
      collections.add(collection);
      return this;
    }
    
    public Where where() {
      return new Where(sql);
    }
    
    public OrderBy orderBy() {
      return new OrderBy(sql);
    }
    
    public Sql end() {
      return sql;
    }
    
    @Override
    public String toString() {
      return "from " + collections;
    }
  }
  
  public static class Where extends ExpressionList<Where> {
    Where(Sql sql) {
      super(sql);
      setSelf(this);
      sql.where = this;
    }
    
    public OrderBy orderBy() {
      return new OrderBy(sql);
    }
    
    public Sql end() {
      return sql;
    }
  }
  
  public static class OrderBy extends ExpressionList<OrderBy> {
    OrderBy(Sql sql) {
      super(sql);
      setSelf(this);
      sql.orderBy = this;
    }
    
    @Override
    protected String getKeyword() {
      return "order by";
    }
    
    public Sql end() {
      return sql;
    }
  }
  
  public static class Sql {
    Select select;
    From from;
    Where where;
    OrderBy orderBy;
    
    private Sql() {}
    
    public Select getSelect() {
      return select;
    }
    
    public From getFrom() {
      return from;
    }
    
    public Where getWhere() {
      return where;
    }
    
    public OrderBy getOrderBy() {
      return orderBy;
    }
    
    public static Select select() {
      return new Select(new Sql());
    }
    
    @Override
    public String toString() {
      return
                                      select
          +                    "\n" + from
          + (where   != null ? "\n" + where   : "")
          + (orderBy != null ? "\n" + orderBy : "");
    }
  }
    
  public static void main(String[] args) {
    Sql sql = Sql
      .select().add("x").add(nvl().add("y").add("Default.y"))
      .from()
        .add(Sql.select().add(all).from().add("Coordonnées").end())
        .add("Default")
      .where()
        .add("x < 10").add("y != 20")
      .orderBy()
        .add(distance("x", "y", 0, 0))
      .end();
    System.out.println(sql);
  }
}
