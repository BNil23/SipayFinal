using Microsoft.AspNetCore.Mvc;
using SipayBussiness.Services;
using SipayData.Domain;

namespace SipayServis.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AidatBilgileriController : GenericController<AidatBilgileri>
    {
        public AidatBilgileriController(IGenericService<AidatBilgileri> genericService) : base(genericService)
        {
        }
    }
}

