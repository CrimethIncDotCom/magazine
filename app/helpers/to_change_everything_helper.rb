module ToChangeEverythingHelper
  TCE_IMAGE_BASE_URL = 'https://cloudfront.crimethinc.com/assets/tce/images/'.freeze

  SECTIONS = {
    intro: %w[introduction].freeze,
    first: %w[self answering power relationships reconciling liberation revolt control].freeze,
    last:  %w[hierarchy borders representation leaders government profit property lastcrime].freeze,
    outro: %w[anarchy outro takeflight next].freeze
  }.freeze

  SECTIONS_INTRO = %w[introduction].freeze
  SECTIONS_FIRST = %w[self answering power relationships reconciling liberation revolt control].freeze
  SECTIONS_LAST  = %w[hierarchy borders representation leaders government profit property lastcrime].freeze
  SECTIONS_OUTRO = %w[anarchy outro takeflight next].freeze

  def tce_table_of_contents_sections
    [SECTIONS[:intro], SECTIONS[:first], SECTIONS[:last], SECTIONS[:outro]].flatten
  end

  def tce_body_sections
    [SECTIONS[:first], SECTIONS[:last]].flatten
  end

  def url_for_tce_image *pieces
    [TCE_IMAGE_BASE_URL, pieces].flatten.join
  end

  def tce_image_tag filename
    image_tag url_for_tce_image(filename)
  end
end
