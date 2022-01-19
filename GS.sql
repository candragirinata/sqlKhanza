select * FROM piutang_pasien						


select piutang_pasien.no_rawat, piutang_pasien.tgl_piutang, concat(piutang_pasien.no_rkm_medis,' ',pasien.nm_pasien), 
                       piutang_pasien.status,piutang_pasien.totalpiutang, piutang_pasien.uangmuka, piutang_pasien.sisapiutang, piutang_pasien.tgltempo,penjab.png_jawab 
                       from piutang_pasien inner join pasien inner join reg_periksa inner join penjab on  
                       piutang_pasien.no_rkm_medis=pasien.no_rkm_medis and 
                       piutang_pasien.no_rawat=reg_periksa.no_rawat and 
                       reg_periksa.kd_pj=penjab.kd_pj 
                      
select count(no_rawat)as jmlpx from piutang_pasien

select penagihan_piutang.no_tagihan,penagihan_piutang.tanggal,penagihan_piutang.tanggaltempo,bagianpenagihan.nama,
                     penjab.nama_perusahaan,akun_penagihan_piutang.nama_bank,sum(detail_penagihan_piutang.sisapiutang) as total 
                     from penagihan_piutang inner join pegawai as bagianpenagihan on bagianpenagihan.nik=penagihan_piutang.nip 
                     inner join penjab on penagihan_piutang.kd_pj=penjab.kd_pj 
                     inner join akun_penagihan_piutang on akun_penagihan_piutang.kd_rek=penagihan_piutang.kd_rek 
                     inner join detail_penagihan_piutang on detail_penagihan_piutang.no_tagihan=penagihan_piutang.no_tagihan 
                     where penagihan_piutang.status='Proses Penagihan'                     
                     
select reg_periksa.no_rawat,reg_periksa.no_rkm_medis,pasien.nm_pasien,reg_periksa.tgl_registrasi,dokter.nm_dokter,penjab.png_jawab, 
                        piutang_pasien.uangmuka,piutang_pasien.totalpiutang 
                        from reg_periksa inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
                        inner join penjab on reg_periksa.kd_pj=penjab.kd_pj 
                        inner join dokter on reg_periksa.kd_dokter=dokter.kd_dokter 
                       inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
                        inner join piutang_pasien on piutang_pasien.no_rawat=reg_periksa.no_rawat 
                        where reg_periksa.status_lanjut='Ralan' 
                        
                        
                        and reg_periksa.tgl_registrasi between ? and ? 
                        and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? 
                        order by reg_periksa.tgl_registrasi
                        
                        
select count(png_jawab)as JmlPx, count(case status_lanjut when 'Ralan' then 1 else null end)as Ralan,count(case status_lanjut when 'Ranap' then 1 else null end)as Ranap, 
png_jawab 
from reg_periksa 
inner join pasien on reg_periksa.no_rkm_medis = pasien.no_rkm_medis 
inner join penjab on reg_periksa.kd_pj = penjab.kd_pj 
group by png_jawab

select count(status_lanjut)as Ralan, png_jawab 
from reg_periksa inner join penjab on reg_periksa.kd_pj = penjab.kd_pj where status_lanjut='Ralan' group by png_jawab

select count(status_lanjut)as Ranap, png_jawab 
from reg_periksa inner join penjab on reg_periksa.kd_pj = penjab.kd_pj where status_lanjut='Ranap' group by png_jawab

select count(kd_pj)as kodePJ, kd_pj from reg_periksa group by kd_pj 


SELECT (@row_number := @row_number + 1) AS No, res.*
FROM
(
select png_jawab,count(png_jawab)as JmlPx, count(case status_lanjut when 'Ralan' then 1 else null end)as Ralan,count(case status_lanjut when 'Ranap' then 1 else null end)as Ranap,sum(dpp.sisapiutang)as Tanggungan, sum(uangmuka)as Tunai
,sum(if(reg_periksa.status_lanjut='ralan',dpp.sisapiutang+uangmuka,0))as NominalRalan
,sum(if(reg_periksa.status_lanjut='ranap',dpp.sisapiutang+uangmuka,0))as NominalRanap
,sum(dpp.sisapiutang+uangmuka)as Total_ranapNrawat
from reg_periksa 
inner join pasien on reg_periksa.no_rkm_medis = pasien.no_rkm_medis 
inner join penjab on reg_periksa.kd_pj = penjab.kd_pj
inner join piutang_pasien pp on reg_periksa.no_rawat = pp.no_rawat 
inner join detail_piutang_pasien dpp on reg_periksa.no_rawat = dpp.no_rawat 
where reg_periksa.status_lanjut in ('ralan','ranap') and pp.tgl_piutang between '2021-06-16' AND '2021-06-16'
group by png_jawab
) res
CROSS JOIN (SELECT @row_number := 0) AS dummy


