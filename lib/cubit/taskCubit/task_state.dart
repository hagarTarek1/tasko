abstract class TaskState {}
class InitState extends TaskState{}
class AddTaskSuccess extends TaskState{}
class AddTaskError extends TaskState{}
class GetTaskError extends TaskState{}
class EditTaskError extends TaskState{}
class EditTaskSuccess extends TaskState{}
class GetTaskLoading extends TaskState{}
class GetTaskSuccess extends TaskState{}
class ClearTextSuccess extends TaskState{}
class ChangeIndexSuccess extends TaskState{}
class IndexControllerSuccess extends TaskState{}
class DeleteSuccess extends TaskState{}