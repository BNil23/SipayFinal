using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.ComponentModel.DataAnnotations.Schema;

namespace SipayData.Domain
{
    public class Kullanicilar
    {
        public int KullaniciId { get; set; }
        public string AdSoyad { get; set; }
        public string TCNo { get; set; }
        public string EMail { get; set; }
        public string Telefon { get; set; }
        public string AracBilgisi { get; set; }
        public int DaireId { get; set; }
        public Daireler Daire { get; set; }
        // İlişki: Kullanıcı, mesajları gönderir
        [InverseProperty("Gonderen")]
        public virtual List<Mesajlar> GonderdigiMesajlar { get; set; }

        // İlişki: Kullanıcı, mesajları alır
        [InverseProperty("Alici")]
        public virtual List<Mesajlar> AldigiMesajlar { get; set; }
    }

    public class KullanicilarConfiguration : IEntityTypeConfiguration<Kullanicilar>
    {
        public void Configure(EntityTypeBuilder<Kullanicilar> builder)
        {
            builder.HasKey(x => x.KullaniciId);
            builder.Property(x => x.KullaniciId).ValueGeneratedOnAdd();

            builder.Property(x => x.AdSoyad).IsRequired().HasMaxLength(100);
            builder.Property(x => x.TCNo).IsRequired().HasMaxLength(11);
            builder.Property(x => x.EMail).IsRequired().HasMaxLength(100);
            builder.Property(x => x.Telefon).IsRequired().HasMaxLength(20);
            builder.Property(x => x.AracBilgisi).HasMaxLength(50);

            builder.HasOne(x => x.Daire)
                .WithMany(x => x.Kullanicilar)
                .HasForeignKey(x => x.DaireId)
                .OnDelete(DeleteBehavior.Restrict)
                .IsRequired();
        }
    }
}

