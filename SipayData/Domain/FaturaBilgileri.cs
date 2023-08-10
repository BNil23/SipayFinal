using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace SipayData.Domain
{
    public class FaturaBilgileri
    {
        public int FaturaId { get; set; }

        // İlişki: Fatura, hangi daireye ait?
        public int DaireId { get; set; }
        public virtual Daireler Daire { get; set; }

        public int Ay { get; set; }
        public int Yil { get; set; }
        public string FaturaTuru { get; set; }
        public decimal Tutar { get; set; }
        public bool OdemeDurumu { get; set; }
    }

    public class FaturaBilgileriConfiguration : IEntityTypeConfiguration<FaturaBilgileri>
    {
        public void Configure(EntityTypeBuilder<FaturaBilgileri> builder)
        {
            builder.HasKey(x => x.FaturaId);
            builder.Property(x => x.FaturaId).ValueGeneratedOnAdd();

            builder.Property(x => x.Ay).IsRequired();
            builder.Property(x => x.Yil).IsRequired();
            builder.Property(x => x.FaturaTuru).IsRequired().HasMaxLength(50);
            builder.Property(x => x.Tutar).IsRequired().HasPrecision(15, 4);
            builder.Property(x => x.OdemeDurumu).IsRequired();
        }
    }
}

