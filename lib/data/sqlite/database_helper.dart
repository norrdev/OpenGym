import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:npng/config.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:npng/data/models/models.dart';

class DatabaseHelper {
  static const _databaseName = 'npng.db';
  static const _databaseVersion = 1;

  static const muscleTable = 'muscles';
  // static const ingredientTable = 'Ingredient';
  // static const recipeId = 'recipeId';
  // static const ingredientId = 'ingredientId';

  static late BriteDatabase _streamDatabase;

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static var lock = Lock();

  // only have a single app-wide reference to the database
  static Database? _database;

// SQL code to create the database table
// 1
  // Future _onCreate(Database db, int version) async {
  //   // 2
  //   await db.execute('''
  //       CREATE TABLE $recipeTable (
  //         $recipeId INTEGER PRIMARY KEY,
  //         label TEXT,
  //         image TEXT,
  //         url TEXT,
  //         calories REAL,
  //         totalWeight REAL,
  //         totalTime REAL
  //       )
  //       ''');
  //   // 3
  //   await db.execute('''
  //       CREATE TABLE $ingredientTable (
  //         $ingredientId INTEGER PRIMARY KEY,
  //         $recipeId INTEGER,
  //         name TEXT,
  //         weight REAL
  //       )
  //       ''');
  // }

  // this opens the database (and creates it if it doesn't exist)
  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, _databaseName);
    // Check if the database exists
    final bool exists = await databaseExists(path);
    if (!exists) {
      // Should happen only the first time you launch your application
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      // Copy from asset
      ByteData data = await rootBundle.load(join('assets/db', 'npng.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    }

    Sqflite.setDebugModeOn(true);
    return openDatabase(
      path,
      version: _databaseVersion, /*onCreate: _onCreate*/
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Use this object to prevent concurrent access to data
    await lock.synchronized(() async {
      // lazily instantiate the db the first time it is accessed
      if (_database == null) {
        _database = await _initDatabase();
        _streamDatabase = BriteDatabase(_database!);
      }
    });
    return _database!;
  }

  Future<BriteDatabase> get streamDatabase async {
    await database;
    return _streamDatabase;
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await instance.streamDatabase;
    return db.insert(table, row);
  }

  Future<int> _delete(String table, String columnId, int id) async {
    final db = await instance.streamDatabase;
    return db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Stream<List<Muscle>> watchAllMuscles() async* {
    final sdb = await instance.streamDatabase;
    yield* sdb
        .createQuery(muscleTable)
        .mapToList((row) => Muscle.fromJson(row));
  }

  /*List<Recipe> parseRecipes(List<Map<String, dynamic>> recipeList) {
    final recipes = <Recipe>[];
    // 1
    recipeList.forEach((recipeMap) {
      // 2
      final recipe = Recipe.fromJson(recipeMap);
      // 3
      recipes.add(recipe);
    });
    // 4
    return recipes;
  }

  List<Ingredient> parseIngredients(List<Map<String, dynamic>> ingredientList) {
    final ingredients = <Ingredient>[];
    ingredientList.forEach((ingredientMap) {
      // 5
      final ingredient = Ingredient.fromJson(ingredientMap);
      ingredients.add(ingredient);
    });
    return ingredients;
  }

  Future<List<Recipe>> findAllRecipes() async {
    // 1
    final db = await instance.streamDatabase;
    // 2
    final recipeList = await db.query(recipeTable);
    // 3
    final recipes = parseRecipes(recipeList);
    return recipes;
  }

  Stream<List<Recipe>> watchAllRecipes() async* {
    final db = await instance.streamDatabase;
    // 1
    yield* db
        // 2
        .createQuery(recipeTable)
        // 3
        .mapToList((row) => Recipe.fromJson(row));
  }

  Stream<List<Ingredient>> watchAllIngredients() async* {
    final db = await instance.streamDatabase;
    yield* db
        .createQuery(ingredientTable)
        .mapToList((row) => Ingredient.fromJson(row));
  }

  Future<Recipe> findRecipeById(int id) async {
    final db = await instance.streamDatabase;
    final recipeList = await db.query(recipeTable, where: 'id = $id');
    final recipes = parseRecipes(recipeList);
    return recipes.first;
  }

  Future<List<Ingredient>> findAllIngredients() async {
    final db = await instance.streamDatabase;
    final ingredientList = await db.query(ingredientTable);
    final ingredients = parseIngredients(ingredientList);
    return ingredients;
  }

  Future<List<Ingredient>> findRecipeIngredients(int recipeId) async {
    final db = await instance.streamDatabase;
    final ingredientList =
        await db.query(ingredientTable, where: 'recipeId = $recipeId');
    final ingredients = parseIngredients(ingredientList);
    return ingredients;
  }

// 1
  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await instance.streamDatabase;
    // 2
    return db.insert(table, row);
  }

  Future<int> insertRecipe(Recipe recipe) {
    // 3
    return insert(recipeTable, recipe.toJson());
  }

  Future<int> insertIngredient(Ingredient ingredient) {
    // 4
    return insert(ingredientTable, ingredient.toJson());
  }

// 1
  Future<int> _delete(String table, String columnId, int id) async {
    final db = await instance.streamDatabase;
    // 2
    return db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteRecipe(Recipe recipe) async {
    // 3
    if (recipe.id != null) {
      return _delete(recipeTable, recipeId, recipe.id!);
    } else {
      return Future.value(-1);
    }
  }

  Future<int> deleteIngredient(Ingredient ingredient) async {
    if (ingredient.id != null) {
      return _delete(ingredientTable, ingredientId, ingredient.id!);
    } else {
      return Future.value(-1);
    }
  }

  Future<void> deleteIngredients(List<Ingredient> ingredients) {
    // 4
    ingredients.forEach((ingredient) {
      if (ingredient.id != null) {
        _delete(ingredientTable, ingredientId, ingredient.id!);
      }
    });
    return Future.value();
  }

  Future<int> deleteRecipeIngredients(int id) async {
    final db = await instance.streamDatabase;
    // 5
    return db.delete(ingredientTable, where: '$recipeId = ?', whereArgs: [id]);
  }*/

  void close() {
    _streamDatabase.close();
  }
}
