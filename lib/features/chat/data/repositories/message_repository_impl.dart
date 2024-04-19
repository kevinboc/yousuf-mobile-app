import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/data/datasources/message_remote_source.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/chat_messages.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/repository/message_repository.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/post_chat_message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/retrieve_chat_messages.dart';

class MessageRepositoryImpl implements MessageRepository {
  final NetworkInfo networkInfo;
  final MessageRemoteDataSource remoteDataSource;

  MessageRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, ChatMessages>> getChatMessages(
      ChatMessagesParams params) async {
    // TODO: implement getChatMessages
    if (await networkInfo.isConnected!) {
      final response = await remoteDataSource.getChatMessages(params);
      return response.fold((failure) {
        return Left(failure);
      }, (chatMessages) {
        return Right(chatMessages);
      });
    } else {
      return const Left(ServerFailure("Could not connect to server"));
    }
  }

  @override
  Future<Either<Failure, Message>> message(MessageParams params) async {
    final response = await remoteDataSource.message(params);
    return response.fold((failure) {
      return Left(failure);
    }, (message) {
      return Right(message);
    });
  }
}
