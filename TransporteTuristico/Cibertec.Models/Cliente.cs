using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
//using Dapper.Contrib.Extensions;
using Dapper.Contrib;

namespace Cibertec.Models
{
    public class Cliente
    {
        //[Write(false)]
        public int Id { get; set; }
        [Key]
        public int IdCliente { get; set; }
        public string Documento { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Celular { get; set; }
        public string Email { get; set; }
        public bool Estado { get; set; }
    }
}
