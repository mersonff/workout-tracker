require 'rails_helper'

RSpec.feature 'Listando Treinos', type: feature do

  before do
    @routine = Routine.create(name: 'Treino A', description: 'Supino 3x10')
    @routine2 = Routine.create(name: 'Treino B', description: 'Agachamento 3x10')
  end

  scenario 'Um usuário lista todos os treinos' do
    visit '/'
    expect(page).to have_content(@routine.name)
    expect(page).to have_content(@routine.description)
    expect(page).to have_content(@routine2.name)
    expect(page).to have_content(@routine2.description)
    expect(page).to have_link(@routine.name)
    expect(page).to have_link(@routine2.name)
  end

  scenario 'Um usuário não tem treinos cadastrados' do
    Routine.delete_all
    visit '/'
    expect(page).not_to have_content(@routine.name)
    expect(page).not_to have_content(@routine.description)
    expect(page).not_to have_content(@routine2.name)
    expect(page).not_to have_content(@routine2.description)
    expect(page).not_to have_link(@routine.name)
    expect(page).not_to have_link(@routine2.name)

    within("div#no-routines") do
      expect(page).to have_content("NENHUM TREINO CRIADO")
    end

  end

end