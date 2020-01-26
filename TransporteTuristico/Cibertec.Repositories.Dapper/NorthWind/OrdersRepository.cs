using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cibertec.Models;
using Cibertec.Repositories.NorthWind;

namespace Cibertec.Repositories.Dapper.NorthWind
{
    public class OrdersRepository : Repository<oRDERS>, IOrdersRepository
    {
        public OrdersRepository(string connectionString) : base(connectionString)
        {
        }
    }
}
