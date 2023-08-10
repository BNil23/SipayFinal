using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace SipayData.Domain
{
    public class Daireler
    {
        public int DaireId { get; set; }
        public string Blok { get; set; }
        public string Durumu { get; set; }
        public string Tipi { get; set; }
        public int Kat { get; set; }
        public int DaireNumarasi { get; set; }
        public bool DaireSahibiKiraci { get; set; }

        // İlişki: Bir daireye birden fazla kullanıcı bağlanabilir
        public virtual List<Kullanicilar> Kullanicilar { get; set; }

        // İlişki: Bir daireye birden fazla aidat bilgisi bağlanabilir
        public virtual List<AidatBilgileri> Aidatlar { get; set; }

        // İlişki: Bir daireye birden fazla fatura bilgisi bağlanabilir
        public virtual List<FaturaBilgileri> Faturalar { get; set; }
    }

    public class DairelerConfiguration : IEntityTypeConfiguration<Daireler>
    {
        public void Configure(EntityTypeBuilder<Daireler> builder)
        {
            builder.HasKey(x => x.DaireId);
            builder.Property(x => x.DaireId).ValueGeneratedOnAdd();

            builder.Property(x => x.Blok).IsRequired().HasMaxLength(50);
            builder.Property(x => x.Durumu).IsRequired().HasMaxLength(50);
            builder.Property(x => x.Tipi).IsRequired().HasMaxLength(50);
            builder.Property(x => x.Kat).IsRequired();
            builder.Property(x => x.DaireNumarasi).IsRequired();
            builder.Property(x => x.DaireSahibiKiraci).IsRequired();
        }
    }
}
