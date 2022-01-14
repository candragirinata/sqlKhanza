<?php
include '../conf/conf.php';
//  if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')   
//         $url = "https://";   
//    else  
//         $url = "http://";   
//    // Append the host(domain name, ip) to the URL.   
//    $url.= $_SERVER['HTTP_HOST'];   
//    
//    // Append the requested resource location to the URL   
//    $url.= $_SERVER['REQUEST_URI'];    
//      
////    echo $url;          
//?>
<html>

    <head>
        <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
        <style>
            .tab {
                display: inline-block;
                margin-left: 40px;
            }</style>
    </head>

    <body bgcolor='#ffffff'>
        <script type="text/javascript">
            window.onload = function () {
                window.print();
            }
        </script>
   

        <?php
//        reportsqlinjection();
        $petugas = str_replace("_", " ", $_GET['petugas']);
        $tanggal = str_replace("_", " ", $_GET['tanggal']);
        $norawat = str_replace("_", " ", $_GET['nrwt']);
        $tanggalkeluar = substr($tanggal, 0, 11);
        $nonota = str_replace(": ", "", getOne("select temp2 from temporary_bayar_ranap where temp1='No.Nota'"));
        $noRM = str_replace(": ", "", getOne("select temp2 from temporary_bayar_ranap where temp1='No.R.M.'"));
//        $norawat = getOne("select no_rawat from nota_inap where no_nota='$nonota'");

//var_dump($rwt);

 
//        $norawat = getOne("select ?no_rawat from reg_periksa rp inner join pasien p  on rp.no_rkm_medis = p.no_rkm_medis where rp.no_rkm_medis ='$noRM'  ORDER BY rp.no_rawat DESC LIMIT 1");
        $kodecarabayar = getOne("select kd_pj from reg_periksa where no_rawat='$norawat'");
        $carabayar = getOne("select png_jawab from penjab where kd_pj='$kodecarabayar'");
        $namapx = getOne("select p.nm_pasien from reg_periksa rp inner join pasien p on rp.no_rkm_medis=p.no_rkm_medis where no_rawat = '$norawat'");
        $nopx = getOne("select p.no_peserta from reg_periksa rp inner join pasien p on rp.no_rkm_medis=p.no_rkm_medis where no_rawat = '$norawat'");
        $alamat = getOne("select p.alamat from reg_periksa rp inner join pasien p on rp.no_rkm_medis=p.no_rkm_medis where no_rawat = '$norawat'");
        $tanggalmasuk = getOne("select date_format(rp.tgl_registrasi,'%d-%m-%Y')as tglMasuk from reg_periksa rp where rp.no_rawat='$norawat'");
        $biayaRegistrasi = getOne("select rp.biaya_reg from reg_periksa rp where rp.no_rawat = '$norawat'");
        $TglbiayaRegistrasi = getOne("select rp.tgl_registrasi from reg_periksa rp where rp.no_rawat = '$norawat'");

        $_sql = "
select rawat_inap_dr.no_rawat,pasien.nm_pasien,jns_perawatan_inap.nm_perawatan,
rawat_inap_dr.tgl_perawatan,rawat_inap_dr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan_inap inner join 
dokter inner join rawat_inap_dr 
on rawat_inap_dr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_inap_dr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 
and rawat_inap_dr.kd_dokter=dokter.kd_dokter 
where rawat_inap_dr.no_rawat = '$norawat' 

union all

select rawat_inap_pr.no_rawat,pasien.nm_pasien,jns_perawatan_inap.nm_perawatan,
rawat_inap_pr.tgl_perawatan,rawat_inap_pr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan_inap inner join 
petugas inner join rawat_inap_pr 
on rawat_inap_pr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_inap_pr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 
and rawat_inap_pr.nip=petugas.nip 
where rawat_inap_pr.no_rawat = '$norawat'

union all

select rawat_inap_drpr.no_rawat,pasien.nm_pasien,jns_perawatan_inap.nm_perawatan,
rawat_inap_drpr.tgl_perawatan,rawat_inap_drpr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan_inap inner join 
dokter inner join rawat_inap_drpr inner join petugas on rawat_inap_drpr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_inap_drpr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 
and rawat_inap_drpr.kd_dokter=dokter.kd_dokter and rawat_inap_drpr.nip=petugas.nip 
where rawat_inap_drpr.no_rawat = '$norawat'

