use validasi


select * from 


where BETWEEN '' and date(now())	


*******************************************************************************

select rawat_inap_dr.no_rawat,reg_periksa.no_rkm_medis,pasien.nm_pasien,concat(rawat_inap_dr.kd_jenis_prw,' ',jns_perawatan_inap.nm_perawatan),rawat_inap_dr.kd_dokter,dokter.nm_dokter,rawat_inap_dr.tgl_perawatan,rawat_inap_dr.jam_rawat,rawat_inap_dr.biaya_rawat,rawat_inap_dr.kd_jenis_prw, rawat_inap_dr.tarif_tindakandr,rawat_inap_dr.kso,rawat_inap_dr.material,rawat_inap_dr.bhp,rawat_inap_dr.menejemen from pasien inner join reg_periksa inner join jns_perawatan_inap inner join dokter inner join rawat_inap_dr on rawat_inap_dr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_inap_dr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw and rawat_inap_dr.kd_dokter=dokter.kd_dokter 
where rawat_inap_dr.no_rawat = '2021/06/21/055858' order by rawat_inap_dr.tgl_perawatan

*****************************seleksi kolom tindakan ranap**************************************************

select rawat_inap_dr.no_rawat,pasien.nm_pasien,
concat(rawat_inap_dr.kd_jenis_prw,' ',jns_perawatan_inap.nm_perawatan),
rawat_inap_dr.tgl_perawatan,rawat_inap_dr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan_inap inner join 
dokter inner join rawat_inap_dr 
on rawat_inap_dr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_inap_dr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 
and rawat_inap_dr.kd_dokter=dokter.kd_dokter 
where rawat_inap_dr.no_rawat = '2021/06/21/055858' 


union all



select rawat_inap_pr.no_rawat,pasien.nm_pasien,
concat(rawat_inap_pr.kd_jenis_prw,' ',jns_perawatan_inap.nm_perawatan),rawat_inap_pr.tgl_perawatan,rawat_inap_pr.biaya_rawatfrom pasien inner join reg_periksa inner join jns_perawatan_inap inner join petugas inner join rawat_inap_pr on rawat_inap_pr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_inap_pr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw and rawat_inap_pr.nip=petugas.nip where rawat_inap_pr.no_rawat = '2021/06/21/055858'

UNION all


select rawat_inap_drpr.no_rawat,pasien.nm_pasien,
concat(rawat_inap_drpr.kd_jenis_prw,' ',jns_perawatan_inap.nm_perawatan),rawat_inap_drpr.tgl_perawatan,rawat_inap_drpr.biaya_rawatfrom pasien inner join reg_periksa inner join jns_perawatan_inap inner join dokter inner join rawat_inap_drpr inner join petugas on rawat_inap_drpr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_inap_drpr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw and rawat_inap_drpr.kd_dokter=dokter.kd_dokter and rawat_inap_drpr.nip=petugas.nip where rawat_inap_drpr.no_rawat = '2021/06/21/055858'

order by tgl_perawatan


select sum(besar_bayar),count(DISTINCT reg_periksa.no_rawat) from detail_nota_jalan inner join reg_periksa on reg_periksa.no_rawat=detail_nota_jalan.no_rawat
where 
reg_periksa.kd_poli=? and reg_periksa.status_lanjut='Ralan' and reg_periksa.no_rawat not in (select piutang_pasien.no_rawat from piutang_pasien where piutang_pasien.no_rawat=reg_periksa.no_rawat) 

and reg_periksa.tgl_registrasi between ? and ? 

cari unit/poli apa??<<<

select * from detail_nota_inap dni 

select * from detail_nota_jalan dnj inner join reg_periksa rp inner join poliklinik p  
on dnj.no_rawat = rp.no_rawat and rp.kd_poli = p.kd_poli 


select *
from detail_piutang_pasien dpp inner join reg_periksa rp inner join poliklinik p  
on dpp.no_rawat = rp.no_rawat and rp.kd_poli = p.kd_poli 

