// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const StudentSchema = Schema(
  name: r'Student',
  id: -252783119861727542,
  properties: {
    r'finalGrade1': PropertySchema(
      id: 0,
      name: r'finalGrade1',
      type: IsarType.double,
    ),
    r'finalGrade2': PropertySchema(
      id: 1,
      name: r'finalGrade2',
      type: IsarType.double,
    ),
    r'finalGrade3': PropertySchema(
      id: 2,
      name: r'finalGrade3',
      type: IsarType.double,
    ),
    r'finalRevaluationGrade': PropertySchema(
      id: 3,
      name: r'finalRevaluationGrade',
      type: IsarType.double,
    ),
    r'firstQuarterGrades': PropertySchema(
      id: 4,
      name: r'firstQuarterGrades',
      type: IsarType.doubleList,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'revaluationGrade1': PropertySchema(
      id: 6,
      name: r'revaluationGrade1',
      type: IsarType.double,
    ),
    r'revaluationGrade2': PropertySchema(
      id: 7,
      name: r'revaluationGrade2',
      type: IsarType.double,
    ),
    r'revaluationGrade3': PropertySchema(
      id: 8,
      name: r'revaluationGrade3',
      type: IsarType.double,
    ),
    r'secondQuarterGrades': PropertySchema(
      id: 9,
      name: r'secondQuarterGrades',
      type: IsarType.doubleList,
    ),
    r'thirdQuarterGrades': PropertySchema(
      id: 10,
      name: r'thirdQuarterGrades',
      type: IsarType.doubleList,
    )
  },
  estimateSize: _studentEstimateSize,
  serialize: _studentSerialize,
  deserialize: _studentDeserialize,
  deserializeProp: _studentDeserializeProp,
);

int _studentEstimateSize(
  Student object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.firstQuarterGrades.length * 8;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.secondQuarterGrades.length * 8;
  bytesCount += 3 + object.thirdQuarterGrades.length * 8;
  return bytesCount;
}

void _studentSerialize(
  Student object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.finalGrade1);
  writer.writeDouble(offsets[1], object.finalGrade2);
  writer.writeDouble(offsets[2], object.finalGrade3);
  writer.writeDouble(offsets[3], object.finalRevaluationGrade);
  writer.writeDoubleList(offsets[4], object.firstQuarterGrades);
  writer.writeString(offsets[5], object.name);
  writer.writeDouble(offsets[6], object.revaluationGrade1);
  writer.writeDouble(offsets[7], object.revaluationGrade2);
  writer.writeDouble(offsets[8], object.revaluationGrade3);
  writer.writeDoubleList(offsets[9], object.secondQuarterGrades);
  writer.writeDoubleList(offsets[10], object.thirdQuarterGrades);
}

Student _studentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Student();
  object.finalGrade1 = reader.readDoubleOrNull(offsets[0]);
  object.finalGrade2 = reader.readDoubleOrNull(offsets[1]);
  object.finalGrade3 = reader.readDoubleOrNull(offsets[2]);
  object.finalRevaluationGrade = reader.readDoubleOrNull(offsets[3]);
  object.firstQuarterGrades = reader.readDoubleList(offsets[4]) ?? [];
  object.name = reader.readString(offsets[5]);
  object.revaluationGrade1 = reader.readDoubleOrNull(offsets[6]);
  object.revaluationGrade2 = reader.readDoubleOrNull(offsets[7]);
  object.revaluationGrade3 = reader.readDoubleOrNull(offsets[8]);
  object.secondQuarterGrades = reader.readDoubleList(offsets[9]) ?? [];
  object.thirdQuarterGrades = reader.readDoubleList(offsets[10]) ?? [];
  return object;
}

P _studentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 10:
      return (reader.readDoubleList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension StudentQueryFilter
    on QueryBuilder<Student, Student, QFilterCondition> {
  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalGrade1',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalGrade1',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade1EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalGrade1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade1GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalGrade1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade1LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalGrade1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade1Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalGrade1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalGrade2',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalGrade2',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade2EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalGrade2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade2GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalGrade2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade2LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalGrade2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade2Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalGrade2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalGrade3',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalGrade3',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade3EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalGrade3',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade3GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalGrade3',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade3LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalGrade3',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> finalGrade3Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalGrade3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      finalRevaluationGradeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalRevaluationGrade',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      finalRevaluationGradeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalRevaluationGrade',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      finalRevaluationGradeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalRevaluationGrade',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      finalRevaluationGradeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalRevaluationGrade',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      finalRevaluationGradeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalRevaluationGrade',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      finalRevaluationGradeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalRevaluationGrade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      firstQuarterGradesElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstQuarterGrades',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      firstQuarterGradesElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstQuarterGrades',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      firstQuarterGradesElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstQuarterGrades',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      firstQuarterGradesElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstQuarterGrades',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      firstQuarterGradesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'firstQuarterGrades',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      firstQuarterGradesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'firstQuarterGrades',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      firstQuarterGradesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'firstQuarterGrades',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      firstQuarterGradesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'firstQuarterGrades',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      firstQuarterGradesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'firstQuarterGrades',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      firstQuarterGradesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'firstQuarterGrades',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> nameEqualTo(
    String value, {
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

  QueryBuilder<Student, Student, QAfterFilterCondition> nameGreaterThan(
    String value, {
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

  QueryBuilder<Student, Student, QAfterFilterCondition> nameLessThan(
    String value, {
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

  QueryBuilder<Student, Student, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Student, Student, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Student, Student, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Student, Student, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Student, Student, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Student, Student, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revaluationGrade1',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revaluationGrade1',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade1EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revaluationGrade1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade1GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revaluationGrade1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade1LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revaluationGrade1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade1Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revaluationGrade1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revaluationGrade2',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revaluationGrade2',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade2EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revaluationGrade2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade2GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revaluationGrade2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade2LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revaluationGrade2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade2Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revaluationGrade2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revaluationGrade3',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revaluationGrade3',
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade3EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revaluationGrade3',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade3GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revaluationGrade3',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade3LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revaluationGrade3',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      revaluationGrade3Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revaluationGrade3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      secondQuarterGradesElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secondQuarterGrades',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      secondQuarterGradesElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'secondQuarterGrades',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      secondQuarterGradesElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'secondQuarterGrades',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      secondQuarterGradesElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'secondQuarterGrades',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      secondQuarterGradesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'secondQuarterGrades',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      secondQuarterGradesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'secondQuarterGrades',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      secondQuarterGradesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'secondQuarterGrades',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      secondQuarterGradesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'secondQuarterGrades',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      secondQuarterGradesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'secondQuarterGrades',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      secondQuarterGradesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'secondQuarterGrades',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      thirdQuarterGradesElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thirdQuarterGrades',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      thirdQuarterGradesElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thirdQuarterGrades',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      thirdQuarterGradesElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thirdQuarterGrades',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      thirdQuarterGradesElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thirdQuarterGrades',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      thirdQuarterGradesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thirdQuarterGrades',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      thirdQuarterGradesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thirdQuarterGrades',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      thirdQuarterGradesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thirdQuarterGrades',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      thirdQuarterGradesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thirdQuarterGrades',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      thirdQuarterGradesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thirdQuarterGrades',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Student, Student, QAfterFilterCondition>
      thirdQuarterGradesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thirdQuarterGrades',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension StudentQueryObject
    on QueryBuilder<Student, Student, QFilterCondition> {}
