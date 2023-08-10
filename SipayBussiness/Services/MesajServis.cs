using SipayData.Domain;
using SipayData.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipayBussiness.Services
{
    
    public class MesajServis : GenericService<Mesajlar>, IMesajServis
    {
        public MesajServis(IGenericRepository<Mesajlar> repository) : base(repository)
        {
        }
    }
}
