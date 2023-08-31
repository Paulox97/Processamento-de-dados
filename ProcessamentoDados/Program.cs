namespace ProcessamentoDados
{
    using System;
    using System.IO;
    using System.Text.RegularExpressions;
    internal class Program
    {
        static void Main(string[] args)
        {
            string entradaDados = "D:\\Programação desktop\\Processamento-de-dados\\dvdrss.sql";
            string entradaDadosTabelas = "dvdr - create.sql";
            string saidaDados = "D:\\Programação desktop\\Processamento-de-dados\\dvdrss_new.sql";


            try
            {
                using (StreamReader leitor = new StreamReader(entradaDados))
                using (StreamWriter escritor = new StreamWriter(saidaDados))
                {
                    string linha;
                    while ((linha = leitor.ReadLine()) != null)
                    {
                        if (linha.Trim().StartsWith("INSERT INTO"))
                        {
                            string tabela = GetNomeTabela(linha);
                            //string listaColuna = GetColumnList(tabela);
                            //escritor.WriteLine($"{linha.Substring(0, linha.Length - 1)} {columnList}) VALUES");
                        }
                        else
                        {
                            escritor.WriteLine(linha);
                        }
                    }
                }
                Console.WriteLine("Arquivo gerado com sucesso!");

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }

        static string GetNomeTabela(string insertStatement)
        {
            Regex regex = new Regex(@"INSERT INTO\s+(\w+)\s+");
            Match match = regex.Match(insertStatement);
            if (match.Success)
            {
                return match.Groups[1].Value;
            }
            return null;
        }
    }
}