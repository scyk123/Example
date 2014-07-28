public class FizzBuzz {

  public FizzBuzz(int max) {
    for (int i = 1; i <= max; i++) {
      if (i % 3 == 0) { System.out.print("Fizz"); }
      if (i % 5 == 0) { System.out.print("Buzz"); }
      if (i % 5 != 0 && i % 3 != 0) { System.out.print(i); }
      System.out.println();
    }
  }
  
}
