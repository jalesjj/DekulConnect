// lib/data/network/services/school_services.dart
import 'package:dekul_connect_app/base/base.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/resources/resources.dart';
import 'package:retrofit/retrofit.dart';

part 'school_services.g.dart';

@RestApi()
abstract class SchoolServices {
  factory SchoolServices(Dio dio) = _SchoolServices;

  @GET(SchoolConstant.siswa)
  Future<BaseListResponse<Siswa>> fetchSiswa(
    @Query('page') int? page,
    @Query('perPage') int? perPage,
  );

  @GET(SchoolConstant.siswaByOrtu) // GET /siswa/{id} ;; 
  Future<BaseListResponse<Siswa>> fetchSiswaByOrtu(
    @Path('id') String ortuId,
    @Query('page') int? page,
    @Query('perPage') int? perPage,
  );

  // API ENDPOINT UNTUK MENGAMBIL NILAI
  @GET(SchoolConstant.nilaiById)  // GET ke endpoint "/nilai/{id}" ;;
  Future<BaseListResponse<Nilai>> fetchNilaiBySiswa(
    @Path('id') String siswaId, // Path parameter
    @Query('page') int? page,   // Query parameter untuk pagination
    @Query('perPage') int? perPage,
  );

  // API ENDPOINT UNTUK membuat nilai baru inni
  @POST(SchoolConstant.nilai)   // POST ke endpoint "/nilai" ;;
  Future<BaseResponse<Nilai>> createNilai(@Body() Nilai nilai);

  @PUT(SchoolConstant.nilaiById)
  Future<BaseResponse<Nilai>> updateNilai(
    @Path('id') String siswaId,
    @Body() Nilai nilai,
  );

  @GET(SchoolConstant.aktivitasRumahById)
  Future<BaseListResponse<Aktivitas>> fetchAktivitasRumahBySiswa(
    @Path('id') String siswaId,
    @Query('page') int? page,
    @Query('perPage') int? perPage,
    @Query('tanggalAwal') String? tanggalAwal,
    @Query('tanggalAkhir') String? tanggalAkhir,
  );

  // API ENDPOINT UNTUK MEMBUAT AKTIVITAS RUMAH
  @POST(SchoolConstant.aktivitasRumah) // "aktivitas-rumah" ;;
  Future<BaseResponse<Aktivitas>> createAktivitasRumah(
    @Body() Aktivitas aktivitas,       // Kirim object Aktivitas dalam request body
  );

  @PUT(SchoolConstant.aktivitasRumahById)
  Future<BaseResponse<Aktivitas>> updateAktivitasRumah(
    @Path('id') String siswaId,
    @Body() Aktivitas aktivitas,
  );

  @GET(SchoolConstant.aktivitasSekolahById)
  Future<BaseListResponse<Aktivitas>> fetchAktivitasSekolahBySiswa(
    @Path('id') String siswaId,
    @Query('page') int? page,
    @Query('perPage') int? perPage,
    @Query('tanggalAwal') String? tanggalAwal,
    @Query('tanggalAkhir') String? tanggalAkhir,
  );

  // API ENDPOINT UNTUK MEMBUAT AKTIVITAS SEKOLAH
  @POST(SchoolConstant.aktivitasSekolah)      // "aktivitas-sekolah"
  Future<BaseResponse<Aktivitas>> createAktivitasSekolah(
    @Body() Aktivitas aktivitas,              // Kirim object Aktivitas dalam request body
  );

  @PUT(SchoolConstant.aktivitasSekolahById)
  Future<BaseResponse<Aktivitas>> updateAktivitasSekolah(
    @Path('id') String siswaId,
    @Body() Aktivitas aktivitas,
  );
}
