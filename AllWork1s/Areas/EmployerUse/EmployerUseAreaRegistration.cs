using System.Web.Mvc;

namespace AllWork1s.Areas.EmployerUse
{
    public class EmployerUseAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "EmployerUse";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "EmployerUse_default",
                "EmployerUse/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}