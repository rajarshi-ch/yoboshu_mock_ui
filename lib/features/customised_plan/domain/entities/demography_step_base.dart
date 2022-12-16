import 'package:equatable/equatable.dart';

/// Base Entity for the demography steps with common fields
abstract class DemographyStep extends Equatable {
  final String id;
  final String previous;
  final String next;
  final String type;

  const DemographyStep(this.id, this.previous, this.next, this.type);
  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  String toString(){
    return '$id $type' ;
  }

}