select no_rkm_medis, from reg_periksa rp join pasien p where no_rawat ='2021/05/30/000006'

select sum(totalpiutang)as Ralan from reg_periksa rp join detail_piutang_pasien dpp on rp.no_rawat = dpp.no_rawat where status_lanjut ='ralan' group by dpp.kd_pj 

select rp.no_rkm_medis, rp.kd_pj, rp.no_rawat, nm_pasien, status_lanjut, totalpiutang, sisapiutang from reg_periksa rp join detail_piutang_pasien dpp on rp.no_rawat  = dpp.no_rawat join pasien p on rp.no_rkm_medis = p.no_rkm_medis where dpp.no_rawat in ('2021/05/30/000006','2021/06/11/000004','2021/06/14/000001')

select sum(totalpiutang) from detail_piutang_pasien dpp join reg_periksa rp on dpp.no_rawat = rp.no_rawat where rp.status_lanjut = 'ralan' group by dpp.kd_pj 

select * from piutang_pasien pp where pp.tgl_piutang between '2021-06-11' AND '2021-06-11'


select * from information_schema.columns where column_name like '%no_peserta%'



select * from temporary_bayar_ranap

where table_name='' and column_name like '%user%'

select * from penjab p 

drop database kzt1

show databases

show table from test

use simrs

select * from jurnal

select nota_jalan.no_rawat,nota_jalan.no_nota,nota_jalan.tanggal,pasien.nm_pasien,(piutang_pasien.totalpiutang-piutang_pasien.uangmuka) as totalpiutang,
piutang_pasien.uangmuka from piutang_pasien inner join nota_jalan inner join pasien 
on piutang_pasien.no_rawat=nota_jalan.no_rawat and piutang_pasien.no_rkm_medis=pasien.no_rkm_medis 

where nota_jalan.tanggal between ? and ? and pasien.nm_pasien like ? or 
nota_jalan.tanggal between ? and ? and nota_jalan.no_nota like ? order by nota_jalan.tanggal,nota_jalan.no_nota


select * from detail_piutang_pasien where kd_pj <> 'A65'

SELECT (@row_number := @row_number + 1) AS No, res.*
FROM
(
select png_jawab,count(png_jawab)as JmlPx, count(case status_lanjut when 'Ralan' then 1 else null end)as Ralan,count(case status_lanjut when 'Ranap' then 1 else null end)as Ranap,sum(dpp.sisapiutang)as Tanggungan, sum(uangmuka)as Tunai
,sum(if(reg_periksa.status_lanjut='ralan',dpp.sisapiutang+uangmuka,0))as NominalRalan
,sum(if(reg_periksa.status_lanjut='ranap',dpp.sisapiutang+uangmuka,0))as NominalRanap
,sum(dpp.sisapiutang+uangmuka)as Total_ranapNrawat
from reg_periksa 
inner join pasien on reg_periksa.no_rkm_medis = pasien.no_rkm_medis 
inner join penjab on reg_periksa.kd_pj = penjab.kd_pj
inner join piutang_pasien pp on reg_periksa.no_rawat = pp.no_rawat 
inner join detail_piutang_pasien dpp on reg_periksa.no_rawat = dpp.no_rawat 
where reg_periksa.status_lanjut in ('ralan','ranap') and pp.tgl_piutang between '$P!{GR1}' AND '$P!{GR2}'
group by png_jawab
) res
CROSS JOIN (SELECT @row_number := 0) AS dummy

***************************BPJS , TUNAI , DEPOSIT*********************************************

