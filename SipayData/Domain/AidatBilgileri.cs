using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace SipayData.Domain
{
    public class AidatBilgileri
    {
        public int AidatId { get; set; }

        // İlişki: Aidat, hangi daireye ait?
        public int DaireId { get; set; }
        public virtual Daireler Daire { get; set; }

        public int Ay { get; set; }
        public int Yil { get; set; }
        public decimal Tutar { get; set; }
    }

    public class AidatBilgileriConfiguration : IEntityTypeConfiguration<AidatBilgileri>
    {
        public void Configure(EntityTypeBuilder<AidatBilgileri> builder)
        {
            builder.HasKey(x => x.AidatId);
            builder.Property(x => x.AidatId).ValueGeneratedOnAdd();

            builder.Property(x => x.Ay).IsRequired();
            builder.Property(x => x.Yil).IsRequired();
            builder.Property(x => x.Tutar).IsRequired().HasPrecision(15, 4);
        }
    }
}

