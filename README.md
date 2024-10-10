# 🚚 CargoSelector Web API

## 🎯 Proje Amacı
CargoSelector, kargo firmaları ve sipariş verilerini yöneterek kargo maliyetlerini optimize etmeyi ve otomatik raporlar üretmeyi hedefler. Kullanıcıların en uygun maliyetli kargo firmasını seçmelerine yardımcı olur.

## 🌟 Proje Özellikleri
- **Maliyet Hesaplama:** Sipariş desisi, kargo firmalarının minimum ve maksimum desi değerlerine göre hesaplanır.
- **Raporlama:** Kargo firmalarının ödenen ücretleri, raporlar halinde sunulur.

## ⚙️ Kullanılan Teknolojiler
- **ASP.NET Core Web API:** RESTful API ile veri işlemleri sağlanır.
- **Entity Framework Core:** Veritabanı işlemleri için ORM desteği sunar.
- **SQL Server:** Verilerin yönetimi için kullanılır.
- **Hangfire:** Arka plan işlevlerini yönetir.
- **AutoMapper:** DTO ve veri modelleri arasında dönüşüm yapar.
- **Swagger:** API testleri ve dökümantasyonu için kullanılır.

## 🏗️ Proje Modülleri ve Katmanları
CargoSelector, katmanlı bir yapı ile geliştirilmiştir:
- **Entity Layer:** Veri modellerini içerir.
- **Data Access Layer:** Veritabanı işlemlerini yönetir.
- **Business Layer:** İş mantığı ve servisleri tanımlar.
- **Dto Layer:** Veri taşımak için kullanılır.
- **Web API Layer:** API uç noktalarını yönetir.

## 🔄 Proje İşleyişi
Kullanıcılar sipariş bilgilerini girerek uygun maliyetleri görüntüleyebilir. Her saatte bir otomatik rapor oluşturulur ve veriler SQL Server veritabanında saklanır. Swagger entegrasyonu ile API uç noktaları kolayca test edilebilir.
