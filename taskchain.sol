// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaskChain {
    // Declare a struct to represent a Task
    struct Task {
        uint256 id;
        string description;
        address owner;
        bool completed;
    }

    // Mapping to store tasks by their id
    mapping(uint256 => Task) public tasks;

    // Variable to track the next task ID
    uint256 public nextTaskId;

    // Event to log task creation
    event TaskCreated(uint256 id, string description, address owner);

    // Event to log task completion
    event TaskCompleted(uint256 id, address owner);

    // Modifier to ensure the caller is the task owner
    modifier onlyTaskOwner(uint256 _taskId) {
        require(tasks[_taskId].owner == msg.sender, "You are not the task owner!");
        _;
    }

    // Function to create a new task
    function createTask(string memory _description) public {
        uint256 taskId = nextTaskId;
        tasks[taskId] = Task({
            id: taskId,
            description: _description,
            owner: msg.sender,
            completed: false
        });

        emit TaskCreated(taskId, _description, msg.sender);

        // Increment the task ID for the next task
        nextTaskId++;
    }

    // Function to get a specific task by ID
    function getTask(uint256 _taskId) public view returns (uint256, string memory, address, bool) {
        Task memory task = tasks[_taskId];
        return (task.id, task.description, task.owner, task.completed);
    }

    // Function to get all tasks
    function getTasks() public view returns (Task[] memory) {
        Task[] memory allTasks = new Task[](nextTaskId);
        for (uint256 i = 0; i < nextTaskId; i++) {
            allTasks[i] = tasks[i];
        }
        return allTasks;
    }

    // Function to mark a task as completed
    function completeTask(uint256 _taskId) public onlyTaskOwner(_taskId) {
        require(!tasks[_taskId].completed, "Task is already completed!");
        tasks[_taskId].completed = true;

        emit TaskCompleted(_taskId, msg.sender);
    }
}


Explanation of Code:
Task Struct:
This struct represents a task. It includes:

id: Unique identifier for each task.
description: A text description of the task.
owner: Ethereum address of the person who created the task.
completed: A boolean indicating if the task is completed.
State Variables:

tasks: A mapping from task IDs to Task structs. This allows us to retrieve and store tasks by their ID.
nextTaskId: A counter that increments each time a new task is created.
Events:

TaskCreated: Triggered when a new task is created. This event logs the task ID, description, and the address of the creator.
TaskCompleted: Triggered when a task is marked as completed. It logs the task ID and the address of the user who marked it complete.
Modifiers:

onlyTaskOwner: Ensures that only the task's creator can complete or modify the task. This is important for task integrity.
Functions:

createTask: Allows the user to create a new task with a description. The task is stored in the tasks mapping and emits the TaskCreated event.
getTask: Allows anyone to retrieve the details of a specific task by its ID.
getTasks: Returns an array of all tasks, allowing users to see their full task list.
completeTask: Allows the task owner to mark the task as completed. It requires the caller to be the owner, and it emits the TaskCompleted event.


MIT License

Copyright (c) [year] [Your Name or Organization]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
