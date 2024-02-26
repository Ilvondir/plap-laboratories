import java.util.Random;

public class Main {
    public static void main(String[] args) {
        int[] tab = new int[10];
        Random rand = new Random();

        for (int i=0; i < tab.length; i++) tab[i] = rand.nextInt(1,6+1);

        for (int i=0; i < tab.length; i++) System.out.print(tab[i] + " ");
    }
}
