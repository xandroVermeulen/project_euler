using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Euler23
{
    class Program
    {
        private static List<int> abun_numbers;
        const int MAXRANGE = 28123;

        static void Main(string[] args)
        {
            abun_numbers = new List<int>();
            find_abundant_numbers();
            Console.WriteLine("Solution: " + calculate_sum());
            Console.ReadKey();
        }

        private static int calculate_sum()
        {
            List<int> viable_numbers = new List<int>();
            for(int i = 1; i <= MAXRANGE; i++) {
                viable_numbers.Add(i);
            }

            int j, abun_sum;
            abun_numbers.ForEach(num =>
            {
                j = 0;
                while (j <= num && (abun_sum = abun_numbers[j] + num) <= MAXRANGE)
                {
                    viable_numbers.Remove(abun_sum);
                    j++;
                }
            });
            return viable_numbers.Sum();
        }

        private static void find_abundant_numbers()
        {
            for (int i = 1; i < MAXRANGE; i++)
            {
                if (calculate_sum_proper_divisors(i) > i)
                {
                    abun_numbers.Add(i);
                }
            }
        }

        static int calculate_sum_proper_divisors(int check)
        {
            int amount = 1;
            for (int divisor = 2; divisor <= Math.Sqrt(check); divisor++)
            {
                if (((double)check / divisor % 1) == 0)
                {
                    amount += divisor;
                    if(divisor != check / divisor)
                    {
                        amount += check / divisor;
                    }
                }
            }
            return amount;
        }
    }
}
