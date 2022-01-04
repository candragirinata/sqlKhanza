select concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam)as tes, detail_periksa_lab.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,detail_periksa_lab.id_template,template_laboratorium.Pemeriksaan,
periksa_lab.kd_dokter,dokter.nm_dokter,periksa_lab.nip,
petugas.nama,periksa_lab.dokter_perujuk,penjab.png_jawab,perujuk.nm_dokter as perujuk,
detail_periksa_lab.tgl_periksa,detail_periksa_lab.jam,
if(periksa_lab.status='Ralan',(select nm_poli from poliklinik where poliklinik.kd_poli=reg_periksa.kd_poli),
(select bangsal.nm_bangsal from kamar_inap inner join kamar inner join bangsal on kamar_inap.kd_kamar=kamar.kd_kamar 
and kamar.kd_bangsal=bangsal.kd_bangsal where kamar_inap.no_rawat=periksa_lab.no_rawat limit 1 )) as ruangan,
detail_periksa_lab.bagian_rs,detail_periksa_lab.bhp,detail_periksa_lab.bagian_perujuk,
detail_periksa_lab.bagian_dokter,detail_periksa_lab.bagian_laborat,
detail_periksa_lab.kso,detail_periksa_lab.menejemen,
detail_periksa_lab.biaya_item from detail_periksa_lab 
inner join reg_periksa inner join pasien inner join template_laboratorium 
inner join jns_perawatan_lab inner join periksa_lab 
inner join dokter inner join petugas inner join penjab inner join dokter as perujuk 
on detail_periksa_lab.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and periksa_lab.no_rawat=detail_periksa_lab.no_rawat 
and periksa_lab.kd_jenis_prw=detail_periksa_lab.kd_jenis_prw and perujuk.kd_dokter=periksa_lab.dokter_perujuk 
and reg_periksa.kd_pj=penjab.kd_pj and periksa_lab.kd_dokter=dokter.kd_dokter 
and periksa_lab.nip=petugas.nip and periksa_lab.tgl_periksa=detail_periksa_lab.tgl_periksa 
and periksa_lab.jam=detail_periksa_lab.jam and detail_periksa_lab.id_template=template_laboratorium.id_template 
and jns_perawatan_lab.kd_jenis_prw=detail_periksa_lab.kd_jenis_prw 
where concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between '2020-01-01 20:20:38' and '2021-04-05 20:20:38' order by detail_periksa_lab.tgl_periksa




