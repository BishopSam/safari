import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/features/authentication/data/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository{}
class MockUser extends Mock implements User{}