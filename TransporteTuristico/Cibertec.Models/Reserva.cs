using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cibertec.Models
{
    public class Reserva
    {
        public string Origen { get; set; }
        public string Destino { get; set; }
        public int IdCliente { get; set; }
        public int IdItinerario { get; set; }
        public DateTime Fecha_Inicio { get; set; }
        public DateTime Fecha_Fin { get; set; }
        public decimal Costo { get; set; }
    }
}
