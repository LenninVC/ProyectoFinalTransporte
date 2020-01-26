using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cibertec.Repositories.Dapper.NorthWind;
using Cibertec.UnitOfWork;
using System.Configuration;

namespace Cibertec.Mvc.Controllers
{
    public class OrdersController : Controller
    {
        private readonly IUnitOfWork _unit;

        public OrdersController()
        {
            _unit = new NorthwindUnitOfWork(
                ConfigurationManager.ConnectionStrings["NorthwindConnection"].ToString());
        }

        // GET: Orders
        public ActionResult Index()
        {
            return View(_unit.Orders.GetList());
        }

        public ActionResult OrderDetail(int id)
        {
            return View(_unit.OrderDetails.GetListByOrderId(id));
        }
    }
}