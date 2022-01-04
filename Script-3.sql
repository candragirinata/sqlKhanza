
select rekeningtahun.thn,rekening.kd_rek, rekening.nm_rek, rekening.tipe, 
rekening.balance,rekeningtahun.saldo_awal  

select r.*, r1.* from rekening r inner join rekeningtahun r1 on r1.kd_rek=r.kd_rek 

where rekeningtahun.thn=? and rekening.kd_rek like ? or 
rekeningtahun.thn=? and rekening.nm_rek like ? or 
rekeningtahun.thn=? and rekening.tipe like ? or 
rekeningtahun.thn=? and rekening.balance like ? order by rekening.kd_rek

select sum(detailjurnal.debet),sum(detailjurnal.kredit) 

SELECT * from jurnal inner join detailjurnal on detailjurnal.no_jurnal=jurnal.no_jurnal 

update detailjurnal set debet=0


update rekeningtahun set saldo_awal=0

use kadek



select * from reg_periksa rp where tgl_registrasi like '2021-11-24'


SELECT * from rekeningtahun r 


select * from rekeningtahun where saldo_awal like '110000'

select * from detailjurnal 

d where no_jurnal like 'JR20211124000003'

kredit like '110000'


select * from ipsrsdetailbeli

select * from ipsrsbarang

select sum(besar_bayar),count(DISTINCT reg_periksa.no_rawat) 

select * from detail_nota_jalan inner join reg_periksa on reg_periksa.no_rawat=detail_nota_jalan.no_rawat where reg_periksa.status_lanjut='Ralan' and reg_periksa.no_rawat 

not in (select piutang_pasien.no_rawat from piutang_pasien where piutang_pasien.no_rawat=reg_periksa.no_rawat) and reg_periksa.tgl_registrasi between ? and ? 

select kd_poli,nm_poli from poliklinik
