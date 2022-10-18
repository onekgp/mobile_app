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


/** This is an auto generated class representing the TravelPost type in your schema. */
@immutable
class TravelPost extends Model {
  static const classType = const _TravelPostModelType();
  final String id;
  final Location? _from;
  final Location? _to;
  final int? _seats;
  final bool? _isAvailable;
  final TemporalTime? _flightTime;
  final TemporalTime? _cabStartTime;
  final TemporalTime? _cabEndTime;
  final TemporalDate? _date;
  final OneKgpUser? _user;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _travelPostUserId;

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
  
  int get seats {
    try {
      return _seats!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get isAvailable {
    try {
      return _isAvailable!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalTime? get flightTime {
    return _flightTime;
  }
  
  TemporalTime? get cabStartTime {
    return _cabStartTime;
  }
  
  TemporalTime? get cabEndTime {
    return _cabEndTime;
  }
  
  TemporalDate get date {
    try {
      return _date!;
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
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String get travelPostUserId {
    try {
      return _travelPostUserId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const TravelPost._internal({required this.id, required from, required to, required seats, required isAvailable, flightTime, cabStartTime, cabEndTime, required date, required user, createdAt, updatedAt, required travelPostUserId}): _from = from, _to = to, _seats = seats, _isAvailable = isAvailable, _flightTime = flightTime, _cabStartTime = cabStartTime, _cabEndTime = cabEndTime, _date = date, _user = user, _createdAt = createdAt, _updatedAt = updatedAt, _travelPostUserId = travelPostUserId;
  
  factory TravelPost({String? id, required Location from, required Location to, required int seats, required bool isAvailable, TemporalTime? flightTime, TemporalTime? cabStartTime, TemporalTime? cabEndTime, required TemporalDate date, required OneKgpUser user, required String travelPostUserId}) {
    return TravelPost._internal(
      id: id == null ? UUID.getUUID() : id,
      from: from,
      to: to,
      seats: seats,
      isAvailable: isAvailable,
      flightTime: flightTime,
      cabStartTime: cabStartTime,
      cabEndTime: cabEndTime,
      date: date,
      user: user,
      travelPostUserId: travelPostUserId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TravelPost &&
      id == other.id &&
      _from == other._from &&
      _to == other._to &&
      _seats == other._seats &&
      _isAvailable == other._isAvailable &&
      _flightTime == other._flightTime &&
      _cabStartTime == other._cabStartTime &&
      _cabEndTime == other._cabEndTime &&
      _date == other._date &&
      _user == other._user &&
      _travelPostUserId == other._travelPostUserId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TravelPost {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("from=" + (_from != null ? enumToString(_from)! : "null") + ", ");
    buffer.write("to=" + (_to != null ? enumToString(_to)! : "null") + ", ");
    buffer.write("seats=" + (_seats != null ? _seats!.toString() : "null") + ", ");
    buffer.write("isAvailable=" + (_isAvailable != null ? _isAvailable!.toString() : "null") + ", ");
    buffer.write("flightTime=" + (_flightTime != null ? _flightTime!.format() : "null") + ", ");
    buffer.write("cabStartTime=" + (_cabStartTime != null ? _cabStartTime!.format() : "null") + ", ");
    buffer.write("cabEndTime=" + (_cabEndTime != null ? _cabEndTime!.format() : "null") + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("travelPostUserId=" + "$_travelPostUserId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TravelPost copyWith({String? id, Location? from, Location? to, int? seats, bool? isAvailable, TemporalTime? flightTime, TemporalTime? cabStartTime, TemporalTime? cabEndTime, TemporalDate? date, OneKgpUser? user, String? travelPostUserId}) {
    return TravelPost._internal(
      id: id ?? this.id,
      from: from ?? this.from,
      to: to ?? this.to,
      seats: seats ?? this.seats,
      isAvailable: isAvailable ?? this.isAvailable,
      flightTime: flightTime ?? this.flightTime,
      cabStartTime: cabStartTime ?? this.cabStartTime,
      cabEndTime: cabEndTime ?? this.cabEndTime,
      date: date ?? this.date,
      user: user ?? this.user,
      travelPostUserId: travelPostUserId ?? this.travelPostUserId);
  }
  
  TravelPost.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _from = enumFromString<Location>(json['from'], Location.values),
      _to = enumFromString<Location>(json['to'], Location.values),
      _seats = (json['seats'] as num?)?.toInt(),
      _isAvailable = json['isAvailable'],
      _flightTime = json['flightTime'] != null ? TemporalTime.fromString(json['flightTime']) : null,
      _cabStartTime = json['cabStartTime'] != null ? TemporalTime.fromString(json['cabStartTime']) : null,
      _cabEndTime = json['cabEndTime'] != null ? TemporalTime.fromString(json['cabEndTime']) : null,
      _date = json['date'] != null ? TemporalDate.fromString(json['date']) : null,
      _user = json['user']?['serializedData'] != null
        ? OneKgpUser.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _travelPostUserId = json['travelPostUserId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'from': enumToString(_from), 'to': enumToString(_to), 'seats': _seats, 'isAvailable': _isAvailable, 'flightTime': _flightTime?.format(), 'cabStartTime': _cabStartTime?.format(), 'cabEndTime': _cabEndTime?.format(), 'date': _date?.format(), 'user': _user?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'travelPostUserId': _travelPostUserId
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField FROM = QueryField(fieldName: "from");
  static final QueryField TO = QueryField(fieldName: "to");
  static final QueryField SEATS = QueryField(fieldName: "seats");
  static final QueryField ISAVAILABLE = QueryField(fieldName: "isAvailable");
  static final QueryField FLIGHTTIME = QueryField(fieldName: "flightTime");
  static final QueryField CABSTARTTIME = QueryField(fieldName: "cabStartTime");
  static final QueryField CABENDTIME = QueryField(fieldName: "cabEndTime");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (OneKgpUser).toString()));
  static final QueryField TRAVELPOSTUSERID = QueryField(fieldName: "travelPostUserId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TravelPost";
    modelSchemaDefinition.pluralName = "TravelPosts";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        provider: AuthRuleProvider.IAM,
        operations: [
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelPost.FROM,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelPost.TO,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelPost.SEATS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelPost.ISAVAILABLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelPost.FLIGHTTIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelPost.CABSTARTTIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelPost.CABENDTIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TravelPost.DATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: TravelPost.USER,
      isRequired: true,
      ofModelName: (OneKgpUser).toString(),
      associatedKey: OneKgpUser.ID
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
      key: TravelPost.TRAVELPOSTUSERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _TravelPostModelType extends ModelType<TravelPost> {
  const _TravelPostModelType();
  
  @override
  TravelPost fromJson(Map<String, dynamic> jsonData) {
    return TravelPost.fromJson(jsonData);
  }
}