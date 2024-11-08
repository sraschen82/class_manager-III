// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserCollection on Isar {
  IsarCollection<User> get user => this.collection();
}

const UserSchema = CollectionSchema(
  name: r'User',
  id: -7838171048429979076,
  properties: {
    r'credentials': PropertySchema(
      id: 0,
      name: r'credentials',
      type: IsarType.object,
      target: r'Credentials',
    ),
    r'notesList': PropertySchema(
      id: 1,
      name: r'notesList',
      type: IsarType.objectList,
      target: r'Note',
    ),
    r'pathSchedules': PropertySchema(
      id: 2,
      name: r'pathSchedules',
      type: IsarType.string,
    ),
    r'schoolYears': PropertySchema(
      id: 3,
      name: r'schoolYears',
      type: IsarType.objectList,
      target: r'SchoolYear',
    )
  },
  estimateSize: _userEstimateSize,
  serialize: _userSerialize,
  deserialize: _userDeserialize,
  deserializeProp: _userDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Credentials': CredentialsSchema,
    r'Note': NoteSchema,
    r'SchoolYear': SchoolYearSchema,
    r'Discipline': DisciplineSchema,
    r'SchoolClass': SchoolClassSchema,
    r'Student': StudentSchema
  },
  getId: _userGetId,
  getLinks: _userGetLinks,
  attach: _userAttach,
  version: '3.1.0+1',
);

int _userEstimateSize(
  User object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.credentials;
    if (value != null) {
      bytesCount += 3 +
          CredentialsSchema.estimateSize(
              value, allOffsets[Credentials]!, allOffsets);
    }
  }
  bytesCount += 3 + object.notesList.length * 3;
  {
    final offsets = allOffsets[Note]!;
    for (var i = 0; i < object.notesList.length; i++) {
      final value = object.notesList[i];
      bytesCount += NoteSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.pathSchedules;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.schoolYears.length * 3;
  {
    final offsets = allOffsets[SchoolYear]!;
    for (var i = 0; i < object.schoolYears.length; i++) {
      final value = object.schoolYears[i];
      bytesCount += SchoolYearSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _userSerialize(
  User object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Credentials>(
    offsets[0],
    allOffsets,
    CredentialsSchema.serialize,
    object.credentials,
  );
  writer.writeObjectList<Note>(
    offsets[1],
    allOffsets,
    NoteSchema.serialize,
    object.notesList,
  );
  writer.writeString(offsets[2], object.pathSchedules);
  writer.writeObjectList<SchoolYear>(
    offsets[3],
    allOffsets,
    SchoolYearSchema.serialize,
    object.schoolYears,
  );
}

User _userDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = User(
    reader.readObjectOrNull<Credentials>(
      offsets[0],
      CredentialsSchema.deserialize,
      allOffsets,
    ),
    reader.readObjectList<Note>(
          offsets[1],
          NoteSchema.deserialize,
          allOffsets,
          Note(),
        ) ??
        [],
    reader.readObjectList<SchoolYear>(
          offsets[3],
          SchoolYearSchema.deserialize,
          allOffsets,
          SchoolYear(),
        ) ??
        [],
  );
  object.id = id;
  object.pathSchedules = reader.readStringOrNull(offsets[2]);
  return object;
}

P _userDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Credentials>(
        offset,
        CredentialsSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectList<Note>(
            offset,
            NoteSchema.deserialize,
            allOffsets,
            Note(),
          ) ??
          []) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readObjectList<SchoolYear>(
            offset,
            SchoolYearSchema.deserialize,
            allOffsets,
            SchoolYear(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userGetId(User object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userGetLinks(User object) {
  return [];
}

void _userAttach(IsarCollection<dynamic> col, Id id, User object) {
  object.id = id;
}

extension UserQueryWhereSort on QueryBuilder<User, User, QWhere> {
  QueryBuilder<User, User, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserQueryWhere on QueryBuilder<User, User, QWhereClause> {
  QueryBuilder<User, User, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserQueryFilter on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> credentialsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'credentials',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> credentialsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'credentials',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> notesListLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> notesListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> notesListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> notesListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> notesListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> notesListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pathSchedules',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pathSchedules',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathSchedules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pathSchedules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pathSchedules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pathSchedules',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pathSchedules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pathSchedules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathSchedules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathSchedules',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathSchedules',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> pathSchedulesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathSchedules',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> schoolYearsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schoolYears',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> schoolYearsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schoolYears',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> schoolYearsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schoolYears',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> schoolYearsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schoolYears',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> schoolYearsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schoolYears',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> schoolYearsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schoolYears',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension UserQueryObject on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> credentials(
      FilterQuery<Credentials> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'credentials');
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> notesListElement(
      FilterQuery<Note> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'notesList');
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> schoolYearsElement(
      FilterQuery<SchoolYear> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'schoolYears');
    });
  }
}

extension UserQueryLinks on QueryBuilder<User, User, QFilterCondition> {}

extension UserQuerySortBy on QueryBuilder<User, User, QSortBy> {
  QueryBuilder<User, User, QAfterSortBy> sortByPathSchedules() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathSchedules', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPathSchedulesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathSchedules', Sort.desc);
    });
  }
}

extension UserQuerySortThenBy on QueryBuilder<User, User, QSortThenBy> {
  QueryBuilder<User, User, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPathSchedules() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathSchedules', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPathSchedulesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathSchedules', Sort.desc);
    });
  }
}

extension UserQueryWhereDistinct on QueryBuilder<User, User, QDistinct> {
  QueryBuilder<User, User, QDistinct> distinctByPathSchedules(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathSchedules',
          caseSensitive: caseSensitive);
    });
  }
}

extension UserQueryProperty on QueryBuilder<User, User, QQueryProperty> {
  QueryBuilder<User, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<User, Credentials?, QQueryOperations> credentialsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'credentials');
    });
  }

  QueryBuilder<User, List<Note>, QQueryOperations> notesListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notesList');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> pathSchedulesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathSchedules');
    });
  }

  QueryBuilder<User, List<SchoolYear>, QQueryOperations> schoolYearsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'schoolYears');
    });
  }
}
