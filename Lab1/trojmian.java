import java.util.*;

public class Trojmian {
  private double a, b, c, x1, x2, delta;

  void readData() {
    Scanner scanner = new Scanner(System.in);
    System.out.println("Podaj współczynniki trójmianu.");
    do {
      System.out.print("a = ");
      while(!scanner.hasNextDouble()) {
        System.out.print(scanner.next());
        System.out.print(" nie jest poprawnym zapisem liczby.\na = ");
      }
      a = scanner.nextDouble();
    } while(a == 0);
    
    System.out.print("b = ");
    while(!scanner.hasNextDouble()) {
      System.out.print(scanner.next());
      System.out.print(" nie jest poprawnym zapisem liczby.\nb = ");
    }
    b = scanner.nextDouble();
    
    System.out.print("c = ");
    while(!scanner.hasNextDouble()) {
      System.out.print(scanner.next());
      System.out.print(" nie jest poprawnym zapisem liczby.\nc = ");
    }
    c = scanner.nextDouble();
  }

  void solve() {
    delta = b * b - 4.0 * a * c;
    if (delta >= 0.0) {
      x1 = (-b - Math.sqrt(delta))/(2.0 * a);
      x2 = (-b + Math.sqrt(delta))/(2.0 * a);
    }  
  }
  
  void printResults() {
    if (delta >= 0.0) 
      System.out.println("Rozwiązania rzeczywiste: x1 = " + x1 + ", x2 = " + x2); 
    else
      System.out.println("Brak rozwiązań rzeczywistych");
  }
  
  static public void main(String args[]) {
    Trojmian t = new Trojmian();
    t.readData();
    t.solve();
    t.printResults();  
  }
}

