using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace SipayData.Domain
{
    public class Mesajlar
    {
        public int MesajId { get; set; }

        // İlişki: Mesajı gönderen kullanıcı
        public int GonderenId { get; set; }
        public virtual Kullanicilar Gonderen { get; set; }

        // İlişki: Mesajı alan kullanıcı
        public int AliciId { get; set; }
        public virtual Kullanicilar Alici { get; set; }

        public string MesajIcerik { get; set; }
        public bool OkunduDurumu { get; set; }
        public DateTime Tarih { get; set; }
    }

    public class MesajlarConfiguration : IEntityTypeConfiguration<Mesajlar>
    {
        public void Configure(EntityTypeBuilder<Mesajlar> builder)
        {
            builder.HasKey(x => x.MesajId);
            builder.Property(x => x.MesajId).ValueGeneratedOnAdd();

            builder.Property(x => x.MesajIcerik).IsRequired();
            builder.Property(x => x.OkunduDurumu).IsRequired();
            builder.Property(x => x.Tarih).IsRequired();
        }
    }
}
