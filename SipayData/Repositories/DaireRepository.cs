using System;
using SipayData.Domain;
using SipayData.Repositories.Interfaces;

namespace SipayData.Repositories
{
    public class DaireRepository : GenericRepository<Daireler>, IDaireRepository
    {
        public DaireRepository(sipDbContext context) : base(context)
        {
        }

    }
}
