class Profile < ApplicationRecord
  belongs_to :user

  validates :nickname, presence: true, uniqueness: true, length: {minimun: 3, maximum: 15}
  validates :first_name, presence: true, length: {minimun: 3, maximum: 50}
  validates :last_name, presence: true, length: {minimun: 3, maximum: 50}
  validates :description, length: {minimun: 5}
  validates :gender, presence:true, inclusion: { in:
    [
      'Feminino', 
      'Masculino',
      'Trans homem',
      'Trans mulher',
      'Travesti',
      'Transgênero',
      'Homem transexual',
      'Pessoa trans',
      'Mulher transexual',
      'Pessoa transexual',
      'Mulher (trans)',
      'Homem (trans)',
      'Neutro',
      'Sem gênero',
      'Cross gender',
      'Mtf (homem que está em transição para o gênero feminino)',
      'Ftm (mulher que está em transição para o gênero masculino)'
    ]
  }
  validates :favorite_role, presence: true, inclusion: {in: ['Narrador', 'Jogador' ] }

end