-- *****************************seleksi 5 kolom  tindakan ralan**************************************************

select rawat_jl_dr.no_rawat,pasien.nm_pasien,
concat(rawat_jl_dr.kd_jenis_prw,' ',jns_perawatan.nm_perawatan),rawat_jl_dr.tgl_perawatan,rawat_jl_dr.biaya_rawatfrom pasien inner join reg_periksa inner join jns_perawatan inner join dokter inner join rawat_jl_dr on rawat_jl_dr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_jl_dr.kd_jenis_prw=jns_perawatan.kd_jenis_prw and rawat_jl_dr.kd_dokter=dokter.kd_dokter where rawat_jl_dr.no_rawat = '2021/06/21/055858'
union all

select rawat_jl_pr.no_rawat,pasien.nm_pasien,
concat(rawat_jl_pr.kd_jenis_prw,' ',jns_perawatan.nm_perawatan),rawat_jl_pr.tgl_perawatan,rawat_jl_pr.biaya_rawatfrom pasien inner join reg_periksa inner join jns_perawatan inner join petugas inner join rawat_jl_pr on rawat_jl_pr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw and rawat_jl_pr.nip=petugas.nip where rawat_jl_pr.no_rawat = '2021/06/21/055858'
union all

select rawat_jl_drpr.no_rawat,pasien.nm_pasien,
concat(rawat_jl_drpr.kd_jenis_prw,' ',jns_perawatan.nm_perawatan),rawat_jl_drpr.tgl_perawatan,rawat_jl_drpr.biaya_rawatfrom pasien 
inner join reg_periksa 
inner join jns_perawatan 
inner join dokter 
inner join rawat_jl_drpr 
inner join petugas on rawat_jl_drpr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw and rawat_jl_drpr.kd_dokter=dokter.kd_dokter and rawat_jl_drpr.nip=petugas.nip where rawat_jl_drpr.no_rawat ='2021/06/21/055858' 
-- *****************************seleksi 5 kolom  lab pa dan pk **************************************************

union all

select periksa_lab.no_rawat, pasien.nm_pasien,jns_perawatan_lab.nm_perawatan,periksa_lab.tgl_periksa,periksa_lab.biaya 
from periksa_lab inner join reg_periksa on periksa_lab.no_rawat=reg_periksa.no_rawat 
inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis inner join jns_perawatan_lab on periksa_lab.kd_jenis_prw = jns_perawatan_lab.kd_jenis_prw 
where periksa_lab.no_rawat ='2021/06/21/055858'
union all

-- *****************************seleksi 5 kolom radiologi **************************************************
select periksa_radiologi.no_rawat,pasien.nm_pasien,jpr.nm_perawatan,periksa_radiologi.tgl_periksa,periksa_radiologi.biaya 
from periksa_radiologi 
inner join reg_periksa on periksa_radiologi.no_rawat=reg_periksa.no_rawat inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join jns_perawatan_radiologi jpr on jpr.kd_jenis_prw =periksa_radiologi.kd_jenis_prw where periksa_radiologi.no_rawat ='2021/06/21/055858'

union all
-- *****************************seleksi 5 kolom operasi **************************************************

select operasi.no_rawat, pasien.nm_pasien,paket_operasi.nm_perawatan,left(operasi.tgl_operasi,10),
(operasi.biayaoperator1+operasi.biayaoperator2+operasi.biayaoperator3+
operasi.biayaasisten_operator1+operasi.biayaasisten_operator2+operasi.biayaasisten_operator3+operasi.biayainstrumen+
operasi.biayadokter_anak+operasi.biayaperawaat_resusitas+operasi.biayadokter_anestesi+
operasi.biayaasisten_anestesi+operasi.biayaasisten_anestesi2+operasi.biayabidan+operasi.biayabidan2+operasi.biayabidan3+
operasi.biayaperawat_luar+operasi.biayaalat+operasi.biaya_dokter_pjanak+operasi.biaya_dokter_umum+
operasi.biayasewaok+operasi.akomodasi+operasi.bagian_rs+operasi.biaya_omloop+operasi.biaya_omloop2+operasi.biaya_omloop3+operasi.biaya_omloop4+operasi.biaya_omloop5+operasi.biayasarpras) as total
from operasi 
inner join paket_operasi on operasi.kode_paket=paket_operasi.kode_paket 
inner join reg_periksa on operasi.no_rawat=reg_periksa.no_rawat 
inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
-- where operasi.no_rawat ='2021/06/21/055858'

