import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:flutter/material.dart';

extension StudentExt on Student {
  bool isInFirstQuarterRevaluation() {
    bool have = false;
    if (this.finalGrade1 != null && this.finalGrade1! < 6) {
      have = true;
    }

    return have;
  }

  bool isInSecondQuarterRevaluation() {
    bool have = false;
    if (this.finalGrade2 != null && this.finalGrade2! < 6) {
      have = true;
    }

    return have;
  }

  bool isInThirthQuarterRevaluation() {
    bool have = false;
    if (this.finalGrade3 != null && this.finalGrade3! < 6) {
      have = true;
    }

    return have;
  }

  bool haveAnyRevaluation() {
    bool have = false;
    if (this.isInFirstQuarterRevaluation() ||
        this.isInSecondQuarterRevaluation() ||
        this.isInThirthQuarterRevaluation()) {
      have = true;
    }

    return have;
  }

  bool haveFinalRevaluationInQuarter(int quarter) {
    bool have = false;
    if (quarter == 1) {
      if (this.isInFirstQuarterRevaluation() &&
          this.revaluationGrade1 != null &&
          this.revaluationGrade1! < 6) {
        have = true;
      }
    } else if (quarter == 2) {
      if (this.isInSecondQuarterRevaluation() &&
          this.revaluationGrade2 != null &&
          this.revaluationGrade2! < 6) {
        have = true;
      }
    } else if (quarter == 3) {
      if (isInThirthQuarterRevaluation()) {
        have = true;
      }
    }

    return have;
  }

  bool isInFinalRevaluation() {
    bool have = false;
    if (this.haveFinalRevaluationInQuarter(1) ||
        this.haveFinalRevaluationInQuarter(2) ||
        this.haveFinalRevaluationInQuarter(3)) {
      have = true;
    }
    return have;
  }

  bool isApproved() {
    bool approved = false;

    if (this.haveAnyRevaluation() && this.finalRevaluationGrade! >= 6) {
      approved = true;
    } else if (this.finalGrade1 != null &&
        this.finalGrade1! >= 6 &&
        this.finalGrade2 != null &&
        this.finalGrade2! >= 6 &&
        this.finalGrade3 != null &&
        this.finalGrade3! >= 6) {
      approved = true;
    }

    return approved;
  }

  Widget quarterGradesReportWidget(int quarter) {
    return Column(
      children: [
        Text('${quarter}º TRI'),
        if (quarter == 1)
          Text(
              '${this.finalGrade1 ?? ''}  | ${this.revaluationGrade1 ?? '__'}'),
        if (quarter == 2)
          Text('${this.finalGrade2 ?? ''} | ${this.revaluationGrade2 ?? '__'}'),
        if (quarter == 3) Text('${this.finalGrade3 ?? ''} ')
      ],
    );
  }
}
