// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedulles_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SchedullesSchema = Schema(
  name: r'Schedulles',
  id: 8653418342127126384,
  properties: {
    r'fridayAfternoon': PropertySchema(
      id: 0,
      name: r'fridayAfternoon',
      type: IsarType.stringList,
    ),
    r'fridayMorning': PropertySchema(
      id: 1,
      name: r'fridayMorning',
      type: IsarType.stringList,
    ),
    r'mondayAfternoon': PropertySchema(
      id: 2,
      name: r'mondayAfternoon',
      type: IsarType.stringList,
    ),
    r'mondayMorning': PropertySchema(
      id: 3,
      name: r'mondayMorning',
      type: IsarType.stringList,
    ),
    r'thursdayAfternoon': PropertySchema(
      id: 4,
      name: r'thursdayAfternoon',
      type: IsarType.stringList,
    ),
    r'thursdayMorning': PropertySchema(
      id: 5,
      name: r'thursdayMorning',
      type: IsarType.stringList,
    ),
    r'tuesdayAfternoon': PropertySchema(
      id: 6,
      name: r'tuesdayAfternoon',
      type: IsarType.stringList,
    ),
    r'tuesdayMorning': PropertySchema(
      id: 7,
      name: r'tuesdayMorning',
      type: IsarType.stringList,
    ),
    r'wednesdayAfternoon': PropertySchema(
      id: 8,
      name: r'wednesdayAfternoon',
      type: IsarType.stringList,
    ),
    r'wednesdayMorning': PropertySchema(
      id: 9,
      name: r'wednesdayMorning',
      type: IsarType.stringList,
    )
  },
  estimateSize: _schedullesEstimateSize,
  serialize: _schedullesSerialize,
  deserialize: _schedullesDeserialize,
  deserializeProp: _schedullesDeserializeProp,
);

