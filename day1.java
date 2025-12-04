import java.util.Scanner;

public class day1
{
    public static void main(String[] args) throws Exception
    {
        int value = 50;

        int countOfZeroValue = 0;

        Scanner s = new Scanner(System.in);

        while(s.hasNextLine())
        {
            String line = s.nextLine();
            if (line.length() <= 1) 
            {
                System.out.println("Invalid format, lines must be L or R with a number. Ex R11");
                return;
            }
            
            char op = line.charAt(0);
            int delta = Integer.parseInt(line.substring(1), 10);

            switch (op) 
            {
                case 'L':
                    value = (value - delta) % 100;
                    break;
                case 'R':
                    value = (value + delta) % 100;
                    break;
                default:
                    // Should never reach this, just return if we did
                    throw new Exception("Op was somehow not L or R");
            }

            if (value == 0)
            {
                countOfZeroValue++;
            }
        }


        System.out.println("Password Finder Complete");
        System.out.println(countOfZeroValue);
    }
}