require 'rails_helper'
RSpec.describe 'task manager', type: :system do
    before do
        FactoryBot.create(:task, name: 'factory create name１')
        FactoryBot.create(:task, name: 'factory create name 2')
        FactoryBot.create(:second_task, name: 'factory create name 3', details: 'factory create details')
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

                expect(page).to have_content 'factory'
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
