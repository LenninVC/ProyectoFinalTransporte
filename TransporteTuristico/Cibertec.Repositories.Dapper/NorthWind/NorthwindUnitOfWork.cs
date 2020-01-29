using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cibertec.Repositories.NorthWind;
using Cibertec.UnitOfWork;

namespace Cibertec.Repositories.Dapper.NorthWind
{
    public class NorthwindUnitOfWork : IUnitOfWork
    {
        public NorthwindUnitOfWork(string connectionString)
        {
            Customers = new CustomersRepository(connectionString);
            Users = new UserRepository(connectionString);
            Clientes = new ClienteRepository(connectionString);
        }

        public ICustomersRepository Customers { get; private set; }
        public IUserRepository Users { get; private set; }
        public IClienteRepository Clientes { get; private set; }
    }
}
