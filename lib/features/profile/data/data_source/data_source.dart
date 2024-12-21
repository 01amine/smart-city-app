import 'dart:convert';
import 'package:bsc/features/profile/domain/entities/profile.dart';
import 'package:bsc/shared/utils/dio_client.dart';
import 'package:bsc/shared/utils/service_locator.dart';
import 'package:dio/src/response.dart';

abstract class ProfileDataSource {
  Future<Profile> fetchProfile();
  Future<void> logout();
  Future<void> setLanguage(String language);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final String baseUrl;

  ProfileDataSourceImpl({
    required this.baseUrl,
  });
  
  

  @override
  Future<Profile> fetchProfile() async {
    try {
      final response = await sl<DioClient>().get('api/profile');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Profile(
          name: data['name'],
          email: data['email'],
          profilePictureUrl: data['profilePictureUrl'],
        );
      } else {
        throw Exception('Failed to fetch profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching profile: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      final response = await sl<DioClient>().get('api/auth/logout');
      if (response.statusCode != 200) {
        throw Exception('Failed to log out: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error logging out: $e');
    }
  }

  @override
  Future<void> setLanguage(String language) async {
    
    try {
      final response = await sl<DioClient>().post(
        'api/language',
        data: jsonEncode({'language': language}),
        headers: {'Content-Type': 'application/json'}, body: '',
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to set language: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error setting language: $e');
    }
  }
}

extension on Response {
  String get body => '';
}
