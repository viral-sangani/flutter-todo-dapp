// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract TodoContract {
    uint256 public taskCount = 0;

    struct Task {
        uint256 index;
        string taskName;
        bool isComplete;
    }

    mapping(uint256 => Task) public todos;
    event TaskCreated(string task, uint256 taskNumber);
    event TaskUpdated(string task, uint256 taskId);
    event TaskIsCompleteToggle(string task, uint256 taskId, bool isComplete);
    event TaskDeleted(uint256 taskNumber);

    function createTask(string memory _taskName) public {
        todos[taskCount++] = Task(taskCount, _taskName, false);

        // emit event
        emit TaskCreated(_taskName, taskCount - 1);
    }

    function updateTask(uint256 _taskId, string memory _taskName) public {
        Task memory currTask = todos[_taskId];
        todos[_taskId] = Task(_taskId, _taskName, currTask.isComplete);

        // emit event
        emit TaskUpdated(_taskName, _taskId);
    }

    function toggleComplete(uint256 _taskId) public {
        Task memory currTask = todos[_taskId];
        todos[_taskId] = Task(_taskId, currTask.taskName, !currTask.isComplete);

        // emit event
        emit TaskIsCompleteToggle(
            currTask.taskName,
            _taskId,
            !currTask.isComplete
        );
    }

    function deleteTask(uint256 _taskId) public {
        delete todos[_taskId];

        // emit event
        emit TaskDeleted(_taskId);
    }
}
