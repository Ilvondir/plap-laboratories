import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int a, b, c;
        Scanner in = null;
        PrintWriter out = null;

        try {
            in = new Scanner(new File("liczby.txt"));
            out = new PrintWriter("wynik.txt");

            a = in.nextInt();
            b = in.nextInt();
            c = a + b;
            out.print(c);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (in != null)
                in.close();
            if (out != null)
                out.close();
        }
    }
}