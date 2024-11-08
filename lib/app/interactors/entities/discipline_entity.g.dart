// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discipline_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DisciplineSchema = Schema(
  name: r'Discipline',
  id: -1166910732498755030,
  properties: {
    r'classes': PropertySchema(
      id: 0,
      name: r'classes',
      type: IsarType.objectList,
      target: r'SchoolClass',
    ),
    r'isRegularDiscipline': PropertySchema(
      id: 1,
      name: r'isRegularDiscipline',
      type: IsarType.bool,
    ),
    r'longName': PropertySchema(
      id: 2,
      name: r'longName',
      type: IsarType.string,
    ),
    r'shortName': PropertySchema(
      id: 3,
      name: r'shortName',
      type: IsarType.string,
    )
  },
  estimateSize: _disciplineEstimateSize,
  serialize: _disciplineSerialize,
  deserialize: _disciplineDeserialize,
  deserializeProp: _disciplineDeserializeProp,
);

int _disciplineEstimateSize(
  Discipline object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.classes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[SchoolClass]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              SchoolClassSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.longName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.shortName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _disciplineSerialize(
  Discipline object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<SchoolClass>(
    offsets[0],
    allOffsets,
    SchoolClassSchema.serialize,
    object.classes,
  );
  writer.writeBool(offsets[1], object.isRegularDiscipline);
  writer.writeString(offsets[2], object.longName);
  writer.writeString(offsets[3], object.shortName);
}

Discipline _disciplineDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Discipline();
  object.classes = reader.readObjectList<SchoolClass>(
    offsets[0],
    SchoolClassSchema.deserialize,
    allOffsets,
    SchoolClass(),
  );
  object.isRegularDiscipline = reader.readBoolOrNull(offsets[1]);
  object.longName = reader.readStringOrNull(offsets[2]);
  object.shortName = reader.readStringOrNull(offsets[3]);
  return object;
}

P _disciplineDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<SchoolClass>(
        offset,
        SchoolClassSchema.deserialize,
        allOffsets,
        SchoolClass(),
      )) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DisciplineQueryFilter
    on QueryBuilder<Discipline, Discipline, QFilterCondition> {
  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> classesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'classes',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      classesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'classes',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      classesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> classesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      classesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      classesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      classesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      classesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      isRegularDisciplineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isRegularDiscipline',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      isRegularDisciplineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isRegularDiscipline',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      isRegularDisciplineEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRegularDiscipline',
        value: value,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> longNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longName',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      longNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longName',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> longNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      longNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> longNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> longNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      longNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'longName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> longNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'longName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> longNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'longName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> longNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'longName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      longNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longName',
        value: '',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      longNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'longName',
        value: '',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      shortNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shortName',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      shortNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shortName',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> shortNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      shortNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> shortNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> shortNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      shortNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> shortNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> shortNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> shortNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shortName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      shortNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortName',
        value: '',
      ));
    });
  }

  QueryBuilder<Discipline, Discipline, QAfterFilterCondition>
      shortNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shortName',
        value: '',
      ));
    });
  }
}

extension DisciplineQueryObject
    on QueryBuilder<Discipline, Discipline, QFilterCondition> {
  QueryBuilder<Discipline, Discipline, QAfterFilterCondition> classesElement(
      FilterQuery<SchoolClass> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'classes');
    });
  }
}
