// Mocks generated by Mockito 5.4.0 from annotations
// in kw_store/test/modules/payment/data/datasources/payment_remote_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dio/dio.dart' as _i2;
import 'package:kw_store/core/api/dio_consumer.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_1<T> extends _i1.SmartFake implements _i2.Response<T> {
  _FakeResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DioConsumer].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioConsumer extends _i1.Mock implements _i3.DioConsumer {
  MockDioConsumer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);
  @override
  _i4.Future<_i2.Response<dynamic>> get(
    String? endPoint, {
    Map<String, dynamic>? query,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [endPoint],
          {#query: query},
        ),
        returnValue:
            _i4.Future<_i2.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #get,
            [endPoint],
            {#query: query},
          ),
        )),
      ) as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> post(
    String? endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [endPoint],
          {
            #query: query,
            #body: body,
          },
        ),
        returnValue:
            _i4.Future<_i2.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #post,
            [endPoint],
            {
              #query: query,
              #body: body,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> put(
    String? endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [endPoint],
          {
            #query: query,
            #body: body,
          },
        ),
        returnValue:
            _i4.Future<_i2.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #put,
            [endPoint],
            {
              #query: query,
              #body: body,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response<dynamic>>);
}
