require 'rails_helper'
RSpec.describe 'task manager', type: :system do
    let!(:task) { FactoryBot.create(:task, name: 'task') }
    before do
        visit tasks_path
    end
    
    describe 'Create new task' do
        context 'When a new task is created' do
            it 'The created task will be displayed' do
                visit new_task_path
                fill_in "Name",	with: "Task Name" 
                fill_in "Details",	with: "Task Details" 
                click_on("Create Task")
                expect(page).to have_content 'Task Name'
            end
        end
    end
    describe 'List view function' do
        context 'When you move to the list screen' do
            it 'displays the list of created tasks' do
                task = FactoryBot.create(:task, name: 'task')

                visit tasks_path

                expect(page).to have_content 'task'
            end
        end

        context 'When tasks are arranged in descending order of creation date and time' do
            it 'New task is displayed at the top' do
                task_list = all('.task-row') 
                task_view_name = task_list[0].text.split(" ")[0]
                expect(task_view_name).to eq task.name
            end
        end
    end
    describe 'Detail view function' do
        context 'When you go to any task detail screen' do
            it 'The details of the corresponding task will be displayed' do
            end
        end
    end 
    
end