order by tgl_perawatan
";

        $_sql_kamar = "select concat ('(',bangsal.nm_bangsal,') * ',
kamar_inap.lama)as nama_perawatan,kamar_inap.tgl_masuk,kamar_inap.ttl_biaya as total
from kamar_inap 
inner join bangsal inner join kamar 
on kamar_inap.kd_kamar=kamar.kd_kamar 
and kamar.kd_bangsal=bangsal.kd_bangsal
where kamar_inap.no_rawat='$norawat' order by tgl_masuk";

        $_sql_rajal = "select rawat_jl_dr.no_rawat,pasien.nm_pasien,jns_perawatan.nm_perawatan,
rawat_jl_dr.tgl_perawatan,rawat_jl_dr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan inner join 
dokter inner join rawat_jl_dr 
on rawat_jl_dr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_jl_dr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
and rawat_jl_dr.kd_dokter=dokter.kd_dokter 
where rawat_jl_dr.no_rawat = '$norawat'

union all

select rawat_jl_pr.no_rawat,pasien.nm_pasien,jns_perawatan.nm_perawatan,
rawat_jl_pr.tgl_perawatan,rawat_jl_pr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan inner join 
petugas inner join rawat_jl_pr 
on rawat_jl_pr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
and rawat_jl_pr.nip=petugas.nip 
where rawat_jl_pr.no_rawat = '$norawat'

union all

select rawat_jl_drpr.no_rawat,pasien.nm_pasien,jns_perawatan.nm_perawatan,
rawat_jl_drpr.tgl_perawatan,rawat_jl_drpr.biaya_rawat
from pasien 
inner join reg_periksa 
inner join jns_perawatan 
inner join dokter 
inner join rawat_jl_drpr 
inner join petugas on rawat_jl_drpr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
and rawat_jl_drpr.kd_dokter=dokter.kd_dokter and rawat_jl_drpr.nip=petugas.nip 
where rawat_jl_drpr.no_rawat ='$norawat' order by tgl_perawatan ";

        $_sql_lab = "select periksa_lab.no_rawat, pasien.nm_pasien,jns_perawatan_lab.nm_perawatan,periksa_lab.tgl_periksa,periksa_lab.biaya 
from periksa_lab 
inner join reg_periksa on periksa_lab.no_rawat=reg_periksa.no_rawat 
inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join jns_perawatan_lab on periksa_lab.kd_jenis_prw = jns_perawatan_lab.kd_jenis_prw 
where periksa_lab.no_rawat ='$norawat'
order by tgl_periksa";

        $_sql_rad = "select periksa_radiologi.no_rawat,pasien.nm_pasien,jpr.nm_perawatan,periksa_radiologi.tgl_periksa,periksa_radiologi.biaya 
from periksa_radiologi 
inner join reg_periksa on periksa_radiologi.no_rawat=reg_periksa.no_rawat 
inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join jns_perawatan_radiologi jpr on jpr.kd_jenis_prw =periksa_radiologi.kd_jenis_prw 
where periksa_radiologi.no_rawat ='$norawat' order by tgl_periksa";

        $_sql_obatbhp = "select detail_pemberian_obat.no_rawat,pasien.nm_pasien,
databarang.nama_brng,detail_pemberian_obat.tgl_perawatan,detail_pemberian_obat.total
from detail_pemberian_obat inner join reg_periksa inner join pasien inner join databarang 
on detail_pemberian_obat.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and detail_pemberian_obat.kode_brng=databarang.kode_brng 
where detail_pemberian_obat.no_rawat ='$norawat' order by tgl_perawatan";

        $_sql_operasi = "select operasi.no_rawat, pasien.nm_pasien,paket_operasi.nm_perawatan,left(operasi.tgl_operasi,10),
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
where operasi.no_rawat ='$norawat' order by tgl_operasi";

        $hasil = bukaquery($_sql);
