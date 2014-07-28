import java.util.Scanner;

public class GuessingGame {
  private int high = 0, the_number = 0, guess = 0, guess_count = 0;
  private Scanner s = new Scanner(System.in);
  
  public GuessingGame() {}
  
  private void setVars() {
    while (high <= 1) {
      System.out.print("You are guessing from 1 to what number? ");
      high = safeParse(s.next());
    }
    the_number = (int) ((Math.random() * high) + 1);
  }
  
  private void doGuesses() {
    while (guess != the_number) {
      if (guess_count == 0) {
        System.out.print("Type a number between 1 and " + high + ": ");
      } else { incorrectResult(); }
      
      guess = safeParse(s.next());
      guess_count++;
    }
    
    System.out.println("RIGHT! It took you " + guess_count + " tries.");
  }
  
  private void incorrectResult() {
    String result = guess < the_number ? "low" : "high";
    System.out.println("Too " + result + ". Try again: ");
  }
  
  private int safeParse(String str) {
    int temp = 0;
    try {
      temp = Integer.parseInt(str);
    } catch(NumberFormatException e) {
      System.out.println("Invalid input!");
    }
    return temp;
  }
  
  public boolean playAgain() {
    setVars();
    doGuesses();
    System.out.print("Would you like to play again? [y/n]: ");
    return s.next().hashCode() == "y".hashCode();
  }
}
