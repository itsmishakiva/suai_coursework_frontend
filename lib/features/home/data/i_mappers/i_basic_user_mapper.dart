import 'package:flutter/material.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/basic_user_dto.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/basic_user.dart';

abstract interface class IBasicUserMapper {
  BasicUser mapToDto(BasicUserDto userDto);

  BasicUserDto mapFromDto(BasicUser user);
}
