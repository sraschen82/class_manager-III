// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_year_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SchoolYearSchema = Schema(
  name: r'SchoolYear',
  id: 2507619199416214762,
  properties: {
    r'disicplines': PropertySchema(
      id: 0,
      name: r'disicplines',
      type: IsarType.objectList,
      target: r'Discipline',
    ),
    r'year': PropertySchema(
      id: 1,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _schoolYearEstimateSize,
  serialize: _schoolYearSerialize,
  deserialize: _schoolYearDeserialize,
  deserializeProp: _schoolYearDeserializeProp,
);

int _schoolYearEstimateSize(
  SchoolYear object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.disicplines;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Discipline]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DisciplineSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _schoolYearSerialize(
  SchoolYear object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Discipline>(
    offsets[0],
    allOffsets,
    DisciplineSchema.serialize,
    object.disicplines,
  );
  writer.writeLong(offsets[1], object.year);
}

SchoolYear _schoolYearDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SchoolYear();
  object.disicplines = reader.readObjectList<Discipline>(
    offsets[0],
    DisciplineSchema.deserialize,
    allOffsets,
    Discipline(),
  );
  object.year = reader.readLongOrNull(offsets[1]);
  return object;
}

P _schoolYearDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Discipline>(
        offset,
        DisciplineSchema.deserialize,
        allOffsets,
        Discipline(),
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SchoolYearQueryFilter
    on QueryBuilder<SchoolYear, SchoolYear, QFilterCondition> {
  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition>
      disicplinesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'disicplines',
      ));
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition>
      disicplinesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'disicplines',
      ));
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition>
      disicplinesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'disicplines',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition>
      disicplinesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'disicplines',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition>
      disicplinesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'disicplines',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition>
      disicplinesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'disicplines',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition>
      disicplinesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'disicplines',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition>
      disicplinesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'disicplines',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition> yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition> yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition> yearEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition> yearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition> yearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition> yearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SchoolYearQueryObject
    on QueryBuilder<SchoolYear, SchoolYear, QFilterCondition> {
  QueryBuilder<SchoolYear, SchoolYear, QAfterFilterCondition>
      disicplinesElement(FilterQuery<Discipline> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'disicplines');
    });
  }
}
