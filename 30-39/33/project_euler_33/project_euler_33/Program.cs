using System;
using System.Collections;
using System.Collections.Generic;

namespace project_euler_33
{
    class Program
    {
        static void Main(string[] args)
        {
            int outcome_numerator = 1;
            int outcome_denominator = 1;
            for(int numerator = 11; numerator < 99; numerator += 1)
            {
                if( numerator % 10 != 0)
                {
                    Stack<int> denominatorWorkList = new Stack<int>();
                    for(int i = 1; i < 10; i++)
                    {
                        //tiental numerator gebruiken bij denominator
                        denominatorWorkList.Push(((int)(numerator / 10)) * 10 + i);
                        denominatorWorkList.Push(((int)(numerator / 10)) + 10*i);
                        //eenheid numerator gebruiken bij denominator
                        denominatorWorkList.Push((numerator % 10)  + i * 10);
                        denominatorWorkList.Push((numerator % 10) * 10 + i);

                    }
                    while(denominatorWorkList.Count > 0)
                    {
                        int denominator = denominatorWorkList.Pop();
                        if (CanDigitsBeCancelled(numerator, denominator))
                        {
                            Console.WriteLine("{0} {1}",
                            numerator, denominator);
                            outcome_numerator *= numerator;
                            outcome_denominator *= denominator;
                        }
                    }

                }
            }
            Console.WriteLine("Numerator: {0}\nDenominator: {1}", outcome_numerator, outcome_denominator);
            Console.WriteLine("Lowest common terms:");
            (outcome_numerator, outcome_denominator) = find_lowest_common_terms(outcome_numerator, outcome_denominator);
            Console.WriteLine("Numerator: {0}\nDenominator: {1}", outcome_numerator, outcome_denominator);
        }

        private static (int outcome_numerator, int outcome_denominator) find_lowest_common_terms(int outcome_numerator, int outcome_denominator)
        {
            int divisor = outcome_numerator;
            while (divisor > 1)
            {
                if(outcome_numerator % divisor == 0 && outcome_denominator % divisor == 0)
                {
                    outcome_numerator /= divisor;
                    outcome_denominator /= divisor;
                    
                }
                divisor--;
            }
            return (outcome_numerator, outcome_denominator);
        }

        static bool CanDigitsBeCancelled(double numerator, double denominator)
        {
            if(numerator == denominator || numerator > denominator)
            {
                return false;
            }
            double desiredOutcome = numerator / denominator;

            return ((numerator % 10 == denominator % 10 && (((int)numerator / 10) / ((int)denominator / 10)) == desiredOutcome)
            || (numerator % 10 == ((int)denominator / 10) && (((int)numerator / 10) / (denominator % 10)) == desiredOutcome)
            || (((int)numerator / 10) == denominator % 10 && ((numerator % 10) / ((int)denominator / 10)) == desiredOutcome)
            || (((int)numerator / 10) == ((int)denominator / 10) && ((numerator % 10) / (denominator % 10)) == desiredOutcome));
        }
    }
}
