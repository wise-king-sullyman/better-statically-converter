class LinkBuilder < ApplicationRecord
  validates :commit, presence: true

  def build_link(commit)
    commit_info = parse_github_url(commit)
    raw_files = get_commit_files(structure_request_url(commit_info))
    formatted_links = parse_raw_files(raw_files).map do |filepath|
      structure_statically_link(commit_info, filepath)
    end
    formatted_links.empty? ? ['Error: check commit link'] : formatted_links
  end

  CommitInformation = Struct.new(:owner, :repo, :commit_hash)

  def parse_github_url(commit)
    split_commit = commit.split('/')
    owner = split_commit[3]
    repo = split_commit[4]
    hash = split_commit.last
    CommitInformation.new(owner, repo, hash)
  end

  def structure_request_url(info)
    site = 'https://api.github.com'
    "#{site}/repos/#{info.owner}/#{info.repo}/commits/#{info.commit_hash}"
  end

  def get_commit_files(structured_url)
    uri = URI.parse(structured_url)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)['files']
  end

  def parse_raw_files(files)
    begin
      files.map { |file| file['filename'] }
    rescue NoMethodError
      []
    end
  end

  def structure_statically_link(info, filepath)
    site = "https://cdn.statically.io"
    "#{site}/gh/#{info.owner}/#{info.repo}/#{info.commit_hash}/#{filepath}"
  end
end
