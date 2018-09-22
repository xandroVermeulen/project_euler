using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Euler24
{
    class Program
    {
        static List<int> symbols = new List<int>(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        static long permutation = 0;
        static int current_position = 0, start_size;

        static void Main(string[] args)
        {
            start_size = symbols.Count;
            Find_permutation_at_index(1000000);
            Console.WriteLine("Solution: " + permutation);
            Console.ReadKey();
        }

        private static void Find_permutation_at_index(int index)
        {
            int element=0, perm_position = 0;
            while (symbols.Count != 0)
            {
                element = Find_symbol_at_position(perm_position, index);
                if(symbols.Count != 0)
                {
                    permutation += symbols[element]*((long)Math.Pow(10,(start_size-perm_position-1)));
                    symbols.RemoveAt(element);
                    perm_position++;
                }
            }
        }

        private static int Find_symbol_at_position(int perm_position, int index)
        {
            int interval = Fac(symbols.Count - 1);
            int current_symbol = (index - current_position) / interval;
            current_position += current_symbol * interval;
            if ((index - current_position) == 0)
            {
                current_position -= interval;
                current_symbol --;
            }
            return current_symbol;
        }

        static int Fac(int i)
        {
            if (i <= 1)
            {
                return 1;
            }
            return i * Fac(i - 1);
        }
    }
}
