using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SipayData.Repositories.Interfaces;
using SipayData.Domain;
using System.Threading.Tasks;

namespace SipayData.Repositories
{
    public class MesajlarRepository : GenericRepository<Mesajlar>, IMesajlarRepository
    {
        public MesajlarRepository(sipDbContext context) : base(context)
        {
        }

    }
}
