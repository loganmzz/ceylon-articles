package tutoriel.c_parametres_nommes;

public class h_builder {

  public static class Personne {
    String nom;
    String prenom;
    int    age;
    
    private Personne(String nom, String prenom, int age) {
      this.nom = nom;
      this.prenom = prenom;
      this.age = age;
    }

    public String getNom() {
      return nom;
    }
    
    public String getPrenom() {
      return prenom;
    }
    
    public int getAge() {
      return age;
    }
    
    @Override
    public String toString() {
      return "{nom: " + getNom() + "; prenom: " + getPrenom() + "; age: " + getAge() + "}";
    }
  }
  
  public static class PersonneBuilder {
    String nom;
    String prenom;
    int    age;
    
    public PersonneBuilder withNom(String nom) {
      this.nom = nom;
      return this;
    }
    
    public PersonneBuilder withPrenom(String prenom) {
      this.prenom = prenom;
      return this;
    }
    
    public PersonneBuilder withAge(int age) {
      this.age = age;
      return this;
    }
    
    public Personne build() {
      return new Personne(nom, prenom, age);
    }
  }
    
  public static void main(String[] args) {
    System.out.println(new PersonneBuilder()
      .withNom("DUPOND")
      .withPrenom("Jean")
      .withAge(30)
      .build());
  }
}
