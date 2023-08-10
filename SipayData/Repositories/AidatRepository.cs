using SipayData.Domain;
using SipayData.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipayData.Repositories
{
    public class AidatRepository : GenericRepository<AidatBilgileri>, IAidatRepository
    {
        public AidatRepository(sipDbContext context) : base(context)
        {
        }
    }
}
