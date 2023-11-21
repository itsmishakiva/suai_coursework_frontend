import 'package:flutter/material.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/basic_user_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/i_mappers/i_basic_user_mapper.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/basic_user.dart';

class BasicUserMapper implements IBasicUserMapper {
  @override
  BasicUser mapToDto(BasicUserDto userDto) {
    BasicUser user = BasicUser(
      id: userDto.id,
      username: userDto.username,
      avatarColor: Color(userDto.avatarColor),
      avatarPath: userDto.avatarPath,
      name: userDto.name,
      surname: userDto.surname,
      statusInfo: userDto.statusInfo,
      description: userDto.description,
      email: userDto.email,
    );
    return user;
  }

  @override
  BasicUserDto mapFromDto(BasicUser user) {
    BasicUserDto userDto = BasicUserDto(
      id: user.id,
      username: user.username,
      avatarColor: user.avatarColor.value,
      avatarPath: user.avatarPath,
      name: user.name,
      surname: user.surname,
      statusInfo: user.statusInfo,
      description: user.description,
      email: user.email,
    );
    return userDto;
  }
}
