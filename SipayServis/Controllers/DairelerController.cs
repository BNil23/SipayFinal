using Microsoft.AspNetCore.Mvc;
using SipayBussiness.Services;
using SipayData.Domain;

namespace SipayServis.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DairelerController : GenericController<Daireler>
    {
        public DairelerController(IGenericService<Daireler> genericService) : base(genericService)
        {
        }
    }
}
