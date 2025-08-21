const taskForm = document.getElementById('task-form');
const taskInput = document.getElementById('task');
const taskList = document.getElementById('lists');
taskForm.addEventListener('submit', (e) => {
    e.preventDefault(); 
    const taskText = taskInput.value.trim(); 

    if (!taskText){
        alert("Please enter a task.");
         return; 
    }
   
    const taskItem = document.createElement('li');
    taskItem.classList.add('task-item');
    taskItem.innerHTML = `
        <input type="checkbox" class="complete-checkbox">
        <span class="task-text">${taskText}</span>
        <button class="remove-btn">Remove</button>
    `;

    taskList.appendChild(taskItem);  
    taskInput.value = '';  

    
    taskItem.querySelector('.complete-checkbox').addEventListener('change', (e) => {
        taskItem.querySelector('.task-text').classList.toggle('completed', e.target.checked);
    });

    taskItem.querySelector('.remove-btn').addEventListener('click', () => {
        taskList.removeChild(taskItem);
    });
});
