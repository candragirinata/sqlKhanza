
**********************************************ralan**************************************************************
select * from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join rawat_jl_dr on reg_periksa.no_rawat=rawat_jl_dr.no_rawat 
inner join dokter on rawat_jl_dr.kd_dokter=dokter.kd_dokter 
inner join jns_perawatan JP1 on rawat_jl_dr.kd_jenis_prw=jP1.kd_jenis_prw 
inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join penjab P1 on reg_periksa.kd_pj=P1.kd_pj 
inner join rawat_jl_pr on rawat_jl_pr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan JP2 on rawat_jl_pr.kd_jenis_prw=JP2.kd_jenis_prw 
inner join petugas on rawat_jl_pr.nip=petugas.nip
inner join penjab P2 on reg_periksa.kd_pj=P2.kd_pj 
inner join rawat_jl_drpr on rawat_jl_drpr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan on rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
inner join dokter D1 on rawat_jl_drpr.kd_dokter=D1.kd_dokter 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj 
inner join petugas PT1 on rawat_jl_drpr.nip=PT1.nip 


**********************************************ranap**************************************************************
select * from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join rawat_inap_dr on rawat_inap_dr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan_inap on rawat_inap_dr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 
inner join dokter on rawat_inap_dr.kd_dokter=dokter.kd_dokter 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj
inner join rawat_inap_pr on rawat_inap_pr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan_inap jpi on rawat_inap_pr.kd_jenis_prw=jpi.kd_jenis_prw 
inner join petugas on rawat_inap_pr.nip=petugas.nip
inner join rawat_inap_drpr on rawat_inap_drpr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan_inap jpi1 on rawat_inap_drpr.kd_jenis_prw=jpi1.kd_jenis_prw 
inner join dokter dk1 on rawat_inap_drpr.kd_dokter=dk1.kd_dokter 
inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join petugas pt1 on rawat_inap_drpr.nip=pt1.nip 

****************************************RANAP &RALAN***********************************************************

select * from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join rawat_jl_dr on reg_periksa.no_rawat=rawat_jl_dr.no_rawat 
inner join dokter on rawat_jl_dr.kd_dokter=dokter.kd_dokter 
inner join jns_perawatan JP1 on rawat_jl_dr.kd_jenis_prw=jP1.kd_jenis_prw 
inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join rawat_jl_pr on rawat_jl_pr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan JP2 on rawat_jl_pr.kd_jenis_prw=JP2.kd_jenis_prw 
inner join petugas on rawat_jl_pr.nip=petugas.nip
inner join rawat_jl_drpr on rawat_jl_drpr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan on rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
inner join dokter D1 on rawat_jl_drpr.kd_dokter=D1.kd_dokter 
inner join petugas PT1 on rawat_jl_drpr.nip=PT1.nip 
inner join rawat_inap_dr on rawat_inap_dr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan_inap on rawat_inap_dr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 
inner join dokter D2 on rawat_inap_dr.kd_dokter=D2.kd_dokter 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj
inner join rawat_inap_pr on rawat_inap_pr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan_inap jpi on rawat_inap_pr.kd_jenis_prw=jpi.kd_jenis_prw 
inner join petugas PT2 on rawat_inap_pr.nip=PT2.nip
inner join rawat_inap_drpr on rawat_inap_drpr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan_inap jpi1 on rawat_inap_drpr.kd_jenis_prw=jpi1.kd_jenis_prw 
inner join dokter dk1 on rawat_inap_drpr.kd_dokter=dk1.kd_dokter 
inner join petugas PT3 on rawat_inap_drpr.nip=PT3.nip 

*****************

use sik


select rawat_jl_dr.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,rawat_jl_dr.kd_jenis_prw,jns_perawatan.nm_perawatan,
rawat_jl_dr.kd_dokter,dokter.nm_dokter,rawat_jl_dr.tgl_perawatan,
rawat_jl_dr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_dr.material,rawat_jl_dr.bhp,rawat_jl_dr.tarif_tindakandr,
rawat_jl_dr.kso,rawat_jl_dr.menejemen,rawat_jl_dr.biaya_rawat

