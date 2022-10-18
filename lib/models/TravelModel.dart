/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the TravelModel type in your schema. */
@immutable
class TravelModel extends Model {
  static const classType = const _TravelModelModelType();
  final String id;
  final Location? _from;
  final Location? _to;
  final String? _description;
  final TemporalDateTime? _leavingTime;
  final OneKgpUser? _user;
  final int? _seats;
  final bool? _isCabBooked;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _travelModelUserId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Location get from {
    try {
      return _from!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Location get to {
    try {
      return _to!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get description {
    return _description;
  }
  
  TemporalDateTime get leavingTime {
    try {
      return _leavingTime!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  OneKgpUser get user {
    try {
      return _user!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get seats {
    return _seats;
  }
  
  bool? get isCabBooked {
    return _isCabBooked;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String get travelModelUserId {
    try {
      return _travelModelUserId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const TravelModel._internal({required this.id, required from, required to, description, required leavingTime, required user, seats, isCabBooked, createdAt, updatedAt, required travelModelUserId}): _from = from, _to = to, _description = description, _leavingTime = leavingTime, _user = user, _seats = seats, _isCabBooked = isCabBooked, _createdAt = createdAt, _updatedAt = updatedAt, _travelModelUserId = travelModelUserId;
  
  factory TravelModel({String? id, required Location from, required Location to, String? description, required TemporalDateTime leavingTime, required OneKgpUser user, int? seats, bool? isCabBooked, required String travelModelUserId}) {
    return TravelModel._internal(
      id: id == null ? UUID.getUUID() : id,
      from: from,
      to: to,
      description: description,
      leavingTime: leavingTime,
      user: user,
      seats: seats,
      isCabBooked: isCabBooked,
      travelModelUserId: travelModelUserId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TravelModel &&
      id == other.id &&
      _from == other._from &&
      _to == other._to &&
      _description == other._description &&
      _leavingTime == other._leavingTime &&
      _user == other._user &&
      _seats == other._seats &&
      _isCabBooked == other._isCabBooked &&
      _travelModelUserId == other._travelModelUserId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TravelModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("from=" + (_from != null ? enumToString(_from)! : "null") + ", ");
    buffer.write("to=" + (_to != null ? enumToString(_to)! : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("leavingTime=" + (_leavingTime != null ? _leavingTime!.format() : "null") + ", ");
    buffer.write("seats=" + (_seats != null ? _seats!.toString() : "null") + ", ");
    buffer.write("isCabBooked=" + (_isCabBooked != null ? _isCabBooked!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("travelModelUserId=" + "$_travelModelUserId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TravelModel copyWith({String? id, Location? from, Location? to, String? description, TemporalDateTime? leavingTime, OneKgpUser? user, int? seats, bool? isCabBooked, String? travelModelUserId}) {
    return TravelModel._internal(
      id: id ?? this.id,
      from: from ?? this.from,
      to: to ?? this.to,
      description: description ?? this.description,
      leavingTime: leavingTime ?? this.leavingTime,
      user: user ?? this.user,
      seats: seats ?? this.seats,
      isCabBooked: isCabBooked ?? this.isCabBooked,
      travelModelUserId: travelModelUserId ?? this.travelModelUserId);
  }
  
  TravelModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _from = enumFromString<Location>(json['from'], Location.values),
      _to = enumFromString<Location>(json['to'], Location.values),
      _description = json['description'],
      _leavingTime = json['leavingTime'] != null ? TemporalDateTime.fromString(json['leavingTime']) : null,
      _user = json['user']?['serializedData'] != null
        ? OneKgpUser.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _seats = (json['seats'] as num?)?.toInt(),
      _isCabBooked = json['isCabBooked'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _travelModelUserId = json['travelModelUserId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'from': enumToString(_from), 'to': enumToString(_to), 'description': _description, 'leavingTime': _leavingTime?.format(), 'user': _user?.toJson(), 'seats': _seats, 'isCabBooked': _isCabBooked, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'travelModelUserId': _travelModelUserId
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField FROM = QueryField(fieldName: "from");
  static final QueryField TO = QueryField(fieldName: "to");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField LEAVINGTIME = QueryField(fieldName: "leavingTime");
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (OneKgpUser).toString()));
  static final QueryField SEATS = QueryField(fieldName: "seats");
  static final QueryField ISCABBOOKED = QueryField(fieldName: "isCabBooked");
  static final QueryField TRAVELMODELUSERID = QueryField(fieldName: "travelModelUserId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TravelModel";
    modelSchemaDefinition.pluralName = "TravelModels";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelModel.FROM,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelModel.TO,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelModel.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelModel.LEAVINGTIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: TravelModel.USER,
      isRequired: true,
      ofModelName: (OneKgpUser).toString(),
      associatedKey: OneKgpUser.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelModel.SEATS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelModel.ISCABBOOKED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelModel.TRAVELMODELUSERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _TravelModelModelType extends ModelType<TravelModel> {
  const _TravelModelModelType();
  
  @override
  TravelModel fromJson(Map<String, dynamic> jsonData) {
    return TravelModel.fromJson(jsonData);
  }
}