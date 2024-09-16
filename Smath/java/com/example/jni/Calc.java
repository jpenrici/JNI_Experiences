import java.nio.file.Paths;

public class Calc {
  
  static {   
      String path = System.getProperty("user.dir");

      try {
          String fullLibPath = Paths.get(path + "/cpp/lib", "libCalc.so").toAbsolutePath().toString();
          System.load(fullLibPath);
      } catch (UnsatisfiedLinkError e) {
          e.printStackTrace();
      }
  }  

  public static void main(String[] args) {
    
    Calc calc = new Calc();

    String text = calc.info();

    double first = 10.0;
    double second = 20.0;

    double sum = calc.add(first, second);
    double sub = calc.subtract(first, second);
    double mult = calc.multiply(first, second);
    double div = calc.divide(first, second);

    System.out.println(text);
    // Result: 30,00 -10,00 200,00 0,50
    System.out.printf("%.2f %.2f %.2f %.2f%n", sum, sub, mult, div);

  }

  // native method
  private native String info();
  private native double add(double first, double second);
  private native double subtract(double first, double second);
  private native double multiply(double first, double second);
  private native double divide(double first, double second);

}