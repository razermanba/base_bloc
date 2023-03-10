import 'dart:async';

import 'package:bloc_base/data/local/dao/home_dao.dart';
import 'package:bloc_base/data/local/entity/home_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [HomeEntity])
abstract class AppDatabase extends FloorDatabase{
  HomeDao get homeDao;
}