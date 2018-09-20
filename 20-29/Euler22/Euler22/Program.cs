using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Text.RegularExpressions;

namespace Euler22
{
    class Program
    {
        static List<string> names;
        static void Main(string[] args)
        {
            names = new List<string>();
            read_file("../../names.txt");
            Console.WriteLine("Solution: "+ calculate_score_sum());
            Console.ReadKey();
        }

        private static int calculate_score_sum()
        {
            int sum = 0;
            for (int i = 0; i < names.Count; i++)
            {
                sum += calculate_score(names[i], i);
            }
            return sum;
        }

        private static void read_file(string file)
        {
            try
            {
                StreamReader reader = new StreamReader(file);
                Array.ForEach(reader.ReadLine().Split(','), name => {
                    var match = Regex.Match((String)name, "\"(.*)\"");
                    insert_sorted(match.Groups[1].Value);
                });
                reader.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
            }
        }

        private static void write_names()
        {
            names.ForEach(
                 x => Console.WriteLine("" + x)
                 );
        }

        private static int calculate_score(String name, int index)
        {
            return ++index * calculate_alpha_value(name);
        }

        private static int calculate_alpha_value(string name)
        {
            int sum = 0;
            string lower_case_name = name.ToLower();
            for(int i = 0; i < name.Length; i++)
            {
                sum += (int)lower_case_name[i]-'a'+1;
            }
            return sum;
        }

        private static void insert_sorted(String name)
        {
            int i = 0;
            while(i < names.Count && String.Compare(names[i] , name) == -1)
            {
                i++;
            }
            names.Insert(i, name);            
        }
    }
}