union all
-- *****************************seleksi 5 kolom obat & BHP **************************************************

select detail_pemberian_obat.no_rawat,pasien.nm_pasien,databarang.nama_brng,detail_pemberian_obat.tgl_perawatan,detail_pemberian_obat.totalfrom detail_pemberian_obat inner join reg_periksa inner join pasien inner join databarang on detail_pemberian_obat.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and detail_pemberian_obat.kode_brng=databarang.kode_brng 
where detail_pemberian_obat.no_rawat ='2021/06/21/055858'
select operasi.no_rawat,pasien.nm_pasien,operasi.jenis_anasthesi,
operasi.tgl_operasi from operasi inner join reg_periksa on operasi.no_rawat=reg_periksa.no_rawat 
inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 


select operasi.operator1, operasi.operator2, operasi.operator3, operasi.asisten_operator1,
operasi.asisten_operator2,operasi.asisten_operator3, operasi.instrumen, operasi.dokter_anak, operasi.perawaat_resusitas, 
operasi.dokter_anestesi, operasi.asisten_anestesi,operasi.asisten_anestesi2, operasi.bidan, operasi.bidan2, operasi.bidan3, operasi.perawat_luar, 
operasi.omloop,operasi.omloop2,operasi.omloop3,operasi.omloop4,operasi.omloop5,operasi.dokter_pjanak,operasi.dokter_umum,
operasi.kode_paket,paket_operasi.nm_perawatan, operasi.biayaoperator1, operasi.biayaoperator2, operasi.biayaoperator3, 
operasi.biayaasisten_operator1, operasi.biayaasisten_operator2,operasi.biayaasisten_operator3, operasi.biayainstrumen, 
operasi.biayadokter_anak, operasi.biayaperawaat_resusitas, operasi.biayadokter_anestesi, 
operasi.biayaasisten_anestesi,operasi.biayaasisten_anestesi2, operasi.biayabidan,operasi.biayabidan2,operasi.biayabidan3, operasi.biayaperawat_luar, operasi.biayaalat,
operasi.biayasewaok,operasi.akomodasi,operasi.bagian_rs,operasi.biaya_omloop,operasi.biaya_omloop2,
operasi.biaya_omloop3,operasi.biaya_omloop4,operasi.biaya_omloop5,operasi.biayasarpras,operasi.biaya_dokter_pjanak,operasi.biaya_dokter_umum,

(operasi.biayaoperator1+operasi.biayaoperator2+operasi.biayaoperator3+
operasi.biayaasisten_operator1+operasi.biayaasisten_operator2+operasi.biayaasisten_operator3+operasi.biayainstrumen+
operasi.biayadokter_anak+operasi.biayaperawaat_resusitas+operasi.biayadokter_anestesi+
operasi.biayaasisten_anestesi+operasi.biayaasisten_anestesi2+operasi.biayabidan+operasi.biayabidan2+operasi.biayabidan3+
operasi.biayaperawat_luar+operasi.biayaalat+operasi.biaya_dokter_pjanak+operasi.biaya_dokter_umum+
operasi.biayasewaok+operasi.akomodasi+operasi.bagian_rs+operasi.biaya_omloop+operasi.biaya_omloop2+operasi.biaya_omloop3+operasi.biaya_omloop4+operasi.biaya_omloop5+operasi.biayasarpras) 

as total 