int _schedullesEstimateSize(
  Schedulles object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fridayAfternoon.length * 3;
  {
    for (var i = 0; i < object.fridayAfternoon.length; i++) {
      final value = object.fridayAfternoon[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.fridayMorning.length * 3;
  {
    for (var i = 0; i < object.fridayMorning.length; i++) {
      final value = object.fridayMorning[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.mondayAfternoon.length * 3;
  {
    for (var i = 0; i < object.mondayAfternoon.length; i++) {
      final value = object.mondayAfternoon[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.mondayMorning.length * 3;
  {
    for (var i = 0; i < object.mondayMorning.length; i++) {
      final value = object.mondayMorning[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.thursdayAfternoon.length * 3;
  {
    for (var i = 0; i < object.thursdayAfternoon.length; i++) {
      final value = object.thursdayAfternoon[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.thursdayMorning.length * 3;
  {
    for (var i = 0; i < object.thursdayMorning.length; i++) {
      final value = object.thursdayMorning[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.tuesdayAfternoon.length * 3;
  {
    for (var i = 0; i < object.tuesdayAfternoon.length; i++) {
      final value = object.tuesdayAfternoon[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.tuesdayMorning.length * 3;
  {
    for (var i = 0; i < object.tuesdayMorning.length; i++) {
      final value = object.tuesdayMorning[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.wednesdayAfternoon.length * 3;
  {
    for (var i = 0; i < object.wednesdayAfternoon.length; i++) {
      final value = object.wednesdayAfternoon[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.wednesdayMorning.length * 3;
  {
    for (var i = 0; i < object.wednesdayMorning.length; i++) {
      final value = object.wednesdayMorning[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _schedullesSerialize(
  Schedulles object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.fridayAfternoon);
  writer.writeStringList(offsets[1], object.fridayMorning);
  writer.writeStringList(offsets[2], object.mondayAfternoon);
  writer.writeStringList(offsets[3], object.mondayMorning);
  writer.writeStringList(offsets[4], object.thursdayAfternoon);
  writer.writeStringList(offsets[5], object.thursdayMorning);
  writer.writeStringList(offsets[6], object.tuesdayAfternoon);
  writer.writeStringList(offsets[7], object.tuesdayMorning);
  writer.writeStringList(offsets[8], object.wednesdayAfternoon);
  writer.writeStringList(offsets[9], object.wednesdayMorning);
}

Schedulles _schedullesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Schedulles();
  object.fridayAfternoon = reader.readStringList(offsets[0]) ?? [];
  object.fridayMorning = reader.readStringList(offsets[1]) ?? [];
  object.mondayAfternoon = reader.readStringList(offsets[2]) ?? [];
  object.mondayMorning = reader.readStringList(offsets[3]) ?? [];
  object.thursdayAfternoon = reader.readStringList(offsets[4]) ?? [];
  object.thursdayMorning = reader.readStringList(offsets[5]) ?? [];
  object.tuesdayAfternoon = reader.readStringList(offsets[6]) ?? [];
  object.tuesdayMorning = reader.readStringList(offsets[7]) ?? [];
  object.wednesdayAfternoon = reader.readStringList(offsets[8]) ?? [];
  object.wednesdayMorning = reader.readStringList(offsets[9]) ?? [];
  return object;
}

P _schedullesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SchedullesQueryFilter
    on QueryBuilder<Schedulles, Schedulles, QFilterCondition> {
  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fridayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fridayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fridayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fridayAfternoon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fridayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fridayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fridayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fridayAfternoon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fridayAfternoon',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fridayAfternoon',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayAfternoon',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayAfternoon',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayAfternoon',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayAfternoon',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayAfternoon',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayAfternoonLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayAfternoon',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fridayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fridayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fridayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fridayMorning',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fridayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fridayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fridayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fridayMorning',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fridayMorning',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fridayMorning',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayMorning',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayMorning',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayMorning',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayMorning',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayMorning',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      fridayMorningLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridayMorning',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mondayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mondayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mondayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mondayAfternoon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mondayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mondayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mondayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mondayAfternoon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mondayAfternoon',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mondayAfternoon',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayAfternoon',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayAfternoon',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayAfternoon',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayAfternoon',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayAfternoon',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayAfternoonLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayAfternoon',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mondayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mondayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mondayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mondayMorning',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mondayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mondayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mondayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mondayMorning',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mondayMorning',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mondayMorning',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayMorning',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayMorning',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayMorning',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayMorning',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayMorning',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      mondayMorningLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mondayMorning',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thursdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thursdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thursdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thursdayAfternoon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thursdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thursdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thursdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thursdayAfternoon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thursdayAfternoon',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thursdayAfternoon',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayAfternoon',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayAfternoon',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayAfternoon',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayAfternoon',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayAfternoon',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayAfternoonLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayAfternoon',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thursdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thursdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thursdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thursdayMorning',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thursdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thursdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thursdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thursdayMorning',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thursdayMorning',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thursdayMorning',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayMorning',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayMorning',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayMorning',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayMorning',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayMorning',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      thursdayMorningLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursdayMorning',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tuesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tuesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tuesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tuesdayAfternoon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tuesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tuesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tuesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tuesdayAfternoon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tuesdayAfternoon',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tuesdayAfternoon',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayAfternoon',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayAfternoon',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayAfternoon',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayAfternoon',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayAfternoon',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayAfternoonLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayAfternoon',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tuesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tuesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tuesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tuesdayMorning',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tuesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tuesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tuesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tuesdayMorning',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tuesdayMorning',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tuesdayMorning',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayMorning',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayMorning',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayMorning',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayMorning',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayMorning',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      tuesdayMorningLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesdayMorning',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wednesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wednesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wednesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wednesdayAfternoon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wednesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wednesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wednesdayAfternoon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wednesdayAfternoon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wednesdayAfternoon',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wednesdayAfternoon',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayAfternoon',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayAfternoon',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayAfternoon',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayAfternoon',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayAfternoon',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayAfternoonLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayAfternoon',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wednesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wednesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wednesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wednesdayMorning',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wednesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wednesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wednesdayMorning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wednesdayMorning',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wednesdayMorning',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wednesdayMorning',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayMorning',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayMorning',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayMorning',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayMorning',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayMorning',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Schedulles, Schedulles, QAfterFilterCondition>
      wednesdayMorningLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesdayMorning',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension SchedullesQueryObject
    on QueryBuilder<Schedulles, Schedulles, QFilterCondition> {}
