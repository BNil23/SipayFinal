using SipayData.Domain;
using SipayData.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipayBussiness.Services
{
    public class KullaniciService : GenericService<Kullanicilar>, IKullaniciServisi
    {
        public KullaniciService(IGenericRepository<Kullanicilar> repository) : base(repository)
        {
        }
    }
}
