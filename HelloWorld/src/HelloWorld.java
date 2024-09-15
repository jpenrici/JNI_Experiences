import java.nio.file.Paths;

public class HelloWorld {
  
  static {   
      String path = System.getProperty("user.dir");
      // System.out.println(path);

      try {
          String fullLibPath = Paths.get(path + "/lib", "libnative.so").toAbsolutePath().toString();
          // System.out.println(fullLibPath);
          System.load(fullLibPath);
          System.out.println("Library loaded successfully!");
      } catch (UnsatisfiedLinkError e) {
          e.printStackTrace();
      }
  }  

  public static void main(String[] args) {
    HelloWorld hello = new HelloWorld();
    hello.message(null);          // output : Null
    hello.message("");            // output : Empty
    hello.message("Hello JNI!");  // output : Hello JNI!
  }

  // native method
  private native void message(String text);

}