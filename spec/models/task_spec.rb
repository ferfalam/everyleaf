require 'rails_helper'
describe 'Task model functionality', type: :model do
  describe 'Testing for validation' do
    context 'If the task name is empty' do
      it 'tripped the validation' do
        task = Task.new(name: '', details: 'Failure test')
        expect(task).not_to be_valid
      end
    end
    context 'If the task details are empty' do
      it 'gets stuck on validation' do
        task = Task.new(name: 'Good test only with name', details: '')
        expect(task).to be_valid
      end
    end
    context 'If the task name and details contain content' do
      it 'passes validation' do
        task = Task.new(name: 'Good test', details: 'Good test with name and details')
        expect(task).to be_valid
      end
    end
  end
end