class Profile < ApplicationRecord
  belongs_to :user
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
  has_many :group_as_master, dependent: :nullify, foreign_key: :master_id, class_name: "Group"
  has_many :user_answers, dependent: :destroy
  has_many :answers, through: :user_answers
  has_many :interactions_as_target, dependent: :destroy, foreign_key: :target_user_id, class_name: "UserInteraction"
  has_many :user_interactions, dependent: :destroy, foreign_key: :action_user_id, class_name: "UserInteraction"
  has_one_attached :photo

  validates :nickname, presence: true, uniqueness: true, length: {minimun: 3, maximum: 15}
  validates :first_name, presence: true, length: {minimun: 3, maximum: 50}
  validates :last_name, presence: true, length: {minimun: 3, maximum: 50}
  validates :description, length: {minimun: 5, maximum: 2000}
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

  def compare_answers(current_user)
    user_answers = self.user_answers.map do |ua|
      ua.answer_id
    end

    q_size = user_answers.count.to_f
    return "" if q_size == 0

    current_user_answers = current_user.profile.user_answers.map do |ua|
      ua.answer_id
    end

    in_commom = (user_answers & current_user_answers).count.to_f
    return "#{(in_commom/q_size*100).to_i}%"
  end



end
