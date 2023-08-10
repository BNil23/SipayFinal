using Microsoft.AspNetCore.Mvc;
using SipayBussiness;
using SipayBussiness.Services;
using SipayData.Domain;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;

namespace SipayServis.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class KullanicilarController : GenericController<Kullanicilar>
    {
        private readonly UserManager _userManager;

        public KullanicilarController(IGenericService<Kullanicilar> genericService, UserManager userManager)
            : base(genericService)
        {
            _userManager = userManager;
        }

        [HttpPost("kayit")]
        public async Task<IActionResult> KayitOl([FromBody] Kullanicilar model)
        {
            if (ModelState.IsValid)
            {
                // Kullanıcıyı kaydet ve rastgele şifre oluşturup mail gönder
                var sifre = await _userManager.CreateUserWithRandomPasswordAndSendEmail(model.EMail);

                // GenericController'dan Create metodu kullanarak veritabanına kaydet
                await Create(model);



                return Ok($"Kullanıcı başarıyla kaydedildi. Oluşturulan şifre: {sifre}");
            }

            // Model doğrulama hatası varsa hataları döndürün
            return BadRequest(ModelState);
        }

    }
}
