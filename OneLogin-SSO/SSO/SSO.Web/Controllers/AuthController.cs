using Microsoft.AspNetCore.Mvc;

namespace SSO.Web.Controllers
{
    public class AuthController : Controller
    {
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
    }
}
