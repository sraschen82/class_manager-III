// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_class_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SchoolClassSchema = Schema(
  name: r'SchoolClass',
  id: -7752351258327029191,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'students': PropertySchema(
      id: 1,
      name: r'students',
      type: IsarType.objectList,
      target: r'Student',
    )
  },
  estimateSize: _schoolClassEstimateSize,
  serialize: _schoolClassSerialize,
  deserialize: _schoolClassDeserialize,
  deserializeProp: _schoolClassDeserializeProp,
);

int _schoolClassEstimateSize(
  SchoolClass object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.students;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Student]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += StudentSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _schoolClassSerialize(
  SchoolClass object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeObjectList<Student>(
    offsets[1],
    allOffsets,
    StudentSchema.serialize,
    object.students,
  );
}

SchoolClass _schoolClassDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SchoolClass();
  object.name = reader.readStringOrNull(offsets[0]);
  object.students = reader.readObjectList<Student>(
    offsets[1],
    StudentSchema.deserialize,
    allOffsets,
    Student(),
  );
  return object;
}

P _schoolClassDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<Student>(
        offset,
        StudentSchema.deserialize,
        allOffsets,
        Student(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SchoolClassQueryFilter
    on QueryBuilder<SchoolClass, SchoolClass, QFilterCondition> {
  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition>
      studentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'students',
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition>
      studentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'students',
      ));
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition>
      studentsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'students',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition>
      studentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'students',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition>
      studentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'students',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition>
      studentsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'students',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition>
      studentsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'students',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition>
      studentsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'students',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension SchoolClassQueryObject
    on QueryBuilder<SchoolClass, SchoolClass, QFilterCondition> {
  QueryBuilder<SchoolClass, SchoolClass, QAfterFilterCondition> studentsElement(
      FilterQuery<Student> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'students');
    });
  }
}
