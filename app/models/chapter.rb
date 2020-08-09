# frozen_string_literal: true

# == Schema Information
#
# Table name: chapters
#
#  id               :integer          not null, primary key
#  bismillah_pre    :boolean
#  revelation_order :integer
#  revelation_place :string
#  name_complex     :string
#  name_arabic      :string
#  name_simple      :string
#  pages            :string
#  verses_count     :integer
#  chapter_number   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Chapter < ApiCoreRecord
  include Slugable
  include QuranNavigationSearchable

  has_many :verses
  has_many :chapter_infos
  has_many :slugs

  has_many :translated_names, as: :resource

  # For eager loading
  has_one :translated_name, as: :resource

  serialize :pages

  default_scope { order 'chapter_number asc' }

  #Language.all.each do |language|
  #  has_many "#{language.iso_code}_translated_names".to_sym, -> { where(language: language) }, class_name: 'TranslatedName', as: :resource
  #end
end
