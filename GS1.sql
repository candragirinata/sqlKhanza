select*from akun_bayar order by nama_bayar

select no_nota,tgl_bayar,nama_pasien,jumlah_bayar,petugas from tagihan_sadewa 

show databases

show tables

use khanzaDeposit

use kzt

select * from detailjurnal d 

rekeningtahun r 

delete from detailjurnal limit 62

SELECT (@row_number := @row_number + 1) AS No, res.*
FROM
(
select (select count(*) from nota_inap ni 
where (tanggal between '2021-05-24' and '2021-06-24')
and 
(jam between '13:35:19' and '19:35:18'))as RanapT
,(select count(*) from nota_jalan ni 
where (tanggal between '2021-01-24' and '2021-06-24')
and 
(jam between '13:35:19' and '19:35:18'))as RalanT
,(select sum(jumlah_tagihan) from tagihan_sadewa ts where (no_nota like '%RI%') and (tgl_bayar between '2021-06-24 13:35:19' and '2021-06-24 19:35:18'))as RanapN
,(select sum(jumlah_tagihan) from tagihan_sadewa ts where (no_nota like '%RJ%') and (tgl_bayar between '2021-06-24 13:35:19' and '2021-06-24 19:35:18'))as RalanN 
) res
CROSS JOIN (SELECT @row_number := 0) AS dummy



SELECT (@row_number := @row_number + 1) AS No, res.*
FROM
(
select (select count(*) from nota_inap ni 
where (tanggal between '$P!{DT1}' and '$P!{DT2}')
and 
(jam between '$P!{HR1}' and '$P!{HR2}'))as RanapT
,(select count(*) from nota_jalan ni 
where (tanggal between '$P!{DT1}' and '$P!{DT2}')
and 
(jam between '$P!{HR1}' and '$P!{HR2}'))as RalanT
,(select sum(jumlah_tagihan) from tagihan_sadewa ts where (no_nota like '%RI%') and (tgl_bayar between '$P!{GR1}' and '$P!{GR2}'))as RanapN
,(select sum(jumlah_tagihan) from tagihan_sadewa ts where (no_nota like '%RJ%') and (tgl_bayar between '$P!{GR1}' and '$P!{GR2}'))as RalanN 
) res
CROSS JOIN (SELECT @row_number := 0) AS dummy



select count(*) from nota_jalan ni 
where (tanggal between '2021-06-24' and '2021-06-24')
and 
(jam between '13:35:19' and '19:35:18')





show databases

use kzt

select * from operasi

select * from reg_periksa where no_rawat = '2020/08/14/000001'


select * from nota_inap ni2 where ni2.no_rawat = '(
select no_rawat from nota_inap ni where (tanggal between '2021-06-04' and '2021-06-04')
and 
(jam between '00:35:19' and '23:35:18'))'






                         
                         
                         
 
