


select * from information_schema.columns where column_name like '%nota%'



select * from temporary_bayar_ranap

where table_name='' and column_name like '%user%'

select * from nota_inap ni where ni.no_nota = '2021/08/13/RI0004'

select * from rawat_inap_dr rid where rid.no_rawat ='2021/06/03/000004'

union all

select * from rawat_inap_drpr rid where rid.no_rawat ='2021/08/13/RI0004'

select * from rawat_inap_pr rid where rid.no_rawat ='2021/08/13/RI0004'

select * from rawat_jl_dr rid where rid.no_rawat ='2021/08/13/RI0004'

select * from rawat_jl_drpr rid where rid.no_rawat ='2021/08/13/RI0004'

select * from rawat_jl_pr rid where rid.no_rawat ='2021/08/13/RI0004'


select kamar_inap.no_rawat,reg_periksa.no_rkm_medis,pasien.nm_pasien,kamar_inap.tgl_keluar, 
penjab.png_jawab,kamar_inap.stts_pulang,kamar.kd_kamar, bangsal.nm_bangsal,piutang_pasien.uangmuka,piutang_pasien.totalpiutang 

select pasien.nm_pasien from kamar_inap inner join reg_periksa inner join pasien inner join penjab 
inner join kamar inner join bangsal inner join piutang_pasien 
on kamar_inap.no_rawat=reg_periksa.no_rawat and reg_periksa.kd_pj=penjab.kd_pj 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and kamar_inap.kd_kamar=kamar.kd_kamar and kamar.kd_bangsal=bangsal.kd_bangsal 
and piutang_pasien.no_rawat=reg_periksa.no_rawat 
where kamar_inap.no_rawat = '2021/06/03/000004'
order by kamar_inap.tgl_keluar,kamar_inap.jam_keluar


where kamar_inap.tgl_keluar between ? and ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? 

select * from rawat_inap_pr rip where no_rawat = '2021/04/01/000003'

select * from piutang_pasien

********************************************************
select * from nota_inap ni inner join  rawat_inap_drpr ridd on ni.no_rawat = ridd.no_rawat
where ni.no_nota ='2021/06/03/RI0001'


select * from nota_inap ni inner join  rawat_inap_dr rid on ni.no_rawat = rid.no_rawat
where ni.no_nota ='2021/06/03/RI0001'


select * from nota_inap ni inner join  rawat_inap_pr rip on ni.no_rawat = rip.no_rawat

where ni.no_nota ='2021/06/03/RI0001'

select * from nota_jalan nj inner join rawat_jl_dr rjd on nj.no_rawat = rjd.no_rawat 
where rjd.no_rawat = '2021/06/03/000004'

where nj.no_nota ='2021/06/03/RI0001'

select * from nota_jalan nj inner join rawat_jl_drpr rjd2 on nj.no_rawat = rjd2.no_rawat
where rjd2.no_rawat = '2021/06/03/000004'

select * from nota_jalan nj inner join rawat_jl_pr rjp on nj.no_rawat = rjp.no_rawat
where rjp.no_rawat = '2021/06/03/000004'

select  from reg_periksa rp inner join rawat_inap_dr rid on rp.no_rawat = rid.no_rawat 

select * from rawat_inap_drpr rid where no_rawat = '2021/06/03/000004'

select * from rawat_inap_dr rid2 where no_rawat = '2021/06/03/000004'

select sum(biaya_rawat) from rawat_inap_pr rip where no_rawat = '2021/06/03/000004'



select piutang_pasien.no_rawat, piutang_pasien.tgl_piutang, concat(piutang_pasien.no_rkm_medis,' ',pasien.nm_pasien), 
piutang_pasien.status,piutang_pasien.totalpiutang, piutang_pasien.uangmuka, piutang_pasien.sisapiutang, piutang_pasien.tgltempo,penjab.png_jawab 

select * from piutang_pasien inner join pasien inner join reg_periksa inner join penjab on  
piutang_pasien.no_rkm_medis=pasien.no_rkm_medis and 
piutang_pasien.no_rawat=reg_periksa.no_rawat and 
reg_periksa.kd_pj=penjab.kd_pj

select * from piutang_pasien


select akun_piutang.nama_bayar,akun_piutang.kd_rek,akun_piutang.kd_pj, 
detail_piutang_pasien.totalpiutang from 
akun_piutang inner join detail_piutang_pasien on akun_piutang.nama_bayar=detail_piutang_pasien.nama_bayar 


use sik

select * from billing where nm_perawatan like '%ida kristina%'

select * from nota inap


no_rawat like '%2021/05/04/%'


where nm_perawatan like '%ida kristina%'




*******************************************************************************************************************************

-- sqlpsralandokter
select jns_perawatan.nm_perawatan,rawat_jl_dr.biaya_rawat as total_byrdr,count(rawat_jl_dr.kd_jenis_prw) as jml, 
sum(rawat_jl_dr.biaya_rawat) as biaya,
sum(rawat_jl_dr.bhp) as totalbhp,
(sum(rawat_jl_dr.material)+sum(rawat_jl_dr.menejemen)+sum(rawat_jl_dr.kso)) as totalmaterial,
rawat_jl_dr.tarif_tindakandr,
sum(rawat_jl_dr.tarif_tindakandr) as totaltarif_tindakandr  


select rawat_jl_dr.* from rawat_jl_dr inner join jns_perawatan inner join kategori_perawatan 
on rawat_jl_dr.kd_jenis_prw=jns_perawatan.kd_jenis_prw and 
jns_perawatan.kd_kategori=kategori_perawatan.kd_kategori 
where no_rawat = '2021/06/30/075577'

where 
rawat_jl_dr.no_rawat=? and kategori_perawatan.kd_kategori=? group by rawat_jl_dr.kd_jenis_prw

