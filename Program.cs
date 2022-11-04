using System.Globalization;

namespace Moeda
{
     class Program
    {
        static void Main()
        {
            Console.Clear();

            decimal valor = 10.25m;
            
            Console.WriteLine(valor.ToString("C",CultureInfo.CreateSpecificCulture("pt-BR")));
        }
    }
}