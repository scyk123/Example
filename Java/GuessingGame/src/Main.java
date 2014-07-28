public class Main {
  
  public static void main(String[] args) {
    boolean play = true;
    GuessingGame game = new GuessingGame();
    System.out.println("We are going to play a number guessing game.");
    while (play) {
      play = game.playAgain();
    }
  }
  
}