select penjab.png_jawab, count(distinct  penjab.png_jawab)as JmlPx, count(distinct case status_lanjut when 'Ralan' then 1 else null end)as Ralan,count(distinct case status_lanjut when 'Ranap' then 1 else null end)as Ranap
,sum(if(reg_periksa.status_lanjut='ralan',dpp.sisapiutang,0))as NominalRalan
,sum(if(reg_periksa.status_lanjut='ranap',dpp.sisapiutang,0))as NominalRanap
,sum(dpp.sisapiutang+uangmuka)as Total_ranapNrawat
,sum(distinct pp.totalpiutang)as Total, sum(if(dpp.nama_bayar = "Piutang BPJS",dpp.totalpiutang, 0))as BPJS, 
sum(if(dpp.nama_bayar <> "Piutang BPJS",dpp.totalpiutang, 0))as Tanggungan, sum(distinct pp.uangmuka)as Tunai
,sum(distinct if(reg_periksa.no_rawat = d.no_rawat ,d.besar_deposit, 0))as Deposit
from reg_periksa 
inner join pasien on reg_periksa.no_rkm_medis = pasien.no_rkm_medis 
inner join penjab on reg_periksa.kd_pj = penjab.kd_pj
inner join detail_piutang_pasien dpp on reg_periksa.no_rawat = dpp.no_rawat 
inner join piutang_pasien pp on reg_periksa.no_rawat = pp.no_rawat 
left join deposit d on reg_periksa.no_rawat = d.no_rawat 
where reg_periksa.status_lanjut in ('ralan','ranap')
group by reg_periksa.no_rawat  


*seharusnya BPJS jumlahnya 8 

use sik

select Gmbr_Antigen from pasien

select * from deposit d 

select sum(pp.totalpiutang)as Total from piutang_pasien pp 

select sum(pp.totalpiutang), 

select  sum(distinct pp.totalpiutang), pp.* from detail_piutang_pasien dpp left join piutang_pasien pp using(no_rawat)

select dpp.totalpiutang ,penjab.png_jawab,  
from reg_periksa 


select count (select distinct no_rawat from reg_periksa rp)

select * from (select png_jawab,reg_periksa.* 
from reg_periksa
inner join pasien on reg_periksa.no_rkm_medis = pasien.no_rkm_medis 
inner join penjab on reg_periksa.kd_pj = penjab.kd_pj
inner join piutang_pasien pp on reg_periksa.no_rawat = pp.no_rawat 
inner join detail_piutang_pasien dpp on reg_periksa.no_rawat = dpp.no_rawat 
group by reg_periksa.no_rawat)g group by g.png_jawab 



**********************************request kadek accounting************************************************

select png_jawab, count(JmlPx)as jumlah_pasien,sum(Ralan)as Ralan, sum(Ranap)as Ranap, sum(NominalRalan)as NominalRalan, sum(NominalRanap)as NominalRanap, sum(Total_ranapNrawat)as Total_ranapNrawat, sum(Total)as Total,sum(BPJS)as BPJS, sum(Tanggungan)as Tanggungan,sum(Tunai_inap)as Tunai_inap,sum(Tunai)as Tunai,sum(Deposit)as Deposit
from (select penjab.png_jawab, count(penjab.png_jawab)as JmlPx, count(case status_lanjut when 'Ralan' then 1 else null end)as Ralan,count( case status_lanjut when 'Ranap' then 1 else null end)as Ranap
,sum(if(reg_periksa.status_lanjut='ralan',dpp.sisapiutang,0))as NominalRalan
,sum(if(reg_periksa.status_lanjut='ranap',dpp.sisapiutang,0))as NominalRanap
,sum(dpp.sisapiutang)as Total_ranapNrawat
,sum(distinct pp.totalpiutang)as Total, sum(if(dpp.kd_pj = "bpj",dpp.totalpiutang, 0))as BPJS, 
sum(DISTINCT if(dpp.kd_pj <> "bpj",dpp.totalpiutang, 0))as Tanggungan, sum(distinct dni.besar_bayar)as Tunai_inap, sum(distinct dnj.besar_bayar)as Tunai
,sum(distinct d.besar_deposit)as Deposit
from reg_periksa 
left join pasien on reg_periksa.no_rkm_medis = pasien.no_rkm_medis 
left join penjab on reg_periksa.kd_pj = penjab.kd_pj
left join detail_piutang_pasien dpp on reg_periksa.no_rawat = dpp.no_rawat 
left join piutang_pasien pp on reg_periksa.no_rawat = pp.no_rawat 
left join detail_nota_inap dni on reg_periksa.no_rawat = dni.no_rawat 
left join deposit d on reg_periksa.no_rawat = d.no_rawat 
left join detail_nota_jalan dnj on reg_periksa.no_rawat = dnj.no_rawat 
where reg_periksa.status_lanjut in ('ralan','ranap') and pp.tgl_piutang between '$P!{GR1}' AND '$P!{GR2}'
group by reg_periksa.no_rawat)g group by g.png_jawab