from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join rawat_jl_dr on reg_periksa.no_rawat=rawat_jl_dr.no_rawat 
inner join dokter on rawat_jl_dr.kd_dokter=dokter.kd_dokter 
inner join jns_perawatan on rawat_jl_dr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj 

union all

select rawat_jl_pr.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,rawat_jl_pr.kd_jenis_prw,jns_perawatan.nm_perawatan,
rawat_jl_pr.nip,petugas.nama,rawat_jl_pr.tgl_perawatan,
rawat_jl_pr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_pr.material,rawat_jl_pr.bhp,rawat_jl_pr.tarif_tindakanpr,
rawat_jl_pr.kso,rawat_jl_pr.menejemen,rawat_jl_pr.biaya_rawat 

from pasien inner join reg_periksa on pasien.no_rkm_medis = reg_periksa.no_rkm_medis
inner join rawat_jl_pr on rawat_jl_pr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan on rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
inner join petugas on rawat_jl_pr.nip=petugas.nip 
inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj 
order by no_rawat 


union all

select rawat_jl_drpr.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,rawat_jl_drpr.kd_jenis_prw,jns_perawatan.nm_perawatan,
rawat_jl_drpr.kd_dokter,dokter.nm_dokter,rawat_jl_drpr.nip,petugas.nama,rawat_jl_drpr.tgl_perawatan,
rawat_jl_drpr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_drpr.material,rawat_jl_drpr.bhp,rawat_jl_drpr.tarif_tindakandr,rawat_jl_drpr.tarif_tindakanpr

from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join rawat_jl_drpr on rawat_jl_drpr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan on rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
inner join dokter on rawat_jl_drpr.kd_dokter=dokter.kd_dokter 
inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj 
inner join petugas on rawat_jl_drpr.nip=petugas.nip 
order by no_rkm_medis 

,rawat_jl_drpr.tarif_tindakanpr,
rawat_jl_drpr.kso,rawat_jl_drpr.menejemen,rawat_jl_drpr.biaya_rawat 
where pasien.no_rkm_medis is null or reg_periksa.no_rkm_medis is null 



select kamar_inap.no_rawat,reg_periksa.no_rkm_medis,pasien.nm_pasien,kamar_inap.tgl_keluar, penjab.png_jawab,kamar_inap.stts_pulang,kamar.kd_kamar, bangsal.nm_bangsal,piutang_pasien.uangmuka,piutang_pasien.totalpiutang from kamar_inap inner join reg_periksa inner join pasien inner join penjab inner join kamar inner join bangsal inner join piutang_pasien on kamar_inap.no_rawat=reg_periksa.no_rawat and reg_periksa.kd_pj=penjab.kd_pj and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and kamar_inap.kd_kamar=kamar.kd_kamar and kamar.kd_bangsal=bangsal.kd_bangsal and piutang_pasien.no_rawat=reg_periksa.no_rawatorder by kamar_inap.tgl_keluar,kamar_inap.jam_keluar


use rsbj


select * from rawat_inap_dr rid 

select * from

select * from dokter

billing

select * from temporary_tambahan_potongan ttp 

select * from inacbg_grouping_stage1 igs 



select kamar_inap.kd_kamar,bangsal.nm_bangsal,kamar_inap.trf_kamar,kamar_inap.lama,kamar_inap.ttl_biaya as total,kamar_inap.tgl_masuk, kamar_inap.jam_masuk,if(kamar_inap.tgl_keluar='0000-00-00',current_date(),kamar_inap.tgl_keluar) as tgl_keluar,if(kamar_inap.jam_keluar='00:00:00',current_time(),kamar_inap.jam_keluar) as jam_keluar from kamar_inap inner join bangsal inner join kamar on kamar_inap.kd_kamar=kamar.kd_kamar and kamar.kd_bangsal=bangsal.kd_bangsal where kamar_inap.no_rawat=? order by kamar_inap.tgl_masuk,kamar_inap.kd_kamar




select * from rawat_inap_dr inner join dokter on rawat_inap_dr.kd_dokter=dokter.kd_dokter 