select detail_periksa_lab.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,detail_periksa_lab.id_template,template_laboratorium.Pemeriksaan,
periksa_lab.kd_dokter,dokter.nm_dokter,periksa_lab.nip,
petugas.nama,periksa_lab.dokter_perujuk,penjab.png_jawab,perujuk.nm_dokter as perujuk,
detail_periksa_lab.tgl_periksa,detail_periksa_lab.jam,
if(periksa_lab.status='Ralan',(select nm_poli from poliklinik where poliklinik.kd_poli=reg_periksa.kd_poli),
(select bangsal.nm_bangsal from kamar_inap inner join kamar inner join bangsal on kamar_inap.kd_kamar=kamar.kd_kamar 
and kamar.kd_bangsal=bangsal.kd_bangsal where kamar_inap.no_rawat=periksa_lab.no_rawat limit 1 )) as ruangan,
detail_periksa_lab.bagian_rs,detail_periksa_lab.bhp,detail_periksa_lab.bagian_perujuk,
detail_periksa_lab.bagian_dokter,detail_periksa_lab.bagian_laborat,
detail_periksa_lab.kso,detail_periksa_lab.menejemen,
detail_periksa_lab.biaya_item from detail_periksa_lab 
inner join reg_periksa inner join pasien inner join template_laboratorium 
inner join jns_perawatan_lab inner join periksa_lab 
inner join dokter inner join petugas inner join penjab inner join dokter as perujuk 
on detail_periksa_lab.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and periksa_lab.no_rawat=detail_periksa_lab.no_rawat 
and periksa_lab.kd_jenis_prw=detail_periksa_lab.kd_jenis_prw and perujuk.kd_dokter=periksa_lab.dokter_perujuk 
and reg_periksa.kd_pj=penjab.kd_pj and periksa_lab.kd_dokter=dokter.kd_dokter 
and periksa_lab.nip=petugas.nip and periksa_lab.tgl_periksa=detail_periksa_lab.tgl_periksa 
and periksa_lab.jam=detail_periksa_lab.jam and detail_periksa_lab.id_template=template_laboratorium.id_template 
and jns_perawatan_lab.kd_jenis_prw=detail_periksa_lab.kd_jenis_prw 
where concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and detail_periksa_lab.no_rawat like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and reg_periksa.no_rkm_medis like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and pasien.nm_pasien like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and detail_periksa_lab.kd_jenis_prw like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and jns_perawatan_lab.nm_perawatan like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and periksa_lab.kd_dokter like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and dokter.nm_dokter like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and periksa_lab.nip like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and petugas.nama like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and periksa_lab.dokter_perujuk like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and perujuk.nm_dokter like ? or 
concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam) between ? and ? and concat(periksa_lab.dokter_perujuk,perujuk.nm_dokter) like ? and concat(periksa_lab.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and penjab.png_jawab like ? 
 order by detail_periksa_lab.tgl_periksa
 
/* detail pemeriksaan */
 select concat(detail_periksa_lab.tgl_periksa,' ',detail_periksa_lab.jam)as tes, detail_periksa_lab.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,detail_periksa_lab.id_template,template_laboratorium.Pemeriksaan,
periksa_lab.kd_dokter,dokter.nm_dokter,periksa_lab.nip,
petugas.nama,periksa_lab.dokter_perujuk,penjab.png_jawab,perujuk.nm_dokter as perujuk,
detail_periksa_lab.tgl_periksa,detail_periksa_lab.jam,
if(periksa_lab.status='Ralan',(select nm_poli from poliklinik where poliklinik.kd_poli=reg_periksa.kd_poli),
(select bangsal.nm_bangsal from kamar_inap inner join kamar inner join bangsal on kamar_inap.kd_kamar=kamar.kd_kamar 
and kamar.kd_bangsal=bangsal.kd_bangsal where kamar_inap.no_rawat=periksa_lab.no_rawat limit 1 )) as ruangan,
detail_periksa_lab.bagian_rs,detail_periksa_lab.bhp,detail_periksa_lab.bagian_perujuk,
detail_periksa_lab.bagian_dokter,detail_periksa_lab.bagian_laborat,
detail_periksa_lab.kso,detail_periksa_lab.menejemen,
detail_periksa_lab.biaya_item from detail_periksa_lab 
inner join reg_periksa inner join pasien inner join template_laboratorium 
inner join jns_perawatan_lab inner join periksa_lab 
inner join dokter inner join petugas inner join penjab inner join dokter as perujuk 
on detail_periksa_lab.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and periksa_lab.no_rawat=detail_periksa_lab.no_rawat 
and periksa_lab.kd_jenis_prw=detail_periksa_lab.kd_jenis_prw and perujuk.kd_dokter=periksa_lab.dokter_perujuk 
and reg_periksa.kd_pj=penjab.kd_pj and periksa_lab.kd_dokter=dokter.kd_dokter 
and periksa_lab.nip=petugas.nip and periksa_lab.tgl_periksa=detail_periksa_lab.tgl_periksa 
and periksa_lab.jam=detail_periksa_lab.jam and detail_periksa_lab.id_template=template_laboratorium.id_template 
and jns_perawatan_lab.kd_jenis_prw=detail_periksa_lab.kd_jenis_prw 


/*  ralan dok */
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
where rawat_jl_dr.no_rawat='2021/07/30/000001'

where concat(rawat_jl_dr.tgl_perawatan,' ',rawat_jl_dr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_dr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and rawat_jl_dr.no_rawat like ? or 
concat(rawat_jl_dr.tgl_perawatan,' ',rawat_jl_dr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_dr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and reg_periksa.no_rkm_medis like ? or 
concat(rawat_jl_dr.tgl_perawatan,' ',rawat_jl_dr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_dr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and pasien.nm_pasien like ? or 
concat(rawat_jl_dr.tgl_perawatan,' ',rawat_jl_dr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_dr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and jns_perawatan.nm_perawatan like ? or 
concat(rawat_jl_dr.tgl_perawatan,' ',rawat_jl_dr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_dr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and rawat_jl_dr.kd_dokter like ? or 
concat(rawat_jl_dr.tgl_perawatan,' ',rawat_jl_dr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_dr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and dokter.nm_dokter like ? or 
concat(rawat_jl_dr.tgl_perawatan,' ',rawat_jl_dr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_dr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and penjab.png_jawab like ? or 
concat(rawat_jl_dr.tgl_perawatan,' ',rawat_jl_dr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_dr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and poliklinik.nm_poli like ? 
 order by rawat_jl_dr.no_rawat desc
 
 /*  ralan PRMDS */
select rawat_jl_pr.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,rawat_jl_pr.kd_jenis_prw,jns_perawatan.nm_perawatan,
rawat_jl_pr.nip,petugas.nama,rawat_jl_pr.tgl_perawatan,
rawat_jl_pr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_pr.material,rawat_jl_pr.bhp,rawat_jl_pr.tarif_tindakanpr,
rawat_jl_pr.kso,rawat_jl_pr.menejemen,rawat_jl_pr.biaya_rawat 
from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join rawat_jl_pr on rawat_jl_pr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan on rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
inner join petugas on rawat_jl_pr.nip=petugas.nip 
inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj
where rawat_jl_pr.no_rawat ='2021/07/30/000001'



where concat(rawat_jl_pr.tgl_perawatan,' ',rawat_jl_pr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_pr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and rawat_jl_pr.no_rawat like ? or 
concat(rawat_jl_pr.tgl_perawatan,' ',rawat_jl_pr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_pr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and reg_periksa.no_rkm_medis like ? or 
concat(rawat_jl_pr.tgl_perawatan,' ',rawat_jl_pr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_pr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and pasien.nm_pasien like ? or 
concat(rawat_jl_pr.tgl_perawatan,' ',rawat_jl_pr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_pr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and jns_perawatan.nm_perawatan like ? or 
concat(rawat_jl_pr.tgl_perawatan,' ',rawat_jl_pr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_pr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and rawat_jl_pr.nip like ? or 
concat(rawat_jl_pr.tgl_perawatan,' ',rawat_jl_pr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_pr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and petugas.nama like ? or 
concat(rawat_jl_pr.tgl_perawatan,' ',rawat_jl_pr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_pr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and penjab.png_jawab like ? or 
concat(rawat_jl_pr.tgl_perawatan,' ',rawat_jl_pr.jam_rawat) between ? and ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_pr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and poliklinik.nm_poli like ? 
 order by rawat_jl_pr.no_rawat desc
 
/*  ralan PRMDS & dok */
 select rawat_jl_drpr.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,rawat_jl_drpr.kd_jenis_prw,jns_perawatan.nm_perawatan,
rawat_jl_drpr.kd_dokter,dokter.nm_dokter,rawat_jl_drpr.nip,petugas.nama,rawat_jl_drpr.tgl_perawatan,
rawat_jl_drpr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_drpr.material,rawat_jl_drpr.bhp,rawat_jl_drpr.tarif_tindakandr,rawat_jl_drpr.tarif_tindakanpr,
rawat_jl_drpr.kso,rawat_jl_drpr.menejemen,rawat_jl_drpr.biaya_rawat 
from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join rawat_jl_drpr on rawat_jl_drpr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan on rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
inner join dokter on rawat_jl_drpr.kd_dokter=dokter.kd_dokter 
inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj 
inner join petugas on rawat_jl_drpr.nip=petugas.nip
where rawat_jl_drpr.no_rawat='2021/07/30/000001'


where concat(rawat_jl_drpr.tgl_perawatan,' ',rawat_jl_drpr.jam_rawat) between ? and ? and concat(rawat_jl_drpr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_drpr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and rawat_jl_drpr.no_rawat like ? or 
concat(rawat_jl_drpr.tgl_perawatan,' ',rawat_jl_drpr.jam_rawat) between ? and ? and concat(rawat_jl_drpr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_drpr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and reg_periksa.no_rkm_medis like ? or 
concat(rawat_jl_drpr.tgl_perawatan,' ',rawat_jl_drpr.jam_rawat) between ? and ? and concat(rawat_jl_drpr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_drpr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and pasien.nm_pasien like ? or 
concat(rawat_jl_drpr.tgl_perawatan,' ',rawat_jl_drpr.jam_rawat) between ? and ? and concat(rawat_jl_drpr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_drpr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and jns_perawatan.nm_perawatan like ? or 
concat(rawat_jl_drpr.tgl_perawatan,' ',rawat_jl_drpr.jam_rawat) between ? and ? and concat(rawat_jl_drpr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_drpr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and rawat_jl_drpr.kd_dokter like ? or 
concat(rawat_jl_drpr.tgl_perawatan,' ',rawat_jl_drpr.jam_rawat) between ? and ? and concat(rawat_jl_drpr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_drpr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and dokter.nm_dokter like ? or 
concat(rawat_jl_drpr.tgl_perawatan,' ',rawat_jl_drpr.jam_rawat) between ? and ? and concat(rawat_jl_drpr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_drpr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and rawat_jl_drpr.nip like ? or 
concat(rawat_jl_drpr.tgl_perawatan,' ',rawat_jl_drpr.jam_rawat) between ? and ? and concat(rawat_jl_drpr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_drpr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and petugas.nama like ? or 
concat(rawat_jl_drpr.tgl_perawatan,' ',rawat_jl_drpr.jam_rawat) between ? and ? and concat(rawat_jl_drpr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_drpr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and penjab.png_jawab like ? or 
concat(rawat_jl_drpr.tgl_perawatan,' ',rawat_jl_drpr.jam_rawat) between ? and ? and concat(rawat_jl_drpr.kd_dokter,dokter.nm_dokter) like ? and concat(reg_periksa.kd_poli,poliklinik.nm_poli) like ? and concat(rawat_jl_drpr.nip,petugas.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and poliklinik.nm_poli like ? 
 order by rawat_jl_drpr.no_rawat desc
 
 
 /* operasi*/
select operasi.no_rawat,reg_periksa.no_rkm_medis,pasien.nm_pasien, 
operasi.kode_paket,paket_operasi.nm_perawatan,operasi.tgl_operasi, 
penjab.png_jawab,if(operasi.status='Ralan',(select nm_poli from poliklinik where poliklinik.kd_poli=reg_periksa.kd_poli),
(select bangsal.nm_bangsal from kamar_inap inner join kamar inner join bangsal on kamar_inap.kd_kamar=kamar.kd_kamar 
and kamar.kd_bangsal=bangsal.kd_bangsal where kamar_inap.no_rawat=operasi.no_rawat limit 1 )) as ruangan,
operator1.nm_dokter as operator1,operasi.biayaoperator1, 
operator2.nm_dokter as operator2,operasi.biayaoperator2, 
operator3.nm_dokter as operator3,operasi.biayaoperator3,
asisten_operator1.nama as asisten_operator1,operasi.biayaasisten_operator1, 
asisten_operator2.nama as asisten_operator2,operasi.biayaasisten_operator2, 
asisten_operator3.nama as asisten_operator3,operasi.biayaasisten_operator3, 
instrumen.nama as instrumen,operasi.biayainstrumen, 
dokter_anak.nm_dokter as dokter_anak,operasi.biayadokter_anak, 
perawaat_resusitas.nama as perawaat_resusitas,operasi.biayaperawaat_resusitas, 
dokter_anestesi.nm_dokter as dokter_anestesi,operasi.biayadokter_anestesi, 
asisten_anestesi.nama as asisten_anestesi,operasi.biayaasisten_anestesi, 
(select nama from petugas where petugas.nip=operasi.asisten_anestesi2) as asisten_anestesi2,operasi.biayaasisten_anestesi2, 
bidan.nama as bidan,operasi.biayabidan, 
(select nama from petugas where petugas.nip=operasi.bidan2) as bidan2,operasi.biayabidan2, 
(select nama from petugas where petugas.nip=operasi.bidan3) as bidan3,operasi.biayabidan3, 
(select nama from petugas where petugas.nip=operasi.perawat_luar) as perawat_luar,operasi.biayaperawat_luar, 
(select nama from petugas where petugas.nip=operasi.omloop) as omloop,operasi.biaya_omloop, 
(select nama from petugas where petugas.nip=operasi.omloop2) as omloop2,operasi.biaya_omloop2, 
(select nama from petugas where petugas.nip=operasi.omloop3) as omloop3,operasi.biaya_omloop3, 
(select nama from petugas where petugas.nip=operasi.omloop4) as omloop4,operasi.biaya_omloop4, 
(select nama from petugas where petugas.nip=operasi.omloop5) as omloop5,operasi.biaya_omloop5, 
(select nm_dokter from dokter where dokter.kd_dokter=operasi.dokter_pjanak) as dokter_pjanak,operasi.biaya_dokter_pjanak, 
(select nm_dokter from dokter where dokter.kd_dokter=operasi.dokter_umum) as dokter_umum,operasi.biaya_dokter_umum, 
operasi.biayaalat,operasi.biayasewaok,operasi.akomodasi,operasi.bagian_rs,operasi.biayasarpras 
from operasi inner join reg_periksa on operasi.no_rawat=reg_periksa.no_rawat 
inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join paket_operasi on operasi.kode_paket=paket_operasi.kode_paket 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj 
inner join dokter as operator1 on operator1.kd_dokter=operasi.operator1 
inner join dokter as operator2 on operator2.kd_dokter=operasi.operator2 
inner join dokter as operator3 on operator3.kd_dokter=operasi.operator3 
inner join dokter as dokter_anak on dokter_anak.kd_dokter=operasi.dokter_anak 
inner join dokter as dokter_anestesi on dokter_anestesi.kd_dokter=operasi.dokter_anestesi 
inner join petugas as asisten_operator1 on asisten_operator1.nip=operasi.asisten_operator1 
inner join petugas as asisten_operator2 on asisten_operator2.nip=operasi.asisten_operator2 
inner join petugas as asisten_operator3 on asisten_operator3.nip=operasi.asisten_operator3 
inner join petugas as asisten_anestesi on asisten_anestesi.nip=operasi.asisten_anestesi 
inner join petugas as bidan on bidan.nip=operasi.bidan 
inner join petugas as instrumen on instrumen.nip=operasi.instrumen 
inner join petugas as perawaat_resusitas on perawaat_resusitas.nip=operasi.perawaat_resusitas 
where operasi.no_rawat ='2021/07/30/000001'

where operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and operasi.no_rawat like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and reg_periksa.no_rkm_medis like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and pasien.nm_pasien like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and operasi.kode_paket like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and paket_operasi.nm_perawatan like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and penjab.png_jawab like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and operator1.nm_dokter like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and operator2.nm_dokter like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and operator3.nm_dokter like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and dokter_anak.nm_dokter like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and asisten_operator1.nama like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and asisten_operator2.nama like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and asisten_operator3.nama like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and instrumen.nama like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and perawaat_resusitas.nama like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and asisten_anestesi.nama like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and bidan.nama like ? or 
operasi.tgl_operasi between ? and ? and concat(operasi.operator1,operator1.nm_dokter) like ? and concat(operasi.asisten_operator1,asisten_operator1.nama) like ? and concat(reg_periksa.kd_pj,penjab.png_jawab) like ? and dokter_anestesi.nm_dokter like ? 
order by operasi.no_rawat desc



use realbutnotlive



select rawat_jl_dr.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,rawat_jl_dr.kd_jenis_prw,jns_perawatan.nm_perawatan,
rawat_jl_dr.kd_dokter,dokter.nm_dokter,rawat_jl_dr.tgl_perawatan,
rawat_jl_dr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_dr.material,rawat_jl_dr.bhp,rawat_jl_dr.tarif_tindakandr,
rawat_jl_dr.kso,rawat_jl_dr.menejemen,rawat_jl_dr.biaya_rawat,
rawat_jl_pr.nip,petugas.nama,rawat_jl_pr.tgl_perawatan,
rawat_jl_pr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_pr.material,rawat_jl_pr.bhp,rawat_jl_pr.tarif_tindakanpr,
rawat_jl_pr.kso,rawat_jl_pr.menejemen,rawat_jl_pr.biaya_rawat,
rawat_jl_drpr.kd_dokter,dokter.nm_dokter,rawat_jl_drpr.nip,petugas.nama,rawat_jl_drpr.tgl_perawatan,
rawat_jl_drpr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_drpr.material,rawat_jl_drpr.bhp,rawat_jl_drpr.tarif_tindakandr,rawat_jl_drpr.tarif_tindakanpr,
rawat_jl_drpr.kso,rawat_jl_drpr.menejemen,rawat_jl_drpr.biaya_rawat 


from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join rawat_jl_dr on reg_periksa.no_rawat=rawat_jl_dr.no_rawat 
inner join dokter on rawat_jl_dr.kd_dokter=dokter.kd_dokter 
inner join jns_perawatan on rawat_jl_dr.kd_jenis_prw=jns_perawatan.kd_jenis_prw
inner join rawat_jl_pr on rawat_jl_pr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan on rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
inner join petugas on rawat_jl_pr.nip=petugas.nip 


inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj 
where rawat_jl_dr.no_rawat='2021/07/30/000001'

************************************************************
select rawat_jl_pr.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,rawat_jl_pr.kd_jenis_prw,jns_perawatan.nm_perawatan,


rawat_jl_pr.nip,petugas.nama,rawat_jl_pr.tgl_perawatan,
rawat_jl_pr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_pr.material,rawat_jl_pr.bhp,rawat_jl_pr.tarif_tindakanpr,
rawat_jl_pr.kso,rawat_jl_pr.menejemen,rawat_jl_pr.biaya_rawat 
from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 

inner join rawat_jl_pr on rawat_jl_pr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan on rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
inner join petugas on rawat_jl_pr.nip=petugas.nip 

inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj
where rawat_jl_pr.no_rawat ='2021/07/30/000001'


***********************************************************************************
 select rawat_jl_drpr.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,rawat_jl_drpr.kd_jenis_prw,jns_perawatan.nm_perawatan,

rawat_jl_drpr.kd_dokter,dokter.nm_dokter,rawat_jl_drpr.nip,petugas.nama,rawat_jl_drpr.tgl_perawatan,
rawat_jl_drpr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_drpr.material,rawat_jl_drpr.bhp,rawat_jl_drpr.tarif_tindakandr,rawat_jl_drpr.tarif_tindakanpr,
rawat_jl_drpr.kso,rawat_jl_drpr.menejemen,rawat_jl_drpr.biaya_rawat 
from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join rawat_jl_drpr on rawat_jl_drpr.no_rawat=reg_periksa.no_rawat 
inner join jns_perawatan on rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
inner join dokter on rawat_jl_drpr.kd_dokter=dokter.kd_dokter 
inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj 
inner join petugas on rawat_jl_drpr.nip=petugas.nip
where rawat_jl_drpr.no_rawat='2021/07/30/000001'

*****************************************************************************************

select rawat_jl_dr.no_rawat,reg_periksa.no_rkm_medis,
pasien.nm_pasien,jns_perawatan.nm_perawatan,
dokter.nm_dokter,rawat_jl_dr.tgl_perawatan,
rawat_jl_dr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_dr.material,rawat_jl_dr.bhp,rawat_jl_dr.tarif_tindakandr,
rawat_jl_dr.kso,rawat_jl_dr.menejemen,rawat_jl_dr.biaya_rawat,
rawat_jl_pr.nip,petugas.nama,rawat_jl_pr.tgl_perawatan,
rawat_jl_pr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_pr.material,rawat_jl_pr.bhp,rawat_jl_pr.tarif_tindakanpr,
rawat_jl_pr.kso,rawat_jl_pr.menejemen,rawat_jl_pr.biaya_rawat,
rawat_jl_drpr.kd_dokter,dokter.nm_dokter,rawat_jl_drpr.nip,petugas.nama,rawat_jl_drpr.tgl_perawatan,
rawat_jl_drpr.jam_rawat,penjab.png_jawab,poliklinik.nm_poli, 
rawat_jl_drpr.material,rawat_jl_drpr.bhp,rawat_jl_drpr.tarif_tindakandr,rawat_jl_drpr.tarif_tindakanpr,
rawat_jl_drpr.kso,rawat_jl_drpr.menejemen,rawat_jl_drpr.biaya_rawat 
from pasien inner join reg_periksa on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join rawat_jl_dr on reg_periksa.no_rawat=rawat_jl_dr.no_rawat 
inner join dokter on rawat_jl_dr.kd_dokter=dokter.kd_dokter 
inner join jns_perawatan on rawat_jl_dr.kd_jenis_prw=jns_perawatan.kd_jenis_prw
inner join rawat_jl_pr on rawat_jl_pr.no_rawat=reg_periksa.no_rawat 
inner join rawat_jl_drpr on rawat_jl_drpr.no_rawat=reg_periksa.no_rawat 
inner join petugas on rawat_jl_pr.nip=petugas.nip 
inner join poliklinik on reg_periksa.kd_poli=poliklinik.kd_poli 
inner join penjab on reg_periksa.kd_pj=penjab.kd_pj 
where rawat_jl_dr.no_rawat='2021/07/30/000001'


inner join jns_perawatan on rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
