import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/ui/extentions/num_ext.dart';
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

  Widget quarterGradesReportColumnWidget(int quarter) {
    return SizedBox(
      height: 50,
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('${quarter}º TRI'),
          if (quarter == 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                this.finalGrade1 != null && this.finalGrade1! < 6
                    ? Text(
                        '${this.finalGrade1 ?? ''}  | ${this.revaluationGrade1 ?? '__'}')
                    : Text('${this.finalGrade1 ?? ''} '),
              ],
            ),
          if (quarter == 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                this.finalGrade2 != null && this.finalGrade2! < 6
                    ? Text(
                        '${this.finalGrade2 ?? ''}  | ${this.revaluationGrade2 ?? '__'}')
                    : Text('${this.finalGrade2 ?? ''} '),
              ],
            ),
          if (quarter == 3) Text('${this.finalGrade3 ?? ''} ')
        ],
      ),
    );
  }

  Widget quarterGradesReportRowWidget(int quarter) {
    return Row(
      children: [
        Text('${quarter}º TRI:     '),
        if (quarter == 1)
          Text(
              '${this.finalGrade1 ?? ''}  | ${this.revaluationGrade1 ?? '__'}'),
        if (quarter == 2)
          Text('${this.finalGrade2 ?? ''} | ${this.revaluationGrade2 ?? '__'}'),
        if (quarter == 3) Text('${this.finalGrade3 ?? ''} ')
      ],
    );
  }

  String quarterScoresWidget(int quarter) {
    String str = '';
    double sum = 0;
    switch (quarter) {
      case 1:
        {
          if (this.firstQuarterGrades.length == 1) {
            sum += this.firstQuarterGrades.first;
            str = '${this.firstQuarterGrades.first}';
          } else if (this.firstQuarterGrades.length > 1) {
            for (double score in this.firstQuarterGrades) {
              sum += score;
              str = '$str + ${score.toString()}';
            }
          }
        }
      case 2:
        {
          if (this.secondQuarterGrades.length == 1) {
            sum += this.secondQuarterGrades.first;
            str = '${this.secondQuarterGrades.first}';
          } else if (this.secondQuarterGrades.length > 1) {
            for (double score in this.secondQuarterGrades) {
              sum += score;
              str = '$str + ${score.toString()}';
            }
          }
        }
      case 3:
        {
          if (this.thirdQuarterGrades.length == 1) {
            sum += this.thirdQuarterGrades.first;
            str = '${this.thirdQuarterGrades.first}';
          } else if (this.thirdQuarterGrades.length > 1) {
            for (double score in this.thirdQuarterGrades) {
              sum += score;
              str = '$str + ${score.toString()}';
            }
          }
        }
      case _:
        null;
    }

    str = str.replaceFirst(r'+', '');

    str = str.trim();
    sum == 0
        ? str = 'Nenhuma avaliação lançada.'
        : str = '$str  =  ${sum.toStringAsFixed(2)}';
    return str;
  }

  double quarterScoreSum(int quarter) {
    double sum = 0;
    switch (quarter) {
      case 1:
        {
          sum = this
              .firstQuarterGrades
              .fold(sum, (previousValue, element) => previousValue + element);
        }
      case 2:
        {
          sum = this
              .secondQuarterGrades
              .fold(sum, (previousValue, element) => previousValue + element);
        }
      case 3:
        {
          sum = this
              .thirdQuarterGrades
              .fold(sum, (previousValue, element) => previousValue + element);
        }
      case _:
        null;
    }
    if (sum > 10) {
      sum = 10;
    }
    return sum;
  }

  double quarterGradeSuggestion(int quarter) {
    double result = quarterScoreSum(quarter);
    return result.finalQuarterGradeRound();
  }

  Widget finalRevaluationGradeWidget() => Card(
        elevation: 15,
        surfaceTintColor: Colors.black,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(strokeAlign: 2),
        ),
        color: this.finalRevaluationGrade == null ||
                this.finalRevaluationGrade! < 6
            ? Colors.amber
            : Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Final'),
              this.finalRevaluationGrade != null
                  ? Text('${this.finalRevaluationGrade}')
                  : Text('___'),
            ],
          ),
        ),
      );
}
