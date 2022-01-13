-- *****************************seleksi kolom tindakan ranap**************************************************

select rawat_inap_dr.no_rawat,pasien.nm_pasien,jns_perawatan_inap.nm_perawatan,
rawat_inap_dr.tgl_perawatan,rawat_inap_dr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan_inap inner join 
dokter inner join rawat_inap_dr 
on rawat_inap_dr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_inap_dr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 
and rawat_inap_dr.kd_dokter=dokter.kd_dokter 
where rawat_inap_dr.no_rawat = '2022/01/05/045887' 

union all

select rawat_inap_pr.no_rawat,pasien.nm_pasien,jns_perawatan_inap.nm_perawatan,rawat_inap_pr.tgl_perawatan,rawat_inap_pr.biaya_rawatfrom pasien inner join reg_periksa inner join jns_perawatan_inap inner join petugas inner join rawat_inap_pr on rawat_inap_pr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_inap_pr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw and rawat_inap_pr.nip=petugas.nip where rawat_inap_pr.no_rawat = '2022/01/05/045887'

union all

select rawat_inap_drpr.no_rawat,pasien.nm_pasien,jns_perawatan_inap.nm_perawatan,rawat_inap_drpr.tgl_perawatan,rawat_inap_drpr.biaya_rawatfrom pasien inner join reg_periksa inner join jns_perawatan_inap inner join dokter inner join rawat_inap_drpr inner join petugas on rawat_inap_drpr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_inap_drpr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw and rawat_inap_drpr.kd_dokter=dokter.kd_dokter and rawat_inap_drpr.nip=petugas.nip where rawat_inap_drpr.no_rawat = '2022/01/05/045887'
-- *****************************seleksi 5 kolom  tindakan ralan**************************************************
union all
select rawat_jl_dr.no_rawat,pasien.nm_pasien,jns_perawatan.nm_perawatan,rawat_jl_dr.tgl_perawatan,rawat_jl_dr.biaya_rawatfrom pasien inner join reg_periksa inner join jns_perawatan inner join dokter inner join rawat_jl_dr on rawat_jl_dr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_jl_dr.kd_jenis_prw=jns_perawatan.kd_jenis_prw and rawat_jl_dr.kd_dokter=dokter.kd_dokter where rawat_jl_dr.no_rawat = '2022/01/05/045887'
union all

select rawat_jl_pr.no_rawat,pasien.nm_pasien,jns_perawatan.nm_perawatan,rawat_jl_pr.tgl_perawatan,rawat_jl_pr.biaya_rawatfrom pasien inner join reg_periksa inner join jns_perawatan inner join petugas inner join rawat_jl_pr on rawat_jl_pr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw and rawat_jl_pr.nip=petugas.nip where rawat_jl_pr.no_rawat = '2022/01/05/045887'
union all

select rawat_jl_drpr.no_rawat,pasien.nm_pasien,jns_perawatan.nm_perawatan,rawat_jl_drpr.tgl_perawatan,rawat_jl_drpr.biaya_rawatfrom pasien 
inner join reg_periksa 
inner join jns_perawatan 
inner join dokter 
inner join rawat_jl_drpr 
inner join petugas on rawat_jl_drpr.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw and rawat_jl_drpr.kd_dokter=dokter.kd_dokter and rawat_jl_drpr.nip=petugas.nip where rawat_jl_drpr.no_rawat ='2022/01/05/045887' 
-- *****************************seleksi 5 kolom  lab pa dan pk **************************************************

union all

select periksa_lab.no_rawat, pasien.nm_pasien,jns_perawatan_lab.nm_perawatan,periksa_lab.tgl_periksa,periksa_lab.biaya 
from periksa_lab inner join reg_periksa on periksa_lab.no_rawat=reg_periksa.no_rawat 
inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis inner join jns_perawatan_lab on periksa_lab.kd_jenis_prw = jns_perawatan_lab.kd_jenis_prw 
where periksa_lab.no_rawat ='2022/01/05/045887'
union all

-- *****************************seleksi 5 kolom radiologi **************************************************
select periksa_radiologi.no_rawat,pasien.nm_pasien,jpr.nm_perawatan,periksa_radiologi.tgl_periksa,periksa_radiologi.biaya 
from periksa_radiologi 
inner join reg_periksa on periksa_radiologi.no_rawat=reg_periksa.no_rawat inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join jns_perawatan_radiologi jpr on jpr.kd_jenis_prw =periksa_radiologi.kd_jenis_prw where periksa_radiologi.no_rawat ='2022/01/05/045887'

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
where operasi.no_rawat ='2022/01/05/045887'

union all
-- *****************************seleksi 5 kolom obat & BHP **************************************************

select detail_pemberian_obat.no_rawat,pasien.nm_pasien,
databarang.nama_brng,detail_pemberian_obat.tgl_perawatan,detail_pemberian_obat.totalfrom detail_pemberian_obat inner join reg_periksa inner join pasien inner join databarang on detail_pemberian_obat.no_rawat=reg_periksa.no_rawat and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and detail_pemberian_obat.kode_brng=databarang.kode_brng where detail_pemberian_obat.no_rawat ='2022/01/05/045887'
union all
-- *****************************reistrasi**************************************************

select rp.no_rawat ,p.nm_pasien,'Biaya Registrasi',rp.tgl_registrasi,rp.biaya_reg from reg_periksa rp inner join pasien p on rp.no_rkm_medis = p.no_rkm_medis where rp.no_rawat = '2022/01/05/045887'

union all
-- ********************************************************************************** kamar*****************************************
select kamar_inap.no_rawat,'ssssssss',concat ('(',bangsal.nm_bangsal,') * ',kamar_inap.lama)as nama_perawatan,kamar_inap.tgl_masuk,kamar_inap.ttl_biaya as total
from kamar_inap inner join bangsal inner join kamar on kamar_inap.kd_kamar=kamar.kd_kamar 
and kamar.kd_bangsal=bangsal.kd_bangsal
where kamar_inap.no_rawat='2022/01/05/045887'


order by tgl_perawatan

-- **********************************************************************************nama kamar*****************************************
-- select reg_periksa.no_rkm_medis,concat(DATE_FORMAT(reg_periksa.tgl_registrasi, '%e %M %Y'),' ',reg_periksa.jam_reg) as registrasi,kamar_inap.kd_kamar,concat(if(kamar_inap.tgl_keluar='0000-00-00',DATE_FORMAT(CURDATE(), '%e %M %Y'),DATE_FORMAT(kamar_inap.tgl_keluar, '%e %M %Y')),' ',kamar_inap.jam_keluar) as keluar,  
-- (select sum(kamar_inap.lama) from kamar_inap where kamar_inap.no_rawat=reg_periksa.no_rawat ) as lama,reg_periksa.biaya_reg,reg_periksa.umurdaftar,reg_periksa.sttsumur,reg_periksa.tgl_registrasi -- from reg_periksa inner join kamar_inap on reg_periksa.no_rawat=kamar_inap.no_rawat where reg_periksa.no_rawat = '2021/06/21/055858'-- 



-- **********************************************************************************pembayaran CASH*****************************************
select no_nota,tgl_bayar,nama_pasien,jumlah_bayar,petugas from tagihan_sadewa where no_nota ='2021/07/20/788879'

select no_rawat from detail_piutang_pasien