using Microsoft.EntityFrameworkCore;
using SipayData.Domain;
using System.Reflection;

namespace SipayData
{
    public class sipDbContext : DbContext
    {
        public sipDbContext(DbContextOptions<sipDbContext> options) : base(options)
        {
        }

        public DbSet<Kullanicilar> Kullanicilar { get; set; }
        public DbSet<Daireler> Daireler { get; set; }
        public DbSet<AidatBilgileri> AidatBilgileri { get; set; }
        public DbSet<FaturaBilgileri> FaturaBilgileri { get; set; }
        public DbSet<Mesajlar> Mesajlar { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

            base.OnModelCreating(modelBuilder);
        }
    }
}
