import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/data/datasources/message_remote_source.dart';

final messageDataSourceProvider =
    Provider.family<MessageRemoteDataSource, DioClient>(
        (_, dioClient) => MessageRemoteDataSourceImpl(dioClient));
