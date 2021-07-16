class LinkBuilder < ApplicationRecord
  validates :commit, presence: true
  validates :file, presence: true

  def build_link(commit, file)
    split_commit = commit.split('/')
    owner = split_commit[3]
    repo = split_commit[4]
    hash = split_commit.last
    "https://cdn.statically.io/gh/#{owner}/#{repo}/#{hash}/#{file}"
  end
end
