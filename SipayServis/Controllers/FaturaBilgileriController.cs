using Microsoft.AspNetCore.Mvc;
using SipayBussiness.Services;
using SipayData.Domain;

namespace SipayServis.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FaturaBilgileriController : GenericController<FaturaBilgileri>
    {
        public FaturaBilgileriController(IGenericService<FaturaBilgileri> genericService) : base(genericService)
        {
        }
    }
}
