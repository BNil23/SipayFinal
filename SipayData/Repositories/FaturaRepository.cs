using SipayData.Repositories.Interfaces;
using SipayData.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipayData.Repositories
{
    public class FaturaRepository : GenericRepository<FaturaBilgileri>, IFaturaRepository
    {
        public FaturaRepository(sipDbContext context) : base(context)
        {
        }

    }
}
