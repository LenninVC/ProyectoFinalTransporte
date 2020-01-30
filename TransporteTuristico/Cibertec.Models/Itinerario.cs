using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper.Contrib;
using Dapper.Contrib.Extensions;


namespace Cibertec.Models
{
    public class Itinerario
    {
        [Write(false)]
        public int Id { get; set; }
        [Key]
        public int IdItinerario { get; set; }
        public int IdConductor { get; set; }
        public string Descripcion { get; set; }
        public string Origen { get; set; }
        public string Destino { get; set; }
        public string Conductor { get; set; }
        public string Licencia { get; set; }
        public decimal Costo { get; set; }
        public bool Estado { get; set; }

    }
}
