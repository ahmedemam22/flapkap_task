
enum BaseStatus {
  initial,
  inProgress,
  success,
  failure,
}

class BaseState<T> {
  const BaseState({
    this.status = BaseStatus.initial,
    this.item,
    this.failure,
  });
  final BaseStatus status;
  final T? item;
  final String? failure;

  BaseState<T> setInitialState() => BaseState<T>(
    status: BaseStatus.initial,
  );

  BaseState<T> setInProgressState() => BaseState<T>(
    status: BaseStatus.inProgress,
  );
  BaseState<T> setSuccessState(T item) => BaseState<T>(status: BaseStatus.success, item: item);

  BaseState<T> setFailureState(String failure) => BaseState<T>(status: BaseStatus.failure, failure: failure);

  bool get isInProgress => status == BaseStatus.inProgress;

  bool get isInitial => status == BaseStatus.initial;

  bool get isFailure => status == BaseStatus.failure;

  bool get isSuccess => status == BaseStatus.success;

  BaseState<T> copyWith({
    BaseStatus? status,
    T? item,
    String? failure,
  }) {
    return BaseState<T>(
      status: status ?? this.status,
      item: item ?? this.item,
      failure: failure ?? this.failure,
    );
  }
}

extension BaseStatusFunctionality on BaseStatus {
  bool get isInitial => this == BaseStatus.initial;
  bool get isSuccess => this == BaseStatus.success;
  bool get isInProgress => this == BaseStatus.inProgress;
  bool get isFailure => this == BaseStatus.failure;
}
