using Microsoft.AspNetCore.Mvc;
using SipayBussiness.Services;
using SipayData.Domain;

namespace SipayServis.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MesajlarController : GenericController<Mesajlar>
    {
        public MesajlarController(IGenericService<Mesajlar> genericService) : base(genericService)
        {
        }
    }
}

