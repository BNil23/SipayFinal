using SipayData.Domain;
using SipayData.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipayBussiness.Services
{
    public class AidatServis : GenericService<AidatBilgileri>, IAidatServis
    {
        public AidatServis(IGenericRepository<AidatBilgileri> repository) : base(repository)
        {
        }
    }
}