select * from detail_piutang_pasien dpp 

select * from deposit d 

select * from detail_nota_inap

select * from piutang_pasien where tgl_piutang between '$P!{GR1}' AND '$P!{GR2}'

select count(reg_periksa.no_rawat) from reg_periksa inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli inner join nota_jalan on reg_periksa.no_rawat=nota_jalan.no_rawat where reg_periksa.kd_pj='bpj' and concat(nota_jalan.tanggal) between '$P!{GR1}' AND '$P!{GR2}' 


********************************** struk nomor kartu bpjs ************************************************

select reg_periksa.no_reg,reg_periksa.no_rawat,reg_periksa.tgl_registrasi,reg_periksa.jam_reg,pasien.no_tlp,
                   reg_periksa.kd_dokter,dokter.nm_dokter,reg_periksa.no_rkm_medis,pasien.nm_pasien,pasien.jk,pasien.umur as umur,poliklinik.nm_poli,
                   reg_periksa.p_jawab,reg_periksa.almt_pj,reg_periksa.hubunganpj,reg_periksa.biaya_reg,reg_periksa.stts_daftar,penjab.png_jawab 
                   from reg_periksa inner join dokter inner join pasien inner join poliklinik inner join penjab 
                   on reg_periksa.kd_dokter=dokter.kd_dokter and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
                   and reg_periksa.kd_pj=penjab.kd_pj and reg_periksa.kd_poli=poliklinik.kd_poli 
                   
                   
select reg_periksa.no_reg,reg_periksa.no_rawat,reg_periksa.tgl_registrasi,reg_periksa.jam_reg,pasien.no_tlp, reg_periksa.kd_dokter,dokter.nm_dokter,reg_periksa.no_rkm_medis,pasien.nm_pasien,pasien.jk,pasien.umur,poliklinik.nm_poli,
reg_periksa.p_jawab,reg_periksa.almt_pj,reg_periksa.hubunganpj,reg_periksa.biaya_reg,
reg_periksa.stts_daftar,penjab.png_jawab,pasien.no_peserta
from reg_periksa inner join dokter inner join pasien inner join poliklinik inner join penjab
on reg_periksa.kd_dokter=dokter.kd_dokter and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and reg_periksa.kd_pj=penjab.kd_pj and reg_periksa.kd_poli=poliklinik.kd_poli




select png_jawab,count(png_jawab)as JmlPx, count(case status_lanjut when 'Ralan' then 1 else null end)as Ralan,count(case status_lanjut when 'Ranap' then 1 else null end)as Ranap,sum(dpp.sisapiutang)as Tanggungan, sum(uangmuka)as Tunai
,sum(if(reg_periksa.status_lanjut='ralan',dpp.sisapiutang+uangmuka,0))as NominalRalan
,sum(if(reg_periksa.status_lanjut='ranap',dpp.sisapiutang+uangmuka,0))as NominalRanap
,sum(dpp.sisapiutang+uangmuka)as Total_ranapNrawat
from reg_periksa 
inner join pasien on reg_periksa.no_rkm_medis = pasien.no_rkm_medis 
inner join penjab on reg_periksa.kd_pj = penjab.kd_pj
inner join piutang_pasien pp on reg_periksa.no_rawat = pp.no_rawat 
inner join detail_piutang_pasien dpp on reg_periksa.no_rawat = dpp.no_rawat 
where reg_periksa.status_lanjut in ('ralan','ranap')

select * from detail_piutang_pasien where no_rawat = '2021/06/12/075588'

select * from reg_periksa rp 

show tables 

describe piutang_pasien 

