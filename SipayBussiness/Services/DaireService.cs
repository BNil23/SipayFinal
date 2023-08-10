using SipayData.Domain;
using SipayData.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipayBussiness.Services
{
    public class DaireService : GenericService<Daireler>, IDaireServisi
    {
        public DaireService(IGenericRepository<Daireler> repository) : base(repository)
        {
        }
    }
}