//        var_dump($hasil);
        if (mysqli_num_rows($hasil) >= 0) {
            $setting = mysqli_fetch_array(bukaquery("select nama_instansi,alamat_instansi,kabupaten,propinsi,kontak,email,logo from setting"));
            echo "   
            <table width='" . getOne("select nota1ranap from set_nota") . "' bgcolor='#ffffff' align='left' border='0' padding='0' cellspacing='0' cellpadding='0'>
            <tr class='isi12' padding='0'>
            <td colspan='7' padding='0'>
                   <table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                        <tr>
                            <td  width='20%'>
				<img width='45' height='45' src='data:image/jpeg;base64," . base64_encode($setting['logo']) . "'/>
			    </td>
			    <td>
				<center>
				    <font color='000000' size='3'  face='Tahoma'>" . $setting["nama_instansi"] . "</font><br>
				    <font color='000000' size='1'  face='Tahoma'>
					" . $setting["alamat_instansi"] . ", " . $setting["kabupaten"] . ", " . $setting["propinsi"] . "<br/>
					" . $setting["kontak"] . ", E-mail : " . $setting["email"] . "
                                    </font> 
				</center>
			    </td>
			    <td  width='20%'><font color='000000' size='2'  face='Tahoma'>$carabayar</font></td>
                        </tr>
                  </table>
            </td>
            </tr>
            <tr>
              <td colspan='7' padding='0'>
               <hr/>
               <center><font color='333333' size='1'  face='Tahoma'>BILLING</font> </center>
               <hr/>
               
               
               </td>
               </tr>
               ";
            $z = 1;



            echo "<tr>
               
               <td colspan='6' padding='0'><font color='111111' size='1'  face='Tahoma'>No. Nota  &nbsp;&emsp;&emsp;
               : $nonota</td>   
               
               </tr>";
            echo "
               <td colspan='6' padding='0'><font color='111111' size='1'  face='Tahoma'>No.Rawat &emsp;&emsp;
               : $norawat</td>           
               
               </tr>   ";
            echo "<tr class='isi12' padding='0'>
               
               <td colspan='6' padding='0'><font color='111111' size='1'  face='Tahoma'>Nama Pasien &ensp;
               : $namapx</td>   
               
               </tr> ";
            echo "
               
               <td colspan='6' padding='0'><font color='111111' size='1'  face='Tahoma'>No Peserta &emsp;&ensp;
               : $nopx</td>   
               
               </tr> ";
            echo "
                  
               <td colspan='6' padding='0'><font color='111111' size='1'  face='Tahoma'>Tanggal Masuk&nbsp;: $tanggalmasuk</td>   
               
               </tr> ";
            echo "
               
               <td colspan='6' padding='0'><font color='111111' size='1'  face='Tahoma'>Tanggal Keluar&nbsp;: $tanggalkeluar</td>   
               
               </tr> ";
            echo "
               
               <td colspan='6' padding='0'><font color='111111' size='1'  face='Tahoma'>Alamat    &ensp;&emsp;&emsp;&emsp;: $alamat</td>   
               
               </tr>";

            // MULAI BILLING TAGIHAN

            $ranap = bukaquery($_sql); //sdh
            $kamar = bukaquery($_sql_kamar); //sdh
            $rajal = bukaquery($_sql_rajal);
            $lab = bukaquery($_sql_lab);
            $rad = bukaquery($_sql_rad);
            $obatbhp = bukaquery($_sql_obatbhp);
            $operasi = bukaquery($_sql_operasi);


            //  *************************************************************************************************registrasi**********************************************************************************
            echo "
               <tr>
                 <td colspan='7' padding='0'>
                  <hr/>
                   <left><font color='333333' size='1'  face='Tahoma'>Registrasi : </font> </left>
                   <hr/>
                 </td>
               </tr>";
            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
               <tr class='isi12' padding='0'>
                            <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                            <td padding='0'><font color='111111' size='1'  face='Tahoma'>Tanggal<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Total Biaya<hr/></td>
                            
                           </tr></table>";

            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                            <tr class='isi12' padding='0'>
                                   <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                                   <td padding='0' width='52%'><font color='111111' size='1'  face='Tahoma'>$TglbiayaRegistrasi</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . number_format($biayaRegistrasi) . "</td> 

                                 </tr>
                                 </table>";


            //  *************************************************************************************************kamar**********************************************************************************
            echo "
               <tr>
                 <td colspan='7' padding='0'>
                  <hr/>
                   <left><font color='333333' size='1'  face='Tahoma'>Kamar : </font> </left>
                   <hr/>
                 </td>
               </tr>";
            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
               <tr class='isi12' padding='0'>
                            <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                            <td padding='0'><font color='111111' size='1'  face='Tahoma'>Tanggal<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Nama Perawatan<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Total Biaya<hr/></td>
                            
                           </tr></table>";
            while ($kamarf = mysqli_fetch_array($kamar)) {

                echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                            <tr class='isi12' padding='0'>
                                   <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                                   <td padding='0' ><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $kamarf[1]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $kamarf[0]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . number_format(str_replace("  ", "&nbsp;&nbsp;", $kamarf[2])) . "</td> 
                                 </tr>
                                 </table>";
            }
            //  *************************************************************************************************rajal**********************************************************************************
            echo "
               <tr>
                 <td colspan='7' padding='0'>
                  <hr/>
                   <left><font color='333333' size='1'  face='Tahoma'>Rawat Jalan : </font> </left>
                   <hr/>
                 </td>
               </tr>";
            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
               <tr class='isi12' padding='0'>
                            <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                            <td padding='0'><font color='111111' size='1'  face='Tahoma'>Tanggal<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Nama Perawatan<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Total Biaya<hr/></td>
                            
                           </tr></table>";
            while ($rajalf = mysqli_fetch_array($rajal)) {

                echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                            <tr class='isi12' padding='0'>
                                   <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                                   <td padding='0' ><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $rajalf[3]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $rajalf[2]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . number_format(str_replace("  ", "&nbsp;&nbsp;", $rajalf[4])) . "</td> 
                                 </tr>
                                 </table>";
            }
            //  *************************************************************************************************ranap**********************************************************************************
            echo "
              <tr>
                <td colspan='7' padding='0'>
                 <hr/>
                  <left><font color='333333' size='1'  face='Tahoma'>Rawat Inap : </font> </left>
                  <hr/>
                </td>
              </tr>";
            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
              <tr class='isi12' padding='0'>
                           <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                           <td padding='0'><font color='111111' size='1'  face='Tahoma'>Tanggal<hr/></td> 
                           <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Nama Perawatan<hr/></td> 
                           <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Total Biaya<hr/></td>
                           
                          </tr></table>";
            while ($ranapf = mysqli_fetch_array($ranap)) {

                echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                           <tr class='isi12' padding='0'>
                                  <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                                  <td padding='0' ><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $ranapf[3]) . "</td> 
                                  <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $ranapf[2]) . "</td> 
                                  <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . number_format(str_replace("  ", "&nbsp;&nbsp;", $ranapf[4])) . "</td> 
                                </tr>
                                </table>";
            }

            //  *************************************************************************************************lab**********************************************************************************
            echo "
               <tr>
                 <td colspan='7' padding='0'>
                  <hr/>
                   <left><font color='333333' size='1'  face='Tahoma'>Pemeriksaan Lab : </font> </left>
                   <hr/>
                 </td>
               </tr>";
            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
               <tr class='isi12' padding='0'>
                            <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                            <td padding='0'><font color='111111' size='1'  face='Tahoma'>Tanggal<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Nama Perawatan<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Total Biaya<hr/></td>
                            
                           </tr></table>";
            while ($labf = mysqli_fetch_array($lab)) {

                echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                            <tr class='isi12' padding='0'>
                                   <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                                   <td padding='0' ><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $labf[3]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $labf[2]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . number_format(str_replace("  ", "&nbsp;&nbsp;", $labf[4])) . "</td> 
                                 </tr>
                                 </table>";
            }
            //  *************************************************************************************************rad**********************************************************************************
            echo "
               <tr>
                 <td colspan='7' padding='0'>
                  <hr/>
                   <left><font color='333333' size='1'  face='Tahoma'>Pemeriksaan Radiologi : </font> </left>
                   <hr/>
                 </td>
               </tr>";
            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
               <tr class='isi12' padding='0'>
                            <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                            <td padding='0'><font color='111111' size='1'  face='Tahoma'>Tanggal<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Nama Perawatan<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Total Biaya<hr/></td>
                            
                           </tr></table>";
            while ($radf = mysqli_fetch_array($rad)) {

                echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                            <tr class='isi12' padding='0'>
                                   <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                                   <td padding='0' ><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $radf[3]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $radf[2]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . number_format(str_replace("  ", "&nbsp;&nbsp;", $radf[4])) . "</td> 
                                 </tr>
                                 </table>";
            }
            //  *************************************************************************************************operasi**********************************************************************************
            echo "
               <tr>
                 <td colspan='7' padding='0'>
                  <hr/>
                   <left><font color='333333' size='1'  face='Tahoma'>Operasi: </font> </left>
                   <hr/>
                 </td>
               </tr>";
            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
               <tr class='isi12' padding='0'>
                            <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                            <td padding='0'><font color='111111' size='1'  face='Tahoma'>Tanggal<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Nama Perawatan<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Total Biaya<hr/></td>
                            
                           </tr></table>";
            while ($operasif = mysqli_fetch_array($operasi)) {

                echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                            <tr class='isi12' padding='0'>
                                   <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                                   <td padding='0' ><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $operasif[3]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $operasif[2]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . number_format(str_replace("  ", "&nbsp;&nbsp;", $operasif[4])) . "</td> 
                                 </tr>
                                 </table>";
            }
            //  *************************************************************************************************obat**********************************************************************************
            echo "
               <tr>
                 <td colspan='7' padding='0'>
                  <hr/>
                   <left><font color='333333' size='1'  face='Tahoma'>Obat & BHP: </font> </left>
                   <hr/>
                 </td>
               </tr>";
            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
               <tr class='isi12' padding='0'>
                            <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                            <td padding='0'><font color='111111' size='1'  face='Tahoma'>Tanggal<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Nama Perawatan<hr/></td> 
                            <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>Total Biaya<hr/></td>
                            
                           </tr></table>";
            while ($obatbhpf = mysqli_fetch_array($obatbhp)) {

                echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                            <tr class='isi12' padding='0'>
                                   <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&ensp;</td> 
                                   <td padding='0' ><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $obatbhpf[3]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $obatbhpf[2]) . "</td> 
                                   <td padding='0' width='40%'><font color='111111' size='1'  face='Tahoma'>" . number_format(str_replace("  ", "&nbsp;&nbsp;", $obatbhpf[4])) . "</td> 
                                 </tr>
                                 </table>";
            }
