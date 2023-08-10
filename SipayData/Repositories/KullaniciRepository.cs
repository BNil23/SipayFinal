using SipayData.Domain;
using SipayData.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipayData.Repositories
{
    public class KullaniciRepository : GenericRepository<Kullanicilar>, IKullaniciRepository
    {
        public KullaniciRepository(sipDbContext context) : base(context)
        {
        }
    }
}
