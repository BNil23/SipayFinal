## Projenin Amacı ve Gereksinimleri:
Bir sitede yer alan dairelerin aidat ve ortak kullanım elektrik, su ve doğalgaz faturalarının yönetimini bir sistem üzerinden yapılacak. 

İki tip kullanıcı var: 

1- Admin/Yönetici 

- Daire bilgilerini girebilir.
- İkamet eden kullanıcı bilgilerini girer.
- Daire başına ödenmesi gereken aidat ve fatura bilgilerini girer(Aylık olarak). Toplu veya tek tek atama yapılabilir.
- Gelen ödeme bilgilerini görür.
- Gelen mesajları görür.
- Mesajların okunmuş/okunmamış/yeni mesaj olduğu anlaşılmalı.
- Aylık olarak borç-alacak listesini görür. 
- Kişileri listeler, düzenler, siler.
- Daire/konut bilgilerini listeler, düzenler siler.
- Fatura ödemeyen kişilere günlük mail job atılmalı

2- Kullanıcı 

- Kendisine atanan fatura ve aidat bilgilerini görür.
- Sadece kredi kartı ile ödeme yapabilir.
-  Yöneticiye mesaj gönderebilir.

### Sistemin İşleyişi: 

_Sistem kullanılmaya başladığında ilk olarak_; 

- Yönetici daire bilgilerini girer.
- Kullanıcı bilgilerini girer.
- Giriş yapması için otomatik olarak bir şifre oluşturulur.
- Kullanıcıları dairelere atar
- Ay bazlı olarak aidat bilgilerini girer.
- Ay bazlı olarak fatura bilgilerini girer 

- Arayüz dışında kullanıcıların kredi kartı ile ödeme yapabilmesi için ayrı bir servis yazılacaktır. 

Bu servisde sistemde ki her bir kullanıcı için banka bilgileri(bakiye, kredi kartı no vb.) kontrol edilerek ödeme yapılması sağlanır. 

      _Gereksinimler_: 

- Web projesi için: .Net 
- Sistemin yönetimi/database için MS SQL Server / PostgreSQL
- Sunum in dokumantasyon (Postman,swagger vs.)

## Projede kullanılan paketler:
“`
<PackageReference Include="Microsoft.AspNetCore.Identity.EntityFrameworkCore" Version="6.0.20" />
    <PackageReference Include="Microsoft.AspNetCore.Identity.UI" Version="6.0.20" />
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="6.0.20" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Design" Version="6.0.20">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
    <PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="6.0.20" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="6.0.20">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
    <PackageReference Include="Swashbuckle.AspNetCore" Version="6.5.0" /
“`

### Projenin içeriği:

_Projede aşağıdaki katmanlar kullanılmıştır:_

- **Business Katmanı:** İş mantığı işlemlerini içerir. Kullanıcı, aidat ve fatura yönetimi gibi işlemler bu katmanda yer alır.
- **Data Katmanı:** Veritabanı işlemlerini gerçekleştirir. Entity Framework Core kullanılarak daire ve kullanıcı bilgileri veritabanında saklanır.
- **Service Katmanı:** Web API servislerini sağlar. Kullanıcılar, aidat ve fatura bilgilerine bu servisler üzerinden erişebilir.

### Teknolojiler:

- ASP.NET Core MVC
- Entity Framework Core
- SQL Server
- Swagger

#### Ek Bilgi:
_Kullanılan bazı bileşenler:_
- **_Servisler (Services):_**
  Servisler, iş mantığınızı ve işlemlerinizi yürüten temel bileşenlerdir. Projede kullanılan servisler, farklı işlevleri yerine getirir ve genellikle veritabanı etkileşimi, iş hesaplamaları veya dış hizmetlerle iletişim gibi görevleri üstlenir.
- **_Repository'ler:_**
  Repository'ler, veritabanına erişim sağlayan ve CRUD (Create, Read, Update, Delete) işlemlerini gerçekleştiren bileşenlerdir. Veritabanı işlemlerini soyutlayarak, kodunuzun daha bakım kolaylığına sahip ve test edilebilir olmasını sağlar.
- **_Controller'lar_**
    Controller'lar, gelen HTTP isteklerini yönetir, ilgili servis ve repository'leri çağırarak işlemleri gerçekleştirir ve sonuçları HTTP yanıtı olarak döndürür. Controller'lar, istemcilerin (örneğin web tarayıcıları veya mobil uygulamalar) sisteminizle etkileşime girmesini sağlar.

     - _banka klasörü ödev teslimi sırasında kredi kartı ödemeleri için yazılamamış servis olduğundan ötürü eklenmiştir. Daha önce bankaların api leri ile yapılmış testleri içerir._