select * from pasien where id_px=42

use kuntul

select kamar_inap.no_rawat,reg_periksa.no_rkm_medis,pasien.nm_pasien,kamar_inap.tgl_keluar, 
                penjab.png_jawab,kamar_inap.stts_pulang,kamar.kd_kamar, bangsal.nm_bangsal,piutang_pasien.uangmuka,piutang_pasien.totalpiutang 
                from kamar_inap inner join reg_periksa inner join pasien inner join penjab 
                inner join kamar inner join bangsal inner join piutang_pasien 
                on kamar_inap.no_rawat=reg_periksa.no_rawat and reg_periksa.kd_pj=penjab.kd_pj 
                and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
                and kamar_inap.kd_kamar=kamar.kd_kamar and kamar.kd_bangsal=bangsal.kd_bangsal
                and piutang_pasien.no_rawat=reg_periksa.no_rawat
                order by kamar_inap.tgl_keluar,kamar_inap.jam_keluar


select reg_periksa.no_reg,reg_periksa.no_rawat,reg_periksa.tgl_registrasi,reg_periksa.jam_reg,pasien.no_tlp,
                   reg_periksa.kd_dokter,dokter.nm_dokter,reg_periksa.no_rkm_medis,pasien.nm_pasien,pasien.jk,pasien.umur as umur,poliklinik.nm_poli,
                   reg_periksa.p_jawab,reg_periksa.almt_pj,reg_periksa.hubunganpj,reg_periksa.biaya_reg,reg_periksa.stts_daftar,penjab.png_jawab 
                   from reg_periksa inner join dokter inner join pasien inner join poliklinik inner join penjab 
                   on reg_periksa.kd_dokter=dokter.kd_dokter and reg_periksa.no_rkm_medis=pasien.no_rkm_medis
                   and reg_periksa.kd_pj=penjab.kd_pj and reg_periksa.kd_poli=poliklinik.kd_poli 
                
SELECT (@row_number := @row_number + 1) AS No, res.*
FROM
(
select png_jawab,count(png_jawab)as JmlPx, count(case status_lanjut when 'Ralan' then 1 else null end)as Ralan,count(case status_lanjut when 'Ranap' then 1 else null end)as Ranap,sum(dpp.sisapiutang)as Tanggungan, sum(uangmuka)as Tunai
,sum(if(reg_periksa.status_lanjut='ralan',dpp.sisapiutang+uangmuka,0))as NominalRalan
,sum(if(reg_periksa.status_lanjut='ranap',dpp.sisapiutang+uangmuka,0))as NominalRanap
,sum(dpp.sisapiutang+uangmuka)as Total_ranapNrawat
from reg_periksa 
inner join pasien on reg_periksa.no_rkm_medis = pasien.no_rkm_medis 
inner join penjab on reg_periksa.kd_pj = penjab.kd_pj
inner join piutang_pasien pp on reg_periksa.no_rawat = pp.no_rawat 
inner join detail_piutang_pasien dpp on reg_periksa.no_rawat = dpp.no_rawat 
where reg_periksa.status_lanjut in ('ralan','ranap') 
group by png_jawab
) res
CROSS JOIN (SELECT @row_number := 0) AS dummy

SELECT no,temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13 from temporary order by no asc


SELECT tgl_jual,nip,no_rkm_medis,nm_pasien,keterangan,ongkir from penjualan

SELECT * from penjualan



select detailjual.kode_brng,databarang.nama_brng, detailjual.kode_sat,
                 kodesatuan.satuan,detailjual.h_jual, detailjual.jumlah, 
                 detailjual.subtotal, detailjual.dis, detailjual.bsr_dis,detailjual.tambahan,detailjual.total,detailjual.aturan_pakai from 
                 detailjual inner join databarang inner join kodesatuan inner join jenis 
                 on detailjual.kode_brng=databarang.kode_brng and databarang.kdjns=jenis.kdjns 
                 and detailjual.kode_sat=kodesatuan.kode_sat 	
                 
                 
                 
