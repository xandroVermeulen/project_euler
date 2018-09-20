using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Euler21
{
    class Program
    {
        const int MAXRANGE = 10000;

        static void Main(string[] args)
        {
            int[] cache = new int[MAXRANGE];
            int amount, sum = 0;

            for (int i = 1; i < MAXRANGE; i++)
             {
                amount = calculate_amount_proper_divisors(i);
                if(amount < MAXRANGE && cache[amount] == 0 && amount != i)
                {
                    cache[i] = amount;
                    cache[amount] = calculate_amount_proper_divisors(amount);
                    if (cache[amount] == i)
                    {
                        sum += amount + i;
                    }
                }
             }
            Console.WriteLine("Solution: " + sum);
            Console.ReadKey();
        }

        static int calculate_amount_proper_divisors(int check)
        {
            int amount = 1;
            for(int divisor = 2; divisor <= check/2; divisor++)
            {
                if (((double)check / divisor % 1) == 0)
                {
                    amount+= divisor;
                }
            }
            return amount;
        }
    }
}
