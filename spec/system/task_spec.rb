require 'rails_helper'
RSpec.describe 'task manager', type: :system do
    # let!(:task) { FactoryBot.create(:task, name: 'task') }
    before do
        FactoryBot.create(:task, name: 'taskA')
        FactoryBot.create(:second_task, name: 'taskB')
        FactoryBot.create(:second_task, name: 'taskC')
        FactoryBot.create(:second_task, name: 'taskD')
        visit tasks_path
    end
    
    describe 'Create new task' do
        context 'When a new task is created' do
            it 'The created task will be displayed' do
                visit new_task_path
                fill_in "Name",	with: "Task Name" 
                fill_in "Details",	with: "Task Details" 
                fill_in "Deadline", with: "19/07/2021 12:00"
                fill_in "Deadline", with: "unstarted"
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

        context 'When tasks are arranged in descending order of deadline date and time' do
            it 'Closer deadline task is displayed at the top' do
                visit tasks_path(sort_expired: "true")
                task_list = all('.task-deadline') 
                first_task_view_date = task_list[0].text
                last_task_view_date = task_list[task_list.size-1].text
                
                result = Date.parse(first_task_view_date) <= Date.parse(last_task_view_date)
                expect(result).to eq true
            end
        end

        context 'When tasks are arranged in descending order of priority' do
            it 'high task is displayed at the top' do
                visit tasks_path(sort_priority: "true")
                task_list = all('.task-priority') 
                first_task_view_priority = task_list[0].text
                last_task_view_priority = task_list[task_list.size-1].text
                
                expect(first_task_view_priority).to eq "high"
                expect(last_task_view_priority).to eq "low"
            end
        end

        context 'When tasks are arranged in descending order of creation date and time' do
            it 'New task is displayed at the top' do
                task_list = all('.task-name') 
                task_view_name = task_list[0].text
                expect(task_view_name).to eq "taskD"
            end
        end
        
    end
    describe 'Detail view function' do
        context 'When you go to any task detail screen' do
            it 'The details of the corresponding task will be displayed' do
            end
        end
    end 
    describe 'Search function' do
        before do
            FactoryBot.create(:task, name: "task")
            FactoryBot.create(:second_task, name: "sample")
        end
        context 'If you do a fuzzy search by name' do
            it "Filter by tasks that include search keywords" do
                visit tasks_path
                fill_in "Name",	with: "task"
                click_on("Search")
                expect(page).to have_content 'task'
            end
        end
        context 'When you search for status' do
            it "Tasks that exactly match the status are narrowed down" do
                visit tasks_path
                select "unstarted", from: "task_status"
                click_on("Search")
                expect(page).to have_content 'unstarted'
            end
        end
        context 'name performing fuzzy search of name and status search' do
            it "Narrow down tasks that include search keywords in the name and exactly match the status" do
                visit tasks_path
                select "unstarted", from: "task_status"
                fill_in "Name",	with: "task" 
                click_on("Search")
                expect(page).to have_content 'task'
            end
        end
    end
end