select count(case rp.status_lanjut when 'Ralan' then 1 else null end)as Ralan
,count(case rp.status_lanjut when 'Ranap' then 1 else null end)as Ranap
,sum(if(rp.status_lanjut='ralan',ts.jumlah_tagihan,0))as NominalRalan
,sum(if(rp.status_lanjut='ranap',ts.jumlah_tagihan,0))as NominalRanap
from reg_periksa rp
inner join tagihan_sadewa ts on rp.no_rawat = ts.no_nota 
where rp.status_lanjut in ('ralan','ranap') 

select (select count(*) from reg_periksa rp 
inner join tagihan_sadewa ts on rp.no_rawat = ts.no_nota 
where (rp.status_lanjut ='ralan') and (tgl_bayar between '2021-05-24 13:35:19' and '2021-06-24 19:35:18'))as RalanT
,(select count(*) from reg_periksa rp 
inner join tagihan_sadewa ts on rp.no_rawat = ts.no_nota 
where (rp.status_lanjut ='ranap') and (tgl_bayar between '2021-05-24 13:35:19' and '2021-06-24 19:35:18'))as RanapT
,(select sum(jumlah_tagihan) from reg_periksa rp 
inner join tagihan_sadewa ts on rp.no_rawat = ts.no_nota 
where (rp.status_lanjut ='ralan') and (tgl_bayar between '2021-05-24 13:35:19' and '2021-06-24 19:35:18'))as NominalRalan
,(select sum(jumlah_tagihan) from reg_periksa rp 
inner join tagihan_sadewa ts on rp.no_rawat = ts.no_nota 
where (rp.status_lanjut ='ranap') and (tgl_bayar between '2021-05-24 13:35:19' and '2021-06-24 19:35:18'))as NominalRanap 


select (select count(*) from reg_periksa rp 
inner join tagihan_sadewa ts on rp.no_rawat = ts.no_nota 
where (rp.status_lanjut ='ralan') and (tgl_bayar between '$P!{GR1}' and '$P!{GR2}'))as RalanT
,(select count(*) from reg_periksa rp 
inner join tagihan_sadewa ts on rp.no_rawat = ts.no_nota 
where (rp.status_lanjut ='ranap') and (tgl_bayar between '$P!{GR1}' and '$P!{GR2}'))as RanapT
,(select sum(jumlah_tagihan) from reg_periksa rp 
inner join tagihan_sadewa ts on rp.no_rawat = ts.no_nota 
where (rp.status_lanjut ='ralan') and (tgl_bayar between '$P!{GR1}' and '$P!{GR2}'))as NominalRalan
,(select sum(jumlah_tagihan) from reg_periksa rp 
inner join tagihan_sadewa ts on rp.no_rawat = ts.no_nota 
where (rp.status_lanjut ='ranap') and (tgl_bayar between '$P!{GR1}' and '$P!{GR2}'))as NominalRanap 


show tables

use sik

select * from kamar_inap 

select * from billing b where no_rawat ='2021/05/03/008982'

select * from piutang_pasien where totalpiutang = ''

select * from temporary




select pasien.nm_pasien,rawat_jl_drpr.tarif_tindakanpr,
jns_perawatan.nm_perawatan,reg_periksa.tgl_registrasi,reg_periksa.kd_pj 
from pasien inner join reg_periksa  
inner join jns_perawatan inner join rawat_jl_drpr 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj and rawat_jl_drpr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 


select pasien.nm_pasien,rawat_jl_pr.tarif_tindakanpr,
jns_perawatan.nm_perawatan,reg_periksa.tgl_registrasi,reg_periksa.kd_pj 
from pasien inner join reg_periksa  
inner join jns_perawatan inner join rawat_jl_pr 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj and rawat_jl_pr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 


select rawat_inap_pr.tarif_tindakanpr,pasien.nm_pasien,jns_perawatan_inap.nm_perawatan,
rawat_inap_pr.tgl_perawatan,rawat_inap_pr.jam_rawat,reg_periksa.kd_pj 
from pasien inner join reg_periksa inner join jns_perawatan_inap inner join rawat_inap_pr 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj and rawat_inap_pr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_inap_pr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 


select operasi.biaya_omloop,pasien.nm_pasien,paket_operasi.nm_perawatan,
operasi.tgl_operasi,reg_periksa.kd_pj from operasi inner join reg_periksa inner join pasien inner join paket_operasi 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj and operasi.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and operasi.kode_paket=paket_operasi.kode_paket 




