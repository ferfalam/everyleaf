require 'rails_helper'
describe 'Task model functionality', type: :model do
  
  describe 'Testing for validation' do
    before do
      @user = FactoryBot.create(:user)
    end
    context 'If the task name is empty' do
      it 'tripped the validation' do
        task = Task.new(name: '', details: 'Failure test')
        expect(task).not_to be_valid
      end
    end
    context 'If the task details are empty' do
      it 'gets stuck on validation' do
        task = Task.new(name: 'Good test only with name', details: '', user_id: @user.id)
        expect(task).to be_valid
      end
    end
    context 'If the task name and details contain content' do
      it 'passes validation' do
        task = Task.new(name: 'Good test', details: 'Good test with name and details', user_id: @user.id)
        expect(task).to be_valid
      end
    end
  end
  describe 'Search function' do
    let!(:task) { FactoryBot.create(:task, name: 'task') }
    let!(:second_task) { FactoryBot.create(:second_task, name: "sample") }
    context 'name is performed by scope method' do
      it "undefined" do
        # name_seach is a name search method presented by scope. The method name can be arbitrary.
        expect(Task.name_search('task')).to include(task)
        expect(Task.name_search('task')).not_to include(second_task)
        expect(Task.name_search('task').count).to eq 1
      end
    end
    context 'When the status is searched with the scope method' do
      it "Tasks that exactly match the status are narrowed down" do
        expect(Task.statut_search('unstarted')).to include(task)
        expect(Task.statut_search('unstarted')).not_to include(second_task)
        expect(Task.statut_search('unstarted').count).to eq 1
      end
    end
    context 'When performing fuzzy search and status search name' do
      it "Narrow down tasks that include search keywords in the name and exactly match the status" do
        expect(Task.name_statut_search('task', 'unstarted')).to include(task)
        expect(Task.name_statut_search('task', 'unstarted')).not_to include(second_task)
        expect(Task.name_statut_search('task', 'unstarted').count).to eq 1
      end
    end
  end

  describe "Pagination function" do
    before do
      @user = FactoryBot.create(:user)
      200.times do |n|
        Task.create(name: "sample", user_id: @user.id )
      end 
    end
    
    context "Verify the gem kaminari" do
      it "is 200 task page per 25" do
        expect(Task.count).to eq 200
        expect(Task.page(5).next_page).to eq 6
      end
    end
  end
  
end