//  *************************************************************************************************IKS& TOTAL PEMBAYARAN**********************************************************************************

            $cekBayar = getOne("select count(no_rawat) from reg_periksa rp where no_rawat='$norawat' and status_bayar ='Belum Bayar'");
            $uangmuka = getOne("select ifnull(sum(besar_deposit),0) from deposit where no_rawat='$norawat'");
            $perkiraanTagihan = getOne("select sum(biaya_rawat)as jumlah from(
-- *****************************seleksi kolom tindakan ranap**************************************************

select rawat_inap_dr.no_rawat,pasien.nm_pasien,jns_perawatan_inap.nm_perawatan,
rawat_inap_dr.tgl_perawatan,rawat_inap_dr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan_inap inner join 
dokter inner join rawat_inap_dr 
on rawat_inap_dr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_inap_dr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 
and rawat_inap_dr.kd_dokter=dokter.kd_dokter 
where rawat_inap_dr.no_rawat = '$norawat' 

union all

select rawat_inap_pr.no_rawat,pasien.nm_pasien,jns_perawatan_inap.nm_perawatan,
rawat_inap_pr.tgl_perawatan,rawat_inap_pr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan_inap inner join 
petugas inner join rawat_inap_pr 
on rawat_inap_pr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_inap_pr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 
and rawat_inap_pr.nip=petugas.nip 
where rawat_inap_pr.no_rawat = '$norawat'

union all

select rawat_inap_drpr.no_rawat,pasien.nm_pasien,jns_perawatan_inap.nm_perawatan,
rawat_inap_drpr.tgl_perawatan,rawat_inap_drpr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan_inap inner join 
dokter inner join rawat_inap_drpr inner join petugas on rawat_inap_drpr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_inap_drpr.kd_jenis_prw=jns_perawatan_inap.kd_jenis_prw 
and rawat_inap_drpr.kd_dokter=dokter.kd_dokter and rawat_inap_drpr.nip=petugas.nip 
where rawat_inap_drpr.no_rawat = '$norawat'
-- *****************************seleksi 5 kolom  tindakan ralan**************************************************
union all
select rawat_jl_dr.no_rawat,pasien.nm_pasien,jns_perawatan.nm_perawatan,
rawat_jl_dr.tgl_perawatan,rawat_jl_dr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan inner join 
dokter inner join rawat_jl_dr 
on rawat_jl_dr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_jl_dr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
and rawat_jl_dr.kd_dokter=dokter.kd_dokter 
where rawat_jl_dr.no_rawat = '$norawat'

union all

select rawat_jl_pr.no_rawat,pasien.nm_pasien,jns_perawatan.nm_perawatan,
rawat_jl_pr.tgl_perawatan,rawat_jl_pr.biaya_rawat
from pasien inner join reg_periksa inner join jns_perawatan inner join 
petugas inner join rawat_jl_pr 
on rawat_jl_pr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and rawat_jl_pr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
and rawat_jl_pr.nip=petugas.nip 
where rawat_jl_pr.no_rawat = '$norawat'

union all

select rawat_jl_drpr.no_rawat,pasien.nm_pasien,jns_perawatan.nm_perawatan,
rawat_jl_drpr.tgl_perawatan,rawat_jl_drpr.biaya_rawat
from pasien 
inner join reg_periksa 
inner join jns_perawatan 
inner join dokter 
inner join rawat_jl_drpr 
inner join petugas on rawat_jl_drpr.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis and rawat_jl_drpr.kd_jenis_prw=jns_perawatan.kd_jenis_prw 
and rawat_jl_drpr.kd_dokter=dokter.kd_dokter and rawat_jl_drpr.nip=petugas.nip 
where rawat_jl_drpr.no_rawat ='$norawat'
 
-- *****************************seleksi 5 kolom  lab pa dan pk **************************************************

union all

select periksa_lab.no_rawat, pasien.nm_pasien,jns_perawatan_lab.nm_perawatan,periksa_lab.tgl_periksa,periksa_lab.biaya 
from periksa_lab 
inner join reg_periksa on periksa_lab.no_rawat=reg_periksa.no_rawat 
inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join jns_perawatan_lab on periksa_lab.kd_jenis_prw = jns_perawatan_lab.kd_jenis_prw 
where periksa_lab.no_rawat ='$norawat'

union all

-- *****************************seleksi 5 kolom radiologi **************************************************
select periksa_radiologi.no_rawat,pasien.nm_pasien,jpr.nm_perawatan,periksa_radiologi.tgl_periksa,periksa_radiologi.biaya 
from periksa_radiologi 
inner join reg_periksa on periksa_radiologi.no_rawat=reg_periksa.no_rawat 
inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
inner join jns_perawatan_radiologi jpr on jpr.kd_jenis_prw =periksa_radiologi.kd_jenis_prw 
where periksa_radiologi.no_rawat ='$norawat'

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
where operasi.no_rawat ='$norawat'


union all
-- *****************************seleksi 5 kolom obat & BHP **************************************************

select detail_pemberian_obat.no_rawat,pasien.nm_pasien,
databarang.nama_brng,detail_pemberian_obat.tgl_perawatan,detail_pemberian_obat.total
from detail_pemberian_obat inner join reg_periksa inner join pasien inner join databarang 
on detail_pemberian_obat.no_rawat=reg_periksa.no_rawat 
and reg_periksa.no_rkm_medis=pasien.no_rkm_medis 
and detail_pemberian_obat.kode_brng=databarang.kode_brng 
where detail_pemberian_obat.no_rawat ='$norawat'

union all
-- *****************************reistrasi**************************************************

select rp.no_rawat ,p.nm_pasien,'Biaya Registrasi',rp.tgl_registrasi,rp.biaya_reg from reg_periksa rp inner join pasien p on rp.no_rkm_medis = p.no_rkm_medis where rp.no_rawat = '$norawat'

union all
-- ********************************************************************************** kamar*****************************************

select kamar_inap.no_rawat,'ssssssss',concat ('(',bangsal.nm_bangsal,') * ',
kamar_inap.lama)as nama_perawatan,kamar_inap.tgl_masuk,kamar_inap.ttl_biaya as total
from kamar_inap 
inner join bangsal inner join kamar 
on kamar_inap.kd_kamar=kamar.kd_kamar 
and kamar.kd_bangsal=bangsal.kd_bangsal
where kamar_inap.no_rawat='$norawat'


order by tgl_perawatan
) as gr");
            if ($cekBayar == 1) {
                echo "<tr>
              <td colspan='7' padding='0'>
               <hr/>
                <center><font color='333333' size='1'  face='Tahoma'>--------------------------Perkiraan Tagihan-----------------------------</font> </center>
                <hr/>
              </td>
            </tr>";


                echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                        <tr class='isi12' padding='0'>
                                <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&nbsp;&nbsp;</td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Total Tagihan </td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Rp. " . number_format($perkiraanTagihan) . "</td> 
                        </tr>
                        <tr class='isi12' padding='0'>
                                <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&nbsp;&nbsp;</td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Uang Muka</td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Rp. " . number_format($uangmuka) . "</td>
                        </tr>
                        </table>
                        <table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                        <tr>***********************************************************************</tr>
                        <tr class='isi12' padding='0'>
                                <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&nbsp;&nbsp;</td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Sisa Tagihan </td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Rp. " . number_format($perkiraanTagihan - $uangmuka) . "</td> 
                        </tr>
                              </table>";
            } else {

                $_sql1 = "select * from detail_piutang_pasien where no_rawat = '$norawat'";
                $hasil1 = bukaquery($_sql1);
                $_sql_CASH = "select no_nota,tgl_bayar,nama_pasien,jumlah_bayar,petugas from tagihan_sadewa where no_nota ='$norawat'";
                $totalCASHbayar = bukaquery($_sql_CASH);

                echo "<tr>
              <td colspan='7' padding='0'>
               <hr/>
                <center><font color='333333' size='1'  face='Tahoma'>--------------------------Total Tagihan-----------------------------</font> </center>
                <hr/>
              </td>
            </tr>";

                $sw = getOne("select count(no_rawat) from detail_piutang_pasien where no_rawat='$norawat'");
                switch ($sw) {
                    case "0":
                        while ($cashf = mysqli_fetch_array($totalCASHbayar)) {
//                            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
//                         <tr class='isi12' padding='0'>
//                                <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&nbsp;&nbsp;</td> 
//                                <td padding='0'><font color='111111' size='3'  face='Tahoma'>UMUM</td> 
//                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Rp. " . number_format($cashf[3]) . "</td> 
//                              </tr>
//                              </table>";

                            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                        <tr class='isi12' padding='0'>
                                <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&nbsp;&nbsp;</td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Total Tagihan </td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Rp. " . number_format($perkiraanTagihan) . "</td> 
                        </tr>
                        <tr class='isi12' padding='0'>
                                <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&nbsp;&nbsp;</td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Uang Muka</td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Rp. " . number_format($uangmuka) . "</td>
                        </tr>
                        </table>
                        <table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                        <tr>***********************************************************************</tr>
                        <tr class='isi12' padding='0'>
                                <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&nbsp;&nbsp;</td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Sisa Tagihan </td> 
                                <td padding='0' width='40%' align='left'><font color='111111' size='3'  face='Tahoma'>Rp. " . number_format($perkiraanTagihan - $uangmuka) . "</td> 
                        </tr>
                              </table>";
                        }
                        break;
                    default :
                        echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                    <tr class='isi2' padding='0'>
                         <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&nbsp;&nbsp;</td> 
                         <td padding='0'><font color='111111' size='1'  face='Tahoma'>Nama IKS<hr/></td> 
                         <td padding='0' width='30%' align='left'><font color='111111' size='1'  face='Tahoma'>Total Piutang<hr/></td> 
                         <td padding='0' width='30%' align='left'><font color='111111' size='1'  face='Tahoma' >Sisa Piutang<hr/></td> 
                         
                        </tr>
                        </table>";
                        while ($inapdrpasien = mysqli_fetch_array($hasil1)) {

                            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                         <tr class='isi12' padding='0'>
                                <td padding='0' width='8%'><font color='#ffffff' size='1'  face='Tahoma'>&nbsp;&nbsp;</td> 
                                <td padding='0'><font color='111111' size='3'  face='Tahoma'>" . str_replace("  ", "&nbsp;&nbsp;", $inapdrpasien[1]) . "</td> 
                                <td padding='0' width='30%' align='left'><font color='111111' size='3'  face='Tahoma'>Rp. " . number_format($inapdrpasien[3]) . "</td> 
                                <td padding='0' width='30%' align='left'><font color='111111' size='3'  face='Tahoma'>Rp. " . number_format($inapdrpasien[4]) . "</td>  
                              </tr>
                              </table>";
                        }
                }
            }


            echo "<table width='100%' bgcolor='#ffffff' align='left' border='0' cellspacing='0' cellpadding='0'>
                <tr class='isi12' padding='0'>
			    <td colspan='7' padding='0'>
                                <table width='100%' bgcolor='#ffffff' align='left' border='0' padding='0' cellspacing='0' cellpadding='0'>
                                    <tr class='isi12' padding='0'>
                                     <td padding='0' width='40%' align=center><font color='000000' size='1'  face='Tahoma'>&nbsp;</td>   
                                     <td padding='0' width='20%' align=center><font color='000000' size='1'  face='Tahoma'>&nbsp;</td>   
                                     <td padding='0' width='40%' align='center'><font color='000000' size='1'  face='Tahoma'>&nbsp;</font></td>              
                                    </tr>
                                    <tr class='isi12' padding='0'>
                                     <td padding='0' width='40%' align=center><font color='000000' size='1'  face='Tahoma'><br></td> 
                                     <td padding='0' width='20%' align=center><font color='000000' size='1'  face='Tahoma'>&nbsp;</td>     
                                     <td padding='0' width='40%' align='center'><font color='000000' size='1'  face='Tahoma'>" . getOne("select kabupaten from setting") . ", " . $tanggal . "</font></td>              
                                    </tr>  
                                    <tr class='isi12' padding='0'>
                                     <td padding='0' width='40%' align=center><font color='000000' size='1'  face='Tahoma'>Penanggung Jawab Pasien</td> 
                                     <td padding='0' width='20%' align=center><font color='000000' size='1'  face='Tahoma'>&nbsp;</td>   
                                     <td padding='0' width='40%' align='center'><font color='000000' size='1'  face='Tahoma'>Petugas</font></td>              
                                    </tr>  
                                    <tr class='isi12' padding='0'>
                                     <td padding='0' width='40%'><font color='000000' size='1'  face='Tahoma'>&nbsp;</td> 
                                     <td padding='0' width='20%' align=center><font color='000000' size='1'  face='Tahoma'>&nbsp;</td>   
                                     <td padding='0' width='40%' align='right'><font color='000000' size='1'  face='Tahoma'></font></td>              
                                    </tr> 
                                    <tr class='isi12' padding='0'>
                                     <td padding='0' width='40%'><font color='000000' size='1'  face='Tahoma'>&nbsp;</td> 
                                     <td padding='0' width='20%' align=center><font color='000000' size='1'  face='Tahoma'>&nbsp;</td>   
                                     <td padding='0' width='40%' align='right'><font color='000000' size='1'  face='Tahoma'></font></td>              
                                    </tr> 
                                    <tr class='isi12' padding='0'>
                                     <td padding='0' width='40%' align=center><font color='000000' size='1'  face='Tahoma'>( ............................. )</td>     
                                     <td padding='0' width='20%' align=center><font color='000000' size='1'  face='Tahoma'>&nbsp;</td>   
                                     <td padding='0' width='40%' align='center'><font color='000000' size='1'  face='Tahoma'>(";
            if (getOne("select count(nama) from petugas where nip='$petugas'") >= 1) {
                echo getOne("select nama from petugas where nip='$petugas'");
            } else {
                echo " .............................. ";
            }
            echo ")</font></td>              
                                    </tr>   
                              </table>
                            </td>
                        </tr>
                        <tr class='isi12' padding='0'>
			    <td colspan='7' padding='0'>&nbsp</td>
                        </tr>
                        <tr class='isi12' padding='0'>
			    <td colspan='7' padding='0'><font color='000000' size='1'  face='Tahoma'>NB : Mohon maaf apabila ada tagihan yang belum tertagihkan dalam perincian ini akan ditagihkan kemudian, dan apabila berlebih akan dikembalikan.</font></td>
                        </tr>
                </table>";
        } else {
            echo "<font color='333333' size='1'  face='Times New Roman'><b>Data  Billing masih kosong !</b>";
        }
        ?>

    </body>

</html>