-- sqlpsralandrpr
select jns_perawatan.nm_perawatan,rawat_jl_drpr.biaya_rawat as total_byrdr,count(rawat_jl_drpr.kd_jenis_prw) as jml, 
sum(rawat_jl_drpr.biaya_rawat) as biaya,
sum(rawat_jl_drpr.bhp) as totalbhp,
(sum(rawat_jl_drpr.material)+sum(rawat_jl_drpr.menejemen)+sum(rawat_jl_drpr.kso)) as totalmaterial,
rawat_jl_drpr.tarif_tindakandr,
sum(rawat_jl_drpr.tarif_tindakanpr) as totaltarif_tindakanpr,
sum(rawat_jl_drpr.tarif_tindakandr) as totaltarif_tindakandr  

select rawat_jl_drpr.* from rawat_jl_drpr inner join jns_perawatan inner join kategori_perawatan 
on rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw and 
jns_perawatan.kd_kategori=kategori_perawatan.kd_kategori 
where no_rawat = '2021/06/30/075577' 

where 
rawat_jl_drpr.no_rawat=? and kategori_perawatan.kd_kategori=? group by rawat_jl_drpr.kd_jenis_prw

-- sqlpsranapdokter
select jns_perawatan_inap.nm_perawatan,rawat_inap_dr.biaya_rawat as total_byrdr,count(rawat_inap_dr.kd_jenis_prw) as jml, 
sum(rawat_inap_dr.biaya_rawat) as biaya,
sum(rawat_inap_dr.bhp) as totalbhp,
(sum(rawat_inap_dr.material)+sum(rawat_inap_dr.menejemen)+sum(rawat_inap_dr.kso)) as totalmaterial,
rawat_inap_dr.tarif_tindakandr,
sum(rawat_inap_dr.tarif_tindakandr) as totaltarif_tindakandr 

select rawat_inap_dr.* from rawat_inap_dr inner join jns_perawatan_inap inner join kategori_perawatan 
on rawat_inap_dr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw and 
jns_perawatan_inap.kd_kategori=kategori_perawatan.kd_kategori 
where no_rawat = '2021/06/30/075577' 

where 
rawat_inap_dr.no_rawat=? and kategori_perawatan.kd_kategori=? group by rawat_inap_dr.kd_jenis_prw

-- sqlpsranapdrpr
select jns_perawatan_inap.nm_perawatan,rawat_inap_drpr.biaya_rawat as total_byrdr,count(rawat_inap_drpr.kd_jenis_prw) as jml, 
sum(rawat_inap_drpr.biaya_rawat) as biaya,
sum(rawat_inap_drpr.bhp) as totalbhp,
(sum(rawat_inap_drpr.material)+sum(rawat_inap_drpr.menejemen)+sum(rawat_inap_drpr.kso)) as totalmaterial,
rawat_inap_drpr.tarif_tindakandr,
sum(rawat_inap_drpr.tarif_tindakanpr) as totaltarif_tindakanpr, 
sum(rawat_inap_drpr.tarif_tindakandr) as totaltarif_tindakandr

select rawat_inap_drpr.* from rawat_inap_drpr inner join jns_perawatan_inap inner join kategori_perawatan 
on rawat_inap_drpr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw and 
jns_perawatan_inap.kd_kategori=kategori_perawatan.kd_kategori 
where no_rawat = '2021/06/30/075577' 

where 
rawat_inap_drpr.no_rawat=? and kategori_perawatan.kd_kategori=? group by rawat_inap_drpr.kd_jenis_prw

                                           

-- sqlpsralanperawat
select jns_perawatan.nm_perawatan,jns_perawatan.total_byrpr,count(jns_perawatan.nm_perawatan) as jml, 
                                          jns_perawatan.total_byrpr*count(jns_perawatan.nm_perawatan) as biaya 
                                          
                                          select rawat_jl_pr.* from rawat_jl_pr inner join jns_perawatan inner join kategori_perawatan  
                                          on rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw  and 
                                          jns_perawatan.kd_kategori=kategori_perawatan.kd_kategori 
                                          where no_rawat = '2021/06/30/075577' 
                                          
                                          where 
                                          rawat_jl_pr.no_rawat=? and kategori_perawatan.kd_kategori=? group by rawat_jl_pr.kd_jenis_prw

-- sqlpsranapperawat
select jns_perawatan_inap.nm_perawatan,jns_perawatan_inap.total_byrpr,count(jns_perawatan_inap.nm_perawatan) as jml, 
jns_perawatan_inap.total_byrpr*count(jns_perawatan_inap.nm_perawatan) as biaya 

select rawat_inap_pr.* from rawat_inap_pr inner join jns_perawatan_inap  inner join kategori_perawatan 
on rawat_inap_pr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw  and 
jns_perawatan_inap.kd_kategori=kategori_perawatan.kd_kategori 
where no_rawat = '2021/06/30/075577' 

where 
rawat_inap_pr.no_rawat=? and kategori_perawatan.kd_kategori=?  group by rawat_inap_pr.kd_jenis_prw


select material,bhp,tarif_tindakanpr,kso,menejemen,biaya_rawat from rawat_inap_pr where no_rawat = '2021/06/30/075577' 

select material,bhp,tarif_tindakanpr,kso,menejemen,biaya_rawat from rawat_jl_pr


select * from rawat_inap_pr

select * from nota_inap where no_nota = '2021/07/02/RI0002'


************************************** query fix**********************************************

select * from rawat_inap_pr rip inner join nota_inap ni on rip.no_rawat = ni.no_rawat where no_nota = '2021/07/02/RI0002'

select * from rawat_jl_pr


**************************** yang digunakan adalah biaya_rawat ******************************************