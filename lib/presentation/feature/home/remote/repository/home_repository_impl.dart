import 'package:bloc_base/core/common/result.dart';
import 'package:bloc_base/data/local/entity/home_entity.dart';
import 'package:bloc_base/data/repository/base_repository.dart';
import 'package:bloc_base/presentation/feature/home/mapper/home_mapper.dart';
import 'package:bloc_base/presentation/feature/home/model/home_response.dart';
import 'package:bloc_base/presentation/feature/home/remote/repository/home_repository.dart';
import 'package:bloc_base/presentation/feature/home/remote/service/home_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/local/dao/home_dao.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends BaseRepository implements HomeRepository {
  final HomeService _homeService;
  final HomeDao _homeDao;

  HomeRepositoryImpl(this._homeService, this._homeDao);

  @override
  Future<Result<List<HomeResponse>>> getLocalHomeData() {
    return safeDbCall(_homeDao.getHomeData(),
        mapperDb: (List<HomeEntity>? entityList) =>
            entityList?.map((HomeEntity e) => e.toModel()).toList() ?? []);
  }

  @override
  Future<Result<List<HomeResponse>>> loadHomeData() {
    return safeApiCall(
      _homeService.loadHomeData(),
      saveResult: (List<HomeResponse>? data) => _homeDao.saveHome(
          data?.map<HomeEntity>((HomeResponse e) => e.toEntity()).toList() ??
              []),
    );
  }
}
